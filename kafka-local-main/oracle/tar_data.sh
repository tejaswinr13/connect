#!/bin/sh

tar cfv ./KAFKA_MAIN_data.tar ./init.d/startup/*_data.sql
gzip ./KAFKA_MAIN_data.tar
