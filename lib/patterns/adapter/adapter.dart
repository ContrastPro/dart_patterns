import 'dart:convert';

void main() {
  // Example #1
  final PostsAPI mediumPost = MediumAdapter();
  final PostsAPI habrPost = HabrAdapter();

  final List<Post> posts = mediumPost.getPosts() + habrPost.getPosts();

  posts.forEach((element) {
    print("Title: ${element.title}\nContent: ${element.content}\n");
  });

  // Example #2
  final LocalDatabase database = OrderAdapter();
  database.select();
  database.update();
  database.remove();
}

// Example #1
class Database {
  // Разные имена свойств
  String getMediumPosts() {
    return '[{"headline": "Medium headline", "text": "Text 1..."}]';
  }

  String getHabrPosts() {
    return '[{"header": "Habr header", "body": "Body 1..."}]';
  }
}

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);
}

abstract class PostsAPI {
  List<Post> getPosts();
}

class MediumAdapter extends Database implements PostsAPI {
  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(getMediumPosts()) as List;

    return rawPosts
        .map((post) => Post(post['headline'], post['text']))
        .toList();
  }
}

class HabrAdapter extends Database implements PostsAPI {
  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(getHabrPosts()) as List;

    return rawPosts.map((post) => Post(post['header'], post['body'])).toList();
  }
}

// Example #2
abstract class LocalDatabase {
  void select();

  void update();

  void remove();
}

class Order {
  void loadOrder() => print("Order is loading...");

  void updateOrder() => print("Order is updating...");

  void deleteOrder() => print("Order is deleting...");
}

class OrderAdapter extends Order implements LocalDatabase {
  @override
  void select() => loadOrder();

  @override
  void update() => updateOrder();

  @override
  void remove() => deleteOrder();
}
