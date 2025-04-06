#!/bin/bash

if [ "$SPARK_MODE" == "master" ] ; then
   echo "starting spark master ... "
   exec $SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master
elif [ "$SPARK_MODE" == "worker" ]; then
   if [ -z "SPARK_MASTER_URL" ]; then
       echo "SPARK_MASTER_URL is missing ..."
       exit -1
   fi
   echo "staring spark worker , connecting to $SPARK_MASTER_URL"
   exec $SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker $SPARK_MASTER_URL
else
   echo "spark_mode needs should be master or worker"
   exit 1
fi
 