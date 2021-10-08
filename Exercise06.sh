#Problem 1
cat wages.csv | cut -f 1,2 -d , | tr "," " " | sort -u | grep -v "gender" | sort -k 2 -n | sort -s -k 1,1 > genderYearsExp.txt

#Problem 2
cat wages.csv | tr "," " " | sort -k 4 -r | grep -v "gender" > sortByWage.csv
topEarner=$(head -n 1 sortByWage.csv)
TEGender=$(echo $topEarner | cut -d ' ' -f 1)
TEYearsExp=$(echo $topEarner | cut -d ' ' -f 2)
TEWage=$(echo $topEarner | cut -d ' ' -f 4)
echo "The top earner is $TEGender, with $TEYearsExp years of experience, and takes home a wage of $TEWage"

bottomEarner=$(tail -n 1 sortByWage.csv)
BEGender=$(echo $bottomEarner | cut -d ' ' -f 1)
BEYearsExp=$(echo $bottomEarner | cut -d ' ' -f 2)
BEWage=$(echo $bottomEarner | cut -d ' ' -f 4)
echo "The bottom earner is $BEGender, with $BEYearsExp years of experience, and takes home a wage of $BEWage"

echo "Top 10 Wage Earners by Gender:"
cat sortByWage.csv | head -n 10 | cut -f 1 -d ' ' | sort | uniq -c

#Problem 3
cat wages.csv | tr ',' ' ' | cut -f 3,4 -d ' ' | sort | grep -v "wage" > schoolWage.csv
grep "12 " schoolWage.csv | cut -d ' ' -f 2 > highschooled.txt
grep "16 " schoolWage.csv | cut -d ' ' -f 2 > collegeed.txt
highschooln=$(cat highschooled.txt | wc -l)
highschoolsum=$(cat highschooled.txt)
head -n 5 $highschoolsum


