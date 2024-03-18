#!/bin/bash

# Empty the phones.txt file to ensure it's fresh for this run
> phones.txt

# Read from text.txt line by line
while IFS= read -r line; do
    # Phonemize the line and append to phones.txt
    # We use printf to avoid adding a newline character at the end, which espeak-ng would interpret as an additional input.
    printf "%s" "$line" | espeak-ng --ipa -q -v roa/es-419 >> phones.txt
    # Optionally, add a newline after each processed line to separate phonetic transcriptions
    echo "" >> phones.txt
done < text.txt
