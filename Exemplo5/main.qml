import QtQuick 2.13
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.13


ApplicationWindow {
    visible: true
    width: 500
    height: 500

    ListView {
        id: list
        property int rows: 6

        anchors {
            fill:parent
            margins: 5
        }
        boundsBehavior: Flickable.StopAtBounds
        spacing: 5

        model: manager.champions
        delegate: Rectangle {
            width: list.width; height: list.height/list.rows
            color: '#999'; radius: 6
            border { color: Qt.darker(color); width:3 }

            ColumnLayout {
                height: parent.height; width: parent.width*0.33
                anchors.centerIn: parent
                Item { Layout.fillHeight: true; Layout.fillWidth: true; }
                Label {
                    Layout.fillHeight: true; Layout.fillWidth: true;
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter

                    font { bold: true; pixelSize: 30 }

                    text: manager.get(index).name
                }
                Label {
                    Layout.fillHeight: true; Layout.fillWidth: true;
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter

                    font { bold: false; pixelSize: 20 }

                    text: manager.get(index).champion_class
                }
                Item { Layout.fillHeight: true; Layout.fillWidth: true; }
            }
        }
    }
}