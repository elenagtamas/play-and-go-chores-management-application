import 'package:flutter/material.dart';
import 'package:frontend/screens/room_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Household extends StatelessWidget {
  const Household({super.key});

  void _cancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Detecție tabletă 11 inch
            final isTablet = constraints.maxWidth > 600;
            
            // Scale factor pentru tabletă
            final scale = isTablet ? 1.4 : 1.0;
            
            return Stack(
              children: [
                Positioned(
                  top: 80 * scale,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'SELECT A ROOM',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.moiraiOne(
                        fontSize: 34 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16 * scale,
                  top: 16 * scale,
                  child: GestureDetector(
                    onTap: () => _cancel(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 * scale, vertical: 8 * scale),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF283C7E),
                          fontSize: 16 * scale,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 230 * scale,
                  child: Center(
                    child: SizedBox(
                      width: isTablet ? 800 : double.infinity,
                      height: 510.87 * scale,
                      child: Stack(
                        children: [
                          // Bedroom
                          Positioned(
                            left: isTablet ? (800 - 406) / 2 : 1.68,
                            top: 317 * scale,
                            child: Transform.scale(
                              scale: scale,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Room(
                                        roomName: 'Bedroom',
                                        roomImagePath: 'assets/images/imgBedroom.png',
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 182,
                                  height: 193.87,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 31,
                                        top: 0,
                                        child: Container(
                                          width: 151,
                                          height: 151,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/imgBedroom.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16.89,
                                        top: 109,
                                        child: SizedBox(
                                          width: 115,
                                          height: 45,
                                          child: Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.38),
                                            child: Text(
                                              'bedroom',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Moirai One',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: isTablet ? (800 - 406) / 2 + 227 : 228.68,
                            top: 3 * scale,
                            child: Transform.scale(
                              scale: scale,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Room(
                                        roomName: 'Bathroom',
                                        roomImagePath: 'assets/images/imgBathroom.png',
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 177,
                                  height: 189.87,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 26,
                                        top: 0,
                                        child: Container(
                                          width: 151,
                                          height: 151,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/imgBathroom.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16.89,
                                        top: 105,
                                        child: SizedBox(
                                          width: 115,
                                          height: 45,
                                          child: Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.38),
                                            child: Text(
                                              'bathroom',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Moirai One',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: isTablet ? (800 - 406) / 2 : 0,
                            top: 0,
                            child: Transform.scale(
                              scale: scale,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Room(
                                        roomName: 'Kitchen',
                                        roomImagePath: 'assets/images/imgKitchen.png',
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 183.68,
                                  height: 191.77,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 32.68,
                                        top: 0,
                                        child: Container(
                                          width: 151,
                                          height: 151,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/imgKitchen.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.61,
                                        top: 99.10,
                                        child: SizedBox(
                                          width: 115,
                                          height: 45,
                                          child: Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.48),
                                            child: Text(
                                              'kitchen',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Moirai One',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: isTablet ? (800 - 406) / 2 + 221.68 : 223.36,
                            top: 317 * scale,
                            child: Transform.scale(
                              scale: scale,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Room(
                                        roomName: 'Office Room',
                                        roomImagePath: 'assets/images/imgOfficeroom.png',
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 182.32,
                                  height: 192.51,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 31.32,
                                        top: 0,
                                        child: Container(
                                          width: 151,
                                          height: 151,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/imgOfficeroom.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 15.72,
                                        top: 110.16,
                                        child: SizedBox(
                                          width: 115,
                                          height: 45,
                                          child: Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.36),
                                            child: Text(
                                              'Office Room',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Moirai One',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: isTablet ? (800 - 406) / 2 + 95.66 : 97.34,
                            top: 133 * scale,
                            child: Transform.scale(
                              scale: scale,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Room(
                                        roomName: 'Living Room',
                                        roomImagePath: 'assets/images/imgLivingroom.png',
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 221.34,
                                  height: 230.67,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 21.34,
                                        top: 0,
                                        child: Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/imgLivingroom.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 25.62,
                                        top: 128.20,
                                        child: SizedBox(
                                          width: 115,
                                          height: 45,
                                          child: Transform(
                                            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.61),
                                            child: Text(
                                              'living room',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Moirai One',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}