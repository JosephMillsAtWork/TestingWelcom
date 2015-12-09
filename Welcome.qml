import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Rectangle{
    id: playerView
    width: 12
    height: 12
    color: "transparent"
    property string artName
    property string  descFull: lArt.lastArtist.summary
    // ARTwork goes here


    Image {
        id:aPic
        source:lArt.lastArtist.imageMed
        opacity: .5
        anchors.fill: parent
    }


    GetArt{
        id:lArt;
    }

Column{
    width: playerView.width
    height: playerView.height

    TextField{
        width: parent.width / 1.2
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: "Enter a name of a band"
        onAccepted: {
            lArt.artist = text
            lArt.reload();
        }

    }

Button{
    width: parent.width / 1.2
    anchors.horizontalCenter: parent.horizontalCenter
    text: "show description"
    onClicked: {
        openDesc();

    }
}

Text {
    id: errorText
    text: lArt.errorString
}



}// col







// desc Rec
Rectangle{
    id: descRec
    color: "#80000000"
    property bool shown: false
    width: parent.width
    height: parent.height / 4
    y: shown === true ? 0 : -parent.height
    Behavior on y{
        NumberAnimation{duration: 1200 ; easing.type: Easing.OutBack}

    }
    Column{
        width: playerView.width
        height: playerView.height

        Text{
            width: parent.width / 1.2
            anchors.horizontalCenter: parent.horizontalCenter
            text: descFull
        }


    }
Button{
    width: parent.width / 1.2
    anchors{
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }
        text: "close"
    onClicked: openDesc()


}



}










function openDesc(){

    if(descRec.shown === false){
        descRec.shown = true
    }else if (descRec.shown === true){
        descRec.shown = false
    }

}


}

