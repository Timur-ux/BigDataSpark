#!/usr/bin/env bash

sudo docker compose down clickhouse
sudo rm -rf ./db/clickhouse/
sudo docker compose up -d clickhouse
