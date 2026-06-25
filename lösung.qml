import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 680
    title: "🍪 Cookie Clicker"

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#1a0a00"

        property int cookies: 0
        property int cookiesPerClick: 1
        property int cookiesPerSecond: 0
        property int grandmaCount: 0
        property int farmCount: 0

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                root.cookies += root.cookiesPerSecond
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 30
            width: parent.width - 40
            spacing: 16

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🍪 " + root.cookies + " Kekse"
                color: "#f5c842"
                font.pixelSize: 36
                font.bold: true
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "+" + root.cookiesPerSecond +
                      " pro Sekunde | +" +
                      root.cookiesPerClick +
                      " pro Klick"
                color: "#c8a060"
                font.pixelSize: 14
            }

            Rectangle {
                id: cookieButton

                anchors.horizontalCenter: parent.horizontalCenter

                width: 160
                height: 160
                radius: 80

                color: "#c8620a"

                Rectangle {
                    anchors.fill: parent
                    radius: parent.radius
                    color: "#7a3a04"
                    y: 6
                    z: -1
                }

                Text {
                    anchors.centerIn: parent
                    text: "🍪"
                    font.pixelSize: 72
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        root.cookies += root.cookiesPerClick
                    }

                    onPressed: cookieButton.y += 4
                    onReleased: cookieButton.y -= 4
                    onCanceled: cookieButton.y -= 4
                }
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "#3a2010"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🛒 Shop"
                color: "#f5c842"
                font.pixelSize: 20
                font.bold: true
            }

            // ===== Besserer Finger =====

            Rectangle {
                width: parent.width
                height: 64
                radius: 10

                color: "#2d1505"
                border.color: "#6b3a10"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text {
                        text: "👆"
                        font.pixelSize: 28
                        Layout.alignment: Qt.AlignVCenter
                    }

                    Column {
                        spacing: 2
                        Layout.alignment: Qt.AlignVCenter

                        Text {
                            text: "Besserer Finger"
                            color: "#f0d080"
                            font.pixelSize: 14
                            font.bold: true
                        }

                        Text {
                            text: "+1 Keks / Klick – Kosten: 50 🍪"
                            color: "#a08040"
                            font.pixelSize: 11
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (root.cookies >= 50) {
                            root.cookies -= 50
                            root.cookiesPerClick += 1
                        }
                    }
                }
            }

            // ===== Oma =====

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
                        text: "👵"
                        font.pixelSize: 28
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2

                        Text {
                            text: "Oma [" + root.grandmaCount + "]"
                            color: "#f0d080"
                            font.pixelSize: 14
                            font.bold: true
                        }

                        Text {
                            text: "+1 Keks / Sek – Kosten: 100 🍪"
                            color: "#a08040"
                            font.pixelSize: 11
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (root.cookies >= 100) {
                            root.cookies -= 100
                            root.grandmaCount += 1
                            root.cookiesPerSecond += 1
                        }
                    }
                }
            }

            // ===== Farm =====

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
                        text: "🌾"
                        font.pixelSize: 28
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 2

                        Text {
                            text: "Farm [" + root.farmCount + "]"
                            color: "#f0d080"
                            font.pixelSize: 14
                            font.bold: true
                        }

                        Text {
                            text: "+5 Kekse / Sek – Kosten: 500 🍪"
                            color: "#a08040"
                            font.pixelSize: 11
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (root.cookies >= 500) {
                            root.cookies -= 500
                            root.farmCount += 1
                            root.cookiesPerSecond += 5
                        }
                    }
                }
            }

            // ===== Reset =====

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
                        root.cookies = 0
                        root.cookiesPerClick = 1
                        root.cookiesPerSecond = 0
                        root.grandmaCount = 0
                        root.farmCount = 0
                    }
                }
            }
        }
    }
}
