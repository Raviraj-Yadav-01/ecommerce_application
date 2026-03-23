class AppExceptions implements Exception {
  String exTitle, exMsg;

  AppExceptions({required this.exTitle, required this.exMsg});

  @override
  String toString() {
    return "$exTitle : $exMsg";
  }
}

class NoInternetExceptions extends AppExceptions {
  NoInternetExceptions({required String msg})
    : super(exTitle: "No Internet", exMsg: msg);
}

//500 and Above
class ServerExceptions extends AppExceptions {
  ServerExceptions({required String msg})
    : super(exTitle: "Server Error", exMsg: msg);
}

class BadRequestException extends AppExceptions {
  BadRequestException({required String msg})
    : super(exTitle: "Bad Error", exMsg: msg);
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException({required String msg})
    : super(exTitle: "Unauthorized", exMsg: msg);
}

//404
class NotFoundExceptions extends AppExceptions {
  NotFoundExceptions({required String msg})
    : super(exTitle: "Not Found Exception", exMsg: msg);
}

class InvalidInputException extends AppExceptions {
  InvalidInputException({required String msg})
    : super(exTitle: "Invalid Input", exMsg: msg);
}
