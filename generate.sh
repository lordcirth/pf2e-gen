# Pre-process data
jq 'map({name, rarity}) | {ancestries: {common: map(select(.rarity == "Common")), uncommon: map(select(.rarity == "Uncommon")), rare: map(select(.rarity == "Rare"))}} ' < data/Ancestries_raw.json > data/Ancestries.json

#jinja2 index.html.jinja <(jq '{ancestries: .}' data/Ancestries.json) --format=json
