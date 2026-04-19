#! /bin/bash

# Clear/create the output file
> historical_fc_accuracy.tsv

# Get total number of lines in the log
total_lines=$(wc -l < rx_poc.log)

# Need at least 2 lines to compare yesterday's forecast with today's temp
# Iterate from line 2 to the last line
for (( i=2; i<=total_lines; i++ ))
do
    # Extract consecutive pair: previous line = "yesterday", current line = "today"
    yesterday=$(head -$((i-1)) rx_poc.log | tail -1)
    today=$(head -$i rx_poc.log | tail -1)

    # Yesterday's forecasted temp (field 5)
    yesterday_fc=$(echo "$yesterday" | cut -f5 | grep -Eo -e '-?[[:digit:]]+')

    # Today's observed temp (field 4)
    today_temp=$(echo "$today" | cut -f4 | grep -Eo -e '-?[[:digit:]]+')

    # Calculate accuracy
    accuracy=$(( yesterday_fc - today_temp ))

    # Determine accuracy range
    if [ -1 -le $accuracy ] && [ $accuracy -le 1 ]; then
        accuracy_range=excellent
    elif [ -2 -le $accuracy ] && [ $accuracy -le 2 ]; then
        accuracy_range=good
    elif [ -3 -le $accuracy ] && [ $accuracy -le 3 ]; then
        accuracy_range=fair
    else
        accuracy_range=poor
    fi

    # Extract date fields from today's row (fields 1, 2, 3)
    year=$(echo "$today"  | cut -f1)
    month=$(echo "$today" | cut -f2)
    day=$(echo "$today"   | cut -f3)

    # Append to historical report
    echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range" >> historical_fc_accuracy.tsv

    echo "Processed $year-$month-$day: obs=$today_temp, fc=$yesterday_fc, diff=$accuracy ($accuracy_range)"
done

echo "Done. Results written to historical_fc_accuracy.tsv"

./weekly_stats.sh
