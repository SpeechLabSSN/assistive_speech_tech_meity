# Assistive Speech Technologies

This repository provides **Automatic Speech Recognition (ASR) and Text-to-Speech (TTS)** models developed by the Speech Lab, Department of Electronics and Communication Engineering, SSN College of Engineering, Chennai.

These models were developed as part of the **Assistive Technologies module** within **Bashini: National Language Translation Mission (NLTM) – Speech Technologies in Indian Languages Project**, funded by the Ministry of Electronics and Information Technology (MeitY), Government of India.

They are intended to support **speech processing applications for Indian languages**, especially for research and assistive technology development.

---

## 📦 Repository Contents

* **ASR Models:**

  * [Transfer- Learning based ASR (Individual speaker 6)](https://github.com/SpeechLabSSN/assistive_speech_tech_meity/tree/main/models/asr/kaldi_dysarthria)
  * [Class-wise ASR (mild and moderate speakers)](https://github.com/SpeechLabSSN/assistive_speech_tech_meity/tree/main/class-wise%20ASR%20models)

* **TTS Models:**

  * [HTS-based TTS](models/tts/hts)
  * [Tacotron2-based TTS](models/tts/taco2)

* **Test Database:**

  * [Download link (Google Drive)](https://drive.google.com/file/d/1JiicZTT2X6Q_WQVltMrBwnnSyCHeL5n6/view?usp=drive_link) *(shared upon request)*

---

## ⚙️ Usage Instructions

### Pre-requisites

* [Kaldi](https://github.com/kaldi-asr/kaldi)
* [ESPnet](https://github.com/espnet/espnet)

> ✅ **Note:** The ASR models were trained using an **older version of Kaldi**, so specific setup steps are required.

---

### 🔧 Setting Up Kaldi (for compatibility)

#### Download and Setup Prerequisites

1️⃣ Download `prerequisites.zip` (provided).
2️⃣ Install dependencies:

```bash
sudo unzip prerequisites.zip -d /usr/lib
```

---

#### Kaldi Directory Structure

```
kaldi/
  egs/
    cwd/
      steps/       ← steps directory
      utils/       ← utils directory
      path.sh      ← path.sh (update KALDI_ROOT)
  src/           ← kaldi/src
  tools/         ← kaldi/tools

```

---

#### Configure Environment

Update `path.sh` in `cwd/`:

```bash
export KALDI_ROOT=<path_to_kaldi_root>
```

Then:

```bash
source path.sh
```

---

#### Build Kaldi

```bash
cd kaldi/src
./configure
make clean -j $(nproc)
make -j $(nproc)
```

> ⚠️ **Important:** Use only the provided `steps/` and `utils/` folders to ensure compatibility with older Kaldi scripts.

---

## Testing Transfer learning based ASR

### 1️⃣ Clone and Setup

```bash
cd kaldi/egs
git clone https://github.com/SpeechLabSSN/assistive_speech_tech_meity.git
cd assistive_speech_tech_meity
unzip kaldi_setup.zip
unzip path/to/ASR_test_data.zip
```

---

### 2️⃣ Run Test Scripts

#### Batch Testing

```bash
chmod 777 ./testing_dysarthric_asr_all.sh
./testing_dysarthric_asr_all.sh <speaker_id> 
```

Example:

```
./testing_dysarthric_asr_all.sh MRA
```

#### Single Audio Test

```bash
chmod 777 ./testing_dysarthric_asr.sh
./testing_dysarthric_asr.sh <path/to/audio-file.wav>
```

---

## Testing Class-wise ASR

```bash
# Usage: decode_tri.sh <exp_dir> <test_data_dir>
decode_tri.sh exp_FG_mild ./test_data_mild/FSI
```

---

## 📄 Dataset

### SSN-TDSC: Tamil Dysarthric Speech Corpus

* First disordered speech database in Indian languages (Tamil).
* Collected from mild and moderate dysarthric speakers, with guidance from therapists at National Institute for Empowerment for People with Multiple disabilities NIEPMD.
* \~300 phonetically balanced sentences, repeated 10 times each.

---

## 🤝 ASR: Transfer Learning Approach

### Training

* Source model: 10 normal speakers, 365 utterances each.
* Feature: 13D MFCC → 40D transformation.
* Speaker Adaptive Training with GMM-HMM.
* Further fine-tuned using CNN-TDNN for dysarthric speakers.

### Testing

* 175 augmented test sentences (35 augmentations x 5 originals).

---

## 🔊 TTS Systems

### HTS-Based

* Adaptation: 7 mild + 10 moderate speakers from TDSC.
* \~1000 synthesized utterances per speaker.

---

### Tacotron2-Based

* Pre-trained on \~11 hours (40 Tamil speakers).
* Fine-tuned using \~325 utterances per dysarthric speaker.
* \~1000 synthesized utterances per speaker.

---

## 📊 Benchmark Metrics

### ASR

**Metric:** Word Error Rate (WER)  
**Model:** Transfer Learning-based ASR for Domain-Specific Sentences

| Speaker    | Domain     | WER (Test) | WER (Real-Time) |
| ---------- | ---------- | ---------- | --------------- |
| MRA (mild) | Stores     | 4%         | 6%              |
| FGA (mod)  | Classroom  | 5%         | 8%              |
| MMU (mod)  | Stores     | 7.5%       | 9%              |
| MGN (mod)  | Nursery    | 8.3%       | 11%             |
| MKA (mod)  | Classroom  | 10%        | 12%             |
| FDH (mod)  | Xerox shop | 10.2%      | 12%             |

---

### TTS

#### HTS

* **MOS:**

  * Mild: 3.0
  * Moderate: 2.8
* Higher intelligibility, less speaker identity preservation.

#### Tacotron2

* **MOS:** 2.5
* Lower intelligibility, better speaker identity preservation.

---

## 📚 Publications


- T. A. Mariya Celin, P. Vijayalakshmi, T. Nagarajan, "Data augmentation techniques for transfer learning-based continuous dysarthric speech recognition", Circuits, Systems, and Signal Processing, Vol. 42, pp. 601 -  622, 2022.
- M. Dhanalakshmi, T. Nagarajan, P. Vijayalakshmi, "Significant sensors and parameters in assessment of dysarthric speech", Sensor Review, Vol. 41, pp. 271-286, 2021.
- T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Data Augmentation using virtual microphone array synthesis and multi-resolution feature extraction for isolated word dysarthric speech recognition", IEEE Journal of selected topics on signal processing, Vol. 14, No. 2, pp. 346 – 354, 2020.
- T. A. MariyaCelin, G. Anushiya Rachel, T. Nagarajan, P. Vijayalakshmi, "A Weighted Speaker-Specific Confusion Transducer Based Augmentative and Alternative Speech Communication Aid for Dysarthric Speakers", IEEE Transactions on Neural Systems and Rehabilitation Engineering, Vol. 27, Issue 2, pp. 187-197, 2019.
- M. Dhanalakshmi, T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Speech-input speech-output communication for dysarthric speakers using HMM-based speech recognition and adaptive synthesis system", Circuits, Systems, and Signal Processing, Vol. 37, pp. 674-703, 2018.
- M. Dhanalakshmi, T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Electromagnetic articulograph sensor-to-sound unit mapping-based intelligibility assessment of dysarthric speech", in Proc. of IEEE TENCON, pp. 1784-1789, 2017.
- T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Dysarthric speech corpus in tamil for rehabilitation research", in Proc. of IEEE TENCON, pp. 2610-2613, 2016.
- P. Vijayalakshmi, T. Nagarajan, "Assessment and intelligibility modification for dysarthric speakers", Chapter 3 – Voice Technologies for Reconstruction and Enhancement, De Gruyter Series in Speech Technology and Text Mining in Medicine and Healthcare, pp. 67 – 94, 2020.
- P. Vijayalakshmi, T. A. Mariya Celin, T. Nagarajan, "Selective pole modification-based technique for the analysis and detection of hypernasality", Chapter 2 – Signal and Acoustic Modeling for Speech and Communication Disorders, De Gruyter Series in Speech Technology and Text Mining in Medicine and Healthcare, pp. 33 – 68, 2018.

---

## ✅ Summary

* 🔹 **ASR:** Low WER for mild speakers; robust in real-time.
* 🔹 **HTS TTS:** Better intelligibility, less speaker identity.
* 🔹 **Tacotron TTS:** Better identity, lower intelligibility.

---

## 💬 Contact

For test database access or additional support, please [open an issue](https://github.com/SpeechLabSSN/assistive_speech_tech_meity/issues) or contact the Speech Lab, SSN College of Engineering.

---

## 📝 License

This project uses code and models based on Kaldi and ESPnet toolkits.

* **Kaldi (DNN-HMM and monophone models):** Licensed under the Apache License 2.0.
* **ESPnet (Tacotron2 models):** Licensed under the [Apache License 2.0.](https://github.com/espnet/espnet/blob/master/LICENSE)
  
For commercial use or additional permissions, please contact the Speech Lab, SSN College of Engineering.

---
