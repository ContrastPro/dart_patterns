import 'dart:convert';

void main() => _dartAdapter();

void _dartAdapter() {
  final PostsAPI apiMedium = MediumAdapter();
  final PostsAPI apiHabr = HabrAdapter();

  final List<Post> posts = apiMedium.getPosts() + apiHabr.getPosts();
  for (int i = 0; i < posts.length; i++) {
    print("Title: ${posts[i].title}\nContent: ${posts[i].content}\n");
  }
}

class MediumAPI {
  // разные интерфейсы
  String getMediumPosts() {
    return '[{"headline": "Medium headline", "text": "Text 1..."}]';
  }
}

class HabrAPI {
  String getHabrPosts() {
    return '[{"header": "Habr header", "body": "Body 1..."}]';
  }
}

class Post {
  final String title;
  final String content;

  const Post(this.title, this.content);
}

abstract class PostsAPI {
  List<Post> getPosts();
}

class MediumAdapter implements PostsAPI {
  final api = MediumAPI();

  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getMediumPosts()) as List;

    return rawPosts
        .map((post) => Post(post['headline'], post['text']))
        .toList();
  }
}

class HabrAdapter implements PostsAPI {
  final api = HabrAPI();

  @override
  List<Post> getPosts() {
    final rawPosts = jsonDecode(api.getHabrPosts()) as List;

    return rawPosts.map((post) => Post(post['header'], post['body'])).toList();
  }
}
