#!/bin/sh

# Conversion of OWL file to simple network diagram
# Cam Webb <cwebb@oeb.harvard.edu>

cd `dirname $0`

TMP1=`mktemp`.n3
TMP2=`mktemp`.rdf
TMP3=`mktemp`.dot

# get the things that have ranges
roqet -D ../dsw.owl --exec "
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
CONSTRUCT { ?s rdfs:range ?o}
WHERE { ?s rdfs:range ?o }" > $TMP1

# get the things that have domains
roqet -D ../dsw.owl --exec "
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
CONSTRUCT { ?s rdfs:domain ?o}
WHERE { ?s rdfs:domain ?o }" >> $TMP1

# match them up
roqet -D $TMP1 -r rdfxml --exec "
PREFIX rdfs:  <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dwc: <http://rs.tdwg.org/dwc/terms/>
PREFIX dsw: <http://purl.org/dsw/>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
CONSTRUCT { ?s ?v ?o }
WHERE { ?v rdfs:domain ?s .
        ?v rdfs:range ?o . }" > $TMP2

# convert to dot
SIZECK=`mktemp`
rapper -i rdfxml -o dot $TMP2 1> $TMP3 2> $SIZECK

# check the size! (vital: dot will hog all resources and swapspace)
SIZE=`grep "rapper: Parsing returned " $SIZECK | awk '{print \$4}'`

if [ $SIZE -gt 200 ]
then
        echo "Stopping - too big for dot (" $SIZE " triples )" 
        exit
else
    dot -T jpg $TMP3 > ../img/dsw.jpg
fi
