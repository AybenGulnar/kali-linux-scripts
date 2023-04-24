#!/bin/bash

# Kullanıcıdan iki dizin yolu girdisi alınır
read -p "Lütfen ilk dizinin yolunu girin: " dir1
read -p "Lütfen ikinci dizinin yolunu girin: " dir2

# İki farklı prosese forklayan fonksiyon
fork_processes () {
  # İlk proses
  diff $1 $2

  # İkinci proses
  diff $3 $4
}

# Fork işlemi başlatılır
fork_processes "$dir1/file1.txt" "$dir2/file1.txt" "$dir1/file2.txt" "$dir2/file2.txt"
