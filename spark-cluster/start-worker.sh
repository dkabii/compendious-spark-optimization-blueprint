#!/bin/bash
$SPARK_HOME/sbin/start-worker.sh spark://spark-master:7077
tail -f $SPARK_HOME/logs/*
