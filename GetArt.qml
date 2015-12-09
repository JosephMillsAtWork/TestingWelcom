import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    id: info
    property string artist: "talking heads"
    property variant lastArtist: null
    property string  errorString: ""
    signal reload()
    onReload: nfoFm.reload()
    XmlListModel{
        id: nfoFm
        source:{
            var u = info.artist
            "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist="
                    + u
                    + "&api_key=8d6a5b038ee630a9cdd2644fcb1f9bd3"
        }
        query: "/lfm/artist"
        XmlRole{name: "name"; query: "name/string()"}
        XmlRole{name: "mbid"; query: "mbid/string()"}
        XmlRole{name: "url"; query: "url/string()"}
        XmlRole{name: "imageSma"; query: "image[1]/string()"}
        XmlRole{name: "imageMed"; query: "image[5]/string()"}
        XmlRole{name: "imageLar"; query: "image[3]/string()"}
        XmlRole{name: "imageExL"; query: "image[4]/string()"}
        XmlRole{name: "imageMega"; query: "image[5]/string()"}
        XmlRole{name: "streamable"; query: "streamable/string()"}
        //stats
        XmlRole{name: "ontour"; query: "ontour/string()"}
        XmlRole{name: "listeners"; query: "stats/listeners/string()"}
        //similar artists
        //0
        XmlRole{name: "similar0Name"; query: "similar/artist[0]/name/string()"}
        XmlRole{name: "similar0Url"; query: "similar/artist[0]/url/string()"}
        XmlRole{name: "similar0ImgMed"; query: "similar/artist[0]/image[2]/string()"}
        XmlRole{name: "similar0ImgLrg"; query: "similar/artist[0]/image[3]/string()"}
        //1
        XmlRole{name: "similar1Name"; query: "similar/artist[1]/name/string()"}
        XmlRole{name: "similar1Url"; query: "similar/artist[1]/url/string()"}
        XmlRole{name: "similar1ImgMed"; query: "similar/artist[1]/image[3]/string()"}
        XmlRole{name: "similar1ImgLrg"; query: "similar/artist[1]/image[3]/string()"}
        //2
        XmlRole{name: "similar2Name"; query: "similar/artist[2]/name/string()"}
        XmlRole{name: "similar2Url"; query: "similar/artist[2]/url/string()"}
        XmlRole{name: "similar2ImgMed"; query: "similar/artist[2]/image[2]/string()"}
        XmlRole{name: "similar2ImgLrg"; query: "similar/artist[2]/image[3]/string()"}
        //3
        XmlRole{name: "similar3Name"; query: "similar/artist[3]/name/string()"}
        XmlRole{name: "similar3Url"; query: "similar/artist[3]/url/string()"}
        XmlRole{name: "similar3ImgMed"; query: "similar/artist[3]/image[2]/string()"}
        XmlRole{name: "similar3ImgLrg"; query: "similar/artist[3]/image[3]/string()"}
        //bios and descriptions
        XmlRole{name: "published"; query: "bio/published/string()"}
        XmlRole{name: "summary"; query: "bio/summary/string()"}
        XmlRole{name: "content"; query: "bio/content/string()"}
        XmlRole{name: "yearformed"; query: "bio/yearformed/string()"}
        onStatusChanged: {
            if(status===XmlListModel.Error){
               info.errorString =  errorString()
//                reload()
            }
            if(status===XmlListModel.Ready)
            {
                if(count>0)
                    info.lastArtist=nfoFm.get(0)
            }
        }
    } //
}














