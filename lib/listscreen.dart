import 'package:flutter/material.dart';
import 'package:musicapp/api/trackdetail.dart';

class listscreen extends StatefulWidget {
  const listscreen({Key? key, this.trackList}) : super(key: key);

  final trackList;

  @override
  State<listscreen> createState() => _listscreenState();
}

class _listscreenState extends State<listscreen> {
  var list;

  void updateUI(dynamic trackList) {
    list = trackList['track_list'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.trackList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Music App"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TrackDetail(
                    trackID: list[index]['track']['track_id'],
                  );
                }));
              },
              child: Container(
                height: 80.0,
                margin: EdgeInsets.all(2.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white70,
                ),
                child: Row(
                  children: [
                    Icon(Icons.library_music),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      width: 240.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index]['track']['track_name'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            list[index]['track']['album_name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: Text(
                        list[index]['track']['artist_name'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
