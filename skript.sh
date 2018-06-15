#!/bin/bash
# Skript: skript.sh
#
# Skript welches den Ordner im Dateipfad XY mit Hilfe von rsync sichert
#

# Ordner der gesicher wird
quelle="root@192.168.220.12:/home/vmadmin/LB03/internedokumente" #Daten welche gesichert werden müssen ->  script läuft auf backupserver .

# Wo wird das Backup gespeichert -> VMLS5
#Prinzip Grossvater Vater Sohn

#Tagessicherungen -> Sohn insgesamt 5
#tagessicherung1="/home/backup/tagessicherungen/tagessicherung1" script auf vmls3 ausführen? -> einfacherer code
#ich werde es wahrscheinlich ohne zip machen
tagessicherung1="/home/backup/tagessicherungen/tagessicherung1"
tagessicherung2="/home/backup/tagessicherungen/tagessicherung2"
tagessicherung3="/home/backup/tagessicherungen/tagessicherung3"
tagessicherung4="/home/backup/tagessicherungen/tagessicherung4"
tagessicherung5="/home/backup/tagessicherungen/tagessicherung5"

#Wochensicherungen -> Vater insgesamt 3
wochensicherungen1="/home/backup/wochensicherungen/wochensicherungen1"
wochensicherungen2="/home/backup/wochensicherungen/wochensicherungen2"
wochensicherungen3="/home/backup/wochensicherungen/wochensicherungen3"

#Jahressicherung -> Grossvater insgesamt 12
monatssicherung1="/home/backup/monatssicherungen/monatssicherung1"
monatssicherung2="/home/backup/monatssicherungen/monatssicherung2"
monatssicherung3="/home/backup/monatssicherungen/monatssicherung3"
monatssicherung4="/home/backup/monatssicherungen/monatssicherung4"
monatssicherung5="/home/backup/monatssicherungen/monatssicherung5"
monatssicherung6="/home/backup/monatssicherungen/monatssicherung6"
monatssicherung7="/home/backup/monatssicherungen/monatssicherung7"
monatssicherung8="/home/backup/monatssicherungen/monatssicherung8"
monatssicherung9="/home/backup/monatssicherungen/monatssicherung9"
monatssicherung10="/home/backup/monatssicherungen/monatssicherung10"
monatssicherung11="/home/backup/monatssicherungen/monatssicherung11"
monatssicherung12="/home/backup/monatssicherungen/monatssicherung12"

#passwort rsync
rsync_passwort="gibbiX12345"

#Ort der Binaer-Datei von rsync
rsync='which rsync'

#beispielbefehl:
#sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung1

#-------------------------------------------------------------------------#
# 				Programm
#-------------------------------------------------------------------------#

echo "Dieses Skript wird Ihnen verschiedene Fragen stellen. Damit das Backup reibungslos verläuft, halten Sie sich an die vorgeschlagenen Wörtern in den Klammern!"

echo "\n-------------Skript beginnt-------------\n"

echo "Welcher Tag ist heute?(Mo,Di,Mi,Do,Fr,Sa): "
	    read tag
if [ "$tag" = "Mo" ];
	then
		echo "Es wird das Tagesbackup von Mo gemacht, welches in /home/backup/tagessicherungen/tagessicherung1 abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung1

elif [ "$tag" = "Di" ];
	then
		echo "Es wird das Tagesbackup von Di gemacht, welches in /home/backup/tagessicherungen/tagessicherung2 abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung2

elif [ "$tag" = "Mi" ];
	then
		echo "Es wird das Tagesbackup von Mi gemacht, welches in /home/backup/tagessicherungen/tagessicherung3 abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung3

elif [ "$tag" = "Do" ];
	then
		echo "Es wird das Tagesbackup von Do gemacht, welches in /home/backup/tagessicherungen/tagessicherung4 abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung4

elif [ "$tag" = "Fr" ];
	then
		echo "Es wird das Tagesbackup von Fr gemacht, welches in /home/backup/tagessicherungen/tagessicherung5 abglegt wird."
		sshpass -p $rsync_passwort $rsync -av $quelle $tagessicherung5

