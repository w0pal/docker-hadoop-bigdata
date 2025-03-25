#!/usr/bin/env python3
import sys

current_word = None
current_count = 0

# Baca output dari mapper di standar input
for line in sys.stdin:
    line = line.strip()
    # Pisahkan kata dan count (dipisahkan oleh tab)
    word, count = line.split('\t', 1)
    try:
        count = int(count)
    except ValueError:
        continue

    # Jika kata yang sama, tambahkan count
    if current_word == word:
        current_count += count
    else:
        # Jika kata berubah dan bukan baris pertama, keluarkan hasilnya
        if current_word:
            print(f"{current_word}\t{current_count}")
        current_word = word
        current_count = count

# Output kata terakhir
if current_word == word:
    print(f"{current_word}\t{current_count}")