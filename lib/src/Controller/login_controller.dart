import 'package:utilidades/src/Model/user_model.dart';

class LoginController {
 UserModel _mockUser = UserModel(username: "admin", password: "123456");

 Future<bool> login(String username, String password) async{
  await Future.delayed(Duration(seconds: 2));
  return username == _mockUser.username && password == _mockUser.password;
 } 
}