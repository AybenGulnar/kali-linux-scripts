#!/bin/bash

# Kullanıcıdan bir komut girdisi alınır
read -p "Lütfen bir komut girin: " command

# İki farklı prosese forklayan fonksiyon
fork_processes () {
  # İlk proses
  eval $1 &

  # İkinci proses
  eval $1 &
}

# Fork işlemi başlatılır
fork_processes "$command"

