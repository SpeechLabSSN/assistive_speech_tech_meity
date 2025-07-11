#!/bin/bash

# === USAGE ===
# ./decode_single_speaker.sh <exp_dir> <speaker_id>
# Example: ./decode_single_speaker.sh exp_FG_moderate FGA

# === CONFIGURATION ===
exp_dir=$1           # e.g. exp_FG_mild
speaker_id=$2        # e.g. MMU
converted_folder="converted_wavs"
mfcc_dir="mfcc"
data_dir="data/test_online_$speaker_id"
output_file="recognized_${speaker_id}.txt"

model_dir="$exp_dir/DNN_tri_8_2000_aligned_layer3_nodes256"
graph_dir="$exp_dir/tri_8_2000/graph"
decode_dir="$model_dir/decode_test_online_${speaker_id}"

if [ -z "$exp_dir" ] || [ -z "$speaker_id" ]; then
  echo "Error: Missing arguments."
  echo "Usage: $0 <exp_dir> <speaker_id>"
  exit 1
fi

# === STAGE 1: Validate input ===
speaker_folder="$converted_folder/$speaker_id"
if [ ! -d "$speaker_folder" ]; then
  echo "Error: Folder $speaker_folder not found. Ensure converted_wavs/$speaker_id exists."
  exit 1
fi

echo "Stage 1: Preparing Kaldi data directory for speaker $speaker_id..."

rm -rf "$data_dir" "$decode_dir" "$output_file"
mkdir -p "$data_dir"

> "$data_dir/wav.scp"
> "$data_dir/utt2spk"

find "$speaker_folder" -type f -iname "*.wav" | while read -r wav_input; do
  base_name=$(basename "$wav_input" .wav)
  utt_id=$base_name
  spk_id=$speaker_id

  echo "$utt_id $(realpath "$wav_input")" >> "$data_dir/wav.scp"
  echo "$utt_id $spk_id" >> "$data_dir/utt2spk"
done

utils/utt2spk_to_spk2utt.pl "$data_dir/utt2spk" > "$data_dir/spk2utt"
utils/fix_data_dir.sh "$data_dir"

echo "Data directory for $speaker_id prepared."

# === STAGE 2: Feature Extraction ===
echo
echo "Stage 2: Extracting MFCC features..."

steps/make_mfcc.sh --nj 1 --cmd run.pl "$data_dir" "$exp_dir/make_mfcc/test_online_${speaker_id}" "$mfcc_dir" || exit 1
steps/compute_cmvn_stats.sh "$data_dir" "$exp_dir/make_mfcc/test_online_${speaker_id}" "$mfcc_dir" || exit 1

echo "MFCC extraction done."

# === STAGE 3: Decoding ===
echo
echo "Stage 3: Decoding for speaker $speaker_id..."

steps/nnet2/decode.sh --cmd run.pl --nj 1 \
  "$graph_dir" "$data_dir" "$decode_dir" || exit 1

echo "Decoding done."

# === STAGE 4: Extract Output ===
echo
echo "Stage 4: Saving recognized text to $output_file ..."

lattice-best-path --word-symbol-table="$graph_dir/words.txt" \
  "ark:gunzip -c $decode_dir/lat.*.gz|" ark,t:- \
  | utils/int2sym.pl -f 2- "$graph_dir/words.txt" \
  > "$output_file"

echo "Done. Transcriptions for $speaker_id saved in $output_file"

