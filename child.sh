#!/bin/bash

# Çocuk işlemi yaratılır
if [ "$pid" = "" ]; then
  pid=$$
  # Yeni işlem oluşturulur
  if [ "$1" = "process1" ]; then
    echo "process1 started"
    # process1 komutu çalıştırılır
    exec command1
  else
    echo "process2 started"
    # process2 komutu çalıştırılır
    exec command2
  fi
fi
