part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSingUpResult> signUp(String email, String password, String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      User user = result.user.convertToUser(
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

      await UserServices.updateUser(user);

      return SignInSingUpResult(user: user);
    } catch (e){
      return SignInSingUpResult(massage: e.toString());
    }
  }
}

class SignInSingUpResult {
  final User user;
  final String massage;

  SignInSingUpResult({this.user,this.massage});
}