class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({
    this.name,
    this.message,
    this.time,
    this.avatarUrl,
  });
}

final List<ChatModel> chatDeatails = [
  ChatModel(
    name: 'Barry Allen',
    message: 'Hey, Flutter is so Amazing!',
    time: '10.30 AM',
    avatarUrl:
        'https://img4.bdbphotos.com/images/400x400/d/g/dgoinelbqd80n0ed.jpg?skj2io4l',
  ),
  ChatModel(
    name: 'Tony Stark',
    message: 'Hey, Flash!',
    time: '12.30 PM',
    avatarUrl:
        'https://pbs.twimg.com/profile_images/1114951635116208128/MF1zYXby_400x400.png',
  ),
  ChatModel(
    name: 'Chris Hemsworth',
    message: 'Bring me thanos!',
    time: '04.50 PM',
    avatarUrl: 'https://avatarfiles.alphacoders.com/177/177681.jpg',
  ),
  ChatModel(
    name: 'Sunil',
    message: 'Hello, Nikhil',
    time: '07.30 AM',
    avatarUrl: 'https://avatarfiles.alphacoders.com/103/103636.jpg',
  ),
  ChatModel(
    name: 'Manish',
    message: 'Hello, wassup?',
    time: '01.30 AM',
    avatarUrl: 'https://avatarfiles.alphacoders.com/163/163988.jpg',
  ),
  ChatModel(
    name: 'Shatkiman',
    message: 'How are you?',
    time: '09.30 PM',
    avatarUrl:
        'https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/08/3b/1d/083b1dfe-d966-1165-4221-cf0b86d0d9bc/pr_source.png/400x400.png',
  ),
  ChatModel(
    name: 'Spiderman',
    message: 'How are you my friend?',
    time: '03.30 AM',
    avatarUrl: 'https://avatarfiles.alphacoders.com/235/235128.jpg',
  ),
];
