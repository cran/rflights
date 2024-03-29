## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval = TRUE--------------------------------------------------------
library("rflights")
# get Argentina and toulouse IDs
arg_id <- find_location("Argentina", "country")
length(arg_id) # only one result, so it might be the one
arg_id <- arg_id[[1]]
names(arg_id)
arg_id$id
arg_id$continent
arg_id <- arg_id$id

tl_id <- find_location("toulouse")
length(tl_id)
lapply(tl_id, function(x) x$type)

# we are looking for the city
tl_id <- tl_id[[which(sapply(tl_id, function(x) x$type == "city"))]]
tl_id$country
tl_id <- tl_id$id
tl_id

## ---- eval = FALSE-------------------------------------------------------
#  # get flights from Argentina to toulouse around 01 July to 09 July
#  # Maybe I can go to the useR! 2019?
#  flights <- get_flights(
#    fly_from = "AR", fly_to = "toulouse_fr",
#    date_from = "01/09/2019", date_to = "09/09/2019"
#  )
#  length(flights)
#  names(flights[[1]])
#  sapply(flights, function(x) x$price)

## ---- eval = FALSE-------------------------------------------------------
#  my_savings <- 25 # yup, just 25USD ound_ticket <- FALSE
#  while (!found_ticket) {
#    flights <- get_flights(
#      fly_from = "AR", fly_to = "toulouse_fr",
#      date_from = "01/09/2019", date_to = "09/09/2019"
#    )
#    flights <- flights[sapply(flights, function(x) x$price) <= my_savings]
#    if (length(flights) > 0) {
#      send_alert(paste0(
#        "There is a plane ticket you can afford!\n",
#        "Check it out at Kiwi.com"
#      ))
#      # user-defined alert function (not in rflights)
#    }
#  }

## ---- eval = TRUE--------------------------------------------------------
# I am a freelancer, let's go anywhere!
flights <- get_flights(
  fly_from = "COR",
  date_from = Sys.Date(), date_to = Sys.Date() + 2 * 7
)
length(flights)
head(t(sapply(flights, function(x) c(x$price, x$cityTo))), n = 20)

