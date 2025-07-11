#!/bin/bash

SPK=$1


source cmd.sh
source path.sh


rm -rf ./mfcc
rm -rf ./wav_test
rm -rf ./output_mono.txt
rm -rf test_one
rm -rf recognized_text
mkdir -p test_one
mkdir -p wav_test


for input_wav_path in ./ASR_test_data/$SPK/test/*.wav ; do


last_part=$(echo "$input_wav_path" | rev | cut -d'/' -f1 | rev)
base_name=$(basename "$last_part" .wav)
spk=$(echo "$input_wav_path" | cut -d'/' -f3)

sox "$input_wav_path" "wav_test/$base_name.wav"          # This is done becuase the .wav file was actually in sphere (.sph) format. 
echo "$base_name wav_test/$base_name.wav" >> test_one/wav.scp
echo "$base_name" >> test_one/utt
echo "$spk" >> test_one/spk
paste test_one/utt test_one/spk >> test_one/utt2spk

done

./utils/utt2spk_to_spk2utt.pl test_one/utt2spk > test_one/spk2utt


#feature extraction for test cases

utils/fix_data_dir.sh test_one
steps/make_mfcc.sh --cmd "run.pl" --nj 1 test_one models/asr/kaldi_dysarthria/exp_$SPK/make_mfcc/test mfcc
echo ""
echo ""

steps/compute_cmvn_stats.sh test_one models/asr/kaldi_dysarthria/exp_$SPK/make_mfcc/test mfcc
echo ""
echo ""

#decode using monophone GMM-HMM

steps/decode.sh --nj "1" --cmd "run.pl" --model ./models/asr/kaldi_dysarthria/exp_$SPK/mono/40.mdl models/asr/kaldi_dysarthria/exp_$SPK/mono/graph test_one models/asr/kaldi_dysarthria/exp_$SPK/mono/decode

#steps/decode.sh --nj "1" --cmd "run.pl" models/asr/kaldi_dysarthria/exp_$SPK/mono/graph test_one models/asr/kaldi_dysarthria/exp_$SPK/mono/decode

#Store the decoded result

grep -h -Ev '^(#|nnet|LOG|apply|gmm|add|latgen-faster-mapped|copy|WARNING)' models/asr/kaldi_dysarthria/exp_$SPK/mono/decode/log/decode.1.log > output_MONO.txt

grep -w accounts ./models/asr/kaldi_dysarthria/exp_$SPK/mono/decode/log/analyze_lattice_depth_stats.log > temp
awk '{print $2, $5}' temp > lattice_stats.txt
sed -i 's/%//g' lattice_stats.txt



python3 prep_text.py $SPK

steps/score_kaldi.sh test_one ./models/asr/kaldi_dysarthria/exp_$SPK/mono/graph ./models/asr/kaldi_dysarthria/exp_$SPK/mono/decode

cat models/asr/kaldi_dysarthria/exp_$SPK/mono/decode/scoring_kaldi/best_wer
# Extract best LMWT and WIP
best_wer_path=$(awk '{print $NF}' models/asr/kaldi_dysarthria/exp_$SPK/mono/decode/scoring_kaldi/best_wer)
best_lmwt=$(echo $best_wer_path | awk -F'_' '{print $(NF-1)}')
best_wip=$(echo $best_wer_path | awk -F'_' '{print $NF}')
echo $best_lmwt
echo $best_wip
# Save filtered hypothesis to output_mono.txt
cp models/asr/kaldi_dysarthria/exp_$SPK/mono/decode/scoring_kaldi/penalty_${best_wip}/${best_lmwt}.txt output_MONO.txt

