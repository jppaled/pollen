# pollen
Script to retrieve the pollen map of France for the day from https://pollens.fr/

I wanted to know every day the risks of allergy according to the department thanks to this map on the site https://pollens.fr/, to see which department is the least affected by pollen.

Problem, once the map is updated on the site, we cannot retrieve the previous maps.

So I started going to the site every day and then took a screenshot with the date.

Then finally it was automatable, so I made this script.  

## Instructions
`curl -O https://raw.githubusercontent.com/jppaled/pollen/main/pollen.sh`

`bash pollen.sh ./`
