<img width="1439" height="169" alt="image" src="https://github.com/user-attachments/assets/8074d693-a139-47b5-8177-a1ee4429981e" />

---

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

## Testing Transfer learning based ASR

### 1️⃣ Clone and Setup
#### Open your terminal and execute the following commands:

```bash
cd kaldi/egs
```
```
git clone https://github.com/SpeechLabSSN/assistive_speech_tech_meity.git
```
```
cd assistive_speech_tech_meity
```
```
unzip kaldi_setup.zip
```
```
unzip <path/to>/ASR_test_data.zip # update with the correct path
```

---
#### Your Directory Structure will look like:

```
kaldi/
  egs/
    assitive_speech_tech_meity/
      conf/        ← conf directory
      local/       ← local directory
      steps/       ← steps directory
      utils/       ← utils directory
      path.sh      ← path.sh (update KALDI_ROOT)
      output_MONO.txt                 ← output file (generated after testing)
      text_<spk>                      ← ground truth transcripts
      kaldi_setup.zip                 ← contains conf, local,utils, steps
      testing_dysarthric_asr.sh       ← testing script - script to test a single audio file corresponding to a speaker
      testing_dysarthric_asr_all.sh   ← batch testing - script to test multiple audio files corresponding to a speaker

```

---

#### Configure Environment

```bash
source path.sh
```

> ⚠️ **Important:** Use only the provided `steps/` and `utils/` folders to ensure compatibility with older Kaldi scripts.


### 2️⃣ Run Test Scripts

#### Batch Testing (for multiple audio files)

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
#### To Display output in terminal
```
cat output_MONO.txt
```
---

## Testing Class-wise ASR

[Click here](https://github.com/SpeechLabSSN/assistive_speech_tech_meity/blob/main/class-wise%20ASR%20models#README.md) to see the detailed steps.

---

# 🗂️ Dataset and  Summary

## 📄 Dataset: SSN-TDSC
This is the first disordered speech database in an **Indian language, Tamil**. The data was collected from **mild, moderate and severe** dysarthric speakers under the guidance of *therapists from  "National Institute for Empowerment of Persons with Multiple Disabilities (NIEPMD)*. The database consists of approximately **300 phonetically balanced sentences**, each repeated 10 times, providing a rich resource for research and development in speech disorders and assistive technologies.

---

## 🤝 ASR: Transfer Learning Approach
### Training
- Source model: 10 normal speakers, 365 utterances each.
- Features: 13D MFCC → 40D transformation.
- Speaker Adaptive Training with GMM-HMM.
- Further fine-tuned with CNN-TDNN for dysarthric speakers.

### Testing
- 175 augmented test sentences (35 augmentations × 5 originals)
- Data augmenation is carried out using TTS systems such as HTS and Tacotron2.
---
## 🔊 TTS Systems
### HTS-Based 
- **Training data:**  
  - Native Tamil speech from 4 normal speakers: Aarthi, Rajiv, Sherlin, and Ramya  
  - Approximately 1 hour of recording per speaker

- **Adaptation data:**  
  - Speech from dysarthric speakers (mild and moderate) of the TDSC dataset  
  - Consists of 365 sentences

- **Number of dysarthric speakers:**  
  - Mild dysarthria: 7 speakers  
  - Moderate dysarthria: 10 speakers

- **TTS development:**  
  - One HTS-based adapted TTS model created for each dysarthric speaker  
  - Total of 17 adapted TTS models (7 mild + 10 moderate)

- **Synthesized data:**  
  - Around 1000 utterances synthesized per dysarthric speaker, including 365 from SSN TDSC  
  - Total synthesized utterances across all speakers: 17,000 (1000 x 17)
---
### Tacotron2-Based
- **Training Data:**  
  Approximately **11 hours** of speech data collected from **40 native Tamil speakers**, consisting of:  
  - ~5.5 hours from **15 female** speakers  
  - ~5.5 hours from **25 male** speakers  

- **Fine-tuning Data:**  
  For each dysarthric speaker, **325 utterances** from the **SSN TDSC** dataset are used for fine-tuning.

- **Synthesis Data:**  
  For each dysarthric speaker, a total of **1000 synthesized utterances** are generated, which includes:  
  - 365 utterances from the SSN TDSC  
  - 635 additional synthesized utterances  

- **Total Utterances per Dysarthric Speaker:**  
  1000 utterances × 17 speakers
---
## 📊 Benchmark Metrics
### ASR
**Metric:** Word Error Rate (WER)

| Speaker | Domain     | WER (Test) | WER (Real-Time) |
|-----------|-------------|-------------|----------------|
| MRA (mild) | Stores     | 4%         | 6%            |
| FGA (mod)  | Classroom  | 5%         | 8%            |
| MMU (mod)  | Stores     | 7.5%       | 9%            |
| MGN (mod)  | Nursery    | 8.3%       | 11%          |
| MKA (mod)  | Classroom  | 10%        | 12%          |
| FDH (mod)  | Xerox shop| 10.2%      | 12%          |

### TTS
#### HTS
- MOS:
  - Mild: 3.0
  - Moderate: 2.8
- Higher intelligibility, less speaker identity preservation.

#### Tacotron2
- MOS: 2.5
- Lower intelligibility, better speaker identity preservation.

---

## 📚 Publications
- T. A. Mariya Celin, P. Vijayalakshmi, T. Nagarajan, "Data augmentation techniques for transfer learning-based continuous dysarthric speech recognition", Circuits, Systems, and Signal Processing, Vol. 42, pp. 601–622, 2022.
- M. Dhanalakshmi, T. Nagarajan, P. Vijayalakshmi, "Significant sensors and parameters in assessment of dysarthric speech", Sensor Review, Vol. 41, pp. 271–286, 2021.
- T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Data Augmentation using virtual microphone array synthesis and multi-resolution feature extraction for isolated word dysarthric speech recognition", IEEE JSTSP, Vol. 14, No. 2, pp. 346–354, 2020.
- T. A. MariyaCelin, G. Anushiya Rachel, T. Nagarajan, P. Vijayalakshmi, "A Weighted Speaker-Specific Confusion Transducer Based Augmentative and Alternative Speech Communication Aid for Dysarthric Speakers", IEEE TNSRE, Vol. 27, Issue 2, pp. 187–197, 2019.
- M. Dhanalakshmi, T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Speech-input speech-output communication for dysarthric speakers using HMM-based speech recognition and adaptive synthesis system", CSSP, Vol. 37, pp. 674–703, 2018.
- M. Dhanalakshmi, T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Electromagnetic articulograph sensor-to-sound unit mapping-based intelligibility assessment of dysarthric speech", Proc. IEEE TENCON, pp. 1784–1789, 2017.
- T. A. Mariya Celin, T. Nagarajan, P. Vijayalakshmi, "Dysarthric speech corpus in Tamil for rehabilitation research", Proc. IEEE TENCON, pp. 2610–2613, 2016.
- P. Vijayalakshmi, T. Nagarajan, "Assessment and intelligibility modification for dysarthric speakers", Chapter 3, De Gruyter Series, pp. 67–94, 2020.
- P. Vijayalakshmi, T. A. Mariya Celin, T. Nagarajan, "Selective pole modification-based technique for the analysis and detection of hypernasality", Chapter 2, De Gruyter Series, pp. 33–68, 2018.

---

## ✅ Summary
- 🔹 **ASR:** Low WER for mild speakers; robust in real-time.
- 🔹 **HTS TTS:** Better intelligibility, less speaker identity.
- 🔹 **Tacotron TTS:** Better identity preservation, lower intelligibility.

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
