# Decrypted by K-fuscator
# Github- https://github.com/KasRoudra/k-fuscator
UPDATE="https://raw.githubusercontent.com/myridwan/scxray/ipuk/"
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray_service == "running" ]]; then
status_xray="${GB}[ ON ]${NC}"
else
status_xray="${RB}[ OFF ]${NC}"
fi
if [[ $nginx_service == "running" ]]; then
status_nginx="${GB}[ ON ]${NC}"
else
status_nginx="${RB}[ OFF ]${NC}"
fi
daily_usage=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
monthly_usage=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e ""
echo -e "           ${WB}━━━━━ [ XRAY SCRIPT RIDWAN ] ━━━━━${NC}       "
echo -e ""
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${YB}Service Provider${NC} ${WB}: $ISP${NC}"
echo -e " ${YB}Timezone${NC}         ${WB}: $WKT${NC}"
echo -e " ${YB}City${NC}             ${WB}: $CITY${NC}"
echo -e " ${YB}Date${NC}             ${WB}: $DATE${NC}"
echo -e " ${YB}Domain${NC}           ${WB}: $domain${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${WB}NGINX STATUS :${NC} $status_nginx    ${WB}XRAY STATUS :${NC} $status_xray   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "          ${WB}━━━━━ [ Bandwidth Monitoring ] ━━━━━${NC}"
echo -e ""
echo -e "   ${GB}Today ($DATE)     Monthly ($(date +%B/%Y))${NC}  "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${GB}↓↓ Days: $daily_usage          ↓↓ Month: $monthly_usage${NC}   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                ${WB}━━━━━ [ Xray Menu ] ━━━━━${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[1]${NC} ${YB}Ssh Menu${NC}              ${MB}[6]${NC} ${YB}Update Menu${NC}"
echo -e " ${MB}[2]${NC} ${YB}Vmess Menu${NC}            ${MB}[7]${NC} ${YB}Log Create Account${NC}"
echo -e " ${MB}[3]${NC} ${YB}Vless Menu${NC}            ${MB}[8]${NC} ${YB}Backup Vps Menu${NC}"
echo -e " ${MB}[4]${NC} ${YB}Trojan Menu${NC}           ${MB}[9]${NC} ${YB}Restore Vps Menu${NC}"
echo -e " ${MB}[5]${NC} ${YB}All Xray Menu${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                 ${WB}━━━━━ [ Utility ] ━━━━━${NC}                "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[10]${NC} ${YB}Resart service${NC}        ${MB}[14]${NC} ${YB}Change Xray-core Mod${NC}"
echo -e " ${MB}[11]${NC} ${YB}Speedtest${NC}             ${MB}[15]${NC} ${YB}Change Xray-core Official${NC}"
echo -e " ${MB}[12]${NC} ${YB}Change Domain${NC}         ${MB}[16]${NC} ${YB}About Script${NC}"
echo -e " ${MB}[13]${NC} ${YB}Cert Acme.sh${NC}          ${MB}[17]${NC} ${YB}Rebot vps${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e ""
echo -e " ${WB}Press [ ctrl + c ] or Input x To Exit Script${NC}"
echo -e ""
read -p " Select Menu :  "  opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; vmess ;;
3) clear ; vless ;;
4) clear ; trojan ;;
5) clear ; allxray ;;
6) clear ; wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh ;;
7) clear ; log-create ;;
8) clear ; Backup ;;
9) clear ; Restore ;;
10) clear ; Retart ;;
11) clear ; speedtest ;;
12) clear ; dns ;;
13) clear ; certxray ;;
14) clear ; xraymod ;;
15) clear ; xrayofficial ;;
16) clear ; about ;;
17) clear ; Reboot ;;
x) exit ;;
*) echo -e "salah input" ; sleep 0.5 ; menu ;;
esac
