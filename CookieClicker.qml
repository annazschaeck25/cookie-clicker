// ============================================================
//  🍪 Cookie Clicker – QML Lückentext-Übung
//  Fülle die markierten Lücken (___) anhand der Kommentare aus!
//  Starte das Programm mit: qml CookieClicker.qml
// ============================================================

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

// Aufgabe 1: Erstelle das Hauptfenster mit Breite 480 und Höhe 680.
//            Gib ihm den Titel "🍪 Cookie Clicker"
___ {
    width: ___
    height: ___
    title: "___"
    visible: true

    // ── Hintergrund ──────────────────────────────────────────
    Rectangle {
        anchors.fill: parent

        // Aufgabe 2: Setze die Hintergrundfarbe auf "#1a0a00" (Dunkelbraun)
        color: "___"

        // ── Eigenschaften (Spielzustand) ──────────────────────
        // Aufgabe 3: Deklariere eine int-Eigenschaft namens "cookies" mit Startwert 0
        property ___ cookies: ___

        // Aufgabe 4: Deklariere eine int-Eigenschaft "cookiesPerClick" mit Startwert 1
        property int ___: ___

        // Aufgabe 5: Deklariere eine int-Eigenschaft "cookiesPerSecond" mit Startwert 0
        property int cookiesPerSecond: ___

        // Aufgabe 6: Deklariere eine int-Eigenschaft "grandmaCount" mit Startwert 0
        property int ___: 0

        // Aufgabe 7: Deklariere eine int-Eigenschaft "farmCount" mit Startwert 0
        property int farmCount: ___

        // ── Passives Einkommen: Timer ─────────────────────────
        // Aufgabe 8: Erstelle einen Timer mit einem Intervall von 1000 ms,
        //            der wiederholt läuft (running & repeat = true)
        Timer {
            interval: ___
            running: ___
            repeat: ___

            // Aufgabe 9: Im onTriggered-Handler: addiere cookiesPerSecond zu cookies
            onTriggered: {
                parent.___ += parent.___
            }
        }

        // ── Inhalt (vertikal zentriert) ───────────────────────
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 30
            spacing: 16
            width: parent.width - 40

            // ── Cookie-Zähler ─────────────────────────────────
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🍪 " + parent.parent.cookies + " Kekse"
                font.pixelSize: 36
                font.bold: true

                // Aufgabe 10: Setze die Textfarbe auf "#f5c842" (Goldgelb)
                color: "___"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "+" + parent.parent.cookiesPerSecond + " pro Sekunde  |  +" +
                      parent.parent.cookiesPerClick + " pro Klick"
                font.pixelSize: 14
                color: "#c8a060"
            }

            // ── Großer Klick-Keks ─────────────────────────────
            // Aufgabe 11: Erstelle ein Rectangle als Keks-Button.
            //             Breite und Höhe: 160, Radius: 80 (= Kreis),
            //             Farbe: "#c8620a"
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: ___
                height: ___
                radius: ___
                color: "___"

                // Aufgabe 12: Füge einen leichten Schatten-Effekt hinzu:
                //             Erstelle ein zweites Rectangle direkt darunter
                //             (width/height 160, radius 80, color "#7a3a04")
                //             und positioniere es mit einem y-Offset von 6.
                Rectangle {
                    width: ___
                    height: ___
                    radius: ___
                    color: "___"
                    y: ___
                    z: -1
                }

                Text {
                    anchors.centerIn: parent
                    text: "🍪"
                    font.pixelSize: 72
                }

                // Aufgabe 13: Erstelle einen MouseArea, der die gesamte Fläche
                //             des Kreises abdeckt (anchors.fill: parent)
                ___ {
                    anchors.fill: ___

                    // Aufgabe 14: Beim Klick soll cookiesPerClick zu cookies addiert werden
                    onClicked: {
                        parent.parent.parent.parent.___ += parent.parent.parent.parent.___
                    }

                    // Aufgabe 15: Beim Drücken soll der Keks leicht nach unten rutschen.
                    //             Setze parent.y auf 4, wenn pressed true ist, sonst auf 0.
                    onPressedChanged: {
                        parent.y = pressed ? ___ : ___
                    }
                }
            }

            // ── Trennlinie ────────────────────────────────────
            Rectangle {
                width: parent.width
                height: 1
                color: "#3a2010"
            }

            // ── Shop-Überschrift ──────────────────────────────
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🛒 Shop"
                font.pixelSize: 20
                font.bold: true
                color: "#f5c842"
            }

            // ── Shop: Klick-Upgrade ───────────────────────────
            Rectangle {
                width: parent.width
                height: 64
                radius: 10
                color: "#2d1505"
                border.color: "#6b3a10"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text { 
                        text: "👆"
                        font.pixelSize: 28
                        anchors.verticalCenter: parent.verticalCenter 
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2

                        Text { 
                            text: "Besserer Finger"
                            color: "#f0d080"
                            font.pixelSize: 14
                            font.bold: true 
                        }

                        Text { 
                            text: "+1 Keks / Klick  –  Kosten: 50 🍪"
                            color: "#a08040"
                            font.pixelSize: 11 
                        }
                    }
                }

                // Aufgabe 16: Füge eine MouseArea hinzu.
                //             Beim Klick: prüfe ob cookies >= 50.
                //             Falls ja: ziehe 50 von cookies ab und
                //             erhöhe cookiesPerClick um 1.
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var root = parent.parent.parent.parent
                        if (root.___ >= 50) {
                            root.cookies -= ___
                            root.___ += 1
                        }
                    }
                }
            }

            // ── Shop: Oma ─────────────────────────────────────
            Rectangle {
                width: parent.width
                height: 64
                radius: 10
                color: "#2d1505"
                border.color: "#6b3a10"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text { text: "👵"; font.pixelSize: 28; anchors.verticalCenter: parent.verticalCenter }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2

                        // Aufgabe 17: Zeige den aktuellen grandmaCount in eckigen Klammern
                        //             hinter "Oma" an, z. B. "Oma [2]"
                        Text {
                            text: "Oma [" + ___ + "]"
                            color: "#f0d080"; font.pixelSize: 14; font.bold: true
                        }
                        Text { text: "+1 Keks / Sek  –  Kosten: 100 🍪"; color: "#a08040"; font.pixelSize: 11 }
                    }
                }

                // Aufgabe 18: MouseArea für den Kauf der Oma.
                //             Preis: 100 Kekse.
                //             Beim Kauf: cookies -= 100, grandmaCount += 1,
                //             cookiesPerSecond += 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var root = parent.parent.parent.parent
                        if (root.cookies >= ___) {
                            root.___ -= 100
                            root.grandmaCount += ___
                            root.___ += 1
                        }
                    }
                }
            }

            // ── Shop: Farm ────────────────────────────────────
            Rectangle {
                width: parent.width
                height: 64
                radius: 10
                color: "#2d1505"
                border.color: "#6b3a10"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text { text: "🌾"; font.pixelSize: 28; anchors.verticalCenter: parent.verticalCenter }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2
                        Text {
                            text: "Farm [" + parent.parent.parent.parent.parent.parent.farmCount + "]"
                            color: "#f0d080"; font.pixelSize: 14; font.bold: true
                        }
                        Text { text: "+5 Kekse / Sek  –  Kosten: 500 🍪"; color: "#a08040"; font.pixelSize: 11 }
                    }
                }

                // Aufgabe 19: MouseArea für die Farm.
                //             Preis: 500 Kekse.
                //             Beim Kauf: cookies -= 500, farmCount += 1,
                //             cookiesPerSecond += 5
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var root = parent.parent.parent.parent
                        if (root.cookies >= ___) {
                            root.cookies -= ___
                            root.___ += 1
                            root.cookiesPerSecond += ___
                        }
                    }
                }
            }

            // ── Reset-Button ──────────────────────────────────
            // Aufgabe 20: Erstelle einen Button mit dem Text "🔄 Neustart".
            //             Beim Klick sollen alle Eigenschaften zurückgesetzt werden:
            //             cookies=0, cookiesPerClick=1, cookiesPerSecond=0,
            //             grandmaCount=0, farmCount=0
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 160
                height: 40
                radius: 8
                color: "#4a1a00"
                border.color: "#8b3a10"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: "🔄 Neustart"
                    color: "#f0a060"
                    font.pixelSize: 14
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var root = parent.parent.parent.parent
                        // Aufgabe 20 – setze hier alle Werte zurück:
                        root.___ = 0
                        root.___ = 1
                        root.___ = 0
                        root.___ = 0
                        root.___ = 0
                    }
                }
            }

        } // Ende Column
    } // Ende Rectangle (Hintergrund)
} // Ende ApplicationWindow
