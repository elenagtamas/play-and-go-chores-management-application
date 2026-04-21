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
                width: 180,
                height: 740,
                child: Stack(
                    children: [
                        Positioned(
                            left: 90,
                            top: 620,
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
                                width: 83,
                                height: 83,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 83,
                                                height: 83,
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
                                            top: 12,
                                            child: SizedBox(
                                                width: 44,
                                                height: 55,
                                                child: Text(
                                                    'M',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFFBFB),
                                                        fontSize: 45,
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
                            left: 110,
                            top: 500,
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
                                height: 71,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 71,
                                                height: 71,
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
                                            top: 8,
                                            child: SizedBox(
                                                width: 44,
                                                height: 45,
                                                child: Text(
                                                    'T',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 45,
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
                            left: 34,
                            top: 399,
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
                                width: 63,
                                height: 63,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 63,
                                                height: 63,
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
                                            left: 12,
                                            top: 7,
                                            child: SizedBox(
                                                width: 39,
                                                height: 37,
                                                child: Text(
                                                    'W',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFF7F7),
                                                        fontSize: 40,
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
                            left: 0,
                            top: 292,
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
                                width: 57,
                                height: 57,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 57,
                                                height: 57,
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
                                            left: 12,
                                            top: 5,
                                            child: SizedBox(
                                                width: 32,
                                                height: 44,
                                                child: Text(
                                                    'T',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFF6F6),
                                                        fontSize: 39,
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
                            left: 81,
                            top: 191,
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
                                width: 82,
                                height: 51,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 51,
                                                height: 51,
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
                                            left: 10,
                                            top: 2,
                                            child: SizedBox(
                                                width: 32,
                                                height: 42,
                                                child: Text(
                                                    'F',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(0xFFFFFAFA),
                                                        fontSize: 38,
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
                            left: 93,
                            top: 75,
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
                                width: 47,
                                height: 47,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 47,
                                                height: 47,
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
                                            left: 8,
                                            top: 0,
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
                            left: 26,
                            top: 0,
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
                                width: 44,
                                height: 44,
                                child: Stack(
                                    children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                                width: 44,
                                                height: 44,
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
                                            left: 6,
                                            top: 0,
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
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weekDates.map((date) {
                        final day = DateFormat('dd').format(date);
                        final month = DateFormat('MMM').format(date);
                        final bool isToday = isSameDay(date, today);
                        return Padding(
                          padding: const EdgeInsets.only(left: 6.0, right: 2.0),
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
                                horizontal: 6,
                              ),
                              minimumSize: const Size(55, 80),
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
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 170,
              left: 0,
              right: 220,
              child: Center(
                  child: Container(
                      width: 156,
                      height: 156,
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
              top: 320,
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
              top: 460,
              left: 0,
              right: 350,
              child: Center(
                  child: Container(
                      width: 66,
                      height: 66,
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
              top: 530,
              left: 0,
              right: 350,
              child: Center(
                  child: Container(
                      width: 66,
                      height: 66,
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
              top: 770,
              left: 0,
              right: 350,
              child: Center(
                  child: Container(
                      width: 66,
                      height: 66,
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
                  top: 335,
                  left: 110,
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
                        width: 38,
                        height: 38,
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
              top: 645,
              left: 220,
              right: 0,
              child: Center(
                  child: Container(
                      width: 55,
                      height: 55,
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
              left: 280,
              right: 0,
              child: Center(
                  child: Container(
                      width: 156,
                      height: 156,
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
              top: 380,
              left: 280,
              right: 0,
              child: Center(
                  child: Container(
                      width: 156,
                      height: 156,
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
              top: 580,
              left: 0,
              right: 280,
              child: Center(
                  child: Container(
                      width: 156,
                      height: 156,
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
              top: 570,
              left: 320,
              right: 0,
              child: Center(
                  child: Container(
                      width: 86,
                      height: 86,
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
              top: 700,
              left: 360,
              right: 0,
              child: Center(
                  child: Container(
                      width: 106,
                      height: 106,
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