Release Notes

Citation: 
US EPA, 2026, "CMAQ Model Version 5.5 CRACMM1-2 Input Data – 12/22/2019 - 12/31/2020 12km CONUS ",  https://doi.org/10.15139/S3/BYFKMI, UNC Dataverse, V1.

Description: 
Data Summary
CMAQ input data for the CRACMM1 chemical mechanism for a 12/22/2019 - 12/31/2020 simulation over the Continental US. Data can be used in CMAQv5.4-6.0 and CRACMM1-3 with appropriate adjustments. Scripts are configured to run these inputs in CMAQv5.5 CRACMM2.

Note: The datasets are part of the CMAS Center Amazon Web Services (AWS) Open Data Program and are saved in an AWS S3 bucket. The metadata associated with this DOI contain the link to the S3 bucket and instructions for downloading the data.

File Location and Download Instructions
* Link to emissions, initial, and boundary conditions input files for 2020 12US1 CRACMM: https://cmaq-12us1-cracmm1-modeling-platform-2020.s3.amazonaws.com/index.html.
* Link to download instructions: https://cmaq-12us1-cracmm1-modeling-platform-2020.s3.amazonaws.com/readme.html.

This S3 bucket contains CMAQ-ready emissions, initial, and boundary condition input files suitable for running a simulation using the CRACMM chemical mechanism:
* Model-ready emissions inputs using CRACMM1 speciation are available at 2020_12US1/emis.
* Files linking representative day emissions to specific calendar days are located under 2020_12US1/smk_dates_2020.
* Boundary conditions files are located under 2020_12US1/cracmm1hap_2020_icbcs.
* An initial condition file (time independent) is located under 2020_12US1/cracmm1hap_2020_icbcs.
* Scripts to run these inputs for CMAQv5.5 and CRACMM are available under 2020_12US1/scripts.
* Additional folders contain ozone column data (omi), lightning inputs (LTNG), fertilizer information (fesc1_4_dev), surface inputs (surface), and sample output (output_CCTM_v55+_cracmm2_2020ha_cb6_20k_m3dry and LOGS).

Meteorology Inputs
The meteorology used in processing these emissions and suitable for running CMAQ can be found with the 2020 EPA modeling platform (US EPA, 2023) at https://doi.org/10.15139/S3/W4HCMV.

Emissions Inputs
2020 CRACMMv1 emissions (labeled 'cracmmv1') here largely follow the US EPA 2020 modeling platform inventory methods (US EPA, 2023) except for the use of CRACMMv1 speciation (Pye et al., 2023). Emissions include both criteria air pollutants (CAPs) and hazardous air pollutants (HAPs).

Primary organic aerosol (POA) in these files is stored as volatility resolved species for the carbon (POCN2, POCN2, POCP0, POCP1, POCP2) and non-carbon (PNCOMN1, PNCOMN2, PNCOMP0, PNCOMP1, PNCOMP2) mass.  A DESID file (Murphy et al., 2021) is provided for CMAQv5.5 with CRACMM2 and maps the POA species to alkane-like CRACMM species of the correct volatility. The DESID files also provide some unused rules for PMOC* and PMNCOM* and ROCN2 to ROCP6 (replaced by ROC species of alkane identity) that were used in some earlier CRACMM1 configurations. A processor log file can provide confirmation of emissions mapping.

These inputs contain a full suite of HAPs that are not required for an ozone or PM2.5 simulation. They can be added as optional species at runtime by updating the model species namelists and uncommenting lines in the DESID file. See https://www.epa.gov/cmaq/modeling-toxic-air-pollutants-cmaq and the CMAQ code repository as well as Pye et al. (2026) for information on how to run a full suite of HAPs.

Boundary and Initial Conditions Inputs
Hourly values came from a global simulation using the GEOSCHEM model version 14.0.1 (Yantosca, et al. 2022) with full chemistry. Mapping to the CRACMM2 mechanism was completed using Air Quality Model Boundary Condition Tools (Henderson and Pye, 2023) and the file provided in the CMAQ github code repository.

Additional required inputs for CMAQ
In addition to these meteorology, emissions, initial, and boundary conditions files, users will also need certain other mechanism and time independent input files to perform a 2020 12US1 simulation of CMAQv5.5 using CRACMM2. The following files are included with this 2020 data repository:
* GRIDDESC grid description file for the 12US1 domain
* Gridded normalized biogenic emission factors for running with inline BEISv4
* EPIC files needed when running with bi-directional NH3 air-surface exchange
* Lighting NO files based on lightning data from WWLLN
* Land surface files needed for running with inline biogenics from MEGAN
* Ocean files (needed for sea spray emissions)
* OMI column ozone data for stratospheric ozone estimates in CMAQ

Scripts and control files
Example run script and CMAQ Control DESID file for running CMAQv5.5 CRACMM2 with these 2022 input files.

