This README is for the EQUATES version 1.0 model ready emissions dataset
Last Update: June 28 2021

This readme desribes brief the emission related CMAQ  inputs for the EQUATES project.  It is not an exhaustive list of all CMAQ inputs, only the emission related files used in the EQUATES project.

Each equates year requires a set of 38 input tar files as follows. Each tar file as a contents.txt file associated with it.

-statis_emis_files_EQUATES_v1.0.tar.
This contains biogenic files, lightning inputs, surfzone file, and other inputs for natural sources. It does not contain any inputs for the dust module which was not used in the EQUATES project.

-model_ready_emis_<year>_stackgroups_epicsoil_EQUATES_v1.0.tar
year specific stack_groups file and an epic soil file that are needed for any given year.
 
12 monthly files containing the point source inputs and rwc inputs for a specific month of a specific year
-model_ready_emis_ptsectors_plus_rwc_<year>_<month>_EQUATES_v1.0.tar

12 monthly files containing the layer 1 inputs for a specific month of a specific year
-model_ready_emis_<year>_merged_nobeis_norwc_<month>_EQUATES_v1.0.tar

12 monthly files containing the outputs from the epic model needed for the bidi file. The soil file is contained in the model_ready_emis_<year>_stackgroups_epicsoil_EQUATES_v1.0 tar file
