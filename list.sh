#!/bin/bash

# Array/list

val=(10 20 30 40 50.55 name "Mbr Sagor")

# Get all values
echo "All values is: ${val[*]}"

# Value by index
echo "Value is last index: ${val[6]}"

# How to find number of value in list/array
echo "Total array size or value is: ${#val[*]}"

