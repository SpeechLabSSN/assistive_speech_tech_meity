## Setup Instructions

### 1. Navigate to the project directory

```bash
cd models/tts/taco2
```
### 2. Download and Unzip the Tacotron2 model
```
python3 download_model.py
unzip tacotron.zip
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
pip install sentencepiece  # if not installed
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
`<tamil_text>` : The Tamil text you want to synthesize.

`<speaker-id>` : Speaker ID to use for synthesis. Example: FSP.
