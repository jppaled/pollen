#! /bin/bash

path_to_save_img=$1

get_translated_month () {
    local frMonths=( janvier fevrier mars avril mai juin juillet aout septembre octobre novembre decembre )
    local enMonths=( January February March April May June July August September October November December )
    local i
    
    for (( i=0; i<11; i++ )); do
        [[ $1 = ${frMonths[$i]} ]] && break
    done
    printf ${enMonths[$i]}
}

# html bloc where the date is
html=$(curl -s https://pollens.fr/ | grep "Carte de vigilance");

# remove html tag
title=$(echo $html | sed 's/<[^>]*>//g ; /^$/d');

# remove useless text to get the french date
date=$(echo $title | sed s/"Carte de vigilance - mise &agrave; jour le "// | sed 's/\r$//');

# convert to array
dateArr=( $date );

# get the day number
day="${dateArr[0]}";

# get the french month
frMonth="${dateArr[1]}";

# convert to english month
enMonth=$(get_translated_month $frMonth);

# create date
finalDate=$(date -d "$day"-"$enMonth" +%Y-%m-%d);

# retrieve the image and save it with the date as name
curl -o "$path_to_save_img/pollen-$finalDate.png" https://pollens.fr/generated/vigilance_map.png
