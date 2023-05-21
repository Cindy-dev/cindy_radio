import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/presentation/screens/playing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f2029),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose a radio station you like",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: deviceSize.height / 30),
              Consumer(builder: (_, ref, child) {
                final vm = ref.watch(radioStationsVm);
                return vm.when(
                    data: (data) {
                      return Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 20),
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: (){

                                  Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return PlayingScreen(
                                    radioModel: data[i],
                                  );
                                }));},
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      data[i].favicon!.isEmpty
                                          ? Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 120,
                                                    left: 10,
                                                    bottom: 100,
                                                    child: Text(
                                                      "Image Unavailable",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ))
                                              ],
                                            )
                                          : Container(
                                              width: deviceSize.width / 1.5,
                                              margin: EdgeInsets.only(
                                                  bottom: 0, top: 20),
                                              child: Image.network(
                                                data[i].favicon!,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                      Positioned(
                                          left: 10,
                                          bottom: 0,
                                          right: 10,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              data[i].name!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                    error: (e, s) => Text(e.toString()),
                    loading: () => Center(child: CircularProgressIndicator()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
