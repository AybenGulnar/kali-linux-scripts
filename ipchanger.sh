#!/bin/bash

# ASCII art banner'ını yazdırır
# ASCII sanatı ile yapılmış bir banner yazdırır
echo -e "\e[1;33m"
echo "   /\     /\     /\     /\ "
echo "  /  \   /  \   /  \   /  \ "
echo " /    \ /    \ /    \ /    \ "
echo "/______\______\______\______\ "
echo "   ||     ||     ||     ||     "	
echo "ip changera hos geldiniz! cok egleneceksiniz😈"

count=0

# Programın root olarak çalıştığından emin olur
checkroot() {
    if [[ "$(id -u)" -ne 0 ]]; then
        printf "\e[1;77mProgramı root olarak çalıştırın!\n\e[0m"
        exit 1
    fi
}

checkroot

# TOR bağlantısının doğru şekilde yapılandırıldığından emin olur
checktor() {
    check=$(curl --socks5-hostname localhost:9050 -s https://check.torproject.org > /dev/null; echo $?)
    if [[ "$check" -gt 0 ]]; then
        printf "\e[1;91mLütfen TOR bağlantınızı kontrol edin! 'tor' veya 'service tor start' yazarak kontrol edebilirsiniz.\n\e[0m"
        exit 1
    fi
}

checktor

# Kullanıcının IP adresini değiştirme sıklığını belirlemesine olanak tanır
read -p $'\e[1;92m[::] IP adresinizi değiştirme aralığı (saniye cinsinden): \e[0m' time

# TOR bağlantısını kullanarak IP adresini değiştirir
function switch() {
    old_ip=$(curl --socks5-hostname localhost:9050 -s https://check.torproject.org/ | grep "Your IP address appears to be:")
    killall -HUP tor > /dev/null 2>&1
    sleep 3
    new_ip=$(curl --socks5-hostname localhost:9050 -s https://check.torproject.org/ | grep "Your IP address appears to be:")
    printf "\n\e[1;92m[*] TOR IP adresi %s kez değiştirildi\e[0m\n" $count
    printf "\e[1;93m[*] Eski IP adresi: %s\e[0m\n" "$old_ip"
    printf "\e[1;93m[*] Yeni IP adresi: %s\e[0m\n" "$new_ip"
}

# IP adresi değiştirme döngüsünü sürekli olarak yürütür
while [[ true ]]; do
    let count++
    switch
    sleep $time
    clear
done
