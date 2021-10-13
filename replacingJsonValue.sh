#this program will read the json file and get the required value and create a new json file with updated value
cat version.json | \
jq -r '.devDependencies | keys[]' | \
xargs -I {} npm view -S {} version > new_ver.txt

export var2=$( cat new_ver.txt )
echo $var2
jq '.devDependencies.canvas="'"$var2"'"' version.json > version1.json
