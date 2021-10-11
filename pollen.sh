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

html=$(curl -s https://pollens.fr/ | grep "Carte de vigilance");

title=$(echo $html | sed 's/<[^>]*>//g ; /^$/d');

date=$(echo $title | sed s/"Carte de vigilance - mise &agrave; jour le "// | sed 's/\r$//');

dateArr=( $date );

day="${dateArr[0]}";

frMonth="${dateArr[1]}";

enMonth=$(get_translated_month $frMonth);

finalDate=$(date -d "$day"-"$enMonth" +%Y-%m-%d);

curl -o "$path_to_save_img/pollen-$finalDate.png" https://pollens.fr/generated/vigilance_map.png
