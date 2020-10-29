#! /bin/bash

# This script expects to be executed with the current working directory:
#
# kgtk/datasets/time-machine-20101201
source common.sh

# ==============================================================================
# Extract the qualifiers for the property datatype splits.
for TARGET in ${WIKIDATATYPES[@]}
do
    TARGET_NAME=part.property.${TARGET}
    echo -e "\nExtract any qualifiers for the properties in ${TARGET_NAME}."
    kgtk ${KGTK_FLAGS} \
	 ifexists ${VERBOSE} \
	 --input-file ${DATADIR}/part.property.qual.tsv \
	 --filter-on ${DATADIR}/${TARGET_NAME}.tsv \
	 --output-file ${DATADIR}/${TARGET_NAME}.qual.tsv \
	 --input-keys node1 \
	 --filter-keys id \
	 --presorted \
	|& tee ${LOGDIR}/${TARGET_NAME}.qual.log
done
