import 'package:flutter/material.dart';
import 'package:frontend/screens/household_screen.dart';
import 'package:intl/intl.dart';
import 'package:frontend/screens/activity_rewards_screen.dart';

class HomeScreen extends StatelessWidget {
  final String? profileImagePath;

  const HomeScreen({super.key, this.profileImagePath});

  List<DateTime> getCurrentWeekDates() {
    DateTime now = DateTime.now();
    int weekday = now.weekday;
    DateTime monday = now.subtract(Duration(days: weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates();
    final today = DateTime.now();

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 90,
            bottom: 90,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/roadWidgetFrame.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 246, 167),
                      Color.fromARGB(255, 255, 173, 148),
                    ],
                  ),
                  border: Border(
                    bottom: BorderSide(color: Colors.yellow, width: 4),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 16,
                      top: 80,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ActivityRewards(
                                profileImagePath: profileImagePath),
                            ),
                          );
                        },
                        child: Container(
                          width: 62,
                          height: 43,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/roadmap.png'),
                              fit: BoxFit.contain,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(26, 0, 0, 0),
                                blurRadius: 15,
                                offset: Offset(0, 6),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 20,
                      child: SizedBox(
                        width: 50,
                        height: 85.07,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 23,
                              top: 20,
                              child: Transform.rotate(
                                angle: -1.76,
                                child: Container(
                                  width: 23.71,
                                  height: 23.71,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/imgStars2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 13,
                              top: 33,
                              child: Transform.rotate(
                                angle: -0.33,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/imgStars1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 55,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ActivityRewards(
                                        profileImagePath: profileImagePath,),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/imgCup.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(26, 0, 0, 0),
                                        blurRadius: 15,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 720,
                height: 1024,
                child: Stack(
                    children: [
                        Positioned(
                            left: 400,
                            top: 850,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 113,
                                height: 103,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 103,
                                                height: 103,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 20,
                                            top: 10,
                                            child: SizedBox(
                                                width: 60,
                                                height: 70,
                                                child: Text(
                                                    'M',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFFBFB),
                                                        fontSize: 60,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w900,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 460,
                            top: 670,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 102,
                                height: 102,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 93,
                                                height: 93,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 16,
                                            top: 8,
                                            child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Text(
                                                    'T',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 60,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w900,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 280,
                            top: 550,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 93,
                                height: 93,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 14,
                                            top: 7,
                                            child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Text(
                                                    'W',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFF7F7),
                                                        fontSize: 52,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w900,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 220,
                            top: 410,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 65,
                                height: 65,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 65,
                                                height: 65,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 16,
                                            top: 3,
                                            child: SizedBox(
                                                width: 32,
                                                height: 44,
                                                child: Text(
                                                    'T',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFF6F6),
                                                        fontSize: 46,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w900,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 370,
                            top: 300,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 62,
                                height: 62,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 62,
                                                height: 62,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(-5, 13),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 15,
                                            top: 2,
                                            child: SizedBox(
                                                width: 32,
                                                height: 42,
                                                child: Text(
                                                    'F',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFFAFA),
                                                        fontSize: 42,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w900,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 450,
                            top: 150,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 52,
                                                height: 52,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 10,
                                            top: 2,
                                            child: SizedBox(
                                                width: 32,
                                                height: 42,
                                                child: Text(
                                                    'S',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 35,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w800,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 320,
                            top: 30,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Household(),
                                    ),
                                  );
                                },
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(0.50, -0.00),
                                                        end: Alignment(0.50, 1.00),
                                                        colors: [Color.fromARGB(255, 255, 173, 148), Color.fromARGB(255, 255, 246, 167)],
                                                    ),
                                                    shape: OvalBorder(),
                                                    shadows: [
                                                        BoxShadow(
                                                            color: Color(0x3F000000),
                                                            blurRadius: 13,
                                                            offset: Offset(0, 18),
                                                            spreadRadius: -6,
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                        Positioned(
                                            left: 10,
                                            top: 2,
                                            child: SizedBox(
                                                width: 32,
                                                height: 42,
                                                child: Text(
                                                    'S',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFF7F7),
                                                        fontSize: 33,
                                                        fontFamily: 'Lilita One',
                                                        fontWeight: FontWeight.w800,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 127,
                            top: 199,
                            child: SizedBox(width: 36, height: 36, child: Stack()),
                        ),
                        Positioned(
                            left: 183,
                            top: 503,
                            child: SizedBox(width: 36, height: 36, child: Stack()),
                        ),
                    ],
                ),
            ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 253, 155, 126),
                      Color.fromARGB(255, 252, 186, 166),
                    ],
                  ),
                  border: const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 160, 35, 35),
                      width: 4,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, -4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculăm lățimea disponibilă pentru fiecare buton
                      final availableWidth = constraints.maxWidth;
                      final buttonWidth = availableWidth / 7; // Împărțim egal în 7 părți
                      
                      return Row(
                        children: weekDates.map((date) {
                          final day = DateFormat('dd').format(date);
                          final month = DateFormat('MMM').format(date);
                          final bool isToday = isSameDay(date, today);
                          
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isToday
                                      ? const Color.fromARGB(255, 255, 246, 167)
                                      : const Color.fromARGB(255, 253, 155, 126),
                                  foregroundColor: Colors.black,
                                  elevation: isToday ? 8 : 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                  minimumSize: Size(buttonWidth, 80),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      day,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      month,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        color: Color.fromARGB(255, 58, 58, 58),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 170,
              left: 0,
              right: 550,
              child: Center(
                  child: Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img1.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 350,
              left: 0,
              right: 320,
              child: Center(
                  child: Container(
                      width: 106,
                      height: 106,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img6.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 500,
              left: 0,
              right: 600,
              child: Center(
                  child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img3.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 650,
              left: 0,
              right: 650,
              child: Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img5.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 1050,
              left: 0,
              right: 650,
              child: Center(
                  child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img9.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              if (profileImagePath != null)
                Positioned(
                  top: 445,
                  left: 160,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ActivityRewards(
                              profileImagePath: profileImagePath
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 160, 35, 35),
                            width: 3,
                          ),
                          image: DecorationImage(
                            image: AssetImage(profileImagePath!),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(22, 0, 0, 0),
                              offset: Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
              top: 825,
              left: 420,
              right: 0,
              child: Center(
                  child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/btnClaireProfile.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 170,
              left: 550,
              right: 0,
              child: Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img4.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 500,
              left: 400,
              right: 0,
              child: Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img2.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 820,
              left: 0,
              right: 500,
              child: Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img10.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 750,
              left: 600,
              right: 0,
              child: Center(
                  child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img7.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
              Positioned(
              top: 960,
              left: 600,
              right: 0,
              child: Center(
                  child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img8.png'),
                              fit: BoxFit.cover,
                          ),
                          boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(28, 0, 0, 0),
                                  blurRadius: 70,
                                  offset: Offset(0, 2),
                                  spreadRadius: 2,
                              )
                          ],
                      ),
                  ),
                ),
              ),
          if (profileImagePath != null)
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 160, 35, 35),
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: AssetImage(profileImagePath!),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(22, 0, 0, 0),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}