**Users of these data must acknowledge the original source of these data and follow any data usage/acknowledgement policies that may exist.*** 
***Please refer any data usage policies included along with these data. Users should refer to the sites providing the original source of these data for additional information.***

This file contains the download dates for the various network data files and the source of those data. Note that these data files are only 
updated periodically, and therefore there is no guarantee made that the data in these files are the most up-to-date data available for a particular network. 
While efforts are made to keep these files as up-to-date as possible, it is possible that updates made to the original source data have not been 
translated to these files yet. Provided in this file are the dates of last creation for each network data file for each year.

This file was last updated by K. Wyat Appel (appel.wyat@epa.gov), September 2025
#########################################################################

Important update for CSN and AQS Daily EC/OC data (10/28/2021):

There are three OC values from CSN that we need to be considered. Specifically, these are 88305, 88370, and 88320.

A quick description of each OC value:

88305 / 88307 OC / EC under the old CSN (TOT) protocol
88370 / 88380 OC / EC under the new CSN (TOR) protocol
88320 / 88321 OC / EC under the IMPROVE (TOR) protocol

Note that by default neither the 88305 or 88370 values are corrected for artifacts, while the 88320 value is corrected for artifacts.

From these three values, the 88320 is the preferred value, as it uses both the TOR IMPROVE protocol and is corrected for artifacts. Next best is 88370, as it also uses the TOR protocol but is not corrected for artifacts. The least preferred is 88305, as it uses the old TOT protocol and is not corrected for artifacts. From 2016 and beyond, 88320 is reported for all CSN sites (at least, it should be). Before 2016, there is a mix of 88320 and 88370. And before roughly 2007, 88305 is the primary OC value available.

As such, it is necessary to use a mix of three values when creating data files that cover 2000-present. Fortunately, there are artifact correction methods available for the 88305 and 88370 values to make them more comparable to the 88320 value across time.

For 88305, Joann Rice from EPA recommended this presentation, https://www.epa.gov/sites/default/files/2016-10/documents/statistical_relationship.pdf, where it is described how to convert the New CSN values (TOR; 88370) to Old CSN values (TOT; 88305) using this formula:

OC (Old) = 1.57432 + 1.15101*(NEW_CSN)

As the TOR method is preferred to the TOT method, this formula was inverted to correct the 88305 TOT OC values to be similar to the 88370 TOR OC values:

88305_adj = 0.8688*(88305) - 1.57432

The 88305_adj value is intended to mimic the 88320 value.

Similarly for EC:

EC (Old) = 0.105071 + 0.92462*(NEW_CSN)

88307_adj = 1.091525*(88307) - 0.104071

The 88307_adj value is intended to mimic the 88321 value.

Joann Rice also mentioned that previously the artifact correction for the OC 88370 value was 0.4, but a smaller value of 0.14 is now preferred. So, a value of -0.14 ug/m3 is subtracted from all the 88370 values to correct for artifacts. Applying the -0.14 ug/m3 correction is intended to make the 88370 value similar to the 88320 value. This artifact corrected 88370 value is called 88370_adj in the AMET AQS obs files.

This does not solve the issue that many CSN sites report different OC values based on the year, and some can report multiple OC values under the different OC codes. To deal with this situation, the 88320 value, if available, is the preferred OC value for a site. If 88320 is not available, the missing values are filled with 88370 (artifact corrected), again, if available. Finally, any remaining missing values are filled with 88305 (artifact corrected) if available. This should give the most complete OC record for CSN sites for any period using the best available OC value.

The result of implemented this approach is much better consistency in the OC values over time compared to the previous approach of providing OC as a hodge-podge mix of 88305, 88370, and 88320 with different correction methods.

***Starting with AMETv1.5 and all future versions of AMET, only the CSN observation files labeled AQS_CSN_data_XXXX.csv should be used as the source of CSN data in AMET. The other CSN data files are provided for legacy AMET versions, but are no longer updated as of October 2021. The AMETv1.5 code will only point to the files labeled AQS_CSN_data_XXXX.csv regardless of the year, and the AQ_species_list.input file has also been updated to use only the species in the AQS_CSN_data_XXXX.csv file. 

#########################################################################


#########################################################################

Important update for AQS daily data (04/02/2022):

