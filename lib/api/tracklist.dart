import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musicapp/listscreen.dart';

class TrackList extends StatefulWidget {
  const TrackList({Key? key}) : super(key: key);

  @override
  State<TrackList> createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  static const String url =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=108b8421734cd4756f63143d025d328e";

  Future getList() async {
    http.Response response = await http.get(Uri.parse(url));

    String data = response.body;
    var list = jsonDecode(data)['message']['body'];

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return listscreen(
        trackList: list,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(
      color: Colors.black,
      size: 50.0,
    );
  }
}

//==========================================List api fetch================================================================
