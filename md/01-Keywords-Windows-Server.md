---
title: 'Win-Server'
author: ''
date: \today
subject: "Markdown"
keywords: [Markdown]
lang: "de"
bibliography: literatur.bib 
csl: zitierstil-number.csl
---
<!-----------------------------+
ju 20-2-22
+------------------------------>
# Microsoft Windows Server

Quelle: Udemy Patrick Gruenauer [^1] 

[^1]: <https://www.udemy.com/course/microsoft-windows-server-fur-einsteiger/>


MMOGA [^2] Windows 11 Professional OEM Key:

[^2]: <https://www.mmoga.de>

Windows Download [^3] bootfähigen USB-Sticks erstellen [^4] 

[^3]: <https://www.microsoft.com/de-de/software-download/windows11>

[^4]:  <https://rufus.ie/de/>

## Voraussetzung Software und Hardware

Suche: `pc-info` **Windows Voraussetzung**: Win 10/11 Pro

Powershell mit adminrechten öffnen: `systeminfo` (**Anforderung für Hyper-V muss erfüllt sein.**)

Suche: **Windows Features aktivieren**: `Hyper-V`

**Download Server und Client**

*Windows Server Evaluierungsversion*: Windows Server 2022, englisch (Standard), **180 Tage**, Microsoft Konto 

**6x** 180 Tage **verlängern** (3 Jahre) in Powershell: `slmgr -rearm`

*Windows 10 Evaluierungsversion*: Windows 10 Enterprise, deutsch, **90 Tage**, Microsoft Konto

## Hyper-V-Manager öffnen

1. $\to$ Hyper-V-Manager: **LAP** / (re. Mausklick) 
   - $\to$ **Manager für virtuelle Switches**
     - Neuer Virtueller Netzwerkswitch / Intern $\to$ Virtuellen Switch erstellen / `kurs`
2. $\to$ Hyper-V-Manager: **LAP** / (re. Mausklick) 
   - $\to$ **Neu / Virtueller Computer erstellen**
     - Name und Pfad angeben:  `Server01`
     - Generation angeben: `Generation 2`
     - Speicher zuweisen: `4096` RAM
     - Netzwerk konfigurieren: Verbindung: `kurs` (Virtueller Netzwerkswitch)
     - Installationsoptionen: ISO: `Windows Server 2022.iso` auswählen
   - $\to$ Virtueller Computer: **Server01** / (re. Mausklick) Einstellungen
     - Prüfpunkte deaktivieren
     - CPU: `2 Kerne` (min.)
3. $\to$ Hyper-V-Manager: **Server01** (doppelklick)
   - **Setup**: Windows Server 2022 installieren
     - Version: Standard, Desktop
     - Name: `administrator` key: 
4. $\to$ Hyper-V-Manager: **LAP** / (re. Mausklick) 
   - $\to$ **Neu / Virtueller Computer erstellen**
     - Name und Pfad angeben:  `Server02`
     - Generation angeben: `Generation 2`
     - Speicher zuweisen: `4096` RAM
     - Netzwerk konfigurieren: Verbindung: `kurs` (Virtueller Netzwerkswitch)
     - Installationsoptionen: ISO: `Windows Server 2022.iso` auswählen
   - $\to$ Virtueller Computer: **Server01** / (re. Mausklick)  Einstellungen
     - Prüfpunkte deaktivieren
     - CPU: `2 Kerne` (min.)
5. $\to$ Hyper-V-Manager: **Server02** (doppelklick)
   - **Setup**: Windows Server 2022 installieren
     - Version: Standard, Desktop
     - Name: `administrator` key: 
6. $\to$ Hyper-V-Manager: **LAP** / (re. Mausklick) 
   - $\to$ **Neu / Virtueller Computer erstellen**
     - Name und Pfad angeben:  `Client01`
     - Generation angeben: `Generation 2`
     - Speicher zuweisen: `4096` RAM
     - Netzwerk konfigurieren: Verbindung: `kurs` (Virtueller Netzwerkswitch)
     - Installationsoptionen: ISO: `Windows 10 Enterprise.iso` auswählen
   - $\to$ Virtueller Computer: **Client01** / (re. Mausklick)  Einstellungen
     - Prüfpunkte deaktivieren
     - CPU: `2 Kerne` (min.)
