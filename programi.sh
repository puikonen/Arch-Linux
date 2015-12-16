#!/bin/bash
####################################################################
# Kaj	    : skripta za namestitev dodatnih programovArch linux-u #
# Verzija   : version 1.00                                         #
# Avtor	    : puikonen03                                           #                                      
# email     : puikonen03ATgmail.com                                #
# Licenca   : GPLv2                                                #
####################################################################
#==============================================================================#
clear
echo -e "\033[0m\033[1;36m                   -\`               "
echo -e "\033[0m\033[1;36m                  .o+\`             "   
echo -e "\033[0m\033[1;36m                 \`ooo/                "
echo -e "\033[0m\033[1;36m                \`+oooo:               "
echo -e "\033[0m\033[1;36m               \`+oooooo:              "
echo -e "\033[0m\033[1;36m               -+oooooo+:             "
echo -e "\033[0m\033[1;36m             \`/:-:++oooo+:            "
echo -e "\033[0m\033[1;36m            \`/++++/+++++++:           "
echo -e "\033[0m\033[1;36m           \`/++++++++++++++:     \033[0m\033[31m               Dobrodošli!      "
echo -e "\033[0m\033[1;36m          \`/+++o\033[0m\033[36moooooooo\033[0m\033[1;36moooo/\`    \e[0m  \e[1;34m  S pomočjo te skripte si boste,   "
echo -e "\033[0m\033[36m         \033[0m\033[1;36m./\033[0m\033[36mooosssso++osssssso\033[0m\033[1;36m+\`              na vaš računalnik,    "
echo -e "\033[0m\033[36m        .oossssso-\`\`\`\`/ossssss+\`                 namestili "
echo -e "\033[0m\033[36m       -osssssso.      :ssssssso.          \033[0m\033[31m  dodatne programe. "
echo -e "\033[0m\033[36m      :osssssss/        osssso+++.    "
echo -e "\033[0m\033[36m     /ossssssss/        +ssssooo/-    "
echo -e "\033[0m\033[36m   \`/ossssso+/:-        -:/+osssso+-  "
echo -e "\033[0m\033[36m  \`+sso+:-\`                 \`.-/+oso: "
echo -e "\033[0m\033[36m \`++:.                           \`-/+/ "
echo -e "\033[0m\033[36m .\`                                 \`/ \n\n"



echo -e "\e[36mPreverjanje ali ima vaš sistem nameščene potrebne pakete.\t\n\n"


###################################### KDIALOG ######################################
if [ -e /usr/bin/kdialog ]; then
	echo -e "Kdialog je že namešščen."
else
	echo -e "\e[36mMalce počakaj! Namestiti moram paket\033[0m\033[31m kdialog\e[36m!\e[0m\t\n\n"
	sudo pacman -Sy --noconfirm kdebase-kdialog
	echo -e "Sedaj je vaš sistem pripravljen za nadaljevanje."
fi
#####################################################################################
texlive="Ali želiš namestiti texlive"
fonti="Ali želiš izboljšati glajenje pisave"
tiskalnik="Ali želiš namestiti podporo za tiskalnike in SAMBO?"
backup="Ali želiš povoziti nastavitve desktopa z osebnimi nastavitvami"
EnterYourUsername="Vpišite svoje izbrano \e[0m(uporabniško) \e[36mime"
EnterWebSite="\e[36mVpišite naslov \e[0mspletne strani\e[36m, kjer imaš shranjene datoteke\033[0m\033[31m backup.tar.gz, stili.tar.gz \e[36min\033[0m\033[31m WindowsFonts.tar.gz"
ContinueOrCancel="Pritisnite \e[1;32mEnter\e[0m za nadaljevanje ali \e[1;31mCtrl\e[0m + \e[1;31mC\e[0m za prekinitev namestitve"
Warning="OPOZORILO"
NoWebSite="Niste vpisali spletnega naslova"
NoUsername="Niste vpisali uporabniškega imena"

function USER_NAME {
sleep 2 
clear
echo -e "\n $EnterYourUsername:\n"
read Uporabnik
Uporabnik="${Uporabnik%% *}" 
Uporabnik="${Uporabnik,,}" 
clear
if [ "$Uporabnik" = "" ]; then
 echo -e "\n \e[1;36m* $Warning *\e[0m\n $NoUsername...\n"
 CONTINUE_OR_CANCEL
 USER_NAME
fi
}

function SPLETNA_STRAN {
clear
echo -e "\n $EnterWebSite\e[36m:\n"
read EnterWebSite
EnterWebSite="${EnterWebSite%% *}" 
EnterWebSite="${EnterWebSite,,}" 
clear
if [ "$EnterWebSite" = "" ]; then
 echo -e "\n \e[1;36m* $Warning *\e[0m\n $NoWebSite!\n"
 CONTINUE_OR_CANCEL
 SPLETNA_STRAN 
fi
}

function CONTINUE_OR_CANCEL {
echo -e " $ContinueOrCancel..."
read -p ""
}

