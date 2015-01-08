name        "docker"
description "Manage Docker images"
maintainer  "Giovanni Intini"
license     "Apache 2.0"
version     "0.0.1"

recipe "docker::install", "Install and setup docker"
recipe "docker::cleanup", "Removes unused images"
recipe "docker::deploy", "Deploys a docker container"
recipe "docker::registries", "Logs in to docker registries"
recipe "docker::rails_migrate", "Migrates a Rails Container"
