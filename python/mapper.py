#!/usr/bin/env python3
import sys

# Baca input dari standar input (stdin)
for line in sys.stdin:
    line = line.strip()  # Hilangkan spasi di awal dan akhir
    words = line.split()  # Pisahkan kata per kata
    for word in words:
        # Output setiap kata diikuti oleh angka 1
        print(f"{word}\t1")