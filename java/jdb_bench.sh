# shellcheck disable=SC2148
# Copyright (c) Facebook, Inc. and its affiliates. All Rights Reserved.
PLATFORM=64
if [ `getconf LONG_BIT` != "64" ]
then
  PLATFORM=32
fi

ROCKS_JAR=`find target -name rocksdbjni*.jar | tr '\n' ':'`

echo "Running benchmark in $PLATFORM-Bit mode."
# shellcheck disable=SC2068
java -XX:NewSize=4m -Djava.library.path=target -cp "${ROCKS_JAR}:benchmark/target/classes" org.rocksdb.benchmark.DbBenchmark $@
