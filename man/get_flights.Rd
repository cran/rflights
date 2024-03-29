% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-flights.R
\name{get_flights}
\alias{get_flights}
\title{Query flight prices.}
\usage{
get_flights(fly_from, fly_to = "anywhere", date_from = Sys.Date(),
  date_to = date_from + 1, return_from = NA, return_to = NA,
  curr = "USD", price_from = NA, price_to = NA,
  other_params = list())
}
\arguments{
\item{fly_from}{ID of the departure location.
It accepts multiple values separated by comma, these values might be airport
codes, city IDs, two letter country codes, metropolitan codes and radiuses as
well as subdivision, region, autonomous_territory, continent and specials
(Points of interest, such as Times Square).
Some locations have the same code for airport and metropolis (city), e.g.
DUS stands for metro code Duesseldorf, Moenchengladbach and Weeze as well as
Duesseldorf airport. See the following examples:
fly_from=city:DUS will match all airports in "DUS", "MGL" and "NRN" (all in
the city of Duesseldorf)
fly_from=DUS will do the same as the above
fly_from=airport:DUS will only match airport "DUS" Radius needs to be in form
lat-lon-xkm. The number of decimal places for radius is limited to 6.
E.g.-23.24--47.86-500km for places around Sao Paulo. 'LON' - checks every
airport in London, 'LHR' - checks flights from London Heathrow, 'UK' -
flights from the United Kingdom. Link to Locations API.}

\item{fly_to}{ID of the arrival destination.
It accepts the same values in the same format as the fly_from parameter.}

\item{date_from}{search flights from this date (dd/mm/YYYY). Use parameters
date_from and date_to as a date range for the flight departure.
Parameters 'date_from=01/05/2016' and 'date_to=30/05/2016' mean that the
departure can be anytime between the specified dates. For the dates of the
return flights, use the 'return_to' and 'return_from' or 'nights_in_dst_from'
and 'nights_in_dst_to' parameters.}

\item{date_to}{search flights upto this date (dd/mm/YYYY).}

\item{return_from}{min return date of the whole trip (dd/mm/YYYY).}

\item{return_to}{max return date of the whole trip (dd/mm/YYYY).}

\item{curr}{use this parameter to change the currency in the response.}

\item{price_from}{result filter, minimal price}

\item{price_to}{result filter, maximal price}

\item{other_params}{named list of other params from
https://docs.kiwi.com/#flights-flights-get}
}
\description{
Query flight prices using the [Kiwi API](https://docs.kiwi.com/).
}
\examples{
\donttest{
# get Argentina and toulouse IDs
arg_id <- find_location("Argentina", "country")[[1]]$id # AR
tl_id <- find_location("toulouse", "city")[[1]]$id

# get flights with no specified date
flights <- get_flights(arg_id, tl_id)
sapply(flights, function(x) x$price)
}

}
