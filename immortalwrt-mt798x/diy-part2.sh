#!/bin/bash
sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate
