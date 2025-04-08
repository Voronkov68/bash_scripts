#!/bin/bash

echo "Proverka DNS"

if host ya.ru &> /dev/null
then
	echo "DNS working!"
else
	echo "DNS resolve is  unavailable!"
fi

echo "Proverka Seti"

if ping  8.8.8.8 -c 5 &> /dev/null
then
	echo "Network connection is available"
else
	echo "Network connection is umavailable"
fi

echo "Proverka servica"

ping  vk.com -q -c10 | tail -3
