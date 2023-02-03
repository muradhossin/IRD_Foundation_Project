import 'package:flutter/material.dart';
import 'package:ird_foundation/customwidgets/all_task_view.dart';
import 'package:ird_foundation/customwidgets/reminder_task_view.dart';
import 'package:ird_foundation/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3f3f3),
        body: Column(
          children: [
            buildSectionUptoReminderTask(context),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 18,
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'All Tasks',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.30,
                      color: Color(0xff042d2b),
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1,
                      color: Color(0xb2042e2b),
                    ),
                  )
                ],
              ),
            ),
            buildSectionAllTasks(),
          ],
        ),

        bottomNavigationBar: buildSectionBottomNavBar());
  }

  Container buildSectionBottomNavBar() {
    return Container(
        decoration:  const BoxDecoration (
          borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(18),
            topRight:  Radius.circular(18),
          ),
            boxShadow:  [
            BoxShadow(
            color:  Color(0x19000000),
        offset:  Offset(0, -4),
        blurRadius:  7,
      ),],
  ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft:  Radius.circular(18),
            topRight:  Radius.circular(18),
          ),
          child: BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green.shade900,
            elevation: 50,
            backgroundColor: const Color(0xffffffff),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded,),
                  label: "Search",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emergency_recording),
                  label: "Record",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: "Saved",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",

              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,

          ),
        ),
      );
  }

  Expanded buildSectionAllTasks() {
    return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: reminderList.length,
              itemBuilder: (context, index) {
                final taskItem = reminderList[index];
                return AllTaskView(
                  img: taskItem.img,
                  taskName: taskItem.taskName,
                  saveDate: taskItem.saveDate,
                );
              },
            ),
          );
  }

  SizedBox buildSectionUptoReminderTask(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 425,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 386,
                    decoration: const BoxDecoration(
                        color: Color(0xff042E2B),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                  ),
                ),
                Positioned(
                  left: 1,
                  top: 56,
                  right: 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ListTile(
                      title: const Text(
                        "Hi, Habib 👋",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: 0.18,
                          color: Color(0xffffffff),
                        ),
                      ),
                      subtitle: const Text(
                        "Let’s explore your notes",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          color: Color(0xb2ffffff),
                        ),
                      ),
                      trailing: SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "images/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 132,
                  right: 15,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            height: 140,
                            decoration: BoxDecoration(
                                color: const Color(0x19ffffff),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const Positioned(
                          left: 16,
                          top: 16,
                          child: Text(
                            "Welcome to TickTick Task",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 16,
                          top: 41.5,
                          child: SizedBox(
                            height: 31,
                            width: 288,
                            child: Text(
                              "Your one-stop app for task management. Simplify, track, and accomplish tasks with ease.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                                color: Color(0xb2ffffff),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          top: 93,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
                              width: 109,
                              height: 31,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0x4cffffff)),
                                color: const Color(0xff23956c),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  SizedBox(
                                    width: 11,
                                    height: 11,
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Watch Video',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.30,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -9,
                          top: 63.4141693115,
                          child: Image.asset(
                            "images/iconforbanner.png",
                            fit: BoxFit.cover,
                            width: 89,
                            height: 90,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 304,
                  child: SizedBox(
                    height: 18,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Reminder Task",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1.30,
                            color: Color(0xffffffff),
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            color: Color(0xb2ffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 334,
                  bottom: 0,
                  left: 15,
                  right: 0,
                  child: SizedBox(
                    height: 91,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: reminderList.length,
                        itemBuilder: (context, index) {
                          final reminderItem = reminderList[index];
                          return ReminderTaskView(
                            img: reminderItem.img,
                            taskName: reminderItem.taskName,
                            saveDate: reminderItem.saveDate,
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