elif [ "$tag" = "Sa" ];
	then
		echo "Welche Wochennummer haben wir?(1,2,3,4) "
		read wochennummer
		if [ "$wochennummer" = "1" ];
			then
				echo "Es wird das Wochenbackup von der 1 Woche gemacht, welches in /home/backup/wochensicherungen/wochensicherungen1 abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen1
				cp -ar /home/backup/tagessicherungen/tagessicherung1 /home/backup/tagessicherungen/tagessicherung2 /home/backup/tagessicherungen/tagessicherung3 /home/backup/tagessicherungen/tagessicherung4 /home/backup/tagessicherungen/tagessicherung5 home/backup/wochensicherungen/wochensicherungen1/ #alle tagessicherungen ins wochenbackup kopieren

		elif [ "$wochennummer" = "2" ];
			then
				echo "Es wird das Wochenbackup von der 2 Woche gemacht, welches in /home/backup/wochensicherungen/wochensicherungen2 abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen2
				cp -ar /home/backup/tagessicherungen/tagessicherung1 /home/backup/tagessicherungen/tagessicherung2 /home/backup/tagessicherungen/tagessicherung3 /home/backup/tagessicherungen/tagessicherung4 /home/backup/tagessicherungen/tagessicherung5 home/backup/wochensicherungen/wochensicherungen2/ #alle tagessicherungen ins wochenbackup kopieren

		elif [ "$wochennummer" = "3" ];
			then
				echo "Es wird das Wochenbackup von der 3 Woche gemacht, welches in /home/backup/wochensicherungen/wochensicherungen3 abglegt wird."
				sshpass -p $rsync_passwort $rsync -av $quelle $wochensicherungen3
				cp -ar /home/backup/tagessicherungen/tagessicherung1 /home/backup/tagessicherungen/tagessicherung2 /home/backup/tagessicherungen/tagessicherung3 /home/backup/tagessicherungen/tagessicherung4 /home/backup/tagessicherungen/tagessicherung5 home/backup/wochensicherungen/wochensicherungen3/ #alle tagessicherungen ins wochenbackup kopieren

		elif [ "$wochennummer" = "4" ];
			then
				echo "Welchen Monat haben wir?(1,2,3,4,5,6,7,8,9,10,11,12) "
				read monat
				if [ "$monat" = "1" ];
					then
						echo "Es wird das Monatsbackup des 1. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung1 abglegt wird."
						sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen1
						cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung1 #alle wochensicherungen ins monatsbackup kopieren 
						
				elif [ "$monat" = "2" ];
					then
						echo "Es wird das Monatsbackup des 2. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung2 abglegt wird."
						sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
						cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung2 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "3" ];
					then
							echo "Es wird das Monatsbackup des 3. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung3 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung3 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "4" ];
					then
						echo "Es wird das Monatsbackup des 4. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung4 abglegt wird."
						sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
						cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung4 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "5" ];
						then
							echo "Es wird das Monatsbackup des 5. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung5 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung5 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "6" ];
						then
							echo "Es wird das Monatsbackup des 6. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung6 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung6 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "7" ];
						then
							echo "Es wird das Monatsbackup des 7. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung7 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung7 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "8" ];
						then
							echo "Es wird das Monatsbackup des 8. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung8 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung8 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "9" ];
						then
							echo "Es wird das Monatsbackup des 9. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung9 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung9 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "10" ];
						then
							echo "Es wird das Monatsbackup des 10. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung10 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung10 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "11" ];
						then
							echo "Es wird das Monatsbackup des 11. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung11 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung11 #alle wochensicherungen ins monatsbackup kopieren
				elif [ "$monat" = "12" ];
						then
							echo "Es wird das Monatsbackup des 12. Monates gemacht, welches in /home/backup/monatssicherungen/monatssicherung12 abglegt wird."
							sshpass -p $rsync_passwort $rsync -av $quelle $monatssicherungen2
							cp /home/backup/wochensicherungen/wochensicherungen1 /home/backup/wochensicherungen/wochensicherungen2 /home/backup/wochensicherungen/wochensicherungen3 /home/backup/monatssicherungen/monatssicherung12 #alle wochensicherungen ins monatsbackup kopieren
