#!/bin/bash

puppet apply manifests/dev.pp --modulepath=$PWD/modules/
