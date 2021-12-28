import 'package:flutter/material.dart';
import 'package:quizapp/usefull/my_colors.dart';
import 'package:quizapp/usefull/my_network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  void getData() async {
    await MyNetwork().getQuestion();
    await Future.delayed(
        const Duration(seconds: 2),
        () => {
              Navigator.pushReplacementNamed(context, "/home"),
            });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
      backgroundColor: MyColors.darkseagreen,
    );
  }
}
