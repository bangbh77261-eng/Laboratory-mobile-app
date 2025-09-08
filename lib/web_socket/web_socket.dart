import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late final WebSocketChannel channel;

  WebSocketService(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  Stream get stream => channel.stream;

  void send(String message) {
    channel.sink.add(message);
  }

  void dispose() {
    channel.sink.close();
  }
}