The name of the PM10 species in the AQS daily file has changed. Previously the PM10 species in the AQS daily file was labeled as PM10. To improve transparency of the underlying data used to create the AMET ready obs files, the PM10 species is now called PM10_81102, to indicate the EPA species name from which it is sourced. The AMET species input file (AQ_species_list.input) has been updated in AMETv1.5 to use the PM10_81102 species name. Older versions of AMET have an AQ_species_list.input with PM10 only, and therefore would need to be updated with the new species name. Conversely, one could also change the species name in the AQS_Daily file from PM10_81102 to PM10 to provide compatibility with the older species input file.

#########################################################################


#########################################################################

Important update for NADP data (04/02/2022):

The NADP NTN data provided for use with AMET have been updated. Previously, NTN data obtained directly from NADP only reported the day, month, and year during which a observation was collected. No time (i.e hour) was reported. Based on information provided previously by NADP, it was assumed that the time each observation started and ended was 9am local standard time. 

Recently, the NADP NTN data provided through the NADP website began reporting the hour during which the sample started and ended. As such, the NADP NTN data provided here have been updated to include the start and end hour of every observation, and therefore it is no longer necessary to assume a 9am start and end to each observation. The site compare program that processes the NADP NTN data will use the provided start and end our compare with the CMAQ data.

This updated improves the accuracy of the comparison between NADP NTN observations and CMAQ data by assuring the correct CMAQ start and end hours are used to compare to the observations. However, this change is expected to have only a minor impact overall on the actual model values, especially when aggregating over long temporal periods and a large number of sites.

#########################################################################


#########################################################################

Important update for NOAA ESRL O3 data (10/28/2021):

The previous provided NOAA ESLR data for 2015 - 2018 data was erroneous for the following stations:

     *                  "PCO",
     *                  "SMO",
     *                  "SPO",
     *                  "SUM",
     *                  "TBL_BOS",
     *                  "THD",
     *                  "TIK",
     *                  "TUN",
     *                  "WKT",
     *                  "WVR"/

The reason is that the processing code had commented out NWR because of 2014 NOAA ESRL hourly file inconsistencies, but this led to
a mismatch between the site file that was used to define the array "stid" which was used in the processed output file and the
arrays path_stid and abbr_stid* that were used to read in and store the data. Consequently, the following
stations were mislabeled in the data outputs for 2015 - 2018 (the 2014 files generated by that code were not used for AMET):

Stid in file    correct stid
NWR             PCO (affects 2015)
PCO             SMO (affects 2015)
SMO             SPO (affects 2015 - 2018)
SPO             SUM (affects 2015 - 2018)
SUM             TBL_BOS (affects 2016)
TBL_BOS         THD (does not affect any files)
THD             TIK (affects 2015 - 2018)
TIK             TUN (affects 2016 - 2018)
TUN             WKT (does not affect any files)
WKT             WVR (affects 2015 - 2017)
WVR            [not present in any 2015 - 2018 file because numstat was 17 in the code]

In addition, this not only affected the labeling, but also the time zone shifting for
these stations because array "itz" in the code was obtained from the 18-site file NOAA_ESRL_sites.txt

The publicly released files for 2000 - 2014 were based on processing the *soz combined ozone files
and were never updated with the code processing the hourly data files. The only years processed from hourly
data (affected by the 6/17/2019 processing error) that were publicly released are 2015 - 2017.

The error has been corrected and all NOAA ESRL files provided for all years are correct.

#########################################################################

###########################################################################
AMET Observation files creation/last update dates and data source locations
###########################################################################

