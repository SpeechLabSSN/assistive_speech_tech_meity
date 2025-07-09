# Domain-Specific Speaker-Dependent ASR

This project focuses on **domain-specific, speaker-dependent Automatic Speech Recognition (ASR)** models. Each ASR system has been trained using speech data from individual speakers in specific task-oriented domains.

## Overview

The ASR systems were trained using data from various speakers, each associated with a distinct real-world domain. The goal is to evaluate performance in speaker-specific, domain-bound scenarios.


## 🔤 Language

- **Language Used**: Tamil  


## Speakers and Domains

| Speaker | Severity | Domain                        |
|---------|----------|-------------------------------|
| MRA     | Mild     | Handling Departmental Stores  |
| FGA     | Moderate | Classroom Assistance          |
| MMU     | Moderate | Handling Departmental Stores  |
| MGN     | Moderate | Handling a Nursery            |
| MKA     | Moderate | Classroom Assistance          |
| FDH     | Moderate | Handling a Xerox Shop         |

## What is Speaker-Dependent ASR?

Speaker-dependent ASR systems are trained and optimized for a **specific individual’s voice** and speaking style. This approach often yields **higher accuracy** compared to speaker-independent systems, especially in constrained environments.

## Domains Explained

- **Handling Departmental Stores**: Includes retail transactions, inventory management, and customer service dialogues.
- **Classroom Assistance**: Involves educational tasks like giving instructions, managing student interactions, and explaining lessons.
- **Handling a Nursery**: Focuses on interactions in childcare environments.
- **Handling a Xerox Shop**: Covers common tasks like taking print requests, handling customer queries, and operating printing machines.

## 📁 Project Structure (Optional)

```
asr/
├── kaldi_dysarthria/ 
│   ├── exp_FGA/ # Experiment folder for speaker FGA
│   ├── exp_MRA/
│   ├── exp_MMU/
│   ├── exp_MGN/
│   ├── exp_MKA/
│   └── exp_FDH/
│
└── README.md
```
