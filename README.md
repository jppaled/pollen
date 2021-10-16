# pollen
Script to retrieve the pollen risk map in France for the day from https://pollens.fr/

## Why
I wanted to know every day the risks of allergy according to the department thanks to this map on the site https://pollens.fr/, to see which department is the least affected by pollen.

Problem, once the map is updated on the site, we cannot retrieve the previous maps.

So I started going to the site every day and then took a screenshot with the date.

Then finally it was automatable, so I made this script.  

## The script
This script retrieves the image of the pollen risk map of france, with its date.

The date is in French, so you had to translate the month into English, to then create a date in `Y-m-d` format.

The image is then saved with the name `pollen-Y-m-d.png`.

If the map (and therefore the date) updates on the site, a new image will be saved.

## Instructions
`curl -O https://raw.githubusercontent.com/jppaled/pollen/main/pollen.sh`

`bash pollen.sh`

you can pass a custom path as argument 

`bash pollen.sh /home/$USER/my-directory`


## Image exemple from https://pollens.fr the 2021-09-01
![pollen-2021-09-01-19-56-46 cleaned](https://user-images.githubusercontent.com/22444128/137595081-db1689c3-ddd5-4e30-a457-1bd729fba7ca.png)
