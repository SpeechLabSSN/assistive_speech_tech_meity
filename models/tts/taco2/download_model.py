import gdown
import zipfile
import os

# === CONFIG ===
FILE_ID = "1MGBPwbHVDTcaTvr9PllBvY-X07-pYEWq"  # 🔹 Replace with your Google Drive file ID
OUTPUT_ZIP = "tacotron.zip"                   # 🔹 Name of the downloaded zip file
EXTRACT_DIR = "."                             # 🔹 Current directory (change if needed)

# === DOWNLOAD ===
if not os.path.exists(OUTPUT_ZIP):
    print(f"Downloading {OUTPUT_ZIP} from Google Drive...")
    gdown.download("https://drive.google.com/file/d/1MGBPwbHVDTcaTvr9PllBvY-X07-pYEWq/view?usp=sharing", OUTPUT_ZIP, quiet=False)
    print("✅ Download complete.")
else:
    print("📦 Zip file already exists. Skipping download.")

# === EXTRACT ===
print("Extracting contents...")
with zipfile.ZipFile(OUTPUT_ZIP, 'r') as zip_ref:
    zip_ref.extractall(EXTRACT_DIR)
print(f"✅ Extraction complete. Files extracted to: {os.path.abspath(EXTRACT_DIR)}")
