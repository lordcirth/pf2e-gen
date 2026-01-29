# Pre-process data
jq 'map({name, rarity}) | {ancestries: {common: map(select(.rarity == "Common")), uncommon: map(select(.rarity == "Uncommon")), rare: map(select(.rarity == "Rare"))}} ' < data/Ancestries_raw.json > data/Ancestries.json

jq 'map({name, rarity}) | {backgrounds: {common: map(select(.rarity == "Common")), uncommon: map(select(.rarity == "Uncommon")), rare: map(select(.rarity == "Rare"))}} ' < data/Backgrounds_raw.json > data/Backgrounds.json

cat data/Ancestries.json data/Backgrounds.json | jq -s 'add' > data/Compiled.json

jinja2 index.html.jinja data/Compiled.json  --format=json -o index.html
