clear all

cd "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Universit√†\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project"

* THE FIRST ELECTION WE ARE GOING TO INTRODUCE IS 2013

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Universit√†\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2013.txt"

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


egen medianshare13 = median(voteshare13)

egen supershare13 = pctile(voteshare13), p(75)


* Save the results to a new dataset
save "voteshare.dta", replace 
clear



* DO THE SAME NOW, BUT FOR 2018 ELECTIONS

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Universit√†\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2018.txt"

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

egen medianshare18 = median(voteshare18)


egen supershare18 = pctile(voteshare18), p(75)



* Save the results to a new dataset
save "voteshare18.dta", replace 


**************************************************************
**************************************************************
********** NOW, WE ADD ELECTION OF 2008 **********************
**************************************************************
**************************************************************

clear

import delimited "C:\Users\feder\OneDrive\Documenti Fede\Scuola\Universit√†\MSc in Economics\Next Exams\Labor Economics\Final Project\LABOR FINAL PROJECT\Labor-Economics---Final-Project\camera2008.txt"

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Save the results to a new dataset
save "voteshare08.dta", replace 

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "LEGA NORD" | lista == "LA DESTRA - FIAMMA TRICOLORE" | lista == "IL POPOLO DELLA LIBERTA'")
keep if keep == 1

drop keep

* Collapse the dataset to sum up votes by province and list
collapse (sum) voti_lista votanti, by(circoscrizione lista)

* Keep only desired parties and calculate their share of vote by province
gen keep = (lista == "FORZA NUOVA" | lista == "LEGA NORD" | lista == "LA DESTRA - FIAMMA TRICOLORE" | lista == "IL POPOLO DELLA LIBERTA'")
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

egen medianshare08 = median(voteshare08)


egen supershare08 = pctile(voteshare08), p(75)




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

gen medianshare=.
replace medianshare = medianshare08 if anno == 2010
replace medianshare = medianshare13 if anno == 2014
replace medianshare = medianshare18 if anno == 2020


gen supershare=.
replace supershare = supershare08 if anno == 2010
replace supershare = supershare13 if anno == 2014
replace supershare = supershare18 if anno == 2020




drop voteshare08 voteshare13 voteshare18 medianshare08 medianshare13 medianshare18 supershare08 supershare13 supershare18



merge m:1 nquest nord anno using rper.dta
drop if _merge==1
drop if _merge==2
drop _merge

merge m:1 nquest nord anno using ldip.dta
drop if _merge==1
drop if _merge==2
drop _merge




gen eta2=eta^2
gen unemp=1 if qualp10==10
*drop if qualp10==10
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

*drop iprov acom5 par eta5 settp3 qualp7 qualp10 qualp3 nonoc area5 area3 settp7 cfdic cfeur qualp7n acom4c settp9
*drop settp11 cfred nequ perl perc nperl etapen asnonoc qualp10n asnonoc2 
*drop yl2 yl1 ytp1 ytp2 ym3 yl ytp yta yt ym1 ym2 ym yca1 yca2 yca ycf2 ycf3 ycf4 y1 ycf1 ycf yc ycf1l ycf2l ycfl unemp 

* Specify panel variables

egen  id = group(nquest anasc ireg)



*egen id = group(nord nquest)

gen wave=.
replace wave = 1 if anno==2010
replace wave = 2 if anno==2014
replace wave = 3 if anno==2020

duplicates tag id anno, gen(isdup) 
drop if isdup


xtset id wave

sort id wave


gen figli=0
replace figli=1 if ncomp>2 | ncomp==2 & ncomp-nperc>0

gen sposato=0
replace sposato=1 if staciv==1

gen femfigli=0
replace femfigli=femmina*figli

gen whitecollar = 0
replace whitecollar = 1 if qualp10n==2 
gen bluecollar = 0
replace bluecollar = 1 if qualp10n==1
gen manager = 0
replace manager =1 if qualp10n==3 | qualp10n == 4

gen south=0
replace south = 1 if area3 == 3 

gen north=0
replace north =1 if area3 == 1

gen northeast=0
replace northeast=1 if area5==2

gen northwest=0
replace northwest=1 if area5==1

gen center=0
replace center=1 if area3 == 2


gen voteshare2=voteshare^2

gen dis=0
replace dis=1 if enasc2==2

gen disvoteshare=dis*voteshare

gen aboveshare = 0
replace aboveshare = 1 if voteshare>medianshare

gen extrashare = 0 
replace extrashare = 1 if voteshare>supershare



*xtreg logy femmina eta eta2 yedu sposato figli femfigli voteshare i.ireg i.wave if imm==1, fe robust

*drop if qualp10>4



