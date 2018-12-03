library(tableone)

dput(names(dat))

myVars <- c("time_in_hospital", "num_lab_procedures", 
            "num_procedures", "num_medications", "number_outpatient", "number_emergency", 
            "number_inpatient", "number_diagnoses", "start_age", "end_age", "healthcare_utilization",
            "num_other_diabetes_meds_up_stdy_dwn")

catVars <- c("race", "gender", "max_glu_serum", "A1Cresult", "insulin", "change", "at_emergent", "at_elective", 
             "at_other", "dd_home", "dd_facility_transfer", "dd_other", "dd_admitted", 
             "dd_hospice", "as_outpatient", "as_facility_transfer", "as_ed", 
             "as_other", "as_newborn", "diag_1grp_Blood", "diag_1grp_Circulatory", 
             "diag_1grp_Congenital", "diag_1grp_Diabetes", "diag_1grp_Digestive", 
             "diag_1grp_Endocrine_Nutrition_Metabolic", "diag_1grp_External", 
             "diag_1grp_Genitourinary", "diag_1grp_Infectious", "diag_1grp_Injury", 
             "diag_1grp_Mental", "diag_1grp_Musculoskeletal", "diag_1grp_Neoplasm", 
             "diag_1grp_Nervous", "diag_1grp_Other", "diag_1grp_Pregnancy", 
             "diag_1grp_Respiratory", "diag_1grp_Sense", "diag_1grp_Skin", 
             "diag_1grp_Unknown", "diag_2grp_Blood", "diag_2grp_Circulatory", 
             "diag_2grp_Congenital", "diag_2grp_Diabetes", "diag_2grp_Digestive", 
             "diag_2grp_Endocrine_Nutrition_Metabolic", "diag_2grp_External", 
             "diag_2grp_Genitourinary", "diag_2grp_Infectious", "diag_2grp_Injury", 
             "diag_2grp_Mental", "diag_2grp_Musculoskeletal", "diag_2grp_Neoplasm", 
             "diag_2grp_Nervous", "diag_2grp_Other", "diag_2grp_Pregnancy", 
             "diag_2grp_Respiratory", "diag_2grp_Sense", "diag_2grp_Skin", 
             "diag_2grp_Unknown", "readmitted")

tab1 <- CreateTableOne(strata = "readmitted", data = dat, factorVars = catVars)

tab1

summary(tab1)
