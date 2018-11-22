# load dataset
dat <- read.csv("dataset/diabetic_data.csv")
head(dat)

# I set up dummy variables as I described in the xlsx file I made in the dataset folder
# can also make them into factor variables

# set up dummy variables for admission types
library(tidyverse)
dat <- mutate(dat, at_emergent = as.numeric(admission_type_id %in% c(1, 2, 7)), 
              at_elective = as.numeric(admission_type_id == 3), 
              at_other = as.numeric(admission_type_id %in% c(4, 5, 6, 8)))
dat %>% summarise(mean(at_emergent), mean(at_elective), mean(at_other))

# set up dummy variables for discharge dispositions
dat <- mutate(dat, dd_home = as.numeric(discharge_disposition_id %in% c(1, 6, 8)), 
              dd_facility_transfer = as.numeric(discharge_disposition_id %in% c(2, 3, 4, 5, 10, 16, 17, 22, 23, 24, 30, 27, 28, 29)), 
              dd_other = as.numeric(discharge_disposition_id %in% c(7, 18, 25, 26)), 
              dd_admitted = as.numeric(discharge_disposition_id %in% c(9, 12, 15)),
              dd_expired = as.numeric(discharge_disposition_id %in% c(11, 19, 20, 21)),
              dd_hospice = as.numeric(discharge_disposition_id %in% c(13, 14)))
dat %>% summarise(mean(dd_home), mean(dd_facility_transfer), mean(dd_other), mean(dd_admitted), mean(dd_expired), mean(dd_hospice))

# set up dummy variables for admission source
dat <- mutate(dat, as_outpatient = as.numeric(admission_source_id %in% c(1, 2, 3)),
              as_facility_transfer = as.numeric(admission_source_id %in% c(4, 5, 6, 10, 18, 19, 22, 25, 26)),
              as_ed = as.numeric(admission_source_id %in% c(7)),
              as_other = as.numeric(admission_source_id %in% c(8, 9, 15, 17, 20, 21)),
              as_newborn = as.numeric(admission_source_id %in% c(11, 12, 13, 14, 23, 24)))
dat %>% summarise(mean(as_outpatient), mean(as_facility_transfer), mean(as_ed), mean(as_other), mean(as_newborn))
