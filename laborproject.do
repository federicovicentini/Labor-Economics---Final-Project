clear all

cd "C:\Users\feder\OneDrive\Desktop\LABOR FINAL PROJECT"

import delimited "C:\Users\feder\OneDrive\Desktop\LABOR FINAL PROJECT\camera2013.txt"

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


gen voteshare = voti_lista / votanti
drop voti_lista votanti


collapse (sum) voteshare, by(region)

* Save the results to a new dataset
save "voteshare.dta", replace 
clear



* DO THE SAME NOW, BUT FOR 2018 ELECTIONS

import delimited "C:\Users\feder\OneDrive\Desktop\LABOR FINAL PROJECT\camera2018.txt"

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

* FROM HERE ON, ASSIGNMENT OF CODES


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

*for 2018


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






use comp.dta, clear
merge m:1 ireg using voteshare.dta
drop if _merge==1
drop if _merge==2
drop _merge

merge m:1 ireg using voteshare18.dta
drop if _merge==1
drop if _merge==2
drop _merge

gen changeshare=voteshare18-voteshare


keep if anno == 2012 | anno == 2020


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
gen ylm=log(y)

reg ylm femmina eta eta2 studio changeshare if !missing(), robust


* per la regressione, inserire solo 2014 e 2020. diue regressioni separate per native e immigrants. aggiungendo region fixed effects e wave fixed effects

* si può anche aggiungere una dummy per risultati regionali rispetto la mediana, o due dummy, 50 e 75 % per edere monotonicità effettpo. altra possibilità eùè usare share e share al quadrato


