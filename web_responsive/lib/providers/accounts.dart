import 'package:flutter/material.dart';
import '../home/sign/sign.dart';

enum AccoutState {
  signIn(screen: SingInHome()),
  signUp(screen: SignUpHome()),
  signUpCreate(screen: SignUpHome()),
  signReset(screen: SingResetHome());

  final Widget screen;

  const AccoutState({required this.screen});
}

class AccountStateProvider extends ChangeNotifier {
  AccoutState _currentState = AccoutState.signIn;

  AccoutState get currentState => _currentState;

  void switchSignIn() {
    _currentState = AccoutState.signIn;
    notifyListeners();
  }

  void switchSignUp() {
    _currentState = AccoutState.signUp;
    notifyListeners();
  }

  void switchSignUpCreate() {
    _currentState = AccoutState.signUpCreate;
    notifyListeners();
  }

  void switchSignReset() {
    _currentState = AccoutState.signReset;
    notifyListeners();
  }
}