7. $\to$ Hyper-V-Manager: **Client01** (doppelklick)
   - **Setup**: Windows 10 Enterprise installieren
     - Netzwerk: kein Internet Auswahl
     - kein Microsoft Konto verbinden: Weiter mit eingeschränktem Setup
     - Name: `admin` key: 
     - Windows anmelden
   - **Problem**: Windows-Lizenz ist abgelaufen
   - $\to$ Hyper-V-Manager: Client01 / (re. Mausklick)  Einstellungen
     - Netzwerkkarte: virtueller Switch: `Default-Switch` Auswahl
   - Hyper-V-Manager: **Client01** (doppelklick)
   - **Windows aktivieren**: Netzwerk / Internet / Neustart
   - Kontrolle: Windows Lizenz **90 Tage gültig**
   - $\to$ Hyper-V-Manager: Client01 / (re. Mausklick)  Einstellungen
     - Netzwerkkarte: virtueller Switch: `kurs` wieder umstellen

## Grundkonfiguration Server01 - Server02 - Client01

1. Hyper-V-Manager: **Server01** (doppelklick) **Anmeldung** user: `administrator` key:
   - Server-Manager / Local Server
   - $\to$ **Computer name**: `Server01` 
   - Neustart
   - Server Manager / Local Server
   - **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll
     - IP address: `192.168.0.1` Subnet mask: `255.255.255.0`
   - Test in Powershell: `ipconfig`
2. Hyper-V-Manager: **Server02** (doppelklick) **Anmeldung** user: `administrator` key:
   - Server-Manager / Local Server
   - $\to$ **Computer name**: `Server02` 
   - Neustart
   - Server Manager / Local Server
   - **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll
     - IP address: `192.168.0.2` Subnet mask: `255.255.255.0`
   - Test in Powershell: `ipconfig`
3. Hyper-V-Manager: **Client01** (doppelklick) **Anmeldung** user: `admin` key:
   - Suche: `pc-infos` $\to$ Diesen PC umbenennen (fortgeschritten): Ändern
     - $\to$ **Computer name**: `Client01` 
   - Neustart
   - **Netzwerk und Interneteinstellungen** / Adapteroptionen ändern / 
   - **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll
     - IP address: `192.168.0.100` Subnet mask: `255.255.255.0`
   - Test in Powershell: `ipconfig`


$\to$ Hyper-V-Manager: Je **Server01**, **Server02** und **Client01** (doppelklick) **Anmeldung** user: `administrator` bzw. `admin` (Client01) key:

- Suche: **Firewall** $\to$ Windows Defender Firewall mit erweiterter Sicherheit
  - Eingehende Regeln: 
    - Datei- und Druckerfreigabe Echoanforderung ip4 und ip6 (**2x Regeln aktivieren**)

Suche: **Powershell**

```Bash
# Test in Powershell
ping 192.168.0.1
ping 192.168.0.2
ping 192.168.0.100
ipconfig /all
hostname 
winver
netstat -a -p TCP
```

## Windows Server

$\to$ Hyper-V-Manager: **Server01** (doppelklick) **Anmeldung** user: `administrator` key:

1. **Server-Manager**/ 
   - Local Server/ $\to$ z. B. Zeitzone: Berlin
   - Dashboard
   - Verwalten
   - Tools
2. **Windows Admin Center** 
   - Download Windows Admin Center [^5] vom $\to$ Host (Internet)
   - kopieren nach $\to$ Server01 und installieren
   - **Browser** öffnen und <https://server01> eingeben
  
[^5]:<https://www.microsoft.com/de-de/windows-server/windows-admin-center> 

## Rollen und Features installieren

$\to$ Hyper-V-Manager: **Server02** (doppelklick) **Anmeldung** user: `administrator` key:

1. Server-Manager / Dashboard
   1. **Rollen und Features hinzufügen**
   2. 3 x Weiter bis Serverrollen $\to$ **Web-Server** wählen
   3. Weiter klicken bis zur Bestätigung $\to$ Installieren
   4. **Browser** öffnen und <http://localhost> eingeben 

## Active Directory Domänendienste 

$\to$ Hyper-V-Manager: **Server01** (doppelklick) **Anmeldung** user: `administrator` key:

1. Server-Manager / Lokaler Server / Verwalten
   1. **Rollen und Features hinzufügen**
   2. 3 x Weiter bis Serverrollen $\to$ **Active Directory Doman Services** wählen
   3. Weiter klicken bis zur Bestätigung $\to$ Installieren
2. Server-Manager / Dashboard / Benachrichtigungen
   1. **Server zu einem Domain-Controller hochstufen**
   2. Neue Gesamtstruktur hinzufügen: Domänenname `pagr.inet`
   3. key: 
   4. 4 x Weiter klicken bis zur Bestätigung $\to$ Installieren
   5. Neustart
   6. Anmeldung (**Server01**)

$\to$ Hyper-V-Manager: **Server02** (doppelklick) **Anmeldung** user: `administrator` key: 

**Server Manager / Local Server**

