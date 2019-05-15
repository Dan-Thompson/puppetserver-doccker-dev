#!/bin/bash

#/etc/init.d/puppetserver start
/opt/puppetlabs/bin/puppetserver start
tail -f /dev/null
