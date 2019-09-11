import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.13

ApplicationWindow {
    visible: true
    width:500
    height:500

    Material.theme: Material.Dark

    Column {
        anchors.fill: parent

        Rectangle {
            width: parent.width
            height: parent.height*0.3

            color: "#000"
        }

        Item {
            width: parent.width
            height: parent.height*0.7

            GridView {
                id: buttonsGrid
                property int cols: 4
                property int rows: Math.ceil(buttonsModel.count/cols)

                anchors.fill: parent

                cellWidth: buttonsGrid.width/buttonsGrid.cols
                cellHeight: buttonsGrid.height/buttonsGrid.rows

                model: ListModel {
                    id:buttonsModel
                    ListElement {  title:'1'; type:'number'  }
                    ListElement {  title:'2'; type:'number'  }
                    ListElement {  title:'3'; type:'number'  }
                    ListElement {  title:'+'; type:'op'      }
                    ListElement {  title:'4'; type:'number'  }
                    ListElement {  title:'5'; type:'number'  }
                    ListElement {  title:'6'; type:'number'  }
                    ListElement {  title:'-'; type:'op'      }
                    ListElement {  title:'7'; type:'number'  }
                    ListElement {  title:'8'; type:'number'  }
                    ListElement {  title:'9'; type:'number'  }
                    ListElement {  title:'*'; type:'op'      }
                    ListElement {  title:'0'; type:'number'  }
                    ListElement {  title:';'; type:'dot'     }
                    ListElement {  title:'='; type:'equal'   }
                    ListElement {  title:'/'; type:'op'      }
                }
                delegate: Item {
                    width: buttonsGrid.cellWidth
                    height: buttonsGrid.cellHeight

                    Button {
                        width: parent.width*0.9
                        height: parent.height*0.9
                        anchors.centerIn: parent
                        text:title
                    }
                }
            }
        }
    }
}