#!/bin/bash
################################################################
# Kaj	    : skripta za namestitev Arch linux-a v slovenščini #
# Verzija   : version 1.01                                     #
# Avtor	    : Cooleech                                         #
# Priredil  : puikonen                                         #
# email     : cooleechATgmail.com; puikonen03ATgmail.com       #
# Licenca   : GPLv2                                            #
################################################################
#==============================================================================#
clear
echo -e "\n \e[1;34mDobrodošli!\e[0m | \e[1;34mS pomočjo te skripte si boste, na vaš računalnik, namestili distribucijo Arch Linux\e[0m.\n\n \e[36mENTER\e[0m = \e[36mZačetek namestitve\e[0m\t\n\n \n"
read Language
Language="${Language,,}"
case "$Language" in
*)
EnterYourUsername="Vpišite svoje ( \e[36muporabniško\e[0m ) ime"
Warning="OPOZORILO"
NoUsername="Niste vpisali uporabniškega imena"
EnterUserPass="Vpišite uporabniško geslo"
NoDisplaying="( vnos ne bo prikazan )"
ReenterUserPass="Ponovo vpišite uporabniško geslo"
EnterRootPass="Vpišite geslo \e[1;31mroot\e[0m uporabnika"
ReenterRootPass="Ponovno vpišite geslo za \e[1;31mroot\e[0m uporabnika"
DisplayDisks="Diski na voljo"
EnterDiskToPart="Vpišite kateri disk želite uporabiti in/ali patricionirati"
ToSkipPart="za preskok particioniranja samo zaprite cfdisk"
Without="BREZ"
And="in"
Eg="npr"
Numbers="številk"
Error="NAPAKA"
YouPicked="Izbrali ste"
DiskAccessError="do katerega cfdisk ne more dostopati.\n Ponovite izberite disk"
ViewPartitions="Pregled stanja particij na disku"
EnterPartitionNumber="Vpišite \e[1;36mŠTEVILKO\e[0m particije diska za"
PartitionError="particija *MORA* biti izbrana"
CheckInternet="Preverjam povezavo na internet"
ConnectUsingWiFi="Želite brežično povezavo?"
Yn="D/n"
NoInternet="Ni internetne povezave! \e[1;31m:(\e[0m Preverite kabel ali nastavitve mrežne naprave!
 Če želite dokončati namestitev sistema je \e[1;37mPOTREBNA\e[0m povezava s spletom"
ContinueOrCancel="Pritisnite \e[1;32mEnter\e[0m za nadaljevanje ali \e[1;31mCtrl\e[0m + \e[1;31mC\e[0m za prekinitev namestitve"
PassEmpty="Ne sme biti brez gesla"
PassMismatch="Gesli se ne ujemata"
Welcome="Dobrodošli v poenostavljeno namestitev \e[1;36mArch Linuxa-a\e[0m"
WhyThisScript="Ta skripta je narejena zato, da vam olajša namestitev Arch Linux-a"
YourRisk="UPORABLJATE JO NA LASTNO ODGOVORNOST"
InfoGathering="Za začetek potebujem nekaj informacij. Pa, začnimo!"
WhichKeyLayout="Kateri razpored tipkovnice ( keyboard layout ) želite uporabljati"
Slovenian="Slovenski"
English="Angleški"
Other="Ostali"
Wrong="Nepravilno"
SetSlovenian="Nastavljen je slovenski"
SetAmerican="Nastavljen je angleški"
KeyboardLayout="razpored tipkovnice"
EnterKeyboardLayout="Vpišite razpored tipkovnice katerega želite uporabljati po namestitvi sistema"
GermanEg="za nemški razpored"
LayoutAfterInstall="Razpored tipkovnice po namestitvi bo nastavljen na"
ToSkip="za preskok tega koraka pritisnite \e[1;32mEnter\e[0m"
ToFormat="Želite \e[1;31mformatirati"
Partition="particijo"
HomeToExt="da, v ext4\n\t\t( * POZOR * Vsi podatki na"
WillBeErased="particiji bodo izbrisani"
NoSepHomePart="ni samostojne /home particije"
Yes="da"
No="ne"
NoSwapPart="niste izbrali swap particije"
EnterHostName="Vpišite ime hosta ( bez razmika, samo \e[1;32mEnter\e[0m za"
EnterDE="Vpišite črko poleg DE-a katerega želite namestiti"
IllPickLater="Nobenega. DE ali WM bom namestil kasneje"
AutoLoginAs="Ali želite biti samodejno prijavljeni kot"
AtLogin="pri prijavi"
NumLockOn="Ali želite imeti vključen Num Lock $AtLogin v sistem (zaenkrat ne dela na Gnomu)"
WillBeOn="bo vključen"
WillBeOff="ne bo vključen"
NoDEorWMinstall="Noben DE ali WM ne bo nameščen. Po namestitvi lahko\n pred ponovnim zagonom sistema namestite kar želite v chroot okolju"
DEinstNotSel="Niste izbrali namestitev DE-a"
ThisIsMobilePC="Ta računalnik je prenosnik"
yN="d/N"
Overview="Pregled pomembnih nastavitev"
UserName="Uporabniško ime:"
HostName="Ime gostitelja (hostname)"
DiskPart="Particije diska"
FormPart="Formatiranje particij"
YesTo="da, v"
YesIfSel="da ( če je izbran"
KeyLayout="Tipkovnica"
AllInfoIneed="To bi bilo to. Imam dovolj informacij za nadaljevanje nastavitve.\n Počakajte, da se namestitev izvrši do konca."
AddFastMir="Dodajanje 5 najhitrejših mirrorov. Ne prekinjaj nastavitve - ta korak traja malce dlje časa.\n\n"
InstallEnd="NAMESTITEV JE KONČANA"
EnjoyWith="Veliko veselja pri uporabi"
UnmountAllPart="Odklop vseh particij..."
RebootIn="Ponoven zagon čez 5 sekund..."
;;
esac
X11Layouts="af al am ara at az ba bd be bg br brai bt bw by ca cd ch cm cn cz de dk ee epo es et fi fo fr gb ge gh gn gr hr hu ie il in iq ir is it jp ke kg kh kr kz la latam lk lt lv ma mao md me mk ml mm mn mt mv nec_vndr/jp ng nl no np ph pk pl pt ro rs ru se si sk sn sy th tj tm tr tw tz ua us uz vn za"
#==============================================================================#
function ENTER_KEYBOARD_LAYOUT {
clear
echo -e "\n $EnterKeyboardLayout\n\t( $Eg.\e[1;36m DE\e[0m $GermanEg )\n"
read Layout
Layout="${Layout,,}"
case "$X11Layouts" in
*$Layout*)
 echo -e "\n $LayoutAfterInstall \e[1;36m${Layout^^}\e[0m" && CONTINUE_OR_CANCEL
;;
*)
 echo -e "\n \e[31m*** $Error ***\e[0m\n\n $Wrong $KeyboardLayout!\n"
 sleep 2
 ENTER_KEYBOARD_LAYOUT
;;
esac
}

