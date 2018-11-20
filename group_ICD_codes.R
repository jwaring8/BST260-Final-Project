# Jacob Rosenthal
# BST 260 Project
# 11/20/18

# Code to group ICD codes according to Table 2 in (Strack et al. 2014)

ICD_group <- function(ICD_code){
  if (ICD_code == "?"){return(NA)}
  else if (grepl(ICD_code, pattern = "[EV]") == T){return("external")}
  else if (floor(as.numeric(ICD_code)) == 250){return("diabetes")}
  else if (ICD_code %in% c(390:459, 785)) {return("circulatory")}
  else if (ICD_code %in% c(460:519, 786)) {return("respiratory")}
  else if (ICD_code %in% c(520:579, 787)) {return("digestive")}
  else if (ICD_code %in% c(800:999)) {return("injury")}
  else if (ICD_code %in% c(710:739)) {return("musculoskeletal")}
  else if (ICD_code %in% c(580:629, 788)) {return("genitourinary")}
  else if (ICD_code %in% c(140:239)) {return("neoplasm")}
  else if (ICD_code %in% c(780, 781, 784, 790:799)) {return("other")}
  else if (ICD_code %in% c(240:249, 251:279)) {return("endocrine_nutrition_metabolic")}
  else if (ICD_code %in% c(680:709, 782)) {return("skin")}
  else if (ICD_code %in% c(001:139)) {return("infectious")}
  else if (ICD_code %in% c(290:319)) {return("mental")}
  else if (ICD_code %in% c(280:289)) {return("blood")}
  else if (ICD_code %in% c(320:359)) {return("nervous")}
  else if (ICD_code %in% c(630:679)) {return("pregnancy")}
  else if (ICD_code %in% c(360:389)) {return("sense")}
  else if (ICD_code %in% c(740:759)) {return("congenital")}
}

ICD_group <- Vectorize(ICD_group)

df$diag_1 <- ICD_group(df$diag_1)
df$diag_2 <- ICD_group(df$diag_2)
df$diag_3 <- ICD_group(df$diag_3)







