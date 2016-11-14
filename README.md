# mta-vdayz
MTA - vDayZ [OPEN SOURCE]


Das vDayZ-Projekt ist ein OPEN SOURCE script!
Nach der zeit wird das script weiterentwickelt.

ansonsten viel spaß damit euer Kopfkrank :)

MTA:DayZ - Version 1.0 | Edit by Kopfkrank

Vielen Dank für das Herunterladen von "MTA: DayZ", ein gamemode ähnlich wie DayZ von "Rocket" Hall, wo Ihr Hauptziel
Ist, die postapokalyptische Welt von San Andreas zu überleben, indem sie für Nahrung aufräumt, vermeidet oder verteidigt
Zombies und andere, möglicherweise feindliche Spieler.
Mit den Dateien enthalten ist dieser Gamemode, sind Sie in der Lage und berechtigt, Ihre eigene Version von Host
"MTA: DayZ". Bevor Sie beginnen können, gibt es ein paar Dinge, die Sie tun müssen und im Auge behalten, um voll zu maximieren
Ihre und andere Spieler Erfahrungen, die im folgenden Text ausgearbeitet werden soll:


[[ ----- ANFORDERUNGEN ----- ]]
Bevor Sie mit der Installation beginnen, stellen Sie bitte sicher:
    - Minimum MTA server version is 1.3.4 (Aktuelle MTA-Serverdateien finden Sie hier: http://nightly.mtasa.com/)
    - Minimum MTA client version is 1.3.4

[[ ----- FOLDER: installation ----- ]]
Der Ordner "Installation" enthält eine Datei mit dem Namen "internal.db". Es ist notwendig, um sicherzustellen, dass Zelte, Fahrzeuge und Benutzerdaten richtig gespeichert werden. Verschieben Sie diese Datei auf diesen Pfad: ...\server\mods\deathmatch
Wenn Ihr Betriebssystem (oder das Bedienfeld des Servers) Sie fragt, ob Sie das alte ersetzen möchten internal.db Drücken Sie "Ja".


[[ ----- ACL ----- ]]
Damit die Ressourcen die notwendigen Daten (Fahrzeuge, Zelte und Benutzerdaten) speichern können, müssen Sie Administratorrechte für die jeweiligen Ressourcen angeben. Öffnen Sie Ihre ACL.xml, navigieren Sie zu der Gruppe "Admin" und kopieren und fügen Sie diese:

<object name="resource.DayZ"></object>
<object name="resource.login"></object>
<object name="resource.slothbot"></object>

Wenn Sie der Server-Besitzer sind, müssen Sie sich selbst als Admin hinzufügen. Wenn Sie dies nicht bereits getan haben, kopieren und fügen Sie diese nach <object name="resources.slothbot"></object>:

<object name="user.X"></object>

X ist der Name, mit dem Sie sich bei der Eingabe des Servers anmelden.


[[ ----- FOLDER: resources ----- ]]
Der Ordner "Ressourcen" enthält alle Dateien, die zum Abspielen von "MTA: DayZ" erforderlich sind. Wenn Sie also die Datei in die falsche Richtung setzen oder sie verändern, können Sie den Gamemodus unbrauchbar machen.
Um dies zu vermeiden, verschieben Sie den Ordner [DayZ-MTA] to this path: ...\server\mods\deathmatch\resources

    <!-- Gibt die Ressourcen an, die geladen werden, wenn der Server startet und / oder vor dem Stoppen geschützt sind. Um mehrere Ressourcen anzugeben, fügen Sie mehr <resource> Parameter(s). -->

                <resource src="DayZ" startup="1" protected="0"></resource>
                <resource src="login" startup="1" protected="0"></resource>
                <resource src="slothbot" startup="1" protected="0"></resource>

Entfernen Sie die letzte Zeile der Konfigurationsdatei, um Konflikte mit dem Gamemode zu verhindern.

Für Server, die öffentlich zugänglich sind: Aufgrund der Verschlüsselung von .lua_dayz Dateien, die auf besondere Weise verschlüsselt werden, müssen Ihre Spieler eine MTA Client Version von 1.3.4 oder höher haben.
Um sicherzustellen, dass nur Spieler mit einer solchen Version an Ihrem Server teilnehmen können, suchen Sie nach der folgenden Zeile:
	
    <minclientversion></minclientversion>
    
Und mit ersetzen:

    <minclientversion>1.5.2</minclientversion>


[[ ----- GENERAL INFO ----- ]]
Sie dürfen kein Fahrzeug über das Admin-Panel erstellen, da diese Aktion die Datenbank (internal.db) zerstört und alle Daten dadurch verloren gehen.

Beim ersten Start des Gamemodes müssen Sie sich selbst als Administrator des Gamemodes hinzufügen. Dies kann erreicht werden, indem Sie den Server eingeben und diesen in das Chat-Feld eingeben:
/add admin <name>
<name> = Nennen Sie die Person erscheint mit - ändern Sie es, wenn es zu kompliziert zu schreiben oder ein Fehler verhindert, dass Sie sich selbst oder einen Spieler als Admin.
Unterstützer können hinzugefügt werden, indem Sie diese in das Chat-Feld eingeben:
/add supporter <name>
<name> = Nennen Sie die Person erscheint mit - ändern Sie es, wenn es zu kompliziert ist, um zu schreiben oder ein Fehler verhindert, dass Sie sich selbst oder einen Spieler als Anhänger.
Wenn Sie einen Admin oder Supporter entfernen möchten, geben Sie diesen in das Chat-Feld ein:
/add remove <name>
<name> = Name the person appears with - change it if it's too complicated to write or an error prevents you from removing yourself or a player as a supporter.

Weitere Befehle sind:
/kickall -> Tritt alle Spieler
/pmsg <text> > Globale Nachricht, kann von jedem Spieler gesehen werden
/givevip <accountname> <amount> > Fügt der Gruppe des in <account name> angegebenen Players Gruppenlöcher hinzu

Items respawn every 4 hours - keep in mind that this process will result in major lag, to the point where most players will be kicked due to timing out or a temporary shutdown of the server.
Ab dem neusten Update können Server-Besitzer die Zeit für einen Respawn bearbeiten. Öffnen Sie den Editor _server.lua und überprüfen Sie die Spielvariablen Variablen [ "Item Respawn Timer"].
[[ ----- SUPPORT ----- ]]
Support can only be provided in the official forum: http://mtadayz.net/
Geschäftsanfragen, Fragen, Anregungen und dergleichen sind nur im of

