#!/bin/bash

# Author:	Tien
# Date:		16/12/2016
# Purpose:	This is an original method to SSH to Amazon VPS (AMAZON LightSail). It requires the PEM SSH key by default. Which was created by AMAZON

ssh -v -i LightsailDefaultPrivateKey.pem bitnami@x.x.x.x
