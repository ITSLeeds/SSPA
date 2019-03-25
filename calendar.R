# Aim: import calendar from web
library(rvest) # for webscraping
# u = "http://timetable.leeds.ac.uk/teaching/201819/reporting/textspreadsheet;?objectclass=module&idtype=name&identifier=TRAN5340M01&&template=SWSCUST+module+Individual&days=1-7&weeks=1-52&periods=1-21"
# other version
u = "http://timetable.leeds.ac.uk/teaching/201819/reporting/individual;?objectclass=module&idtype=name&identifier=TRAN5340M01&&template=SWSCUST+module+Individual&days=1-7&weeks=1-52&periods=1-21"
w14_start = as.Date("2019-01-28")
week_num = c(14:22, paste0("E", 1:4), 23:30)
n_weeks = length(week_num)
week_commencing = seq(from = w14_start, by = "week", length.out = n_weeks)
session_date = week_commencing + 1 # day of week, 1 for tuesday
day_of_week = lubridate::wday(session_date, label = TRUE)
weeks = data.frame(week_num, session_date)
weeks_teaching = c(19:22)
weeks = weeks[weeks$week_num %in% weeks_teaching, ]
readr::write_csv(weeks, "data/timetable-dates.csv")
# edit manually

ical::ical()

# scraping contents:
# timetable_scraped = xml2::read_html(u) %>% 
#   html_nodes("td:nth-child(9)") %>% 
#   html_text()
  # html_table(header = TRUE, trim = TRUE, fill = TRUE)
