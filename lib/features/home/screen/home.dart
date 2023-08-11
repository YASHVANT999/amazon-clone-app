import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiko/constrants/global_variable.dart';
import 'package:tiko/features/auth/services/authServices.dart';
import 'package:tiko/features/home/widgets/accountBox.dart';
import 'package:tiko/features/home/widgets/dealoftheday.dart';
import 'package:tiko/features/home/widgets/slider.dart';
import 'package:tiko/features/home/widgets/topCategories.dart';
import 'package:tiko/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 5, top: 2),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 5, top: 2),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.mic,
                    color: Colors.black87,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          AccountBox(),
          SizedBox(
            height: 10,
            // child: Container(
            //   color: Color.fromARGB(255, 216, 215, 215),
            // ),
          ),
          TopCategories(),
          SizedBox(
            height: 10,
          ),
          HomeSlider(),
          DealOfDay()
        ]),
      ),
    );
  }
}
