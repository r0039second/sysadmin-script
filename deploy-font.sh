#!/bin/bash

wget http://download.microsoft.com/download/ie6sp1/finrel/6_sp1/W98NT42KMeXP/EN-US/IELPKTH.CAB
cabextract -F 'tahoma*ttf' IELPKTH.CAB
mv -f tahoma*ttf /usr/share/fonts/truetype/msttcorefonts/
chmod 644 /usr/share/fonts/truetype/msttcorefonts/tahoma*
fc-cache -v
rm -f IELPKTH.CAB
