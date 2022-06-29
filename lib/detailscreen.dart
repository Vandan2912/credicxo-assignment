import 'dart:convert';

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      this.tracklyric,
      this.name,
      this.artist,
      this.album,
      this.explicit,
      this.rating})
      : super(key: key);

  final tracklyric;
  final name;
  final artist;
  final album;
  final explicit;
  final rating;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var lyrics;
  var name;
  var artist;
  var album;
  var explicit;
  var rating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.tracklyric, widget.name, widget.artist, widget.album,
        widget.explicit, widget.rating);

    print(lyrics);
  }

  void updateUI(dynamic trackLyric, dynamic tname, dynamic tartist,
      dynamic talbum, dynamic texplicit, dynamic trating) {
    lyrics = trackLyric['lyrics']['lyrics_body'].toString();
    name = tname;
    artist = tartist;
    album = talbum;
    explicit = texplicit;
    rating = trating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(name, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Artist",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(artist, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Album",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(album, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Explicit",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(explicit, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(rating, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Lyrics",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                lyrics,
                style: const TextStyle(fontSize: 16.0),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
