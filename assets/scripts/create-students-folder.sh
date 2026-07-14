#!/bin/bash

cd "$(dirname "$0")/../../pages/student" || exit 1

students=("amosora" "arena" "bersales" "corrales" "dabatos" "de_leon" "fuentes" "garces" "jalipa" "labanda" "lentija" "limen" "matondo" "montoya" "oflas" "pechera" "rondina" "quiruben" "pepito" "recta" "semblante" "temperatura" "andriano" "balanuico" "maglasang" "managaytay" "parallon" "templa" "visoc")

for student in "${students[@]}"; do
    name=$(echo "$student" | tr '_' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

    mkdir -p "$student/assets/css" "$student/assets/js" "$student/pages"

    cat > "$student/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$name | Portfolio</title>
</head>
<body>

</body>
</html>
EOF

    touch "$student/assets/css/style.css"
    touch "$student/assets/js/main.js"
done

echo "Done!"