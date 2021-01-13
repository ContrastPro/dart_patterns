void main() {
  GroupTelegramChat groupTelegramChat = GroupTelegramChat();

  User admin = AdminUser(groupTelegramChat, "Gleb");
  User commonUser1 = CommonUser(groupTelegramChat, "Brad");
  User commonUser2 = CommonUser(groupTelegramChat, "Dan");

  groupTelegramChat.admin = admin;

  groupTelegramChat
    ..addUserToGroupChat(commonUser1)
    ..addUserToGroupChat(commonUser2);

  commonUser1.sendMessage("Hello");
}

//Colleague
abstract class User {
  void sendMessage(String massage);

  void getMessage(String massage);
}

class CommonUser implements User {
  final TelegramChat _telegramChat;
  final String _name;

  CommonUser(this._telegramChat, this._name);

  @override
  void sendMessage(String massage) {
    _telegramChat.postMessage(this, massage);
  }

  @override
  void getMessage(String massage) {
    print("Common user $_name: $massage");
  }
}

class AdminUser implements User {
  final TelegramChat _telegramChat;
  final String _name;

  AdminUser(this._telegramChat, this._name);

  @override
  void sendMessage(String massage) {
    _telegramChat.postMessage(this, massage);
  }

  @override
  void getMessage(String massage) {
    print("Admin user $_name: $massage");
  }
}

// Mediator
abstract class TelegramChat {
  void postMessage(User user, String massage);
}

class GroupTelegramChat implements TelegramChat {
  User _admin;
  List<User> _usersList = List<User>();

  set admin(User value) => _admin = value;

  void addUserToGroupChat(User user) {
    _usersList.add(user);
  }

  @override
  void postMessage(User user, String massage) {
    _admin.getMessage(massage);

    _usersList.forEach((element) {
      if (element != user) {
        element.getMessage(massage);
      }
    });
  }
}
