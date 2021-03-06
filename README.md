# BST260-Final-Project

## Final Project 
This is the final project repository for the Fall 2018 section of BST 260 at Harvard's T.H. Chan School of Public Health. According to the course syllabus, "the goal of the project is to go through the complete data science process to answer questions you have about some topic of your own choosing. You will acquire the data, design your visualizations, run statistical analyses, and communicate results." 

## Team Members 
The following students contributed to this project: 

1. Jonathan Waring 
2. Selena Huang 
3. Erica Moreira 
4. Jacob Rosenthal 

## Data Set Information 
The dataset represents 10 years (1999-2008) of clinical care at 130 US hospitals and integrated delivery networks. It includes over 50 features representing patient and hospital outcomes. Information was extracted from the database for encounters that satisfied the following criteria.

1. It is an inpatient encounter (a hospital admission).
2. It is a diabetic encounter, that is, one during which any kind of diabetes was entered to the system as a diagnosis.
3. The length of stay was at least 1 day and at most 14 days.
4. Laboratory tests were performed during the encounter.
5. Medications were administered during the encounter.

The data contains such attributes as patient number, race, gender, age, admission type, time in hospital, medical specialty of admitting physician, number of lab test performed, HbA1c test result, diagnosis, number of medication, diabetic medications, number of outpatient, inpatient, and emergency visits in the year before the hospitalization, etc. 

The dataset is avaliable from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Diabetes+130-US+hospitals+for+years+1999-2008) 

The project is a 3-way classification task in which we try to predict if a patient will either 

1. Not be readmitted 
2. Be readmitted in >30 days 
3. Be readmitted in <30 days
