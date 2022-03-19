import 'dart:convert';

import 'package:chat_app_/models/token.dart';
import 'package:http/http.dart' as http;

class getTwitchapi {
  static var tokenn;
  static Future<dynamic> fetchAppAccessToken() async {
    print("enterd into gettwitch api");
    final baseUrl = 'id.twitch.tv';
    Map<String, String> parameters = {
      'client_id': "sb813t02ggjak3ioaq06dcmvdy2ulu",
      'client_secret': "2l757ccwccpd0xfdc6zl7n931lvjhc",
      'grant_type': 'client_credentials',
    };

    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    Uri uri = Uri.https(baseUrl, '/oauth2/token', parameters);

    var token;
    try {
      token = await http.post(uri, headers: headers);
      if (token.statusCode == 200) {
        print(token.statusCode);
        //print(token);
        print(token.body);
        tokenn = token.body['access_token'];
        print("This is tokenn");
        print(tokenn);
        return Token.fromJson(json.decode(token.body));
      }
      return Token.fromJson(json.decode(token.body));
    } catch (e) {
      return Token.fromJson(json.decode(token.body));
    }
  }

  static Future<dynamic> fetchVideoId(String gameId, String tokenu) async {
    final baseUrl = 'api.twitch.tv';
    Map<String, String> parameters = {
      'game_id': gameId,
    };
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenu',
      'Client-id': "sb813t02ggjak3ioaq06dcmvdy2ulu",
    };
    Uri uri = Uri.https(baseUrl, '/helix/videos', parameters);
    try {
      var videoId = await http.get(uri, headers: headers);
      print("thsi is the video body");
      print(videoId.body);
      return videoId.body;
    } catch (e) {
      return e.toString();
    }
  }
}
// class TwitchAPIService {
//   // Making a singleton pattern ensures only one instance of a class is ever created
//   TwitchAPIService twitchAPIServices;
//   twitchAPIServices._internal();

//   static final TwitchAPIService _twitchAPIService =
//       TwitchAPIService._internal();

//   static TwitchAPIService get twitchAPIService => _twitchAPIService;

//   String twitchClientID,
//       twitchClientSecret; // This are to be gotten from the Twitch developer console

//   Future<String> fetchAppAccessToken() async {
//     final baseUrl = 'id.twitch.tv';
//     Map<String, String> parameters = {
//       'client_id': twitchClientID,
//       'client_secret': twitchClientSecret,
//       'grant_type': 'client_credentials',
//     };

//     Map<String, String> headers = {
//       'Accept': 'application/json',
//     };

//     Uri uri = Uri.https(baseUrl, '/oauth2/token', parameters);

//     var token;
//     try {
//       token = await http.post(uri, headers: headers);
//       if (token.statusCode == 200) {
//         // Make secure requests with the token.
//         return token.body;
//       }
//       return json.decode(token.body)['message'];
//     } catch (e) {
//       return json.decode(token.body)['message'];
//     }
//   }

//   // This gets the game Id of any given game under Twitch's game library
//   Future<String> fetchGameId(String token) async {
//     final baseUrl = 'api.twitch.tv';
//     Map<String, String> parameters = {
//       'name': 'fortnite',
//     };
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//       'Client-id': twitchClientID,
//     };

//     Uri uri = Uri.https(baseUrl, '/helix/games', parameters);

//     try {
//       var gameId = await http.get(uri, headers: headers);
//       return gameId.body;
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   // This retrieves videoId(s) under a particular gameId
//   Future<dynamic> fetchVideoId(String gameId) async {
//     final baseUrl = 'api.twitch.tv';
//     Map<String, String> parameters = {
//       'game_id': gameId,
//     };
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer 4aq6y8pqjyw7cc9x4o8el7zha1ua8u',
//       'Client-id': twitchClientID,
//     };
//     Uri uri = Uri.https(baseUrl, '/helix/videos', parameters);
//     try {
//       var videoId = await http.get(uri, headers: headers);
//       return videoId.body;
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }
