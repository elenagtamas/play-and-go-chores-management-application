import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityRewards extends StatefulWidget {
  final String? profileImagePath;

  const ActivityRewards({
    super.key,
    this.profileImagePath,
  });

  @override
  State<ActivityRewards> createState() => _ActivityRewardsState();
}

class _ActivityRewardsState extends State<ActivityRewards>
    with SingleTickerProviderStateMixin {
  
  // List for chores due today
  final List<Chore> _dueTodayChores = [
    Chore(name: "Wash dishes", isCompleted: false, points: 10),
    Chore(name: "Take out trash", isCompleted: false, points: 5),
    Chore(name: "Vacuum living room", isCompleted: false, points: 15),
    Chore(name: "Water plants", isCompleted: false, points: 8),
  ];
  
  // List for completed chores
  final List<Chore> _completedChores = [
    Chore(name: "Make bed", isCompleted: true, points: 10),
    Chore(name: "Clean desk", isCompleted: true, points: 8),
    Chore(name: "Do homework", isCompleted: true, points: 20),
  ];
  
  // Points necessary to reach £50
  final int totalPointsNeeded = 50;
  
  // Computation of total points obtained
  int get totalEarnedPoints {
    int total = 0;
    for (var chore in _completedChores) {
      total += chore.points;
    }
    return total;
  }
  
  // Percentage progress computation (maxim 100%)
  double get progress {
    double progressValue = totalEarnedPoints / totalPointsNeeded;
    return progressValue > 1.0 ? 1.0 : progressValue;
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getTodayDate() {
    return DateFormat('d MMMM').format(DateTime.now());
  }
  
  // Function for selecting/unselecting a chore
  void _toggleChoreStatus(Chore chore, bool isDueToday) {
    setState(() {
      if (isDueToday) {
        // Moving the chore from due today to completed
        chore.isCompleted = true;
        _dueTodayChores.remove(chore);
        _completedChores.add(chore);
      } else {
        // And vice-versa
        chore.isCompleted = false;
        _completedChores.remove(chore);
        _dueTodayChores.add(chore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 255, 246, 167),
                        Color.fromARGB(255, 255, 173, 148),
                      ],
                    ),
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.yellow,
                        width: 4,
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 95,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 160, 35, 35),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              getTodayDate(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Calibri',
                              ),
                            ),
                          ),
                        ),
                        if (widget.profileImagePath != null)
                          Positioned(
                            top: 60,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromARGB(255, 160, 35, 35),
                                      width: 3,
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(widget.profileImagePath!),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(22, 0, 0, 0),
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: 95,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 160, 35, 35),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${totalEarnedPoints}pts/£$totalPointsNeeded',
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Progress",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 160, 35, 35),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          final value = _animation.value * progress;
                          return Container(
                            height: 14, 
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: const Color(0x22000000)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFFD54F).withOpacity(0.6),
                                  blurRadius: 18,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0, end: value),
                                      duration: const Duration(milliseconds: 500),
                                      builder: (context, val, _) {
                                        return FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: val,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFFFD800),
                                                  Color(0xFFFF8A00),
                                                  Color(0xFFFFD800),
                                                ],
                                                stops: [0.0, 0.5, 1.0],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: ShaderMask(
                                      shaderCallback: (rect) {
                                        return LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white.withOpacity(0.0),
                                            Colors.white.withOpacity(0.3),
                                            Colors.white.withOpacity(0.0),
                                          ],
                                          stops: const [0.4, 0.5, 0.6],
                                        ).createShader(rect);
                                      },
                                      blendMode: BlendMode.srcATop,
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$totalEarnedPoints points earned out of $totalPointsNeeded',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 255, 173, 148).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 160, 35, 35),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.today,
                              color: const Color.fromARGB(255, 160, 35, 35),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Due Today (${_dueTodayChores.length})",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Calibri',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 160, 35, 35),
                            width: 1,
                          ),
                        ),
                        child: _dueTodayChores.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    "No chores due today!",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Calibri',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _dueTodayChores.length,
                                itemBuilder: (context, index) {
                                  final chore = _dueTodayChores[index];
                                  return CheckboxListTile(
                                    value: chore.isCompleted,
                                    onChanged: (bool? value) {
                                      _toggleChoreStatus(chore, true);
                                    },
                                    title: Text(
                                      chore.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Calibri',
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${chore.points} points',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    secondary: const Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 156, 94, 0),
                                    ),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: Colors.green,
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Completed (${_completedChores.length})",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Calibri',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        child: _completedChores.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    "No completed chores yet!",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Calibri',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _completedChores.length,
                                itemBuilder: (context, index) {
                                  final chore = _completedChores[index];
                                  return CheckboxListTile(
                                    value: chore.isCompleted,
                                    onChanged: (bool? value) {
                                      _toggleChoreStatus(chore, false);
                                    },
                                    title: Text(
                                      chore.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Calibri',
                                        decoration: chore.isCompleted
                                            ? TextDecoration.lineThrough
                                            : null,
                                        color: chore.isCompleted
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${chore.points} points earned',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                    secondary: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: Colors.green,
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // Feedback message for reaching the target
                if (progress >= 1.0)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.celebration, color: Colors.green, size: 30),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Congratulations! You\'ve earned £50!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

// Chore model
class Chore {
  final String name;
  bool isCompleted;
  final int points; // Points given for this chore
  
  Chore({
    required this.name,
    required this.isCompleted,
    required this.points,
  });
}