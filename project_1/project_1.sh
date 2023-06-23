#!/usr/bin/bash

# PROJECT 1: US UNIVERSITY RANKS
unir="unirank.csv"

echo "1) Explore the file to get a grasp of its structure:"
head -n 8 $unir | csvlook

echo -e

echo "2) Find the colleges:"
grep -iv "university" $unir | grep -i "college"

echo -e

echo "3) Find the percentage of colleges in the list:"
colleges=$(grep -vi "university"  $unir | grep -i "college" | wc -l)
total=$(tail -n +2 $unir | wc -l)
echo $(echo "scale=3;( $colleges / $total ) * 100" | bc)"%"

echo -e

echo "4) Calculate the number of instututes by state and sort in descending order by total:"
tail $unir -n +2 | cut -f3 -d, | sort | uniq -c | sort -r

echo -e

echo "5) Plot tuition against rank:"
cat $unir | cut -f4,6 -d, > plotdata.csv
tail plotdata.csv -n +2 | scatter
