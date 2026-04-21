import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Room extends StatefulWidget {
  final String roomName;
  final String roomImagePath;

  const Room({
    super.key,
    required this.roomName,
    required this.roomImagePath,
  });

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  String? selectedDailyChore;
  String? selectedWeeklyChore;
  
  // List for added chores
  List<String> addedChores = [];
  
  // Daily Chores Options
  final List<String> dailyChores = [
    'Make bed',
    'Wash dishes',
    'Take out trash',
    'Wipe counters',
    'Sweep floor',
    'Water plants',
    'Clean mirrors',
  ];
  
  // Weekly Chores Options
  final List<String> weeklyChores = [
    'Vacuum carpets',
    'Mop floors',
    'Clean bathroom',
    'Dust furniture',
    'Do laundry',
    'Clean windows',
    'Organize closet',
    'Change bedsheets',
  ];
  
  void _addToChoreList() {
    setState(() {
      if (selectedDailyChore != null && selectedDailyChore!.isNotEmpty) {
        addedChores.add('$selectedDailyChore (Daily)');
        selectedDailyChore = null;
      }
      
      if (selectedWeeklyChore != null && selectedWeeklyChore!.isNotEmpty) {
        addedChores.add('$selectedWeeklyChore (Weekly)');
        selectedWeeklyChore = null;
      }
    });
    
    // Confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chore added to list!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
  
  void _removeChore(int index) {
    setState(() {
      addedChores.removeAt(index);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chore removed from list'),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.roomName,
                  textAlign: TextAlign.center,
                      style: GoogleFonts.moiraiOne(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 3),
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xFF283C7E),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 150),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.roomImagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(26, 0, 0, 0),
                          blurRadius: 200,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 173, 148),
                          width: 2,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDailyChore,
                          hint: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.sunny,
                                  color: Color.fromARGB(255, 255, 173, 148),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Select Daily Chore',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          items: dailyChores.map((chore) {
                            return DropdownMenuItem<String>(
                              value: chore,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  chore,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedDailyChore = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(255, 160, 35, 35),
                          width: 2,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedWeeklyChore,
                          hint: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: Color.fromARGB(255, 160, 35, 35),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Select Weekly Chore',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          items: weeklyChores.map((chore) {
                            return DropdownMenuItem<String>(
                              value: chore,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  chore,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedWeeklyChore = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: (selectedDailyChore != null || selectedWeeklyChore != null)
                          ? _addToChoreList
                          : null,
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (selectedDailyChore != null || selectedWeeklyChore != null)
                                ? Color.fromARGB(255, 255, 173, 148)
                                : Colors.grey.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: (selectedDailyChore != null || selectedWeeklyChore != null)
                              ? [
                                  const BoxShadow(
                                    color: Color.fromARGB(120, 0, 0, 0),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  )
                                ]
                              : [],
                        ),
                        child: Center(
                          child: Text(
                            'Add to List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (selectedDailyChore != null || selectedWeeklyChore != null)
                                  ? Color.fromARGB(255, 255, 173, 148)
                                  : const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (addedChores.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Chores List:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 160, 35, 35),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color.fromARGB(255, 255, 173, 148),
                                width: 1,
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: addedChores.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                    addedChores[index],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () => _removeChore(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}