Resources for setting up a CMAQ simulation
CMAQ benchmark tutorial for CRACMM2 (https://github.com/USEPA/CMAQ/blob/main/DOCS/Users_Guide/Tutorials/CMAQ_UG_tutorial_benchmark_cracmm2_stage.md): describes how to prepare your Linux system for installing and running CMAQ.

Two days of sample output are provided in the output folder.

File Format
The 2020 model inputs are stored as uncompressed netcdf formatted files using I/O API data structures. Information on the model projection and grid structure is contained in the header information of the netcdf files. The netcdf files can be opened and manipulated using I/O API utilities (e.g. M3XTRACT, M3WNDW) or other software programs that can read and write netcdf formatted files (e.g. Fortran, R, Python).

CRACMM1 emissions are compatible with the CRACMM2 mechanism.

The DESID control files provided here are configured to use these CRACMM1 emissions in a CRACMM2 simulation. For more information on CRACMM version compatibility, see this guidance: https://usepa.github.io/CRACMM/emissions/README.html.

Recommended citations/Related Publications
For traceability, please cite use of these inputs with the dataset doi of https://doi.org/10.15139/S3/BYFKMI. 

For method documentation, please cite at least one of the following that best matches your usage of the data:
* Pye et al. (2023): Overall CRACMM approach for chemistry and emissions and CRACMM version 1.
* Skipper et al. (2024): CRACMM version 2, updated gas-phase emissions mapping rules for select species, formaldehyde.
* Pye et al. (2026): CRACMM HAP capability.
* US EPA (2023): 2020 emissions inventory methods.

Subject 	Earth and Environmental Sciences
Keyword 	2020, CMAQ, CMAQv5.5, CRACMM, atmospheric chemistry

Related Publications

Henderson, B. H. and Pye, H. O. T. (2023). Air Quality Model Boundary Condition Tools [Computer software]. Github https://github.com/barronh/aqmbc

Pye, H. O. T. Place, B. K., Murphy, B. N., Seltzer, K. M., D’Ambro, E. L., Allen, C., Piletic, I. R., Farrell, S., Schwantes, R. H., Coggon, M. M., Saunders, E., Xu, L., Sarwar, G., Hutzell, W. T., Foley, K. M., Pouliot, G., Bash, J., and Stockwell, W. R., Linking gas, particulate, and toxic endpoints to air emissions in the Community Regional Atmospheric Chemistry Multiphase Mechanism (CRACMM), Atmos Chem Phys, 23, 5043–5099, 2023. https://doi.org/10.5194/acp-23-5043-2023

Pye, H. O. T., Hutzell, W. T., Fann, N. L., Skipper, T. N., Pye, M., Beidler, J., Allen, C., Murphy, B. N., D’Ambro, E. L., Lin, S., Talgo, K., Reynolds, L., Kang, D., Bash, J., Seltzer, K. M., Farrell, S. L., Appel, K. W., Brehme, K., Gilliam, R. C., Henderson, B. H. and Chan, A. W. H.: The risks to human health of air toxics, PM2.5, and ozone from the 2023 Canadian wildfires, Environ. Sci. Technolo. Lett., 2026. https://doi.org/10.1021/acs.estlett.5c01181

Skipper, T. N., D'Ambro, E. L., Wiser, F. C., McNeill, V. F., Schwantes, R. H., Henderson, B. H., Piletic, I. R., Baublitz, C. B., Bash, J. O., Whitehill, A. R., Valin, L. C., Mouat, A. P., Kaiser, J., Wolfe, G. M., St. Clair, J. M., Hanisco, T. F., Fried, A., Place, B. K., and Pye, H. O. T.: Role of chemical production and depositional losses on formaldehyde in the Community Regional Atmospheric Chemistry Multiphase Mechanism (CRACMM), Atmos. Chem. Phys., 24, 12903–12924, 2024. https://doi.org/10.5194/acp-24-12903-2024

US Environmental Protection Agency, Technical Support Document (TSD): Preparation of Emissions Inventories for the 2020 North American Emissions Modeling Platform, EPA-454/B-23-004, 2023. https://www.epa.gov/air-emissions-modeling/2020-emissions-modeling-platform-technical-support-document

Murphy, B. N.; Nolte, C. G.; Sidi, F.; Bash, J. O.; Appel, K. W.; Jang, C.; Kang, D.; Kelly, J.; Mathur, R.; Napelenok, S.; Pouliot, G.; and Pye, H. O. T., The Detailed Emissions Scaling, Isolation, and Diagnostic (DESID) module in the Community Multiscale Air Quality (CMAQ) Modeling System version 5.3.2, Geosci Model Dev 2021, 14, 3407-3420. https://doi.org/10.5194/gmd-14-3407-2021

Yantosca, et al. Geoschem/geos-chem: GEOS-Chem 14.0.1. 14.0.1, Zenodo, 1 Nov. 2022, https://doi.org/10.5281/zenodo.7271960


Disclaimer: This data product has been reviewed in accordance with U.S. Environmental Protection Agency policy and approved for public release. 