1. **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll
   - DNS-Server: `192.168.0.1` (**Server01**)    
2. **Computername**: $\to$ Domäne: `pagr.inet` 
   - Domäne beitreten: user und key von (**Server01**)
   - Neustart
   - **Anmeldung** user: `pagr\administrator` key: von (**Server01**)
   - Test in Powershell: `Test-ComputerSecureChannel -Verbose` (True)

$\to$ Hyper-V-Manager: **Client01** (doppelklick) **Anmeldung** user: `admin` key: 

1. **Netzwerk und Interneteinstellungen** / Adapteroptionen ändern /
   - **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll /
       - DNS-Server: `192.168.0.1` (**Server01**)
   - Test in Powershell: `ping pagr.inet` 
2. **Domänen beitritt**
   - Suche: `pc-infos` $\to$ Diesen PC umbenennen (fortgeschritten): *Ändern*
       - $\to$ Domäne: `pagr.inet`  
       - Domäne beitreten: user und key von (**Server01**)
   - Neustart
   - **Anmeldung** user: `pagr\administrator` key: von (**Server01**)

## Active Directory - Benutzer Computer Gruppen und Richtlinien

$\to$ Hyper-V-Manager: **Server01** (doppelklick) **Anmeldung** user: `administrator` key: 

Server-Manager / Dashboard / **Tools** / $\to$ Active Directory - Benutzer und Computer / Ansicht / Erweiterte Features

1. **Benutzer erstellen** 
   - `pagr.inet` (re. Mausklick) Neu / Organisationseinheit: **HR** erstellen
   - **HR**: (re. Mausklick) Neu / User
     - Name: `Franz Bizeps`
     - Benutzeranmeldenname: f.bizeps@pagr.inet
     - Passwort muss nach der ersten Anmeldung geändert werden!
   - $\to$ Hyper-V-Manager: **Client01** (doppelklick)
   - **Anmeldung** user: `pagr\administrator` key: von (**Server01**)
   - Suche: `lusrmgr.msc` (Lokale Benutzer und Gruppen)
     - Gruppen / Remotedesktopbenutzer: Objektnamen: `Franz Bizeps` (Namen überprüfen)
   - Abmelden
   - **Anmeldung** user: `f.bizeps` key:
   - Test in Powershell: 
     - `Test-ComputerSecureChannel`  (True)
     - `$env:logonserver` (\\server01)
2. **Benutzer konfigurieren** 
   - $\to$ Hyper-V-Manager: **Server01** (doppelklick) 
   - **Anmeldung** user: `administrator` key: 
   - Server-Manager / Dashboard / **Tools** / 
     - $\to$ Active Directory - Benutzer und Computer / Ansicht / Erweiterte Features
   - `pagr.inet` 
   - **HR** / **Franz Bizeps** (re. Mausklick) Eigenschaften
3. **Computerkonten** 
   - `pagr.inet` (re. Mausklick) Neu / Organisationseinheit: **Windows Server** erstellen
   - `pagr.inet` (re. Mausklick) Neu / Organisationseinheit: **Windows Clients** erstellen
   - **Computers** / Client01 $\to$ **Windows Clients** verschieben
   - **Computers** / Server02 $\to$ **Windows Server** verschieben
4. **Gruppen erstellen und konfigurieren** 
   - `pagr.inet` (re. Mausklick) Neu / Organisationseinheit: **Gruppen** erstellen
   - **Gruppen** (re. Mausklick) Neu / Gruppe  
     - Gruppenname: HR
   - **HR** / **Franz Bizeps** (re. Mausklick) Eigenschaften
     - Mitglied von: Hinzufügen / Objektnamen: `HR` (Namen überprüfen)
5. einfache Gruppenrichtlinien erstellen


## Netzwerkdienste mit Windows Server bereitstellen

$\to$ Hyper-V-Manager: **Server01** (doppelklick) **Anmeldung** user: `administrator` key: 

Server-Manager / Dashboard / **Tools** / $\to$ DNS

1. **DNS in Active Directory**
   - Server01 / Forward-Lookupzonen 
   - `pagr.inet` (re. Mausklick) $\to$ Neuer Host
     - `printer` und `192.168.0.200`
   - `pagr.inet` (re. Mausklick) $\to$ Neuer Alias
     - `drucker` und `printer.pagr.inet`
   - Test in Powershell: `nslookup`
     - `> drucker` (sollte auf printer.pagr.inet zeigen, Address: 192.168.0.200)
     - `> exit`
