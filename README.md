# FreeESPA 4.4.4

[![Windows](https://img.shields.io/badge/platform-Windows-0078D4)](https://www.microsoft.com/windows)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-5391FE)](https://learn.microsoft.com/powershell/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Eigenständiger ESPA-4.4.4-Monitor für Windows. Der lokale Server und der Schnittstellenzugriff laufen in Windows PowerShell. Python, zusätzliche Module, separate .NET-Installationen und Administratorrechte sind nicht vorgesehen.

> **Projektstatus:** frühe Entwicklungsfassung. COM/TCP-Verbindung, Anzeige der empfangenen Bytes und manuelles Senden von Rohbytes sind vorhanden. Automatische Leitstellen-/Gegenstellenemulation und formularbasierter ESPA-Meldungsversand sind noch nicht fertig.

## Schnellstart

1. Repository als ZIP herunterladen und entpacken.
2. `Start-FreeESPA.bat` doppelklicken.
3. Die Oberfläche öffnet sich im Browser unter [http://127.0.0.1:8765](http://127.0.0.1:8765).
4. Transport und Verbindung einstellen, dann **Verbinden** anklicken.
5. Zum Beenden das PowerShell-Fenster schließen.

Wenn Windows beim ersten Start nachfragt, **Trotzdem ausführen** wählen. Das Startskript verwendet `-ExecutionPolicy Bypass` nur für diesen Prozess; es ändert keine systemweite Richtlinie.

## Funktionen

- Windows-COM-Ports über `System.IO.Ports.SerialPort`
- Serielle Baudrate, Datenbits, Parität und Stoppbits
- TCP-Client und TCP-Server
- Empfangsanzeige mit Zeit, Richtung, Telegrammtyp und Hexbytes
- ESPA-Grundrahmen aus SOH, Header, STX, Datensätzen, ETX und BCC
- Erkennung von Polling, ACK, NAK und EOT
- Manuelles Senden von Rohbytes in Hex
- Ereignisverlauf mit bis zu 500 Einträgen und Zähler für RX/TX

## Sicherheit und Netzwerk

Der Webserver bindet ausschließlich an `127.0.0.1` und ist nur auf diesem Rechner erreichbar. Für TCP-ESPA bindet der Server an die in der Oberfläche eingetragene Adresse. Wähle `127.0.0.1`, wenn die Gegenstelle lokal läuft; eine LAN-Adresse macht den rohen TCP-Port im lokalen Netz erreichbar.

Die serielle oder TCP-Verbindung wird erst nach Klick auf **Verbinden** geöffnet. Vor dem Senden von Rohbytes müssen Protokollrolle, Gegenstelle und Bytes bekannt sein.

## Dateien

| Datei | Zweck |
| --- | --- |
| `Start-FreeESPA.bat` | Startet die mit Windows ausgelieferte PowerShell ohne Richtlinienänderung. |
| `FreeESPA.ps1` | Lokaler HTTP-Server, ESPA-Empfang und COM/TCP-Verbindungen. |
| `index.html` | Browseroberfläche. |
| `icon.svg` | Favicon. |
| `LICENSE` | MIT-Lizenz. |

## Voraussetzungen

Windows mit Windows PowerShell 5.1 oder neuer und .NET Framework, wie es in unterstützten Windows-Versionen enthalten ist. Es werden keine Pakete installiert. Der Monitor verwendet einen freien lokalen HTTP-Port (Standard 8765) und benötigt dafür normalerweise keine Administratorrechte.

## Bekannte Grenzen

- Die ESPA-BCC-Prüfung und Anzeige werden schrittweise erweitert; zunächst wird die 7-Bit-XOR-Prüfung angezeigt.
- Der automatische Polling-/Auswahlablauf für Leitstelle oder Pager-Gegenstelle fehlt noch.
- Der Testmeldungseditor und die automatische Queue fehlen noch; derzeit ist nur manueller Hexversand vorgesehen.
- In dieser Entwicklungsumgebung ist kein Windows-PC mit COM-Adapter verfügbar. Die PowerShell-Oberfläche und echte serielle Hardware müssen auf Windows erprobt werden.

## Entwicklung

Änderungen an `FreeESPA.ps1` und `index.html` bleiben ohne zusätzliche Abhängigkeiten. Bitte zuerst mit einer lokalen TCP-Gegenstelle oder einem virtuellen COM-Port prüfen. Sende keine Testbytes an angeschlossene Ruf- oder Alarmtechnik, bevor deren Wirkung geklärt ist.

## Lizenz

MIT. Siehe [LICENSE](LICENSE).
