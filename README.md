# PMSM Parameter Estimation and Control

This project focuses on the parameter estimation and simulation of a Permanent Magnet Synchronous Motor (PMSM). It includes data analysis for parameter estimation and Simulink models for motor control simulation.

## Folder Structure

*   `Data_analysis/`: This directory contains Jupyter notebooks and MATLAB scripts for analyzing motor data and estimating its parameters. The notebooks likely explore different optimization algorithms like Simulated Annealing and Dual Annealing for this purpose.
    *   `CBA_Artigo_Execucao.ipynb`: Notebook for executing the analysis related to a scientific article.
    *   `CBA_Execucao_SA_original.ipynb`: Notebook for executing the original Simulated Annealing analysis.
    *   `create_csv.m`: MATLAB script to create a CSV file, probably from simulation data.
    *   `Dual_Annealing_Raquel_CBA_SIAc.ipynb`: Notebook for Dual Annealing analysis.
    *   `SA_PMSM.ipynb`: Notebook for Simulated Annealing applied to the PMSM.
    *   `Visualizacao_CBA.ipynb`: Notebook for visualizing the results.

*   `simulacao_motor/`: This directory contains MATLAB/Simulink files for simulating the PMSM control.
    *   `InteriorPMSMFieldOrientedControl 1.slx` and `InteriorPMSMFieldOrientedControl1.slx`: Simulink models for Field-Oriented Control (FOC) of an Interior PMSM.
    *   `InteriorPMSMFieldOrientedControlData_Lafae.m`: MATLAB script containing data for the Simulink simulation.
    *   `UnifiedPWMModulator2Level.m`: MATLAB script for a 2-level PWM modulator.

## How to Use

### Data Analysis

1.  The Jupyter notebooks in the `Data_analysis` folder can be run using Jupyter Notebook or JupyterLab.
2.  The `.m` files are MATLAB scripts and can be run in MATLAB.

### Simulation

1.  The `.slx` files are Simulink models and can be opened and run in MATLAB/Simulink.
2.  The `.m` files in the `simulacao_motor` directory are supporting files for the Simulink models and should be in the MATLAB path when running the simulations.

## Dependencies

*   MATLAB with Simulink
*   Python 3.x
*   Jupyter Notebook or JupyterLab
*   Python libraries: pandas, numpy, matplotlib, etc. (the specific libraries are listed in the notebooks).
