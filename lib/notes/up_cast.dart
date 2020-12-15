void _notes() {
  /**
   *  Создаём экземпляр класса и выполняем метод
   */
  Human human = Human();
  human._printInfo();

  /**
   *  Приводим экземпляр [employee] класса потомка [Employee] к типу
   *  родительского класса [Human]
   *
   *  Такой тип приведения называеться Up cast
   */
  Human employee = Employee();

  /**
   *  Метод [employee._printInfo()] как и все переопределённые методы и
   *  переменные наследника, заменяют собой етоды и переменные родителя.
   *
   *  (Полиморфизм)
   */
  employee._printInfo();

  /**
   *  Метод [employee._printInfoEmployee()] небудет работать, из за приведения
   *  класса потомка к типу родительского класса благодаря процессу приведения
   *  Up cast.
   *
   *  В результате чего экземпляр прячет все методы пренадлежащие
   *  классу потомку, но не принадлежащие классу родителю
   *
   *  (Инкапсуляция)
   */
}

class Human {
  String _name = "Name1";

  void _printInfo() => print(_name);
}

class Employee extends Human {
  String _name = "Name2";

  @override
  void _printInfo() => print(_name);

  void _printInfoEmployee() => print(_name);
}
