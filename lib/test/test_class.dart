class Singleton{
  static final Singleton _singleton = Singleton._();

  factory Singleton (){
    return _singleton;
  }

  Singleton._();
}