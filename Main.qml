import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window

ApplicationWindow {
    visible: true
    width: 400
    height: 200
    title: "Видеопроигрыватель"

    Rectangle {
        width: parent.width
        height: parent.height

        Item {
            MediaPlayer {
                onPositionChanged: {
                        console.log("Position changed:", mediaplayer.position)
                    }
                id: mediaplayer
                source: "..CAT.mp4"
                audioOutput: AudioOutput {}
                videoOutput: videoOutput
            }

            VideoOutput {
                id: videoOutput
                anchors.fill: parent
            }
        }

        RowLayout {
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 10
            }

            Button {
                text: "\u25B6️" // ▶️
                onClicked: mediaplayer.play()
            }

            Button {
                text: "\u23F8️" // ⏸️
                onClicked: mediaplayer.pause()
            }

            Button {
                text: "\u23F9️" // ⏹️
                onClicked: mediaplayer.stop()
            }

            Button {
                text: "\u23EA️" // ⏪️
            }

            Button {
                text: "\u23E9️" // ⏩️
            }
        }

        ProgressBar {
            id: progressBar
            width: parent.width - 20
            height: 10
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 30
            }
            from: 0
            to: mediaplayer.duration
            value: mediaplayer.position
        }
    }
}
