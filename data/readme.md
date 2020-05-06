## Data Dictionary

Source: [LA City Arrest Data](https://data.lacity.org/A-Safe-City/Arrest-Data-from-2010-to-Present/yru6-6re4)

This folder contains the following datasets on 3 charge groups:

1. Driving Under Influence (last updated: 4/11/2020)
2. Drunkenness (last updated: 4/10/2020)
3. Liquor Laws (last updated: 4/5/2020)

Each dataset consist of these columns:

- `arrest_date`: [date-ymd] date of arrest (yyyy-mm-dd)
- `time`: [time-hms] military time of arrest (hh:mm:ss)
- `area_name`: [str] 21 unique LAPD patrol areas
- `age`: [int] age of arrestee
- `sex`: [str] F = Female, M = Male
- `descent`: [str] 19 unique descents
- `charge_group`: [str] 3 charges: Driving Under Influence, Drunkeness, Liquor Laws
- `charge_desc`: [str] charge description
- `arrest_type`: [str] 3 types: Misdemeanor, Felony, Infraction
- `rep_dist`: [int] LAPD reporting district
- `latitude`: [int] latitude y-axis
- `longitude`: [int] longitude x-axis
- `year`: [int] year of arrest (2010, 2011, ... , 2020)
- `month`: [str] month of arrest (Jan, Feb, ... , Dec)
- `day`: [str] day of arrest (Sun, Mon, ... , Sat)

