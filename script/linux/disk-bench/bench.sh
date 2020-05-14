TARGET=/tmp fio -f fio.txt --output-format=terse | awk -F ';' '{print $3, ($7+$48) / 1000}'
