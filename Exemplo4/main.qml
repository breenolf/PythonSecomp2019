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

            Column {
                anchors {
                    fill: parent
                    bottomMargin: 10
                    rightMargin: 2
                }

                Label {
                    id: prevLabel
                    property string firstNumber: ''
                    property string op: ''
                    width: parent.width; height: parent.height*0.3
                    horizontalAlignment: Qt.AlignRight
                    verticalAlignment: Qt.AlignBottom
                    color: Material.color(Material.Green, Material.Shade600)
                    text: firstNumber + op; font { bold: false; pixelSize: 35 }
                    fontSizeMode: Text.HorizontalFit
                }
                Label {
                    id: resultLabel
                    width: parent.width; height: parent.height*0.7
                    horizontalAlignment: Qt.AlignRight
                    verticalAlignment: Qt.AlignBottom
                    color: Material.color(Material.Green, Material.Shade600)
                    text: ""; font { bold: true; pixelSize: 50 }
                    fontSizeMode: Text.HorizontalFit
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressAndHold: {
                    resultLabel.text = ''
                    prevLabel.firstNumber = ''
                    prevLabel.op = ''
                    
                    buttonsGrid.ops.forEach((btn) => {
                        btn.enabled = false
                    })
                    buttonsGrid.dot.enabled = false
                    buttonsGrid.equal.enabled = false
                }
            }
        }

        Item {
            width: parent.width
            height: parent.height*0.7

            GridView {
                id: buttonsGrid

                property var numbers: []
                property var ops: []
                property var dot: undefined
                property var equal: undefined

                property int cols: 4
                property int rows: Math.ceil(buttonsModel.count/cols)

                boundsBehavior: Flickable.StopAtBounds

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
                    ListElement {  title:'.'; type:'dot'     }
                    ListElement {  title:'='; type:'equal'   }
                    ListElement {  title:'/'; type:'op'      }
                }
                delegate: Item {
                    width: buttonsGrid.cellWidth
                    height: buttonsGrid.cellHeight

                    Button {
                        id:button

                        function parseColor(type) {
                            switch(type) {
                                case 'number':
                                    return Material.color(Material.Grey, Material.Shade700)
                                case 'op':
                                    return Material.color(Material.Blue, Material.Shade700)
                                case 'dot':
                                    return Material.color(Material.Grey, Material.Shade700)
                                case 'equal':
                                    return Material.color(Material.Orange, Material.Shade700)
                            }
                        }

                        Component.onCompleted: {
                            switch(type) {
                                case 'number':
                                    buttonsGrid.numbers.push(button); break
                                case 'op':
                                    button.enabled = false
                                    buttonsGrid.ops.push(button); break
                                case 'dot':
                                    button.enabled = false
                                    buttonsGrid.dot = button; break
                                case 'equal':
                                    button.enabled = false
                                    buttonsGrid.equal = button; break
                            }
                        }

                        width: parent.width*0.9
                        height: parent.height*0.9
                        anchors.centerIn: parent
                        text:title
                        font.pixelSize: 20
                        background: Rectangle { color: parent.down ? Qt.lighter(button.parseColor(type)) : button.parseColor(type) }

                        onClicked: {
                            if (type === 'number') {
                                resultLabel.text += title

                                if (prevLabel.text.length === 0) {
                                    buttonsGrid.ops.forEach((btn) => {
                                        btn.enabled = true
                                    })
                                } else {
                                    buttonsGrid.equal.enabled = true
                                }

                                buttonsGrid.dot.enabled = true
                            }
                            else if(type === 'op') {
                                prevLabel.firstNumber = resultLabel.text
                                prevLabel.op = title
                                resultLabel.text = ''

                                buttonsGrid.ops.forEach((btn) => {
                                    btn.enabled = false
                                })
                                buttonsGrid.dot.enabled = false
                                buttonsGrid.equal.enabled = false
                            }
                            else if(type === 'dot') {
                                buttonsGrid.ops.forEach((btn) => {
                                    btn.enabled = false
                                })
                                buttonsGrid.dot.enabled = false
                                buttonsGrid.equal.enabled = false
                                resultLabel.text += title
                            } else if(type === 'equal') {
                                let op = prevLabel.op
                                let firstNumber = parseInt(prevLabel.firstNumber)
                                let secondNumber = parseInt(resultLabel.text)

                                let result = 0

                                switch (op) {
                                    case '+': result = firstNumber + secondNumber; break
                                    case '-': result = firstNumber - secondNumber; break
                                    case '*': result = firstNumber * secondNumber; break
                                    case '/': result = firstNumber / secondNumber; break
                                }

                                resultLabel.text = result
                                prevLabel.firstNumber = ''
                                prevLabel.op = ''

                                buttonsGrid.ops.forEach((btn) => {
                                    btn.enabled = true
                                })
                                buttonsGrid.equal.enabled = false
                            }
                        }
                    }
                }
            }
        }
    }
}