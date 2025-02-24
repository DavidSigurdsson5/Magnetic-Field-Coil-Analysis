# **Magnetic Field Coil (MFC) Experiment**

## **Description**
This repository contains MATLAB code and experimental data from a study on the magnetic field properties around a single coil and two-coil systems. The analysis was conducted using real-world measurements, and the MATLAB script processes the data, performs calculations, and generates visual representations of the results.

This project was originally part of a group experiment report. The report was collaboratively written, but **all MATLAB code in this repository was written by David Haukur Sigurdsson**.

## **Table of Contents**
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Project Structure](#project-structure)
- [Data Sources](#data-sources)
- [Results](#results)

## **Installation**
### **MATLAB Setup**
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MFC-Experiment.git
   cd MFC-Experiment
   ```
2. Ensure you have **MATLAB** installed.
3. Run the main MATLAB script:
   ```matlab
   run('mfc.m')
   ```

## **Usage**
- The MATLAB script `mfc.m` reads experimental data from `mfcreal.xlsx`, processes the measurements, and generates plots comparing measured vs. theoretical magnetic field values.
- Results are automatically saved as `.png` images for further analysis.
- The script calculates theoretical magnetic field distributions based on the Biot-Savart law.

## **Features**
- Reads real-world magnetic field data from `mfcreal.xlsx`.
- Computes theoretical values for different coil configurations.
- Generates plots comparing measured vs. calculated values.
- Saves graphical output in the `Images/` directory.

## **Project Structure**
```
/MFC-Experiment
│── MATLAB/
│   │── mfc.m               # Main MATLAB script
│
│── Data/
│   │── mfcreal.xlsx        # Experimental raw data
│
│── Report/
│   │── MFC_Experiment.pdf  # Group report (not written solely by me)
│
│── Images/                 # Folder where output graphs are saved
│
│── README.md               # Documentation
```

## **Data Sources**
- Experimental data was collected as part of a university project on electromagnetism.

## **Results**
This project produces plots comparing measured and theoretical magnetic field values for different coil configurations. The generated images are saved in the `Images/` directory for reference.

---

**Note:** This repository contains the MATLAB code and experimental data, but the group report (`MFC_Experiment.pdf`) is included for reference. The code and data processing were developed solely by **David Haukur Sigurdsson**.

