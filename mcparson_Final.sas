************************************************;
*Author: Maxwell Parsons                                                                            ;                                                                            ;
*Program Purpose: ST 307 Final Project   ;
*Date:12/5/2024                                                                                     ;
************************************************;

*Prescriptive Tasks;
*Part 1;
*Create a permanent library called mcparson using a LIBNAME statement;
LIBNAME mcparson '/home/u63986259/myLib';

*Part 2:; 
*Write code to read in the mcparson_house.csv data set using PROC IMPORT; 
FILENAME House URL 'https://www4.stat.ncsu.edu/~online/ST307/Data/mcparson_house.csv'; 

PROC IMPORT
	datafile= House 
	dbms= csv
	out= mcparson.House;
run;

*Part 3; 
*Use a DATA step to copy the data set read in question 2 into a temporary data set
called myHouse and remove any observations where the Functional variable takes the value 
Other or the FullBath variable takes on a value less than or equal to 1...; 
DATA myHouse;
	set mcparson.House; 
	where (Functional ~= 'Other') and (FullBath <= 1); 
*Create new variable SalePrice1...; 
	SalePrice1 = SalePrice/100000; 
*and Remove LotArea and PavedDrives variables; 
	drop LotArea PavedDrive; 
run; 

*Part 4; 
*With your temporary data set, use a PROC step to create a scatter plot using SalePrice on
the y-axis and TotalBsmtSF on the x-axis. Color the points by the MSZoning variable; 
PROC SGPLOT DATA= myHouse;
	scatter x=TotalBsmtSF y=SalePrice / group=MSZoning; 
run;
*When analyzing the scatterplot, I noticed that there is a linear pattern 
that suggests as TotalBsmtSF increases, SalePrice also tends to increase. 

*Part 5;
*With your temporary data set, fit a multiple linear regression 
model using SalePrice as the response variable and TotalBsmtSF and MoSold as predictors; 
PROC GLM DATA= myHouse plots = all; 
	model SalePrice = TotalBsmtSF MoSold/clparm;
run;
*The fitted or estimated rgression line is:  
SalePrice + 46855.36909 + 92.57005TotalBsmtSF + 1301.36288MoSold;
*The  95% confidence interval for the slope 
corresponding to the TotalBsmtSF variable is: (80.35108, 104.78902);

*Part 6; 
*Save Parts 3-5 as PDF;

***************************************************************;
*Open-ended Tasks; 

*URL of Dataset: *https://catalog.data.gov/dataset/supply-chain-shipment-pricing-data-07d29; 

*Part 1;
*Identify a question from your dataset;
*	Does the continent that materials are being shipped to affect the unit price?; 
*Part 2;
*Read the URL dataset into the library; 
FILENAME SupChain '/home/u63986259/myLib/Supply_Chain_Shipment_Pricing_Dataset.csv';

PROC IMPORT DATAFILE= SupChain
	DBMS= csv
	OUT= mcparson.SupChain
	REPLACE; 
	GETNAMES= YES; 
RUN;
*Part 3; 
*Fit your model (either a comparison of means or a linear regression model). Produce confidence
intervals/bands and diagnostic plots where appropriate; 
*Renamed 'unit price' variable to 'unitprice'; 
data mcparson.SupChain; 
	set mcparson.SupChain; 
	rename 'unit price'n = unitprice;
run;

*Comparison of means for unit price based for Vietnam; 
PROC TTEST data= mcparson.SupChain alpha=0.1 plots=all; 
	where country = 'Vietnam';
	VAR unitprice; 
run;

*Comparison of means for unit price based for Zambia; 
PROC TTEST data= mcparson.SupChain alpha=0.1 plots=all; 
	where country = 'Zambia';
	VAR unitprice; 
run;

*Based off of the data gathered from the TTEST above, we are 90% confident that the unit price in Vietnam 
is 0.2309, and the unit price in Zambia is 0.3153. We can infer that the continent shipped to does in fact 
effect the unit price as well. Vietnam, Asia, is 0.0844 less per unit than Zambia, Africa. So, shipping 
to a certain continent does effect price, and shipping to countries in Asia, are less than shipping 
to countries in Africa. ; 