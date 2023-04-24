#!/bin/bash


# Bu script url gizlemenizi saglar.

# Fonksiyon: URL kontrolü için
# Parametre: $1 -> Kontrol edilecek URL
url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Geçersiz URL. Sadece http veya https kullanın.\e[0m"
            exit 1
        fi
    fi
}

# Terminal ekranını temizler
clear

# ASCII art banner'ını yazdırır
echo -e "\e[1;33m"
echo "   /\     /\     /\     /\ "
echo "  /  \   /  \   /  \   /  \ "
echo " /    \ /    \ /    \ /    \ "
echo "/______\______\______\______\ "
echo "   ||     ||     ||     ||     "	
echo "URL gizleyiciye hoş geldiniz! Çok eğleneceksiniz😈"

# Kullanıcıdan phishing URL'ini isteyip kontrol eder
echo -n "Lütfen phishing URL'sini girin (http veya https ile birlikte): 
>>>"
read phish
url_checker $phish
sleep 1

# Phishing URL'sini işleyip kısaltır
echo "Phishing URL'si işleniyor ve değiştiriliyor"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}

# Kullanıcıdan maskeleme domain'ini isteyip kontrol eder
echo -e "\n\e[1;31mDomain Gizleme!!!!!!!\e[0m"
echo 'Phishing URL'sini gizlemek için bir domain girin (http veya https ile birlikte), örneğin: https://google.com:'
echo -en "\e[31m>>\e[0m "
read mask
url_checker $mask

# Kullanıcıdan sosyal mühendislik kelimelerini isteyip işler
echo -e '\nBir sihirli kelime girin:(örnek: free-money, best-game=tricks)'
echo -e "\e[31mBoşluk kullanmayın, sosyal mühendislik kelimeleri arasında '-' kullanın\e[0m"
echo -en "\e[32m=>\e[0m "
read words

# Gizli phishing URL'sini oluşturur ve yazdırır
echo -e "\nGizli Phish Link OLUŞTURULUYOR LEGEN WAIT FOR IT ...\n"
final=$mask-$words@$shorter
echo -e "DARY !! İşte gizli Phish URL'si:\e[32m ${final} \e[0m\n"