2. DNS auf Server02 manuell einrichten und Zonentransfer durchführen (Ergänzen)
3. **DHCP-Server Rolle auf Server02 installieren und konfigurieren**
   - $\to$ Hyper-V-Manager: **Server02** (doppelklick) 
   - **Anmeldung** user: `pagr\administrator` key:
   - Server-Manager / Dashboard
     1. **Rollen und Features hinzufügen**
     2. 3 x Weiter bis Serverrollen  $\to$ **DHCP** wählen
     3. Weiter klicken bis zur Bestätigung $\to$ Installieren
   - Neustart
   - Server-Manager / Dashboard / **Benachrichtigungen** 
     - $\to$ DHCP-Server Konfiguration abschließen
   - Server-Manager / Dashboard / **Tools** / $\to$ DHCP
   - IPv4 (re. Mausklick) $\to$  Neuer Bereich erstellen
     - Name: `Clients`
     - Start IP-address: 192.168.0.100 End IP-address: 192.168.0.200
     - weiter bis Abschluß
   - Hyper-V-Manager: **Client01** (doppelklick) 
   - **Anmeldung** user: `pagr\administrator` key:
   - **Netzwerk und Interneteinstellungen** / Adapteroptionen ändern / 
     - **Ethernet**: $\to$ Netzwerkkarte (rechte Mausklick) / Eigenschaften / Internetprotokoll
     - IP-Adresse automatisch beziehen
     - DNS-Serveradresse automatisch beziehen
   - Test in Powershell: `ipconfig -all` (Range: 192.168.0.100 - 192.168.0.200)
4. **Server02 als File-Server einsetzen**
    - $\to$ Hyper-V-Manager: **Server02** (doppelklick) 
    - **Anmeldung** user: `pagr\administrator` key:
    - Server-Manager / Dashboard
      1. **Rollen und Features hinzufügen**
      2. 3 x Weiter bis Serverrollen 
      3. $\to$ Datei- und Speicherdienste / Dateiserver und Dateiserver Resource Manager für Dateiserver wählen
      4. Weiter klicken bis zur Bestätigung $\to$ Installieren
    - **Ordner erstellen** `c:\Daten` 
    - **Ordner freigeben** `Daten` (re. Mausklick) / Eigenschaften / Freigabe / Erweitere Freigabe
      - Diesen Ordner freigeben
      - Berechtigungen / Vollzugriff
    - Test: Suche: `\\server02\Daten`
    - Suche: Gruppenrichtlinienverwaltung (Ergänzen)
    - $\to$ Hyper-V-Manager: **Client01** (doppelklick) 
    - **Anmeldung** user: `f.bizeps` key:
    - Windows Explorer öffnen / Netzwerklaufwerk prüfen `x:\\server02\daten`
5. Server02 als Druck-Server einrichten (Ergänzen)

## Windows Server Sicherheit

1. **Windows Server Backup auf Server02 installieren**
   - $\to$ Hyper-V-Manager: **Server02** (doppelklick) 
   - **Anmeldung** user: `pagr\administrator` key:
   - Server-Manager / Dashboard
     1. **Rollen und Features hinzufügen**
     2. 4 x Weiter bis Features $\to$ **Windows Server-Sicherung** wählen
     3. Weiter klicken bis zur Bestätigung $\to$ Installieren
   - $\to$ Hyper-V-Manager: **Server01** (doppelklick) 
   - **Anmeldung** user: `administrator` key: 
   - **Ordner erstellen** `c:\Backup` 
   - **Ordner freigeben** `Backup` (re. Mausklick) / Eigenschaften / Freigabe / Erweitere Freigabe
     - Diesen Ordner freigeben
     - Berechtigungen / Vollzugriff
   - Test: Suche: `\\server02\Daten`
2. **Einen Ordner von Server02 auf Server01 sichern**
   - $\to$ Hyper-V-Manager: **Server02** (doppelklick) 
   - **Anmeldung** user: `pagr\administrator` key:
   - Server-Manager / Dashboard / Tools
   - **Windows Server-Sicherung** / $\to$ Assistent Sicherungszeitplan
     - Benutzerdefiniert
     - Elemente auswählen: `Daten` (Ordner)
     - Sicherungszeit: `21:00`, `Einmal pro Tag`
     - Sicherung auf einem freigegeben Netzwerkordner erstellen
     - Pfad: `\\server01\Backup`
     - **Berechtigung für das planen der Sicherung** user: `pagr\administrator` key: 
   - Suche: Aufgabenplanung (Ergänzen)
3. **Windows Updates manuell ausführen**
   - $\to$ Hyper-V-Manager: **LAP** / (re. Mausklick) 
     - $\to$ **Manager für virtuelle Switches**
     - Virtuellen Switch `kurs` / **Intern** umstellen $\to$ **Externes Netzwerk** (Internet)
