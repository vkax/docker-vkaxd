#!/bin/bash
set -e

testAlias+=(
	[vkaxd:trusty]='vkaxd'
)

imageTests+=(
	[vkaxd]='
		rpcpassword
	'
)
