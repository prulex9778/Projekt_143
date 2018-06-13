#!/bin/bash
# Skript: skript.sh
#
# Skript welches den Ordner im Dateipfad XY mit Hilfe von rsync sichert
#

# Ordner der gesicher wird
quelle="/home/vmadmin/XY"

# Wo wird das Backup gespeichert -> VMLS3
#Prinzip Grossvater Vater Sohn

#Tagessicherungen -> Sohn insgesamt 5
tagessicherung1="root@192.168.220.12:/home/backup/tagessicherungen/tagessicherung1.zip"
tagessicherung2="root@192.168.220.12:/home/backup/tagessicherungen/tagessicherung2.zip"
tagessicherung3="root@192.168.220.12:/home/backup/tagessicherungen/tagessicherung3.zip"
tagessicherung4="root@192.168.220.12:/home/backup/tagessicherungen/tagessicherung4.zip"
tagessicherung5="root@192.168.220.12:/home/backup/tagessicherungen/tagessicherung5.zip"

#Wochensicherungen -> Vater insgesamt 3
wochensicherungen1="root@192.168.220.12:/home/backup/wochensicherungen/wochensicherungen1.zip"
wochensicherungen2="root@192.168.220.12:/home/backup/wochensicherungen/wochensicherungen2.zip"
wochensicherungen3="root@192.168.220.12:/home/backup/wochensicherungen/wochensicherungen3.zip"

#Jahressicherung -> Grossvater insgesamt 12
monatssicherung1="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung1.zip"
monatssicherung2="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung2.zip"
monatssicherung3="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung3.zip"
monatssicherung4="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung4.zip"
monatssicherung5="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung5.zip"
monatssicherung6="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung6.zip"
monatssicherung7="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung7.zip"
monatssicherung8="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung8.zip"
monatssicherung9="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung9.zip"
monatssicherung10="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung10.zip"
monatssicherung11="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung11.zip"
monatssicherung12="root@192.168.220.12:/home/backup/monatssicherungen/monatssicherung12.zip"

#passwort rsync
rsync_passwort="gibbiX12345"

#Ort der Binaer-Datei von rsync
rsync='which rsync'

#beispielbefehl:
#sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung1

#-------------------------------------------------------------------------#
# 				Programm
#-------------------------------------------------------------------------#

echo "Dieses Skript wird Ihnen verschiedene Fragen stellen. Damit das Backup reibungslos verläuft, halten Sie sich an den vorgeschlagenen Wörtern in den Klammern!"

echo "\n-------------Skript beginnt-------------\n"

echo "Welcher Tag ist heute?(Mo,Di,Mi,Do,Sa): "
	    read tag
if [ "$tag" = "Mo" ];
	then
		echo "Es wird das Tagesbackup von Mo gemacht, welches in xy abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung1

elif [ "$tag" = "Di" ];
	then
		echo "Es wird das Tagesbackup von Di gemacht, welches in xy abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung2

elif [ "$tag" = "Mi" ];
	then
		echo "Es wird das Tagesbackup von Mi gemacht, welches in xy abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung3

elif [ "$tag" = "Do" ];
	then
		echo "Es wird das Tagesbackup von Do gemacht, welches in xy abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung4

elif [ "$tag" = "Fr" ];
	then
		echo "Es wird das Tagesbackup von Fr gemacht, welches in xy abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung5

elif [ "$tag" = "Sa" ];
	then
		echo "Welche Wochennummer haben wir?(1,2,3,4) "
		read wochennummer
		if [ "$wochennummer" = "1" ];
			then
				echo "Es wird das Wochenbackup von der 1 Woche gemacht, welches in xy abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen1
				#alle tagessicherungen ins wochenbackup kopieren

		elif [ "$wochennummer" = "2" ];
			then
				echo "Es wird das Wochenbackup von der 2 Woche gemacht, welches in xy abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen2

		elif [ "$wochennummer" = "3" ];
			then
				echo "Es wird das Wochenbackup von der 3 Woche gemacht, welches in xy abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen3

		elif [ "$wochennummer" = "4" ];
			then
				echo "Welchen Monat haben wir?(1,2,3,4,5,6,7,8,9,10,11,12) "
				read monat
				if [ "$monat" = "1" ];
					then
						echo "Es wird das Monatsbackup des 1. Monates gemacht, welches in xy abglegt wird."
						sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen1
						#alle wochensicherungen ins monatsbackup kopieren
				
				elif [ "$monat" = "2" ];
					then
						echo "Es wird das Monatsbackup des 2. Monates gemacht, welches in xy abglegt wird."
						sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
						#alle wochensicherungen ins monatsbackup kopieren
			






