#!/bin/bash
bracket=0
while read -r line; do
        line_out="$line"
        if [[ $line == "}" ]]; then
                bracket=$(( $bracket - 1 ))
        fi
        for ((i = 0 ; i < $bracket ; i++)); do
                line_out="\t$line_out"
        done
        if [[ $line == "{" ]]; then
                bracket=$(( $bracket + 1 ))
        fi
        if [[ $bracket == 0 ]]; then
                line_out="${line_out//,/,\\n}"
        fi
        echo -e "$line_out"
done
