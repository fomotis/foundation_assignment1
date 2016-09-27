DATA SENIC;
infile "C:\Users\OODOOE\Downloads\Video\Second Year\First Semester\Foundation\foundation_assignment1\Data\APPENC01.txt";
input IDNUM LOS Age IR RCR RCXR NumOfBeds MSA Region ADC NumberOfNurses AFAS;
label LOS='Length of Patient Stay'
	  Age='Age of patients'
	  IR='Infection Risk'
	  AFAS='Available Facilities and Services'
	  NumOfBeds='Number of Beds';
run;

*Scatter plot for each of the predictor variables;
title 'Stem and Leaf Plot';
ods listing;
ods graphics off;
ods select Plots SSPlots;
proc univariate data=Senic plot;
   var Age IR AFAS NumofBeds;
run;
title;

*Scatter Plot and Correlation Matrix for Model 1;
title 'Correlation Matrix and Scatter Plots for Model 1';
ods graphics on;
proc corr data=Senic plots=matrix(histogram);
var LOS Age IR AFAS;
run;
ods graphics off;
title;

*Scatter Plot and Correlation Matrix for Model 2;
title 'Correlation Matrix and Scatter Plots for Model 2';
ods graphics on;
proc corr data=Senic plots=matrix(histogram);
var LOS IR AFAS NumofBeds;
run;
ods graphics off;
title;