function USER_NAME {
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

function ENTER_USER_PASS {
clear
Geslo1=""
Geslo2=""
echo -e "\n $EnterUserPass \e[1;36m$Uporabnik\e[0m $NoDisplaying:"
stty -echo
read Geslo1
stty echo
if [ "$Geslo1" = "" ]; then
 PASSWORD_EMPTY
 ENTER_USER_PASS
fi
echo -e "\n $ReenterUserPass \e[1;36m$Uporabnik\e[0m $NoDisplaying:"
stty -echo
read Geslo2
stty echo
if [ "$Geslo1" = "$Geslo2" ]; then
 GesloUporabnika="$Geslo1
$Geslo2"
else
 PASSWORD_MISMATCH
 ENTER_USER_PASS
fi
}

function ENTER_ROOT_PASS {
clear
Geslo3=""
Geslo4=""
echo -e "\n $EnterRootPass $NoDisplaying:"
stty -echo
read Geslo3
stty echo
if [ "$Geslo3" = "" ]; then
 PASSWORD_EMPTY
 ENTER_ROOT_PASS
fi
echo -e "\n $ReenterRootPass $NoDisplaying:"
stty -echo
read Geslo4
stty echo
if [ "$Geslo3" = "$Geslo4" ]; then
 RootGeslo="$Geslo3
$Geslo4"
else
 PASSWORD_MISMATCH
 ENTER_ROOT_PASS
fi
}

function PARTITIONING {
clear
echo -e "\n $DisplayDisks:"
lsblk | grep -v "rom\|loop\|airoot"
echo -e "\n $EnterDiskToPart ( $Without \e[35m/dev/\e[0m $And $Without \e[35m$Numbers\e[0m, $Eg. \e[36msda\e[0m, $ToSkipPart ):\n"
read Disk
Disk="${Disk,,}"
Disk="${Disk//'/dev/'/}" # Odstrani /dev/ (za vsak slučaj :))
cfdisk /dev/$Disk
if [ $? != 0 ]; then
 clear
 echo -e "\n \e[1;31m* $Error *\e[0m\n\n $YouPicked \"$Disk\" disk $DiskAccessError!\n"
 CONTINUE_OR_CANCEL
 PARTITIONING
fi
}

function SEL_ROOT_PARTITION {
clear
echo -e "\n $ViewPartitions \e[1;33m/dev/$Disk\e[0m\n"
lsblk /dev/$Disk
echo -e "\n $EnterPartitionNumber / ( root )\n\t( $Without \e[1;33m/dev/$Disk\e[0m, $Eg. \e[36m 1 \e[0m):"
read RootPart
RootPart="${RootPart//'/dev/$Disk'/}" # Za svaki slučaj... :)
if [ "$RootPart" = "" ]; then
 clear
 echo -e "\n \e[1;31m* $Error *\e[0m\n\n Root $PartitionError!\n"
 CONTINUE_OR_CANCEL
 SEL_ROOT_PARTITION
fi
}

function NET_DEVICE {
ln -sf /dev/null /etc/udev/rules.d/80-net-name-slot.rules # Preimenuj omrežne naprave v "stara" imena
clear
echo -e "\n $CheckInternet...\n"
ping -c2 google.com
if [ $? != 0 ]; then
 echo -e "\n $ConnectUsingWiFi? ( $Yn )"
 read Spajanje
 Spajanje="${Spajanje,,}"
 case "$Spajanje" in
 d*|y*)
  wifi-menu -o
 ;;
 esac
 sleep 2 && ping -c2 google.com
 if [ $? != 0 ]; then
  echo -e "\n \e[1;31m* $Error *\e[0m\n\n $NoInternet.\n"
  CONTINUE_OR_CANCEL
  NET_DEVICE
 fi
fi
}

function CONTINUE_OR_CANCEL {
echo -e " $ContinueOrCancel..."
read -p ""
}

function PASSWORD_EMPTY {
clear
echo -e "\n \e[1;31m* $Error *\e[0m\n\n $PassEmpty!\n"
CONTINUE_OR_CANCEL
}

function PASSWORD_MISMATCH {
clear
echo -e "\n \e[1;31m* $Error *\e[0m\n\n $PassMismatch!\n"        
CONTINUE_OR_CANCEL
}
#==============================================================================#
setfont Lat2-Terminus16 # Nastavljam font 
clear
echo -e "\n\e[36m *******************************************************************************\n\t$Welcome \e[36mby \e[1;36mCooleech & madawc\e[0m\t\e[36m\n *******************************************************************************\e[0m
\n\t$WhyThisScript!\n
\t\e[31m* * * $Warning: $YourRisk * * *\n\e[0m
\t$InfoGathering! \e[1;33m:)\e[0m\n\n
 $WhichKeyLayout?\n\n \e[36ms\e[0m = \e[36m$Slovenian\e[0m\t( SI ) <= default\n\n \e[36me\e[0m = \e[36m$English\e[0m\t( US )\n\n \e[36mo\e[0m = \e[36m$Ostali\e[0m\t( ?? )\n"
read RazporedTipk
case "$RazporedTipk" in
s*|"")
 loadkeys slovene # Nastavi tipkovnico na slovenski layout
 Layout="si"
 echo -e "\n \e[1;36mINFO:\e[0m $SetSlovenian (\e[1;36m SI \e[0m) $KeyboardLayout.\n" && CONTINUE_OR_CANCEL
;;
e*)
 loadkeys us # Nastavi tipkovnico na slovenski layout
 Layout="us"
 echo -e "\n \e[1;36mINFO:\e[0m $SetAmerican (\e[1;36m US \e[0m) $KeyboardLayout.\n" && CONTINUE_OR_CANCEL
;;
*)
 loadkeys slovene # Postavi tipkovnicu na američki layout
 Layout="?"
 echo -e "\n \e[1;36mINFO:\e[0m $SetSlovenian (\e[1;36m SI \e[0m) $KeyboardLayout.\n" && CONTINUE_OR_CANCEL
;;
esac
clear
if [ "$Layout" = "?" ]; then
 ENTER_KEYBOARD_LAYOUT
fi
USER_NAME
ENTER_USER_PASS
ENTER_ROOT_PASS
PARTITIONING
SEL_ROOT_PARTITION
echo -e "\n $EnterPartitionNumber /home\n\t( $Without \e[1;33m/dev/$Disk\e[0m, $ToSkip ):"
read HomePart
HomePart="${HomePart//'/dev/$Disk'/}" # Za vsak slučaj... :)
if [ "$HomePart" != "" ]; then
 echo -e "\n\t$ToFormat\e[0m /home ( /dev/\e[1;36m$Disk$HomePart\e[0m ) $Partition? ( $Yn )"
 read Formatiraj
 Formatiraj="${Formatiraj,,}"
fi
case "$Formatiraj" in # Potrebno za info pred začetkom namestitve
d*|y*|"")
 if [ "$HomePart" != "" ]; then
  Formatirati="$HomeToExt /dev/$Disk$HomePart $WillBeErased! )"
 else
  Formatirati="\e[32m$NoSepHomePart\e[0m"
 fi
;;
*)
 Formatirati="$No"
;;
esac
echo -e "\n $EnterPartitionNumber swap\n\t( $Without \e[1;33m/dev/$Disk\e[0m, $ToSkip ):"
read SwapPart
SwapPart="${SwapPart//'/dev/$Disk'/}" # Za vsak slučaj... :)
if [ "$HomePart" = "" ]; then
 Home=" Home: /dev/$Disk$RootPart ( $NoSepHomePart )"
else
 Home=" Home: /dev/$Disk$HomePart"
fi
if [ "$SwapPart" = "" ]; then
 Swap=" Swap: nič ( $NoSwapPart )"
else
 Swap=" Swap: /dev/$Disk$SwapPart"
fi
clear
echo -e "\n $EnterHostName \e[36marchlinux\e[0m ):\n"
read ImeHosta
ImeHosta="${ImeHosta// /}" # Ukloni razmake
ImeHosta="${ImeHosta//'@'/AT}" # Zamjeni znak @
if [ "$ImeHosta" = "" ]; then
 ImeHosta="archlinux"
fi
NET_DEVICE
clear
echo -e "\n $EnterDE:\n\n \e[36mN\e[0m = \e[36m$IllPickLater\e[0m <= default\n\n \e[36mK\e[0m = \e[36mKDE + kdm\n\n \e[36mP\e[0m = \e[36mPLASMA 5 + sddm\n
 \e[36mG\e[0m = \e[36mGNOME + gdm\n\n M\e[0m = \e[36mMATE + lxdm\n\n \e[36mC\e[0m = \e[36mCINNAMON + gdm\n\n X\e[0m = \e[36mXfce + lxdm\n\n L\e[0m = \e[36mLXDE + lxdm\e[0m\n\n \e[36mE\e[0m = \e[36mENLIGHTENMENT + slim\n\n "
read DEzaInst
DEzaInst="${DEzaInst,,}"
case "$DEzaInst" in
k*|g*|m*|x*|l*|c*|e*|p*)
 clear
 echo -e "\n $AutoLoginAs \e[1;36m$Uporabnik\e[0m? ( $yN )"
 read AutoLogin
 AutoLogin="${AutoLogin,,}"
 echo -e "\n $NumLockOn? ( $Yn )"
 read NumLock
 NumLock="${NumLock,,}"
 case "$NumLock" in
 d*|y*|"")
  NumLock="$Yes ( $WillBeOn $AtLogin )"
 ;;
 *)
  NumLock="$No ( $WillBeOff $AtLogin )"
 ;;
 esac
;;
*)
 echo -e "\n \e[1;36mINFO:\e[31m $NoDEorWMinstall. ;)\e[0m\n"
 NumLock="$No ( $DEinstNotSel )" 
 CONTINUE_OR_CANCEL
;;
esac
echo -e "\n $ThisIsMobilePC? ( $yN )"
read Prenosnik
Prenosnik="${Prenosnik,,}"
case "$Prenosnik" in
d*|y*)
 TouchpadDriver=" xf86-input-synaptics libsynaptics"
;;
esac
clear
echo -e "\n $Overview:\n\n $UserName \e[36m$Uporabnik\e[0m\n $HostName:\t \e[36m$ImeHosta\e[0m\n\n $DiskPart:\n
  \e[36mRoot: /dev/$Disk$RootPart\n $Home\n $Swap\e[0m\n\n $FormPart:\n
  /\t\t\e[36m$YesTo ext4\e[0m\n  /home\t\t\e[1;31m$Formatirati\e[0m\n  swap\t\t\e[36m$YesIfSel )\e[0m\n
 $KeyLayout:\t\e[1;36m${Layout^^}\e[0m\n Num Lock:\t\e[1;32m$NumLock\e[0m\n\n $AllInfoIneed. ;)\n"
CONTINUE_OR_CANCEL
clear
echo -e "\n Formatiranje particij...\n"
umount /dev/$Disk$RootPart 2>/dev/null # Če je mountana, odmountaj
mkfs.ext4 -Fq /dev/$Disk$RootPart
if [ "$HomePart" != "" ]; then
 case "$Formatiraj" in
 d*|y*|"")
  echo -e "\n Formatiram /dev/$Disk$HomePart..."
  umount /dev/$Disk$HomePart 2>/dev/null # Če je mountana, odmountaj
  mkfs.ext4 -Fq /dev/$Disk$HomePart
 ;;
 esac
fi
if [ "$SwapPart" != "" ]; then
 mkswap /dev/$Disk$SwapPart
fi
echo -e "\n Mountam root particijo (/dev/$Disk$RootPart)...\n"
mount /dev/$Disk$RootPart /mnt
if [ $? != 0 ]; then
 echo -e "\n \e[1;31m* $Error *\e[0m\n\n Pritisnite \e[1;32mEnter\e[0m za nadaljevanje...\n"
 read -p ""
fi
if [ "$HomePart" != "" ]; then
 echo -e "\n Ustvarjam mapo /mnt/home..."
 mkdir /mnt/home
 echo -e "\n Mountam home particijo (/dev/$Disk$HomePart)...\n"
 mount /dev/$Disk$HomePart /mnt/home
 if [ $? != 0 ]; then
  echo -e "\n \e[1;31m* $Error *\e[0m\n\n Pritisnite \e[1;32mEnter\e[0m za nadaljevanje...\n"
  read -p ""
 fi
fi
if [ "$SwapPart" != "" ]; then
 echo -e "\n Mountam swap particijo (/dev/$Disk$SwapPart)...\n"
 swapon /dev/$Disk$SwapPart
 if [ $? != 0 ]; then
  echo -e "\n \e[1;31m* $Error *\e[0m\n\n Pritisnite \e[1;32mEnter\e[0m za nadaljevanje...\n"
  read -p ""
 fi
fi
clear
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup # Backup mirrorliste
sed '/^#\S/ s|#||' -i /etc/pacman.d/mirrorlist.backup # Odkomentiraj vse mirrore za test hitrosti
echo -e "\n $AddFastMir"
rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist #| watch -t tail -n 5 /etc/pacman.d/mirrorlist # Prikaz ocenjevanja mirrora in vpisovanje
clear
echo -e "\n Urejanje pacmana v live načinu..\n"
sed -i 's/#Color/Color/' /etc/pacman.conf
echo -e "\n Osveževanje keyringa...\n"
pacman -Sy --noconfirm archlinux-keyring
echo -e "\n Namestitev osnovnega sistema...\n"
pacstrap /mnt base base-devel
if [ $? != 0 ]; then
 echo -e "\n \e[1;31m* $Error *\e[0m\n\n Pritisnite \e[1;32mEnter\e[0m za nadaljevanje...\n"
 read -p ""
fi
echo -e "\n Generiranje fstab datoteke...\n"
genfstab -p /mnt | sed 's/rw,relatime,data=ordered/defaults,relatime/' >> /mnt/etc/fstab
#==============================================================================#
echo "#!/bin/bash
################################################################
# Kaj	    : skripta za namestitev Arch linux-a v slovenščini #
# Verzija   : version 1.00                                     #
# Avtor	    : Cooleech                                         #
# Priredil  : puikonen                                         #
# email     : cooleechATgmail.com; puikonen03ATgmail.com       #
# Licenca   : GPLv2                                            #
################################################################
ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules
echo \"$RootGeslo\" > /tmp/rootpass
passwd < /tmp/rootpass
rm -f /tmp/rootpass
useradd -m -g users -G wheel,storage,power -s /bin/bash $Uporabnik
echo \"$GesloUporabnika\" > /tmp/userpass
passwd $Uporabnik < /tmp/userpass
rm -f /tmp/userpass
echo -e \"\n Urejanje pacman.conf datoteke...\"
sed -i 's/#Color/Color/g' /etc/pacman.conf
echo -e \"\n Generiranje jezika...\"
sed -i 's/#sl_SI/sl_SI/g' /etc/locale.gen
locale-gen
echo \"LANG=sl_SI.UTF-8\" > /etc/locale.conf
export LANG=sl_SI.UTF-8
echo -e \"\n Nastavljam keymap v vconsole.conf...\"
echo -e \"KEYMAP=slovene\" > /etc/vconsole.conf # <=== Potrebno je dodati opcijo za izbiro! ===
echo -e \"\n Nastavljam časovni pas...\"
ln -s /usr/share/zoneinfo/Europe/Ljubljana /etc/localtime
echo -e \"\n Nastavljam hwclock na UTC...\"
hwclock --systohc --utc
echo -e \"\n Nastavljam gostitelja...\"
echo \"$ImeHosta\" > /etc/hostname
pacman-db-upgrade # Fix za stare iso datoteke
pacman -Sy --noconfirm alsa-firmware alsa-plugins alsa-utils bc dialog dnsmasq dosfstools firefox flac flashplugin gksu grub-bios gstreamer0.10-plugins gvfs lshw mtools net-tools network-manager-applet networkmanager-dispatcher-ntpd ntfs-3g ntp openssh os-prober p7zip perl-data-dump pulseaudio pulseaudio-alsa ttf-dejavu ttf-droid unrar unzip wget wireless_tools wpa_actiond wpa_supplicant xcursor-vanilla-dmz xdg-user-dirs xf86-input-keyboard xf86-input-mouse xf86-video-ati xf86-video-fbdev xf86-video-intel xf86-video-nouveau xf86-video-nv xf86-video-sis xf86-video-vesa xorg-server xorg-server-utils xorg-xclock xorg-xinit xterm vorbis-tools mc zip unrar lzop cpio faac$TouchpadDriver
if [ \$? != 0 ]; then
 echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
 read -p \"\"
fi
echo -e \"\n Dodajam OpenSSH v systemd...\"
systemctl enable sshd
echo -e \"\n Nastavljam tipkovnico na $Layout layout...\"
echo -e \"Section \\\"InputClass\\\"\n\tIdentifier \\\"system-keyboard\\\"\n\tMatchIsKeyboard \\\"on\\\"\n\tOption \\\"XkbModel\\\" \\\"pc105\\\"
\tOption \\\"XkbLayout\\\" \\\"$Layout\\\"\n\tOption \\\"XkbVariant\\\" \\\"\\\"\nEndSection\" > /etc/X11/xorg.conf.d/20-keyboard.conf
echo -e \"\n Nastavljam gvfs...\"
echo -e \"polkit.addRule(function(action, subject) {\n\tif (action.id.indexOf(\\\"org.freedesktop.udisks2.\\\") == 0){\n\t\treturn polkit.Result.YES;\n\t}\n});\" > /usr/share/polkit-1/rules.d/10-drives.rules
echo -e \"\n Urejam ntp.conf...\"
sed -i 's/pool.ntp.org/pool.ntp.org iburst/g' /etc/ntp.conf
sed -i 's/www.pool.ntp.org iburst/www.pool.ntp.org/g' /etc/ntp.conf # Fix za link
echo -e \"\n Nastavljam čas...\"
ntpd -qg
hwclock -w
 echo -e "[archlinuxfr]" >> /etc/pacman.conf 
 echo -e "SigLevel = Never" >> /etc/pacman.conf 
 echo -e "Server = http://repo.archlinux.fr/$(uname -m)" >> /etc/pacman.conf
 pacman -Sy --noconfirm yaourt
case \"$DEzaInst\" in
k*|g*|m*|x*|l*|c*)
 echo -e \"\n Namestitev gnome-keyringa in teme gnome-themes-standard...\"
 pacman -Sy --noconfirm gnome-keyring gnome-themes-standard
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 echo -e \"\n Omogočam uporabo gnome-keyringa...\"
 echo -e \"#!/bin/bash\n\nsource /etc/X11/xinit/xinitrc.d/30-dbus\neval \\\$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)\nexport SSH_AUTH_SOCK\" > /home/$Uporabnik/.xinitrc
;;
esac
echo -e \"\n Nadgradnja za .xinitrc...\"
echo -e \"\nif [ -d /etc/X11/xinit/xinitrc.d ]; then\n for f in /etc/X11/xinit/xinitrc.d/*; do\n   [ -x \\\"\\\$f\\\" ] && . \\\"\\\$f\\\"\n done\n unset f\nfi\n\" >> /home/$Uporabnik/.xinitrc
echo -e \"\n Konfiguriram Network Manager...\"
systemctl enable NetworkManager.service
systemctl enable NetworkManager-dispatcher.service && systemctl enable ModemManager.service
echo -e \"\n Dodajam uporabnika $Uporabnik v skupino network ...\"
gpasswd -a $Uporabnik network
echo -e \"\n Dodajam policy...\"
echo -e \"polkit.addRule(function(action, subject) {\n\tif (action.id.indexOf(\\\"org.freedesktop.NetworkManager.\\\") == 0 && subject.isInGroup(\\\"network\\\")) {
	\treturn polkit.Result.YES;\n\t}\n});\" > /etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers # ...and sudo for all
case \"$DEzaInst\" in
k*)
 echo -e \"\n Začenjam namestitev KDE-ja...\"
 pacman -Sy --noconfirm gwenview kdebase kde-l10n-sl kdegraphics-ksnapshot kdemultimedia-kmix kdeplasma-addons-applets-showdesktop kdeplasma-applets-plasma-nm ark oxygen-gtk2 kdegraphics-okular kdeadmin-kuser kdegraphics-kolourpaint kcalc k3b kdesu chromium libreoffice-fresh libreoffice-fresh-sl vlc amarok lame filezilla
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable kdm.service
 echo \"auth            optional        pam_gnome_keyring.so\" >> /etc/pam.d/kscreensaver
 echo -e \"exec startkde\" >> /home/$Uporabnik/.xinitrc
;;
g*)
 echo -e \"\n Začenjam namestitev GNOME-a...\"
 pacman -Sy --noconfirm gnome gnome-extra vlc gdm
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable gdm.service
 echo -e \"exec gnome-session\" >> /home/$Uporabnik/.xinitrc
 sed -i ' /WaylandEnable/s/^#//g' /etc/gdm/custom.conf
;;
m*)
 echo -e \"\n Začenjam namestitev MATE-a...\"
 pacman -Sy --noconfirm deadbeef gtk-engine-murrine lxdm mate mate-extra vlc zenity
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable lxdm.service
 sed -i 's/# session/session/g' /etc/lxdm/lxdm.conf
 sed -i 's/startlxde/mate-session/g' /etc/lxdm/lxdm.conf
 echo -e \"exec mate-session\" >> /home/$Uporabnik/.xinitrc
;;
x*)
 echo -e \"\n Začenjam namestitev Xfce4 DE-a...\"
 pacman -Sy --noconfirm deadbeef lxdm thunar-archive-plugin thunar-volman xarchiver xfce4 xfce4-goodies xfce4-notifyd vlc zenity
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable lxdm.service
 sed -i 's/# session/session/g' /etc/lxdm/lxdm.conf
 sed -i 's/startlxde/startxfce4/g' /etc/lxdm/lxdm.conf
 echo -e \"\n Modificiram desktop ikone Xfce4 DE-a...\"
 echo -e \"style \\\"xfdesktop-icon-view\\\" {\n\tXfdesktopIconView::label-alpha = 0
	XfdesktopIconView::shadow-x-offset = 1\n\tXfdesktopIconView::shadow-y-offset = 1
	XfdesktopIconView::shadow-color = \\\"#000000\\\"\n\tXfdesktopIconView::selected-shadow-x-offset = 0
	XfdesktopIconView::selected-shadow-y-offset = 0\n\tXfdesktopIconView::selected-shadow-color = \\\"#000000\\\"
	fg[NORMAL] = \\\"#ffffff\\\"\n\tfg[SELECTED] = \\\"#ffffff\\\"\n\tfg[ACTIVE] = \\\"#ffffff\\\" }
	widget_class \\\"*XfdesktopIconView*\\\" style \\\"xfdesktop-icon-view\\\"\" >> /home/$Uporabnik/.gtkrc-2.0
 echo -e \"exec startxfce4\" >> /home/$Uporabnik/.xinitrc
;;
l*)
 echo -e \"\n Začenjam namestitev LXDE-a...\"
 pacman -Sy --noconfirm galculator gnome-mplayer leafpad lxde lxdm obconf xarchiver vlc zenity
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable lxdm.service
 echo -e \"exec startlxde\" >> /home/$Uporabnik/.xinitrc
;;
c*)
 echo -e \"\n Začenjam namestitev CINNAMON-a...\"
 pacman -Sy --noconfirm cinnamon nemo-fileroller gdm
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable gdm.service
 echo -e \"exec cinnamon-session\" >> /home/$Uporabnik/.xinitrc
 sed -i ' /WaylandEnable/s/^#//g' /etc/gdm/custom.conf
;;
e*)
 echo -e \"\n Začenjam namestitev ENLIGHTENMENT-a...\"
 pacman -Sy --noconfirm enlightenment slim
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable slim.service
 echo -e \"exec enlightenment_start\" >> /home/$Uporabnik/.xinitrc
;;
p*)
 echo -e \"\n Začenjam namestitev PLASMA 5...\"
 pacman -Sy --noconfirm plasma-desktop sddm kdebase
 if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
 fi
 systemctl enable sddm
 ;;
*)
 echo -e \"\n \e[1;36mINFO:\e[31m $DEinstNotSel!\e[0m\"
;;
esac
case \"$NumLock\" in
d*)
 echo -e \"\n Vključujem numlock pri logiranju...\"
 if [ -e /usr/share/config/kdm/kdmrc ]; then
 echo -e \"numlockx on\" >> /usr/share/config/kdm/Xsetup
 echo -e \"NoUpgrade = usr/share/config/kdm/Xsetup\" >> /etc/pacman.conf
 fi
 if [ -e /etc/lxdm/lxdm.conf ]; then
  sed -i 's/# numlock=0/numlock=1/g' /etc/lxdm/lxdm.conf
 fi
  if [ -e /etc/slim.conf ]; then
 sed -i ' /numlock/s/^#//g' /etc/slim.conf
 fi
   if [ -e /etc/lightdm/lightdm.conf ]; then
 echo -e \"greeter-setup-script=/usr/bin/numlockx on\" >> /etc/lightdm/lightdm.conf
 fi
;;
esac
if ! [ -d /home/$Uporabnik/Dokumenti ]; then # Dodaj uporabniške, če ne obstajajo
 mkdir /home/$Uporabnik/Dokumenti
fi
if ! [ -d /home/$Uporabnik/Prejemi ]; then
 mkdir /home/$Uporabnik/Prejemi
fi
if ! [ -d /home/$Uporabnik/Glasba ]; then
 mkdir /home/$Uporabnik/Glasba
fi
if ! [ -d /home/$Uporabnik/Slike ]; then
 mkdir /home/$Uporabnik/Slike
fi
if ! [ -d /home/$Uporabnik/Javno ]; then
 mkdir /home/$Uporabnik/Javno
fi
if ! [ -d /home/$Uporabnik/Video ]; then
 mkdir /home/$Uporabnik/Video
fi
echo -e \"\n Dodajem aliase...\"
echo -e \"alias la='ls -a'\nalias ll='ls -la'\nalias grep='grep --color=auto'\" >> /etc/bash.bashrc
echo -e \"\n Dodeljujem lastništvo /home/$Uporabnik mape uporabniku $Uporabnik...\"
chown -R $Uporabnik /home/$Uporabnik
echo -e \"\n Izvajam xdg-user-dirs-update...\"
xdg-user-dirs-update --force --set DOKUMENTI /home/$Uporabnik/Dokumenti # Osveži xdg-user-dirs
xdg-user-dirs-update --force --set PREJEMI /home/$Uporabnik/Prejemi
xdg-user-dirs-update --force --set GLASBA /home/$Uporabnik/Glasba
xdg-user-dirs-update --force --set SLIKE /home/$Uporabnik/Slike
xdg-user-dirs-update --force --set VIDEO /home/$Uporabnik/Video
case \"$AutoLogin\" in
d*|y*)
 echo -e \"\n Nastavljam auto-login...\"
 if [ -e /usr/share/config/kdm/kdmrc ]; then
  sed -i 's/#AutoLoginUser=fred/AutoLoginUser=$Uporabnik/g' /usr/share/config/kdm/kdmrc
  sed -i 's/#AutoLoginEnable/AutoLoginEnable/g' /usr/share/config/kdm/kdmrc
 fi
 if [ -e /etc/gdm/custom.conf ]; then
  sed -i '/daemon/ a\AutomaticLogin=$Uporabnik\nAutomaticLoginEnable=True' /etc/gdm/custom.conf # Thnx, vision! :)
 fi
 if [ -e /etc/lxdm/lxdm.conf ]; then
  sed -i 's/# autologin=dgod/autologin=$Uporabnik/g' /etc/lxdm/lxdm.conf
 fi
;;
esac
echo -e \"\n Namestitev GRUB bootloadera...\"
grub-install --target=i386-pc --recheck /dev/$Disk
if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje ali Crtl + C za prekinitev...\n\"
  read -p \"\"
fi
echo -e \"\n Kopiranje GRUB sporočil...\"
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje...\n\"
  read -p \"\"
fi
echo -e \"\n Konfiguracija GRUB bootloadera...\"
grub-mkconfig -o /boot/grub/grub.cfg
if [ \$? != 0 ]; then
  echo -e \"\n $Error *\n\n Pritisnite Enter za nadaljevanje ali Crtl + C za prekinitev...\n\"
  read -p \"\"
fi
rm -f /root/.bashrc
rm -f /etc/ArchChroot" > /mnt/etc/ArchChroot
#==================================================================================================#
echo -e "sh /etc/ArchChroot\nexit" > /mnt/root/.bashrc
arch-chroot /mnt /bin/bash
clear
echo -e "\n $UnmountAllPart"
umount -R /mnt
swapoff -a
echo -e "\n\e[36m*********************************\n*\t\e[37m$InstallEnd\e[36m\t*\n*********************************\e[0m\n\n $EnjoyWith \e[1;36mArch Linux-a \e[1;33m:)\e[0m\n"
sleep 5 | echo -e "\n $RebootIn"
reboot
