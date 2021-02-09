# Run in this bin/ directory

# note that roqet add a \r char

for i in `roqet -i sparql11 -q -r csv -D ../dsw.owl -e 'SELECT DISTINCT (replace(str(?x),"http://purl.org/dsw/","") AS ?aaa ) WHERE {?x ?y ?z FILTER regex(str(?x) , "/dsw/.")}' | tr -d '\r'`
do
    echo $i
    roqet -i sparql11 -r rdfxml -q -D ../dsw.owl -e "CONSTRUCT { <http://purl.org/dsw/$i> ?y ?z } WHERE { <http://purl.org/dsw/$i> ?y ?z }" > ../web/$i
done

# fix, due to print out of CSV table header
rm ../web/aaa

# copy the ontology
cp -f ../dsw.owl ../web/.
