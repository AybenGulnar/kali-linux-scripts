#!/bin/bash

echo -e "\e[1;33m"
echo "   /\     /\     /\     /\ "
echo "  /  \   /  \   /  \   /  \ "
echo " /    \ /    \ /    \ /    \ "
echo "/______\______\______\______\ "
echo "   ||     ||     ||     ||     "	
echo "subdomain bulmaya hoş geldiniz! çok eğleneceksiniz😈"

# Bu, bir siteden alt alan adlarının IP adreslerini alacaktır
echo "Sorgulanacak siteyi girin: "
read url
echo "[+] $url sitesinden alt alan adları alınıyor"
wget $url
grep "href=" index.html |cut -d "/" -f 3 |grep "\." |cut -d '"' -f 1 | sort -u > list.txt
for sub in $(cat list.txt); do host $sub; done |grep "has address" |cut -d " " -f 4 | sort -u > subdomains.txt
echo "[+] Görev tamamlandı."
