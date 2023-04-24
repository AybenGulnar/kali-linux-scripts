#!/bin/bash

# İlk çocuk işlemi yaratılır
echo "Creating child process 1..."
pid1=$(fork)

if [ $pid1 -eq 0 ]; then
  # İlk çocuk işlemi
  echo "Running child process 1..."
  command1
else
  # İkinci çocuk işlemi yaratılır
  echo "Creating child process 2..."
  pid2=$(fork)

  if [ $pid2 -eq 0 ]; then
    # İkinci çocuk işlemi
    echo "Running child process 2..."
    command2
  else
    # Ana işlem
    echo "Parent process running..."
  fi
fi
