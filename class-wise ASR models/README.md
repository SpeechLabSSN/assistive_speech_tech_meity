# 🎤 Class-wise ASR Models

This folder contains **class-wise Automatic Speech Recognition (ASR) models** for **Tamil dysarthric speakers**. The models are trained separately for **mild** and **moderate** speaker categories to enable improved, targeted recognition.

---

## 📂 Directory Structure

```
class-wise_testing/
├── exp_FG_mild/                       # ASR model for mild speakers
├── exp_FG_moderate/                   # ASR model for moderate speakers
├── data/                              # To create utt2spk, spk, utt, text etc
├── steps/                             # Kaldi steps scripts (copied or provided)
├── utils/                             # Kaldi utilities
├── local/                             # Optional local scripts
├── decode_for_a_single_speaker.sh     # Script to decode single speaker
├── path.sh                            # Kaldi environment path setup
├── Packages.zip                       # Support files (configs, graphs, etc.)
├── converted_wavs/                    # Test audio data (after unzip)
└── recognized_*.txt                   # Recognized output text files (generated)
```

---

## ✅ Setup Instructions

### 1️⃣ Clone the Repository
> Skip this step if already done.

```bash
git clone https://github.com/SpeechLabSSN/assistive_speech_tech_meity.git
cd assistive_speech_tech_meity
```

### 2️⃣ Prepare Kaldi Environment
Move and rename the folder:
```bash
mv "class-wise ASR models" class-wise_testing
cd class-wise_testing
```

### 3️⃣ Unpack Required Files

```bash
unzip Packages.zip
unzip /path/to/converted_wavs.zip
```

> 💡 *You may also copy `steps/`, `local/`, and `utils/` from any Kaldi example (optional).* 

Unpack your test data:
```bash
unzip /path/to/converted_wavs.zip
```

### 4️⃣ Set Up Path

```bash
source path.sh
```

> ⚠️ *Ensure `KALDI_ROOT` in `path.sh` is set to your Kaldi directory.*

---

## 🗣️ Testing

### Available Speaker Categories

- **Mild speaker:** MRA
- **Moderate speakers:** FGA, MMU, MGN, MKA, FDH

### Run Decoding

Make the script executable:

```bash
chmod +x decode_for_a_single_speaker.sh
```

#### Usage

```bash
./decode_for_a_single_speaker.sh <exp_dir> <speaker_id>
```

#### Example

```bash
./decode_for_a_single_speaker.sh exp_FG_moderate MMU
```

### Output

- Recognized text is saved as `recognized_<speaker_id>.txt` in the current directory.

---

## ⚠️ Limitations

> These models are trained for **specific speakers and categories**. Using unknown speakers or out-of-domain data may reduce accuracy.

---

## 💬 Contact

For test data access or support, please contact the [Speech Lab mail](speech@ssn.edu.in), SSN College of Engineering, or open an [issue](https://github.com/SpeechLabSSN/assistive_speech_tech_meity/issues).

---
