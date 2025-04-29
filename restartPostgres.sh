#!/usr/bin/env bash

sudo docker compose down postgres
sudo rm -rf ./db/postgres/
sudo docker compose up -d postgres
