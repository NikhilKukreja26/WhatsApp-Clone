import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  const ChatListItem(
      {Key key, this.name, this.message, this.time, this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 8.0,
        ),
        ListTile(
          leading: InkWell(
            onTap: () {
              _showDetailsDialog(context);
            },
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
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
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.7,
            ),
          ),
          subtitle: Text(
            message,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          trailing: Text(
            time,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85.0),
          child: Divider(
            height: 8.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Future<void> _showDetailsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -75,
              bottom: 0,
              left: 0,
              right: 0,
              child: AlertDialog(
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(10.0),
                    ),
                content: Container(
                  // width: 400.0,
                  height: 380.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: avatarUrl,
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
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 16.0),
                            height: 50.0,
                            color: Colors.black54.withOpacity(0.5),
                            child: Text(
                              name,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.7,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Theme.of(context).primaryColor,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.videocam,
                              color: Theme.of(context).primaryColor,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.info_outline,
                              color: Theme.of(context).primaryColor,
                              size: 28.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
