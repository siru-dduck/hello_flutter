import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  String name = "SiruDDuck!";
  // var name = "문자열 추론이 가능하다구~";
  print(name);

  int nameLen = printMyname(name + "!!");
  print(nameLen);

  final APIModule apiModule = new APIModule();
  apiModule
      .getIpAddress()
      .then((ip) => print("My Ip is " + ip))
      .catchError((err) => print(err));

  try {
    final ip = await apiModule._getIpAddress();
    print("My Ip is " + ip + " with async await");
  } catch (err) {
    print(err);
  }

  runApp(const MyCupertinoApp());
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.dark),
        home: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                "Cupertino App",
              ),
            ),
            child: Center(child: Text("호옹이"))));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hello Flutter",
        home: Scaffold(
            appBar: AppBar(title: Text("Welcome to First App bar")),
            body: Center(child: Text("Hello World"))));
  }
}

/**
 * 함수 반환타입 생략가능
 */
int printMyname(String name) {
  print(name);
  return name.length;
}

class APIModule {
  Future<String> getIpAddress() {
    final Uri url = Uri.parse('https://httpbin.org/ip');
    return http.get(url).then((response) {
      return jsonDecode(response.body)['origin'];
    });
  }

  Future<String> _getIpAddress() async {
    final Uri url = Uri.parse('https://httpbin.org/ip');
    final response = await http.get(url);
    return jsonDecode(response.body)['origin'];
  }
}
