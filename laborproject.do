clear all

cd "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Università\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project"

* THE FIRST ELECTION WE ARE GOING TO INTRODUCE IS 2013

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Università\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2013.txt"

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Save the results to a new dataset
save "voteshare.dta", replace 

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "FRATELLI D'ITALIA" | lista == "LEGA NORD" | lista == "LA DESTRA" | lista == "CASAPOUND ITALIA" | lista == "IO AMO L'ITALIA"| lista == "IL POPOLO DELLA LIBERTA'" | lista == "FIAMMA TRICOLORE" )
keep if keep == 1

drop keep

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "FRATELLI D'ITALIA" | lista == "LEGA NORD" | lista == "LA DESTRA" | lista == "CASAPOUND ITALIA" | lista == "IO AMO L'ITALIA"| lista == "IL POPOLO DELLA LIBERTA'" | lista == "FIAMMA TRICOLORE" )
keep if keep == 1

drop keep

* Create a variable to identify the region for each circoscrizione
gen region = substr(circoscrizione, 1, 5)

replace region = "LOMBARDIA" if substr(region,1,5) == "LOMBA"
replace region = "LAZIO" if substr(region,1,5) == "LAZIO"
replace region = "PUGLIA" if substr(region,1,5) == "PUGLI"
replace region = "CAMPANIA" if substr(region,1,5) == "CAMPA"
replace region = "SICILIA" if substr(region,1,5) == "SICIL"
replace region = "CALABRIA" if substr(region,1,5) == "CALAB"
replace region = "PIEMONTE" if substr(region,1,5) == "PIEMO"
replace region = "VENETO" if substr(region,1,5) == "VENET"
replace region = "MARCHE" if substr(region,1,5) == "MARCH"
replace region = "ABRUZZO" if substr(region,1,5) == "ABRUZ"
replace region = "MOLISE" if substr(region,1,5) == "MOLIS"
replace region = "BASILICATA" if substr(region,1,5) == "BASIL"
replace region = "SARDEGNA" if substr(region,1,5) == "SARDE"
replace region = "TOSCANA" if substr(region,1,5) == "TOSCA"
replace region = "FRIULI-VENEZIA GIULIA" if substr(region,1,5) == "FRIUL"
replace region = "LIGURIA" if substr(region,1,5) == "LIGUR"
replace region = "UMBRIA" if substr(region,1,5) == "UMBRI"
replace region = "TRENTINO ALTO-ADIGE" if substr(region,1,5) == "TRENT"
replace region = "EMILIA-ROMAGNA" if substr(region,1,5) == "EMILI"




* collapse by region and list
collapse (sum) voti_lista votanti, by(region lista)


gen voteshare13 = voti_lista / votanti
drop voti_lista votanti


collapse (sum) voteshare13, by(region)

* Save the results to a new dataset
save "voteshare.dta", replace 
clear



* DO THE SAME NOW, BUT FOR 2018 ELECTIONS

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Università\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2018.txt"

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Save the results to a new dataset
save "voteshare18.dta", replace 

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "FRATELLI D'ITALIA CON GIORGIA MELONI" | lista == "GRANDE NORD" | lista == "ITALIA AGLI ITALIANI" | lista == "CASAPOUND ITALIA" | lista == "LEGA"| lista == "FORZA ITALIA")
keep if keep == 1

drop keep

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FRATELLI D'ITALIA CON GIORGIA MELONI" | lista == "GRANDE NORD" | lista == "ITALIA AGLI ITALIANI" | lista == "CASAPOUND ITALIA" | lista == "LEGA"| lista == "FORZA ITALIA")
keep if keep == 1

drop keep

* Create a variable to identify the region for each circoscrizione
gen region = substr(circoscrizione, 1, 5)

replace region = "LOMBARDIA" if substr(region,1,5) == "LOMBA"
replace region = "LAZIO" if substr(region,1,5) == "LAZIO"
replace region = "PUGLIA" if substr(region,1,5) == "PUGLI"
replace region = "CAMPANIA" if substr(region,1,5) == "CAMPA"
replace region = "SICILIA" if substr(region,1,5) == "SICIL"
replace region = "CALABRIA" if substr(region,1,5) == "CALAB"
replace region = "PIEMONTE" if substr(region,1,5) == "PIEMO"
replace region = "VENETO" if substr(region,1,5) == "VENET"
replace region = "MARCHE" if substr(region,1,5) == "MARCH"
replace region = "ABRUZZO" if substr(region,1,5) == "ABRUZ"
replace region = "MOLISE" if substr(region,1,5) == "MOLIS"
replace region = "BASILICATA" if substr(region,1,5) == "BASIL"
replace region = "SARDEGNA" if substr(region,1,5) == "SARDE"
replace region = "TOSCANA" if substr(region,1,5) == "TOSCA"
replace region = "FRIULI-VENEZIA GIULIA" if substr(region,1,5) == "FRIUL"
replace region = "LIGURIA" if substr(region,1,5) == "LIGUR"
replace region = "UMBRIA" if substr(region,1,5) == "UMBRI"
replace region = "TRENTINO ALTO-ADIGE" if substr(region,1,5) == "TRENT"
replace region = "EMILIA-ROMAGNA" if substr(region,1,5) == "EMILI"




* collapse by region and list
collapse (sum) voti_lista votanti, by(region lista)


gen voteshare18 = voti_lista / votanti
drop voti_lista votanti


collapse (sum) voteshare18, by(region)

* Save the results to a new dataset
save "voteshare18.dta", replace 


**************************************************************
**************************************************************
********** NOW, WE ADD ELECTION OF 2008 **********************
**************************************************************
**************************************************************

clear

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Università\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2008.txt"

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Save the results to a new dataset
save "voteshare08.dta", replace 

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "LEGA NORD" | lista == "LA DESTRA - FIAMMA TRICOLORE")
keep if keep == 1

drop keep

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "LEGA NORD" | lista == "LA DESTRA - FIAMMA TRICOLORE")
keep if keep == 1

drop keep

* Create a variable to identify the region for each circoscrizione
gen region = substr(circoscrizione, 1, 5)

replace region = "LOMBARDIA" if substr(region,1,5) == "LOMBA"
replace region = "LAZIO" if substr(region,1,5) == "LAZIO"
replace region = "PUGLIA" if substr(region,1,5) == "PUGLI"
replace region = "CAMPANIA" if substr(region,1,5) == "CAMPA"
replace region = "SICILIA" if substr(region,1,5) == "SICIL"
replace region = "CALABRIA" if substr(region,1,5) == "CALAB"
replace region = "PIEMONTE" if substr(region,1,5) == "PIEMO"
replace region = "VENETO" if substr(region,1,5) == "VENET"
replace region = "MARCHE" if substr(region,1,5) == "MARCH"
replace region = "ABRUZZO" if substr(region,1,5) == "ABRUZ"
replace region = "MOLISE" if substr(region,1,5) == "MOLIS"
replace region = "BASILICATA" if substr(region,1,5) == "BASIL"
replace region = "SARDEGNA" if substr(region,1,5) == "SARDE"
replace region = "TOSCANA" if substr(region,1,5) == "TOSCA"
replace region = "FRIULI-VENEZIA GIULIA" if substr(region,1,5) == "FRIUL"
replace region = "LIGURIA" if substr(region,1,5) == "LIGUR"
replace region = "UMBRIA" if substr(region,1,5) == "UMBRI"
replace region = "TRENTINO ALTO-ADIGE" if substr(region,1,5) == "TRENT"
replace region = "EMILIA-ROMAGNA" if substr(region,1,5) == "EMILI"




* collapse by region and list
collapse (sum) voti_lista votanti, by(region lista)


gen voteshare08 = voti_lista / votanti
drop voti_lista votanti


collapse (sum) voteshare08, by(region)

* Save the results to a new dataset
save "voteshare08.dta", replace 



******************************************
*** FROM HERE ON, ASSIGNMENT OF CODES ****
******************************************

clear

* Load the ISTAT codes from a text file
import delimited "istatregion.txt", clear


* Save the results to a new dataset
save "istatregion.dta", replace 

* Load the election results dataset
use "voteshare.dta", clear

// merge the two datasets based on the provincia variable
merge m:1 region using "istatregion.dta"
drop if _merge==1
drop if _merge==2
drop _merge
rename codice ireg
drop region

// save the updated dataset
save "voteshare.dta", replace
sort ireg


************************
*now, same for 2018
***************************

* Load the election results dataset
use "voteshare18.dta", clear

// merge the two datasets based on the provincia variable
merge m:1 region using "istatregion.dta"
drop if _merge==1
drop if _merge==2
drop _merge
rename codice ireg
drop region

// save the updated dataset
save "voteshare18.dta", replace
sort ireg

*****************************
****** and the same for 2008
*****************************

* Load the election results dataset
use "voteshare08.dta", clear

// merge the two datasets based on the provincia variable
merge m:1 region using "istatregion.dta"
drop if _merge==1
drop if _merge==2
drop _merge
rename codice ireg
drop region

// save the updated dataset
save "voteshare08.dta", replace
sort ireg




use comp.dta, clear

merge m:1 ireg using voteshare08.dta
drop if _merge==1
drop if _merge==2
drop _merge


merge m:1 ireg using voteshare.dta
drop if _merge==1
drop if _merge==2
drop _merge

merge m:1 ireg using voteshare18.dta
drop if _merge==1
drop if _merge==2
drop _merge




keep if anno == 2010 | anno == 2014 | anno == 2020

gen voteshare=.
replace voteshare = voteshare08 if anno == 2010
replace voteshare = voteshare13 if anno == 2014
replace voteshare = voteshare18 if anno == 2020

drop voteshare08 voteshare13 voteshare18

merge m:1 nquest nord anno using rper.dta
drop if _merge==1
drop if _merge==2
drop _merge




gen eta2=eta^2
gen unemp=1 if qualp10==10
drop if qualp10==10
gen femmina = .
replace femmina = 0 if sesso == 1
replace femmina = 1 if sesso == 2
gen logy=log(y)
gen imm=.
replace imm = 0 if enasc2 == .
replace imm = 1 if enasc2 != .



*reg logy femmina eta eta2 studio voteshare imm if !missing(), robust

gen yedu=. // We generate a new variable yedu (years of education) and set it equal to zero
replace yedu=0 if studio==1 // 5 years of schooling to complete a primary level of education
replace yedu=5 if studio==2 // 5 years of schooling to complete a primary level of education
replace yedu=8 if studio==3 // 8 years of schooling to complete a lower secondary level of education
replace yedu=13 if studio==4 // 13 years of schooling to complete a secondary level of education
replace yedu=18 if studio==5 // 18 years of schooling to complete a tertiary level of education
replace yedu=21 if studio==6 // 21 years of schooling to complete a postgraduate level

tab yedu




* Specify panel variables

egen  id = group(nquest anasc sesso)



*egen id = group(nord nquest)

gen wave=.
replace wave = 1 if anno==2010
replace wave = 2 if anno==2014
replace wave = 3 if anno==2020

duplicates tag id anno, gen(isdup) 
drop if isdup


xtset id wave




gen figli=0
replace figli=1 if ncomp>2 | ncomp==2 & ncomp-nperc>0



* Regression for immigrants

reghdfe logy femmina eta eta2 yedu figli voteshare if imm == 1, absorb(ireg wave) cluster(id)

* Regression for natives

reghdfe logy femmina eta eta2 yedu figli voteshare if imm == 0, absorb(ireg wave) cluster(id)





* per la regressione, inserire solo 2010 2014 e 2020. diue regressioni separate per native e immigrants. aggiungendo region fixed effects e wave fixed effects

* si può anche aggiungere una dummy per risultati regionali rispetto la mediana, o due dummy, 50 e 75 % per edere monotonicità effettpo. altra possibilità eùè usare share e share al quadrato


