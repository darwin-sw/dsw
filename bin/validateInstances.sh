#!/bin/sh

# Validation of dsw_instances.owl using eyeball
# Cam Webb <cwebb@oeb.harvard.edu>

cd `dirname $0`

java -cp "../lib/java/eyeball-2.3/lib/antlr-2.7.5.jar:../lib/java/eyeball-2.3/lib/junit4.jar:../lib/java/eyeball-2.3/lib/arq-extra.jar:../lib/java/eyeball-2.3/lib/junit.jar:../lib/java/eyeball-2.3/lib/arq.jar:../lib/java/eyeball-2.3/lib/log4j-1.2.12.jar:../lib/java/eyeball-2.3/lib/commons-logging-1.1.1.jar:../lib/java/eyeball-2.3/lib/mysql-connector-java-5.0.0-beta-bin.jar:../lib/java/eyeball-2.3/lib/commons-logging.jar:../lib/java/eyeball-2.3/lib/napkinlaf.jar:../lib/java/eyeball-2.3/lib/concurrent.jar:../lib/java/eyeball-2.3/lib/relaxngDatatype.jar:../lib/java/eyeball-2.3/lib/eyeball.jar:../lib/java/eyeball-2.3/lib/slf4j-api-1.5.6.jar:../lib/java/eyeball-2.3/lib/icu4j_3_4.jar:../lib/java/eyeball-2.3/lib/slf4j-log4j12-1.5.6.jar:../lib/java/eyeball-2.3/lib/iri.jar:../lib/java/eyeball-2.3/lib/stax-api-1.0.jar:../lib/java/eyeball-2.3/lib/jazzy-core.jar:../lib/java/eyeball-2.3/lib/wstx-asl-3.0.0.jar:../lib/java/eyeball-2.3/lib/jena.jar:../lib/java/eyeball-2.3/lib/xercesImpl.jar:../lib/java/eyeball-2.3/lib/jenatest.jar:../lib/java/eyeball-2.3/lib/xml-apis.jar:../lib/java/eyeball-2.3/lib/json.jar:../lib/java/eyeball-2.3/lib/xsdlib.jar" jena.eyeball -assume ../lib/onts/owl.rdf ../dsw.owl -include owl cardinality -check ../dsw_instances.owl
