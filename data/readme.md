## Data Dictionary

Source: [LA City Arrest Data](https://data.lacity.org/A-Safe-City/Arrest-Data-from-2010-to-Present/yru6-6re4)

This dataset includes the following charge groups:

1. Driving Under Influence
2. Drunkenness
3. Liquor Laws 

Each dataset consist of these columns:

- `arrest_date`: [date-ymd] date of arrest (yyyy-mm-dd)
- `time`: [time-hms] military time of arrest (hh:mm:ss)
- `area_name`: [str] 21 unique LAPD patrol areas
- `age`: [int] age of arrestee
- `sex`: [str] F = Female, M = Male
- `descent`: [str] 19 unique descents
- `charge_group`: [str] 3 charges: Driving Under Influence, Drunkeness, Liquor Laws
- `charge_desc`: [str] charge description
- `arrest_type`: [str] 4 types: Misdemeanor, Felony, Infraction
- `rep_dist`: [int] LAPD reporting district
- `latitude`: [int] latitude y-axis
- `longitude`: [int] longitude x-axis
- `year`: [int] year of arrest
- `month`: [str] month of arrest 
- `day`: [str] day of arrest

