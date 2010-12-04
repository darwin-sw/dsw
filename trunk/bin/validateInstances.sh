#!/bin/sh

# Validation of dsw_instances.owl using eyeball
# Cam Webb <cwebb@oeb.harvard.edu>

cd `dirname $0`

../lib/java/eyeball/eyeball.sh -assume owl ../dsw.owl -include owl cardinality -check ../dsw_instances.owl

