import '../models/user_model.dart';

class AuthService {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Mock login - aceita qualquer email/senha para demonstração
  Future<bool> login(String email, String password) async {
    // Simular delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Validação básica
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    if (password.length < 6) {
      return false;
    }

    // Criar usuário mock
    _currentUser = User(
      id: '1',
      name: email.split('@')[0].toUpperCase(),
      email: email,
      avatarUrl: 'https://i.pravatar.cc/150?u=$email',
      joinedAt: DateTime.now().subtract(const Duration(days: 180)),
    );

    return true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  bool isLoggedIn() {
    return _currentUser != null;
  }
}



