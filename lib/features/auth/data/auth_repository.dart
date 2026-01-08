import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Sign up a new user with email, password, and name
  Future<void> signUp(String email, String password, String name) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      if (response.user == null) {
        throw Exception('Sign up failed');
      }
    } on AuthException catch (e) {
      throw Exception('Authentication error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error during sign up: $e');
    }
  }

  /// Sign in an existing user with email and password
  Future<void> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Sign in failed');
      }
    } on AuthException catch (e) {
      throw Exception('Authentication error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error during sign in: $e');
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }

  /// Stream of authentication state changes
  Stream<AuthState> get authStateChanges {
    return _supabase.auth.onAuthStateChange;
  }

  /// Check if user is currently logged in
  bool get isLoggedIn {
    return _supabase.auth.currentUser != null;
  }

  /// Get the current user
  User? get currentUser {
    return _supabase.auth.currentUser;
  }

  /// Get the current user's ID
  String? get currentUserId {
    return _supabase.auth.currentUser?.id;
  }

  /// Get the current user's email
  String? get currentUserEmail {
    return _supabase.auth.currentUser?.email;
  }

  /// Get the current user's name from metadata
  String? get currentUserName {
    return _supabase.auth.currentUser?.userMetadata?['name'] as String?;
  }
}