* Regression for immigrants

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare dis if imm == 1, absorb(wave) cluster(id) resid

estimates store model1imm

predict residuals, resid

// Generate a variable for the predicted values
gen predicted = logy - residuals

// Create a scatterplot of the residuals
*scatter residuals predicted if !missing(residuals, predicted)

drop predicted residuals


* Regression for natives

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare if imm == 0, absorb(wave) cluster(id) resid

estimates store model1nat

predict residuals, resid

// Generate a variable for the predicted values
gen predicted = logy - residuals

// Create a scatterplot of the residuals
*scatter residuals predicted if !missing(residuals, predicted)

drop predicted residuals


oaxaca logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare, by(imm) weight(1)

estimates store model1oax




* Together

gen voteshareimm=voteshare*imm


reghdfe logy imm oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare dis , absorb(wave) cluster(id)


* Regression for immigrants with the square of votes

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare voteshare2 dis if imm == 1, absorb(wave) cluster(id)

estimates store model2imm


* Regression for natives with the square of votes

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare voteshare2 if imm == 0, absorb(wave) cluster(id)

estimates store model2nat


oaxaca logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south voteshare voteshare2, by(imm) weight(1)

estimates store model2oax



* Regression for immigrants with dummy for votes above the median

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare dis if imm == 1, absorb(wave) cluster(id)

estimates store model3imm



* Regression for natives with dummy for votes above the median

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare if imm == 0, absorb(wave) cluster(id)

estimates store model3nat


oaxaca logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare, by(imm) weight(1)

estimates store model3oax




* Generate a new aboveshare dummy, for votes vetween median and 75th perc

drop aboveshare

gen aboveshare = 0
replace aboveshare = 1 if voteshare>medianshare & voteshare<supershare




* Regression for immigrants with dummy for votes above the median and dummy for above 75th percentile

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare extrashare dis if imm == 1, absorb(wave) cluster(id)

estimates store model4imm



* Regression for natives with dummy for votes above the median and dummy for above 75th percentile

reghdfe logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare extrashare if imm == 0, absorb(wave) cluster(id)

estimates store model4nat



oaxaca logy oretot femmina eta eta2 yedu figli whitecollar bluecollar manager northeast northwest south aboveshare extrashare, by(imm) weight(1)

estimates store model4oax

save "modifiedset.dta", replace



* per la regressione, inserire solo 2010 2014 e 2020. diue regressioni separate per native e immigrants. aggiungendo region fixed effects e wave fixed effects

* si pu√≤ anche aggiungere una dummy per risultati regionali rispetto la mediana, o due dummy, 50 e 75 % per edere monotonicit√† effettpo. altra possibilit√† e√Ļ√® usare share e share al quadrato


* CONTROLLA QUALI REGIONI POSSONO ESSERE DRINVING PER L'EXTRASHARE

* a quanto pare sono Lombardia, Veneto, Friuli, Campania nel 2008
* Lombardia, Veneto, Campania e Puglia nel 2013
* Piemonte, Veneto, Lombardia, Friuli e Umbria nel 2018

* AGGIUNGI QUALCHE ALTRO CONTROLLO PER LE MACROAREE (CENTRO NORDEST NORDOVEST)

summarize logy oretot femmina eta yedu figli whitecollar bluecollar manager northeast northwest south aboveshare extrashare voteshare

*PRODUZIONE TABELLE LATEX. TENTATIVE SOLUTIONS

esttab model1imm model1nat model3imm model3nat model4imm model4nat using "base.tex", r2 se(%8.2f)  b(%8.2f) compress replace drop(eta2 bluecollar _cons)



* LET'S TRY TO DESIGN SOME MAPS!



/* 2. Convert shapefile to Stata attribute and coordinate datasets */
shp2dta using reg2023, data("reg-attr.dta") coord("reg-coord.dta") ///
 genid(stid) gencentroids(cc) replace
/* 3. Draw map */
use "reg-attr.dta", clear

rename COD_REG ireg
merge 1:1 ireg using voteshare18.dta
replace voteshare18=voteshare18*100
spmap voteshare18 using "reg-coord.dta", id(stid) ocolor(black) fcolor(Blues2) osize(vthin)

use "reg-attr.dta", clear

rename COD_REG ireg

merge 1:1 ireg using voteshare08.dta
replace voteshare08=voteshare08*100
spmap voteshare08 using "reg-coord.dta", id(stid) ocolor(black) fcolor(Blues2) osize(vthin)


use "reg-attr.dta", clear

rename COD_REG ireg

merge 1:1 ireg using voteshare.dta
replace voteshare13=voteshare13*100
spmap voteshare13 using "reg-coord.dta", id(stid) ocolor(black) fcolor(Blues2) osize(vthin)




