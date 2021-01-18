void main() {
  MediumNews mediumNews = MediumNews();
  EmailObserver emailObserver = EmailObserver();
  NotificationObserver notificationObserver = NotificationObserver();

  mediumNews
    ..addObserver(emailObserver)
    ..addObserver(notificationObserver);

  mediumNews.addNews("[01.12.21] The Bitcoin Dream Is Dead");
  mediumNews.addNews("[02.12.21] MediaQuery in Flutter");
  //mediumNews.deleteObserver(notificationObserver);
  mediumNews.addNews("[03.12.21] Native Splash Screen in Flutter Using Lottie");
  mediumNews.addNews("[04.12.21] Announcing Flutter Windows Alpha");
  mediumNews.addNews("[05.12.21] Edit a PDF in Flutter");
}

// Observable Наблюдаемый
abstract class NotifyAPI {
  void addObserver(Observer observer);

  void deleteObserver(Observer observer);

  void notifyObservers();
}

class MediumNews implements NotifyAPI {
  List<String> _newsList = List<String>();

  List<Observer> _observersList = List<Observer>();

  void addNews(String news) {
    _newsList.add(news);
    notifyObservers();
  }

  @override
  void addObserver(Observer observer) {
    if(!_observersList.contains(observer)){
      _observersList.add(observer);
    }
  }

  @override
  void deleteObserver(Observer observer) {
    _observersList.remove(observer);
  }

  @override
  void notifyObservers() {
    _observersList.forEach((element) {
      element.handleEvent(_newsList);
    });
  }
}

// Observer Наблюдатель
abstract class Observer {
  void handleEvent(List<String> newsList);
}

class EmailObserver implements Observer {
  @override
  void handleEvent(List<String> newsList) {
    if (newsList.length == 5) {
      print("\n\n*** Email ***\n");
      print("Here are the news from the previous week that you missed:");

      for (int i = 0; i < newsList.length; i++) {
        print("> ${newsList[i]} <");
      }
    }
  }
}

class NotificationObserver implements Observer {
  @override
  void handleEvent(List<String> newsList) {
    if (newsList.length < 5) {
      print("\n*** Notification ***\n");
      print("The last news you might have missed:\n"
          "> ${newsList[newsList.length - 1]} <");
    }
  }
}
