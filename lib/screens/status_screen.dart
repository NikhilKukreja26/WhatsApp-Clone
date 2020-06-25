import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone/widgets/store_page_view.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.photo_camera),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddStatusListTile(),
              Divider(
                color: Colors.blueGrey,
              ),
              Text(
                'Recent Updates',
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                // color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://ordina-jworks.github.io/img/2019-01-10-Flutter/flutter_logo.jpeg',
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Center(
                              heightFactor: 18.0,
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Flutter Dev",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Today, 8:16 PM"),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPageView(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddStatusListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.goodsmile.info/cgm/images/product/20180410/7199/51422/medium/e1ab08a197fa105566949df68472702f.jpg',
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  heightFactor: 18.0,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -6,
            left: 25,
            child: Container(
              height: 20,
              width: 20,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        'My status',
        style: TextStyle(
          letterSpacing: 0.2,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'Tap to add status update',
        style: TextStyle(
          letterSpacing: 0.2,
          color: Colors.blueGrey,
          fontSize: 14.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
