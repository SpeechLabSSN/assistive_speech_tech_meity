# 🔊 Text-to-Speech (TTS) Systems

This folder contains **speaker-adaptive Text-to-Speech (TTS) models**  trained using HTS amd Tacotron2

---

## 📁 Contents

* **HTS-based TTS models** (`hts/`)
* **Tacotron2-based TTS models** (`taco2/`)
* Associated model files

---

## 🎤 HTS-Based Speaker Adaptive TTS

### Overview

* **Training data:** 4 normal native Tamil speakers (\~1 hour each)
* **Adaptation data:** Dysarthric speaker data (mild & moderate) from SSN-TDSC corpus (365 sentences each)
* **Number of dysarthric speakers:** 7 mild, 10 moderate
* **Output:** Speaker-adapted TTS models, \~1000 utterances per speaker

### Features

* Higher intelligibility
* Speaker identity not fully preserved

### Evaluation

* **MOS (Mean Opinion Score):**

  * Mild speakers: \~3.0
  * Moderate speakers: \~2.8

---

## 🗣️ Tacotron2-Based Speaker Adaptive TTS

### Overview

* **Base training data:** \~11 hours from 40 native Tamil speakers
* **Fine-tuning data:** \~325 utterances per dysarthric speaker (from SSN-TDSC)
* **Output:** Speaker-adapted Tacotron2 models, \~1000 utterances per speaker

---

## 📝 License

* **ESPnet code and Tacotron2 models:** Apache License 2.0
* **HTS system code:** HTS is distributed under a non-commercial license; please refer to [HTS License](https://hts.sp.nitech.ac.jp/?Download) for details.

---

## 📄 Citation

If you use these TTS models or scripts in your work, please cite relevant publications from the main project [here](../../README.md#publications).
