import 'package:fitness_tracker/controller/auth_controller.dart';
import 'package:fitness_tracker/controller/user_controller.dart';
import 'package:fitness_tracker/screen/body_track_screen.dart';
import 'package:fitness_tracker/screen/login_screen.dart';
import 'package:fitness_tracker/screen/weight_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0.obs;
    var menuName = ["Ağırlık Takibi", "Vucüt Takibi"];
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child:
                  Text('Hoşgeldin \n${UserController.instance.user.name ?? ""}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      )),
            ),
            ListTile(
              title: Obx(() {
                if (AuthController.instance.isDark.value) {
                  return const Text("Karanlık Tema");
                } else {
                  return const Text("Aydınlık Tema");
                }
              }),
              onTap: () async {
                AuthController.instance.isDark.value =
                    !AuthController.instance.isDark.value;
                if (AuthController.instance.isDark.value) {
                  Get.changeTheme(ThemeData.dark());
                } else {
                  Get.changeTheme(ThemeData.light());
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool(
                    'darkTheme', AuthController.instance.isDark.value);
              },
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              onTap: () async {
                Get.find<AuthController>().logOut();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Obx(() => Text(menuName[selectedIndex.value])),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Obx(() {
          return LoginScreen();
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.fitness_center), label: menuName[0]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.scale), label: menuName[1]),
          ],
          currentIndex: selectedIndex.value,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          onTap: (value) => selectedIndex.value = value,
        );
      }),
    );
  }
}