NADP/NTN (https://nadp.slh.wisc.edu/networks/national-trends-network/)
*observation start and end times in local standard time have been added to the NTN data files

2000 - 04/02/2022
2001 - 04/02/2022
2002 - 04/02/2022
2003 - 04/02/2022
2004 - 04/02/2022
2005 - 04/02/2022
2006 - 04/02/2022
2007 - 04/02/2022
2008 - 04/02/2022
2009 - 04/02/2022
2010 - 04/02/2022
2011 - 04/02/2022
2012 - 04/02/2022
2013 - 04/02/2022
2014 - 04/02/2022
2015 - 04/02/2022
2016 - 04/02/2022
2017 - 04/02/2022
2018 - 04/02/2022
2019 - 04/02/2022
2020 - 04/02/2022
2021 - 08/09/2022
2022 - 12/01/2023
2023 - 09/27/2024
2024 - 08/25/2025

Deposition species are in mg/L; Precip is in mm

##########################################################################

NADP/AMON (https://nadp.slh.wisc.edu/networks/ammonia-monitoring-network/)

All Years - 09/22/2020

##########################################################################

NADP/MDN (https://nadp.slh.wisc.edu/networks/mercury-deposition-network/)

All Years - 01/24/2018

##########################################################################

IMPROVE (http://views.cira.colostate.edu/fed/DataWizard/Default.aspx)

2000 - 12/05/2007
2001 - 12/05/2007
2002 - 12/05/2007
2003 - 01/13/2009
2004 - 01/13/2009
2005 - 01/13/2009
2006 - 05/08/2008
2007 - 07/13/2012
2008 - 05/12/2010
2009 - 03/24/2011
2010 - 01/02/2013
2011 - 02/19/2016
2012 - 02/19/2016
2013 - 01/24/2018
2014 - 01/24/2018
2015 - 01/24/2018
2016 - 11/13/2018
2017 - 03/01/2019
2018 - 12/23/2019
2019 - 05/05/2022
2020 - 05/05/2022
2021 - 08/09/2022
2022 - 03/22/2024
2023 - 09/17/2024
2024 - 08/21/2025

All species are in units of ug/m3.

##########################################################################

CSN (https://aqs.epa.gov/aqsweb/airdata/download_files.html)
Obtained from the EPA's AQS Database (pregenerated files)

2000 - 10/08/2021
2001 - 10/08/2021
2002 - 10/08/2021
2003 - 10/08/2021
2004 - 10/08/2021
2005 - 10/08/2021
2006 - 10/08/2021
2007 - 10/08/2021
2008 - 10/08/2021
2009 - 10/08/2021
2010 - 10/08/2021 
2011 - 10/08/2021
2012 - 10/08/2021
2016 - 10/08/2021
2017 - 01/10/2025
2018 - 01/10/2025
2019 - 01/10/2025
2020 - 01/10/2025
2021 - 01/10/2025
2022 - 01/10/2025
2023 - 01/10/2025
2024 - 08/21/2025

SO4,NO3,NH4,Na,Na_Ion,Cl,Al,Ca,Fe,Si,Ti,Mg,K,K_Ion,Mn,PM25_88101_method_code,PM25_88101,PM25_88502_method_code,PM25_88502,OC_88320,EC_88321,OC_88370,EC_88380,OC_88355,EC_88357,PM10_81102,OC1_88324,OC2_88325,OC3_88326,OC4_88327,Benzene,Propylene,Toluene,Butadiene,Ethane,Ethylene,Isoprene,Acetylene,Sum_PAMS_Target_Compounds,Total_NMOC,Acrolein,Acrolein_Unverified,Acetone,Acetaldehyde,Formaldehyde,Methyl_ethyl_ketone,OC_88305_Artifact,OC_88370_Artifact,OC_88305,EC_88307,OC_88305_adj,EC_88307_adj,OC_88370_adj,OC,EC,PM25,PM25_method_code
ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,,ug/m3,,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3

##########################################################################

CSN from VIEWS (http://views.cira.colostate.edu/fed/DataWizard/Default.aspx)

2011 - 01/24/2018
2012 - 01/24/2018
2013 - 01/24/2018
2014 - 01/24/2018
2015 - 01/24/2018
2016 - 01/23/2018
2017 - 07/18/2018
2018 - N/A
2019 - N/A
2020 - N/A
2021 - N/A
2022 - N/A
2023 - N/A

##########################################################################

CASTNET Hourly (http://www.epa.gov/castnet)

2000 - 08/05/2011
2001 - 12/20/2007
2002 - 12/20/2007
2003 - 12/20/2007
2004 - 12/20/2007
2005 - 12/20/2007
2006 - 08/27/2008
2007 - 09/08/2009
2008 - 05/15/2013
2009 - 05/19/2011
2010 - 05/08/2012
2011 - 05/08/2012
2012 - 10/24/2013
2013 - 11/17/2014
2014 - 06/04/2015
2015 - 05/25/2017
2016 - 11/13/2018
2017 - 08/01/2019
2018 - 05/05/2020
2019 - 09/23/2020
2020 - 05/11/2021
2021 - 08/09/2022
2022 - 12/01/2023
2023 - 09/27/2024
2024 - 08/21/2025

TEMPERATURE,TEMPERATURE_DELTA,RELATIVE_HUMIDITY,SOLAR_RADIATION,OZONE,PRECIPITATION,WINDSPEED,WIND_DIRECTION,SIGMA_THETA
C,C,%,watts/m2,ppb,mm/hr,m/s,degrees,degrees

##########################################################################

CASTNET Hourly Gas (http://www.epa.gov/castnet)

2000 - NA
2001 - NA
2002 - NA
2003 - NA
2004 - NA
2005 - NA
2006 - NA
2007 - NA
2008 - 09/08/2025
2009 - 09/08/2025
2010 - 09/08/2025
2011 - 09/08/2025
2012 - 09/08/2025
2013 - 09/08/2025
2014 - 09/08/2025
2015 - 09/08/2025
2016 - 09/08/2025
2017 - 09/08/2025
2018 - 09/08/2025
2019 - 09/08/2025
2020 - 09/08/2025
2021 - 09/08/2025
2022 - 09/08/2025
2023 - 09/08/2025
2024 - 09/08/2025

CO,SO2,NO,NO2,NOX,NOY,NH3,HNO3
ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb

##########################################################################

CASTNET Weekly (http://www.epa.gov/castnet)

2000 - 02/22/2016
2001 - 02/22/2016
2002 - 02/22/2016
2003 - 02/22/2016
2004 - 02/22/2016
2005 - 02/22/2016
2006 - 02/22/2016
2007 - 02/22/2016
2008 - 02/22/2016
2009 - 02/22/2016
2010 - 02/22/2016
2011 - 02/22/2016
2012 - 02/22/2016
2013 - 02/22/2016
2014 - 02/22/2016
2015 - 02/01/2017
2016 - 09/07/2017
2017 - 07/18/2018
2018 - 12/23/2019
2019 - 09/23/2020
2020 - 05/11/2021
2021 - 08/09/2022
2022 - 12/01/2023
2023 - 09/27/2024
2024 - 08/21/2025

TSO4,TNO3,TNH4,CA,MG,NA,K,CL,NSO4,NHNO3,WSO2,WNO3,TOTAL_SO2,TOTAL_NO3
ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3

##########################################################################

AQS Hourly (https://aqs.epa.gov/aqsweb/airdata/download_files.html)

2000 - 01/24/2018
2001 - 01/24/2018
2002 - 01/24/2018
2003 - 01/24/2018
2004 - 01/24/2018
2005 - 01/24/2018
2006 - 01/24/2018
2007 - 01/24/2018
2008 - 01/24/2018
2009 - 01/24/2018
2010 - 01/24/2018
2011 - 01/24/2018
2012 - 01/24/2018
2013 - 01/24/2018
2014 - 01/24/2018
2015 - 01/24/2018
2016 - 09/10/2018
2017 - 01/10/2025
2018 - 01/10/2025
2019 - 01/10/2025
2020 - 01/10/2025
2021 - 01/10/2025
2022 - 01/10/2025
2023 - 01/10/2025
2024 - 08/21/2025

O3,CO,SO2,NO,NO2,NOX,NOY,Pressure,RH,Temperature,Dewpoint,Wind_Speed,Wind_Direction,Benzene,Propylene,Toluene,Butadiene,Isoprene,Ethane,Ethylene,Acetylene,Sum_PAMS_Target_Compounds,Total_NMOC,SO4,NO3,PM25_88101_method_code,PM25_88101,PM25_88502_method_code,PM25_88502,PM10_81102,PM25,PM25_method_code
ppb,ppb,ppb,ppb,ppb,ppb,ppb,hPa,%,C,C,m/s,degrees,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ug/m3,ug/m3,,ug/m3,,ug/m3,ug/m3,ug/m3

##########################################################################

AQS Daily (https://aqs.epa.gov/aqsweb/airdata/download_files.html)

2000 - 08/13/2025
2001 - 08/13/2025
2002 - 08/13/2025
2003 - 08/13/2025
2004 - 08/13/2025
2005 - 08/13/2025
2006 - 08/13/2025
2007 - 08/13/2025
2008 - 08/13/2025
2009 - 08/13/2025
2010 - 08/13/2025
2011 - 08/13/2025
2012 - 08/13/2025
2013 - 08/13/2025
2014 - 08/13/2025
2015 - 08/13/2025
2016 - 08/13/2025
2017 - 08/13/2025
2018 - 08/13/2025
2019 - 08/13/2025
2020 - 08/13/2025
2021 - 08/13/2025
2022 - 08/13/2025
2023 - 08/13/2025
2024 - 08/21/2025

CO,SO2,NO,NO2,NOX,NOY,SO4,NO3,NH4,Na,Na_Ion,Cl,Al,Ca,Fe,Si,Ti,Mg,K,K_Ion,Mn,PM25_88101_method_code,PM25_88101,PM25_88502_method_code,PM25_88502,OC_88320,EC_88321,OC_88370,EC_88380,OC_88355,EC_88357,PM10_81102,OC1_88324,OC2_88325,OC3_88326,OC4_88327,Benzene,Propylene,Toluene,Butadiene,Ethane,Ethylene,Isoprene,Acetylene,Sum_PAMS_Target_Compounds,Total_NMOC,Acrolein,Acrolein_Unverified,Acetone,Acetaldehyde,Formaldehyde,Methyl_ethyl_ketone,OC_88305_Artifact,OC_88370_Artifact,OC_88305,EC_88307,OC_88305_adj,EC_88307_adj,OC_88370_adj,OC,EC,PM25,PM25_method_code
ppbV,ppbV,ppbV,ppbV,ppbV,ppbV,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,,ug/m3,,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ppb,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3,ug/m3

##########################################################################

AQS Daily VOC (https://aqs.epa.gov/aqsweb/airdata/download_files.html)

2000 - 04/25/2025
2001 - 04/25/2025
2002 - 04/25/2025
2003 - 04/25/2025
2004 - 04/25/2025
2005 - 04/25/2025
2006 - 04/25/2025
2007 - 04/25/2025
2008 - 04/25/2025
2009 - 04/25/2025
2010 - 04/25/2025
2011 - 04/25/2025
2012 - 04/25/2025
2013 - 04/25/2025
2014 - 04/25/2025
2015 - 04/25/2025
2016 - 04/25/2025
2017 - 04/25/2025
2018 - 04/25/2025
2019 - 04/25/2025
2020 - 04/25/2025
2021 - 04/25/2025
2022 - 04/25/2025
2023 - 04/25/2025
2024 - 08/18/2025

##########################################################################

AQS Hourly VOC (https://aqs.epa.gov/aqsweb/airdata/download_files.html)

2000 - 04/25/2025
2001 - 04/25/2025
2002 - 04/25/2025
2003 - 04/25/2025
2004 - 04/25/2025
2005 - 04/25/2025
2006 - 04/25/2025
2007 - 04/25/2025
2008 - 04/25/2025
2009 - 04/25/2025
2010 - 04/25/2025
2011 - 04/25/2025
2012 - 04/25/2025
2013 - 04/25/2025
2014 - 04/25/2025
2015 - 04/25/2025
2016 - 04/25/2025
2017 - 04/25/2025
2018 - 04/25/2025
2019 - 04/25/2025
2020 - 04/25/2025
2021 - 04/25/2025
2022 - 04/25/2025
2023 - 04/25/2025
2024 - 08/18/2025

##########################################################################

SEARCH Hourly (http://www.atmospheric-research.com/public/index.html) *no longer available
*The SEARCH network was disbanded in 2016

2000 - 12/10/2010
2001 - 12/10/2010
2002 - 12/10/2010
2003 - 12/16/2015
2004 - 12/16/2015
2005 - 11/23/2015
2006 - 11/23/2015
2007 - 11/23/2015
2008 - 11/23/2015
2009 - 11/23/2015
2010 - 12/01/2015
2011 - 12/01/2015
2012 - 12/01/2015
2013 - 02/23/2016
2014 - 03/08/2018
2015 - 03/08/2018
2016 - 03/08/2018
2017 - NA; Network disbanded 

##########################################################################

SEARCH Daily (http://www.atmospheric-research.com/public/index.html) *no longer available
*The SEARCH network was disbanded in 2016

2000 - NA
2001 - NA
2002 - NA
2003 - NA
2004 - NA
2005 - 02/11/2010
2006 - 05/21/2008
2007 - 05/17/2011
2008 - 10/08/2014
2009 - 10/08/2014
2010 - 10/08/2014
2011 - 02/10/2016
2012 - 02/10/2016
2013 - 02/10/2016
2014 - 03/05/2018
2015 - 03/05/2018
2016 - 02/20/2019
2017 - NA; Network disbanded

##########################################################################

AERONET Hourly (http://aeronet.gsfc.nasa.gov/new_web/data.html)

2000 - 01/29/2025
2001 - 01/29/2025
2002 - 01/29/2025
2003 - 01/29/2025
2004 - 01/29/2025
2005 - 01/29/2025
2006 - 01/29/2025
2007 - 01/29/2025
2008 - 01/29/2025
2009 - 01/29/2025
2010 - 01/29/2025
2011 - 01/29/2025
2012 - 01/29/2025
2013 - 01/29/2025
2014 - 01/29/2025
2015 - 01/29/2025
2016 - 01/29/2025
2017 - 01/29/2025
2018 - 01/29/2025
2019 - 01/29/2025
2020 - 01/29/2025
2021 - 01/29/2025
2022 - 01/29/2025
2023 - 01/29/2025
2024 - 01/29/2025

All species are in units of nanometers.

##########################################################################

NAPS (https://data.ec.gc.ca/data/air/monitor/national-air-pollution-surveillance-naps-program/)

2000 - 05/15/2012
2001 - 05/15/2012
2002 - 05/15/2012
2003 - 05/15/2012
2004 - 05/15/2012
2005 - 05/15/2012
2006 - 05/15/2012
2007 - 05/15/2012
2008 - 05/15/2012
2009 - 05/15/2012
2010 - 05/15/2012
2011 - 01/30/2018
2012 - 01/30/2018
2013 - 01/30/2018
2014 - 01/30/2018
2015 - 01/30/2018
2016 - 10/30/2018
2017 - 01/28/2020 
2018 - 04/02/2022
2019 - 04/02/2022
2020 - 06/17/2022
2021 - 03/23/2023
2022 - 01/10/2025 
2023 - 05/19/2025 
2024 - N/A

O3,TEOMPM25,TEOMPM10,CO,NO,NO2,NOX,SO2
ppb,ug/m3,ug/m3,ppb,ppb,ppb,ppb,ppb

##########################################################################

FLUXNET (http://ameriflux.lbl.gov/)

2000 - 06/10/2016
2001 - 06/10/2016
2002 - 06/10/2016
2003 - 06/10/2016
2004 - 06/10/2016
2005 - 06/10/2016
2006 - 06/10/2016
2007 - 06/10/2016
2008 - 06/10/2016
2009 - 06/10/2016
2010 - 06/10/2016
2011 - 06/10/2016
2012 - 06/10/2016
2013 - 06/10/2016
2014 - 06/10/2016
2015 - 06/10/2016
2016 - N/A
2017 - N/A
2018 - N/A
2019 - N/A
2020 - N/A
2021 - N/A
2022 - N/A
2023 - N/A
2024 - N/A

##########################################################################

NOAA ESRL surface ozone (https://gml.noaa.gov/ozwv/surfoz/)

2000 - 04/14/2025
2001 - 04/14/2025
2002 - 04/14/2025
2003 - 04/14/2025
2004 - 04/14/2025
2005 - 04/14/2025
2006 - 04/14/2025
2007 - 04/14/2025
2008 - 04/14/2025
2009 - 04/14/2025
2010 - 04/14/2025
2011 - 04/14/2025
2012 - 04/14/2025
2013 - 04/14/2025
2014 - 04/14/2025
2015 - 04/14/2025
2016 - 04/14/2025
2017 - 04/14/2025
2018 - 04/14/2025
2019 - 04/14/2025 
2020 - 04/14/2025
2021 - 04/14/2025
2022 - 04/14/2025
2023 - 04/14/2025
2024 - N/A

All species are in units of ppb.

##########################################################################

Tropospheric Ozone Assessment Report (TOAR)

2000 - 06/08/2022
2001 - 06/08/2022
2002 - 06/08/2022
2003 - 06/08/2022
2004 - 06/08/2022
2005 - 06/08/2022
2006 - 06/08/2022
2007 - 06/08/2022
2008 - 06/08/2022
2009 - 06/08/2022
2010 - 06/08/2022
2011 - 06/08/2022
2012 - 06/08/2022
2013 - 06/08/2022
2014 - 06/08/2022
2015 - 06/08/2022
2016 - 06/08/2022
2017 - Ended

All species are in units of ppb.

##########################################################################

Tropospheric Ozone Assessment Report 2 (TOAR2)

2000 - 01/28/2025
2001 - 01/28/2025
2002 - 01/28/2025
2003 - 01/28/2025
2004 - 01/28/2025
2005 - 01/28/2025
2006 - 01/28/2025
2007 - 01/28/2025
2008 - 01/28/2025
2009 - 01/28/2025
2010 - 01/28/2025
2011 - 01/28/2025
2012 - 01/28/2025
2013 - 01/28/2025
2014 - 01/28/2025
2015 - 01/28/2025
2016 - 01/28/2025
2017 - 01/28/2025
2018 - 01/28/2025
2019 - 01/28/2025
2020 - 01/28/2025
2021 - 01/28/2025
2022 - 01/28/2025
2023 - 01/28/2025
2024 - 01/28/2025

All species are in units of ppb.
