## Setup Instructions

### 1. Navigate to the project directory

```bash
cd models/tts/taco2
```
### 2. Download and Setup Tacotron2 model
```
python3 download_model.py
```
### 3. Create a Python virtual environment
```
python3 -m venv .venv
```
### 4. Activate the virtual environment
```
source .venv/bin/activate
```
### 5. Install dependencies
```
pip install -r requirements.txt
```
```
pip install sentencepiece  # if not installed
```
```
pip install scipy==1.10.1 # use this version
```
Usage
To synthesize Tamil text, use:

```
python3 synthesize.py "<tamil_text>" <speaker-id>
```
Example:
```
python3 synthesize.py "கடவுளை வணங்கு" FSP
```
The synthesized audio output is stored as `models/tts/taco2/test.wav`

`<tamil_text>` : The Tamil text you want to synthesize.

`<speaker-id>` : Speaker ID to use for synthesis. Example: FSP.

# Speaker ID List
- FAM
- FBL
- FC01
- FC02
- FC03
- FC04
- FC05
- FDH
- FGA
- FSI
- FSP
- FVP
- MAK
- MC02
- MC03
- MC04
- MC05
- MGN
- MKA
- MMU
- MPA
- MPK
- MPR
- MRA
- MSU
- MVI
- aarthi
- rajiv
- ramya
- sherlin
