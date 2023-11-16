#!/bin/bash


# First argument, which is the file path
file="$1"

# Check if the specified file exists
if [ -f "$file" ]; then
    echo "The first argument is a file: $file"
elif [ "$file" = "-d" ]; then
    echo "The first argument is the string '-d'"
else
    echo "Error: The first argument must be either a file or the string '-d': $file"
    exit 1
fi



dithering=0
# The dither type to use
# { CONVERT-DITHER-NONE (0), CONVERT-DITHER-FS (1), CONVERT-DITHER-FS-LOWBLEED (2), CONVERT-DITHER-FIXED (3) }

while getopts ":d" opt; do
  case $opt in
    d)
      echo "Dithering: ON"
      dithering=2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

run_gimp()
{
    file_path="$1"
    gimp -i -b "(define file-path \"$file_path\") (define dithering $dithering) (load \"gimpdoom.scm\")" -b "(gimp-quit 0)"
    return $?
}

shift "$((OPTIND-1))"

for arg in "$@"; do
    echo "Applying Doom palette to $arg"
    run_gimp "$arg" > /dev/null 2>&1  # hiding stderr and stdout
done

exit 0

