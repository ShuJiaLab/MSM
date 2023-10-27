# MSM
MSM System Reconstruction

This project is focused on the reconstruction of data acquired in the 3D Multi focal scanning microscope (MSM) system. The code comprises three main steps: mask calibration, data alignment, and the core reconstruction process. These steps are essential for generating accurate 3D images from the data.

## Steps:

### Step 1: Mask Calibration
This step generates calibration masks necessary for accurate data processing. Proper mask calibration is crucial to ensure reliable reconstruction.

### Step 2: Data Alignment
Data alignment is a key component of the reconstruction process. This step offers two alignment options:
- 1D Tracking: Use this method for data alignment.
- Cross Correlation: Utilize cross-correlation for accurate alignment.

### Step 3: Main Reconstruction
The main reconstruction process involves several important operations, including:
- Pinholing
- Scaling
- Pixel Reassignment
- Deconvolution

## Usage:
1. Ensure MATLAB is installed on your system.
2. Open the provided MATLAB script for this code.
3. Execute the script to run the reconstruction process.

## Note:
- This code may require additional libraries or MATLAB toolboxes, depending on the specific reconstruction techniques used.
- Make sure to have the necessary calibration data ready before running the code.
- Read and understand the code comments and documentation for customization according to your specific 3D MSM system and data.

## References:
Please refer to relevant academic papers, documentation, or resources for a deeper understanding of the 3D MSM system and the reconstruction techniques used.

For questions or assistance, please contact Kidan Tadesse at ktadesse3@gatech.edu.
