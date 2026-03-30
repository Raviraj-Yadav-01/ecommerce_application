
abstract class UserEvent{}

class UserAuthenticateEvent extends UserEvent{
  String email;
  String pass;
 UserAuthenticateEvent({required this.email, required this.pass});
}

class UserRegisterEvent extends UserEvent{

  String name;
  String mobNo;
  String email;
  String pass;

  UserRegisterEvent({
    required this.name,
    required this.mobNo,
    required this.email,
    required  this.pass
  });

}