DATA SENIC;
infile "C:\Users\OODOOE\Downloads\Video\Second Year\First Semester\Foundation\foundation_assignment1\Data\APPENC01.txt";
input IDNUM LOS Age IR RCR RCXR NumOfBeds MSA Region ADC NumberOfNurses AFAS;
run;
proc print data=SENIC;
run;

data hw1;
set senic;
keep IDNUM LOS Age NumOfBeds IR AFAS;
run;
proc print data=hw1;
run;


***************A(WE CHOOSE METHOD 1 OR 2- I don't know which one is the best to use);
*Method 1;
ods listing;
ods graphics off;
proc univariate data=hw1 plot;
var Age;
run;
*Method 2;
ods graphics on;
ods select Plots SSPlots;
proc univariate data=hw1 plot;
   var Age;
run;
ods graphics on;
ods select Plots SSPlots;
proc univariate data=hw1 plot;
   var NumOfBeds;
run;
ods graphics on;
ods select Plots SSPlots;
proc univariate data=hw1 plot;
   var IR;
run;
ods graphics on;
ods select Plots SSPlots;
proc univariate data=hw1 plot;
   var AFAS;
run;

*************B;
proc sgscatter data=hw1;
  title "Scatterplot Matrix for Model 1";
  matrix LOS Age IR AFAS;
run;
title 'Correlation Matrix for Model 1';
proc hpcorr data=hw1 pearson;
   var Age IR AFAS;
run;
title;

proc sgscatter data=hw1;
  title "Scatterplot Matrix for Model 2";
  matrix LOS NumOfBeds IR AFAS;
run;
title 'Correlation Matrix for Model 2';
proc hpcorr data=hw1 pearson;
   var NumOfBeds IR AFAS;
run;
title;

***************C;
*First Order Regression Model 1;
ods graphics on;
proc reg;
  model LOS = Age IR AFAS;
run;
ods graphics off;

*First Order Regression Model 2;
ods graphics on;
proc reg;
  model LOS = NumOfBeds IR AFAS;
run;
ods graphics off;

*********D-we have the answers in the code for question C;

*********E-SORRY HERE I'M A LITTLE BIT LOST. I WILL TRY TOMORROW SOME CODES.;
