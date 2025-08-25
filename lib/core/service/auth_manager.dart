  import 'package:flutter/foundation.dart';
  import 'package:shared_preferences/shared_preferences.dart';

  class AuthManager {
    static const String _tokenKey = 'auth_token';
    static const String _userTokenKey = 'user_token';
    static const String _refreshTokenKey = 'refresh_token';
    static const String _tokenExpiryKey = 'token_expiry';
    static const String _userIdKey = 'user_id';
    static const String _isLoggedInKey = 'is_logged_in';

    static SharedPreferences? _prefs;

    static Future<void> initialize() async {
      _prefs ??= await SharedPreferences.getInstance();
    }

    static Future<SharedPreferences> get _preferences async {
      if (_prefs == null) {
        await initialize();
      }
      return _prefs!;
    }

    static Future<bool> saveAuthToken(String token, {
      String? refreshToken,
      DateTime? expiryDate,
      int? userId,
    }) async {
      try {
        final prefs = await _preferences;
        
        await prefs.setString(_tokenKey, token);
        await prefs.setString(_userTokenKey, token);
        
        if (refreshToken != null) {
          await prefs.setString(_refreshTokenKey, refreshToken);
        }
        
        if (expiryDate != null) {
          await prefs.setString(_tokenExpiryKey, expiryDate.toIso8601String());
        }
        
        if (userId != null) {
          await prefs.setInt(_userIdKey, userId);
        }
        
        await prefs.setBool(_isLoggedInKey, true);
        
        if (kDebugMode) {
          print('✅ Auth token saved successfully');
          print('🔑 Token length: ${token.length}');
          if (userId != null) print('👤 User ID: $userId');
          if (expiryDate != null) print('⏰ Expires: $expiryDate');
        }
        
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error saving auth token: $e');
        }
        return false;
      }
    }


    static Future<String?> getAuthToken() async {
      try {
        final prefs = await _preferences;
        
        String? token = prefs.getString(_tokenKey);
        
        token ??= prefs.getString(_userTokenKey);
        
        if (token != null) {
          if (await isTokenExpired()) {
            if (kDebugMode) {
              print('⚠️ Token is expired');
            }
            return null;
          }
          
          if (kDebugMode) {
            print('🔑 Retrieved auth token (length: ${token.length})');
          }
          return token;
        }
        
        if (kDebugMode) {
          print('🚫 No auth token found');
        }
        return null;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error getting auth token: $e');
        }
        return null;
      }
    }

    // Get refresh token
    static Future<String?> getRefreshToken() async {
      try {
        final prefs = await _preferences;
        final refreshToken = prefs.getString(_refreshTokenKey);
        
        if (kDebugMode) {
          print('🔄 Retrieved refresh token: ${refreshToken != null ? "Found" : "Not found"}');
        }
        
        return refreshToken;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error getting refresh token: $e');
        }
        return null;
      }
    }

    // Check if token is expired
    static Future<bool> isTokenExpired() async {
      try {
        final prefs = await _preferences;
        final expiryString = prefs.getString(_tokenExpiryKey);
        
        if (expiryString == null) {
          // If no expiry date is set, assume token is valid
          return false;
        }
        
        final expiryDate = DateTime.parse(expiryString);
        final isExpired = DateTime.now().isAfter(expiryDate);
        
        if (kDebugMode) {
          print('⏰ Token expiry check: ${isExpired ? "Expired" : "Valid"}');
          print('⏰ Expiry date: $expiryDate');
        }
        
        return isExpired;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error checking token expiry: $e');
        }
        // If we can't check, assume it's not expired
        return false;
      }
    }
    static Future<bool> isLoggedIn() async {
      try {
        final prefs = await _preferences;
        final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
        final hasToken = await getAuthToken() != null;
        
        final loggedIn = isLoggedIn && hasToken;
        
        if (kDebugMode) {
          print('👤 Login status: $loggedIn (flag: $isLoggedIn, token: $hasToken)');
        }
        
        return loggedIn;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error checking login status: $e');
        }
        return false;
      }
    }
    static Future<int?> getUserId() async {
      try {
        final prefs = await _preferences;
        final userId = prefs.getInt(_userIdKey);
        
        if (kDebugMode) {
          print('👤 Retrieved user ID: $userId');
        }
        
        return userId;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error getting user ID: $e');
        }
        return null;
      }
    }

    // Clear all authentication data
    static Future<bool> clearAuth() async {
      try {
        final prefs = await _preferences;
        
        await Future.wait([
          prefs.remove(_tokenKey),
          prefs.remove(_userTokenKey),
          prefs.remove(_refreshTokenKey),
          prefs.remove(_tokenExpiryKey),
          prefs.remove(_userIdKey),
          prefs.remove(_isLoggedInKey),
        ]);
        
        if (kDebugMode) {
          print('🧹 All auth data cleared');
        }
        
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error clearing auth data: $e');
        }
        return false;
      }
    }

    // Update token expiry
    static Future<bool> updateTokenExpiry(DateTime expiryDate) async {
      try {
        final prefs = await _preferences;
        await prefs.setString(_tokenExpiryKey, expiryDate.toIso8601String());
        
        if (kDebugMode) {
          print('⏰ Token expiry updated: $expiryDate');
        }
        
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error updating token expiry: $e');
        }
        return false;
      }
    }

    // Check if token needs refresh (expires in less than 5 minutes)
    static Future<bool> needsRefresh() async {
      try {
        final prefs = await _preferences;
        final expiryString = prefs.getString(_tokenExpiryKey);
        
        if (expiryString == null) {
          return false;
        }
        
        final expiryDate = DateTime.parse(expiryString);
        final fiveMinutesFromNow = DateTime.now().add(const Duration(minutes: 5));
        
        final needsRefresh = expiryDate.isBefore(fiveMinutesFromNow);
        
        if (kDebugMode) {
          print('🔄 Token needs refresh: $needsRefresh');
        }
        
        return needsRefresh;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error checking if token needs refresh: $e');
        }
        return false;
      }
    }

    // Get all auth info for debugging
    static Future<Map<String, dynamic>> getAuthInfo() async {
      try {
        final prefs = await _preferences;
        
        final authInfo = {
          'hasToken': await getAuthToken() != null,
          'isLoggedIn': await isLoggedIn(),
          'isExpired': await isTokenExpired(),
          'needsRefresh': await needsRefresh(),
          'userId': await getUserId(),
          'tokenLength': (await getAuthToken())?.length ?? 0,
          'hasRefreshToken': prefs.getString(_refreshTokenKey) != null,
          'expiryDate': prefs.getString(_tokenExpiryKey),
        };
        
        if (kDebugMode) {
          print('📊 Auth Info: $authInfo');
        }
        
        return authInfo;
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error getting auth info: $e');
        }
        return {};
      }
    }

    // For testing purposes - set a mock token
    static Future<bool> setMockToken(String token) async {
      return await saveAuthToken(
        token,
        expiryDate: DateTime.now().add(const Duration(hours: 24)),
        userId: 1,
      );
    }
  }