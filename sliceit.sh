#! /bin/bash

declare -a SLICES=("\t1\t1\t1\t1\t1\t" "\t1\t1\t1\t1\t0\t" "\t1\t0\t1\t1\t1\t" "\t1\t1\t1\t0\t1\t" "\t0\t1\t1\t1\t1\t" "\t1\t1\t0\t1\t1\t" "\t1\t1\t0\t1\t0\t" "\t1\t0\t0\t1\t1\t" "\t1\t1\t0\t0\t1\t" "\t0\t1\t0\t1\t1\t" "\t0\t1\t0\t1\t0\t" "\t0\t0\t0\t1\t1\t" "\t0\t1\t0\t0\t1\t" "\t0\t0\t0\t0\t1\t")
declare -a LABELS=('5.0' '5.1' '5.2' '5.3' '5.4' '4.0' '4.1' '4.2' '4.3' '3.0' '3.1' '3.2' '2.0' '1.0')

touch slices.ALL.log.txt

i=0
for slice in "${SLICES[@]}"
do
	label=${LABELS[$i]}
	grep "$slice" holos.ALL.upset.txt | table_extract_col.pl 0 | perl -p -e 's/orthomcl//gi' > "ogids.ALL.$label.txt"
	og_extract.pl -i "ogids.ALL.$label.txt" < holos_final.end | og_tabulate.pl -s holos.taxa.txt -a holos.taxa.txt holos.faa -v L > "table.ALL.$label.txt"
	wc -l "ogids.ALL.$label.txt" >> slices.ALL.log.txt
	rm "ogids.ALL.$label.txt"
	i=$((i+1))
done

exit

