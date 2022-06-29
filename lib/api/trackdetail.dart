import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musicapp/detailscreen.dart';

class TrackDetail extends StatefulWidget {
  const TrackDetail({Key? key, this.trackID}) : super(key: key);

  final trackID;

  @override
  State<TrackDetail> createState() => _TrackDetailState();
}

class _TrackDetailState extends State<TrackDetail> {
  var id;
  var url1;
  var url2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.trackID;
    print(id);
    url1 =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=108b8421734cd4756f63143d025d328e";
    url2 =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=108b8421734cd4756f63143d025d328e";
    getList();
  }

  Future getList() async {
    http.Response response1 = await http.get(Uri.parse(url2));
    var data1 = response1.body;
    var list = jsonDecode(data1)['message']['body'];
    var name = list['track']['track_name'];
    var artist = list['track']['artist_name'];
    var album = list['track']['album_name'];
    var explicit = list['track']['explicit'];
    if (explicit == 0) {
      explicit = "False";
    } else {
      explicit = "True";
    }
    var rating = list['track']['track_rating'].toString();

    http.Response response2 = await http.get(Uri.parse(url1));
    var data2 = response2.body;
    var lyric = jsonDecode(data2)['message']['body'];

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(
        tracklyric: lyric,
        name: name,
        artist: artist,
        album: album,
        explicit: explicit,
        rating: rating,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: Colors.black,
      size: 50.0,
    );
  }
}
