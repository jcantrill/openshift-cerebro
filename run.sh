#!/bin/bash

envsubst < ./cerebro/application.conf > ./cerebro/conf/application.conf

./cerebro/bin/cerebro
