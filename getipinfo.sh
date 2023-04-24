#!/bin/bash

echo -e "\e[1;33m"
echo "   /\     /\     /\     /\ "
echo "  /  \   /  \   /  \   /  \ "
echo " /    \ /    \ /    \ /    \ "
echo "/______\______\______\______\ "
echo "   ||     ||     ||     ||     "	
echo "ip info bulmaya hoş geldiniz! çok eğleneceksiniz😈"

# IP adresi verildiğinde ISP ve ülke bilgisini bulmak için bir fonksiyon tanımlayalım
function find_ip_info() {
  local ip="$1"
  local url="http://ip-api.com/json/$ip"
  local output=$(curl -s "$url")

  local isp=$(echo "$output" | jq -r '.isp')
  local country=$(echo "$output" | jq -r '.country')

  if [ "$isp" != "null" ] && [ "$country" != "null" ]; then
    echo -e ${GREEN}"IP: $ip\nISP: $isp\nCountry: $country"${NC}
  else
    echo -e ${RED}"Hata: $ip IP adresi için ISP ve ülke bilgisi bulunamadı"${NC}
  fi
}

# Ana fonksiyon
function main() {


  # Bağımlılıkları kontrol etme
  command -v curl > /dev/null 2>&1 || { echo -e "${RED}Hata: curl bulunamadı${NC}"; exit 1; }
  command -v jq > /dev/null 2>&1 || { echo -e "${RED}Hata: jq bulunamadı${NC}"; exit 1; }

  # Kullanıcıdan IP adresini girmesini isteyelim
  read -p "IP adresini girin: " ip

  # IP adresi için ISP ve ülke bilgisini bulalım
  find_ip_info "$ip"
}

# Ana fonksiyonu çalıştıralım
main
