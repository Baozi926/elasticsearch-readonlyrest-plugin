#!/bin/bash
mvn clean package

ES_VERSION=`grep '<elasticsearch.version' pom.xml | sed 's|</b>|-|g' | sed 's|<[^>]*>||g' |xargs`

sed -i.bak "s/^\(elasticsearch.version=\).*/\1$ES_VERSION/" src/main/resources/plugin-descriptor.properties

zip -j -g target/elasticsearch-readonlyrest-v*es-v2*.zip src/main/resources/plugin-descriptor.properties
zip -j -g target/elasticsearch-readonlyrest-v*es-v2*.zip src/main/resources/plugin-security.policy
