#!/bin/bash

serviceDNS="$1"
servicePort="3000"
curl "http://$serviceDNS:$servicePort/api/restaurant"