USER_NAME
SPLETNA_STRAN
cmd=(dialog --separate-output --checklist "Izberi, kaj želiš namestiti:" 22 76 16)
options=(1 "Dodatni KDE programi" off   
         2 "Backup" off
         3 "TexLive" off
         4 "Fonti" off
		 5 "Tiskalniki" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            yaourt -Sy --noconfirm  kde-servicemenus-rootactions fortune-mod fortune-mod-chucknorris dropbox systemd-readahead prelink
		    sudo systemctl enable systemd-readahead-collect 
			sudo systemctl enable systemd-readahead-replay
			sudo pacman -Sy --noconfirm sddm-kcm kdeplasma-addons gwenview  kdegraphics-ksnapshot kdemultimedia-kmix  ark oxygen-gtk2 kdegraphics-okular kdeadmin-kuser 
			sudo pacman -Sy --noconfirm  kdegraphics-kolourpaint kcalc k3b kdesu chromium libreoffice-fresh libreoffice-fresh-sl vlc amarok lame filezilla jre8-openjdk 
			sudo pacman -Sy --noconfirm geogebra screenfetch bleachbit qbittorrent audex kinfocenter kscreen
			sleep 2 | echo -e "\e[36mDodatni KDE programi so nameščeni!"
			clear
            ;;
			
        2)
			sleep 4 | echo -e "\e[36mDatoteka backup.tar.gz mora vsebovati mape:\033[0m\033[31m .config, .kde4\033[0m\033[31m in \033[0m\033[31m .local\e[36m!"
			wget --directory-prefix="/home/$Uporabnik" $EnterWebSite/backup.tar.gz
			rm -df /home/$Uporabnik/.config
			rm -df /home/$Uporabnik/.kde4
			rm -df /home/$Uporabnik/.local
			tar -xvf /home/$Uporabnik/backup.tar.gz -C /home/$Uporabnik
			rm /home/$Uporabnik/backup.tar.gz
			clear
			sleep 2 | echo -e "\e[36mNastavitve so prepisane s pomočjo datoteke backup.tar.gz"
			clear
			;;
		
        3)
			sudo pacman -S --noconfirm texlive-core texlive-fontsextra texlive-latexextra kile
			sudo wget --directory-prefix="/usr/share/texmf-dist/tex/latex" $EnterWebSite/stili.tar.gz
			sudo tar -xvf /usr/share/texmf-dist/tex/latex/stili.tar.gz -C /usr/share/texmf-dist/tex/latex
			sudo rm /usr/share/texmf-dist/tex/latex/stili.tar.gz
			sudo mktexlsr
			sleep 2 | echo -e "\e[36mNamestitev \033[0m\033[31mTexLive \e[36mje končana!"
			clear
            ;;
			
        4)
			sudo mkdir /usr/share/fonts/WindowsFonts
			sudo wget --directory-prefix="/usr/share/fonts/WindowsFonts" $EnterWebSite/WindowsFonts.tar.gz
			sudo tar -xvf /usr/share/fonts/WindowsFonts/WindowsFonts.tar.gz -C /usr/share/fonts/WindowsFonts
			sudo rm /usr/share/fonts/WindowsFonts/WindowsFonts.tar.gz
			sudo chmod 755 /usr/share/fonts/WindowsFonts/*
			sudo fc-cache -fv
			fc-cache -fv
			if [ -e /home/$Uporabnik/.fonts.conf ]; then
				sudo rm /home/$Uporabnik/.fonts.conf
			fi
			echo "<?xml version="1.0"?>
			<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
			<fontconfig>
				<match target="font">
					<edit name="antialias" mode="assign">
						<bool>true</bool>
					</edit>
					<edit name="hinting" mode="assign">
						<bool>true</bool>
					</edit>
					<edit name="rgba" mode="assign">
						<const>rgb</const>
					</edit>
					<edit name="autohint" mode="assign">
						<bool>false</bool>
					</edit>
					<edit name="hintstyle" mode="assign">
						<const>hintslight</const>
					</edit>
					<edit mode="assign" name="lcdfilter">
						<const>lcddefault</const>
					</edit>
				</match>
			</fontconfig>" >> /home/$Uporabnik/.fonts.conf
			clear			
			sleep 5 | echo -e "\e[36mGlajenje fontov je poboljšano. Prav tako so nameščeni \033[0m\033[31mWindows \e[36mfonti!\n\nZa uveljavitev sprememb se je potrebno \033[0m\033[31mponovno prijaviti \e[36mv namizje!"
			clear
            ;;
		5)	
			yaourt -S --noconfirm foo2zjs
			yaourt -S --noconfirm libcups
			yaourt -S--noconfirm kde-servicemenus-lprinter-qt
			sudo pacman -Sy --noconfirm samba cups python-pysmbc system-config-printer hplip
			sudo mv /etc/samba/smb.conf.default /etc/samba/smb.conf
			sudo testparm
			sudo touch /etc/samba/smb.conf
			sudo gpasswd -a franc lp
			sudo systemctl disable.cups.service
			sudo systemctl enable org.cups.cupsd.service
			sudo systemctl start org.cups.cupsd.service
			sudo systemctl enable smbd
			sudo systemctl enable nmbd
			sleep 2 | echo -e "\e[36mPodpora za tiskalnike in \e[36mSAMBA\e[36m so nameščeni."
			clear
		
    esac
done
