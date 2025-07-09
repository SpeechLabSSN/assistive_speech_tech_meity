import os
import sys
import soundfile as sf
import torch
from espnet2.bin.tts_inference import Text2Speech


if len(sys.argv) > 1:
    text = sys.argv[1]
else:
    text = "வணக்கம்! இது என் தமிழ்."

# Model config

model_file = "./exp/tts_train_raw_phn_espeak_ng_tamil/train.loss.ave_5best.tar.gz"
vocoder_tag = "parallel_wavegan/vctk_style_melgan.v1"  # Change if using custom vocoder

text2speech = Text2Speech(
    model_file=model_file,
    vocoder_tag=vocoder_tag,
    device="cuda" if torch.cuda.is_available() else "cpu",
)

# Inference

wav = text2speech(text)["wav"]

os.makedirs("outputs", exist_ok=True)
output_path = os.path.join("outputs", "result.wav")
sf.write(output_path, wav.view(-1).cpu().numpy(), text2speech.fs, "PCM_16")

print(f"Synthesis complete! Saved to: {output_path}")
