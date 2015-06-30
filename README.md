U folderu se nalaze originalni datasetovi sa KDDCup99.  
Od njih, datoteke data10percentWithLabels i correctedWithLabels su prilagođene za korištenje u Weki, te verzije se nalaze u folderu Weka.  

Folder original data sadrži originalne, javno dostupne podatke. Opis važnijih je niže.
kddcup.data.corrected je cijeli training set.  
kddcup.data_10_percent_corrected je 10% training seta. To je korišteno zbog veličine koja je nepogodna za većinu isprobanih algoritama.  
(nije u repozitoriju zbog github ograničenja) kddcup.testdata.unlabeled je testseta, ali bez oznaka kategorija, pa ju nije moguće cijelu koristiti.  
(nije u repozitoriju zbog github ograničenja) kddcup.testdata_unlabeled_10_percent je 10% testseta, isto bez oznaka vrsta napada.  
corrected je samo 10% testseta sa labelama. Nije pronađen cijeli kategoriziran testset.
labels.txt koristi listu svih mogućih vrsta napada.  
   
Folder awk sadrži awk skripte korištene za evaluaciju.  
Folder rezultati sadrži rezultate evaluacija. Podfolderi su rezultati evaluacije različitih algoritama sa različitim parametrima.  
Folder Weka files sadrži datoteke korištene u učenju i testiranju.  
