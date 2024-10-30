import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:testing_ui/Widgets/Mysizedbox.dart';
import 'package:testing_ui/Widgets/line_chart.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Overview heading
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Overview',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30)),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.analytics_outlined,size: 25,),
                            ))
                      ],
                    ),
                  ),
                  MySizedBox(h: 0.02, w: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            EvaIcons.download,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'This Week',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                              Icon(
                                EvaIcons.arrow_ios_downward,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const MySizedBox(h: 0.02, w: 0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildSocialCard(
                      context,
                      icon: Bootstrap.facebook,
                      iconColor: Colors.blue,
                      userName: 'mitchell.cooper',
                      platform: 'Facebook',
                      followers: '353,49K',
                      growth: '1.43%',
                      growthColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildSocialCard(
                      context,
                      icon: Bootstrap.instagram,
                      iconGradient: [
                        const Color(0xFF833AB4),
                        const Color(0xFFFBB03B),
                        const Color(0xFFFD1D1D),
                      ],
                      userName: 'mitchell.cooper',
                      platform: 'Instagram',
                      followers: '253,75K',
                      growth: '2.51%',
                      growthColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const MySizedBox(h: 0.02, w: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Followers
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Followers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25)),
                                Image.asset(
                                  'assets/two-dots.png',
                                  height: 20,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("254,68K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.withOpacity(0.1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Wrap(
                                    children: [
                                      Icon(Icons.arrow_upward_outlined,
                                          color: Colors.green),
                                      Text(
                                        '6.18%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildProgressBar('M', 0.4, Colors.deepPurple),
                              _buildProgressBar('T', 0.5, Colors.deepPurple),
                              _buildProgressBar('W', 0.6, Colors.deepPurple),
                              _buildProgressBar('T', 0.8, Colors.orange),
                              _buildProgressBar('F', 0.45, Colors.deepPurple),
                              _buildProgressBar('S', 0.25, Colors.deepPurple),
                              _buildProgressBar('S', 0.255, Colors.deepPurple),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '834',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 20),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '152',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      'Unfollowed',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 20),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const MySizedBox(h: 0.02, w: 0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Gender',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25)),
                                Image.asset(
                                  'assets/two-dots.png',
                                  height: 20,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                size: const Size(200, 200),
                                painter: CircularProgressBarPainter(),
                              ),
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/girl_emoji.png'),
                              ),
                              const Positioned(
                                left: -8,
                                top: 30,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: Center(
                                    child: Text(
                                      '42%',
                                      style: TextStyle(
                                        // color: Colors.deepPurple,
                                        //  fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: -10,
                                bottom: 30,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: Center(
                                    child: Text(
                                      '58%',
                                      style: TextStyle(
                                        // color: Colors.orange,
                                        //  fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        size: 20,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      'Male:',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 20),
                                    ),
                                    Text(
                                      ' 325k',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.circle_outlined,
                                        size: 20,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    Text(
                                      'Female:',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 20),
                                    ),
                                    Text(
                                      ' 834k',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  MySizedBox(h: 0.02, w: 0),

                  const MySizedBox(h: 0.02, w: 0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Statistics',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25)),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.78,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'This Week',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                  Icon(
                                    EvaIcons.arrow_ios_downward,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: FlutterSalesGraph(
                                salesData: [200, 80, 150, 0, 160, 70, 220],
                                labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S']),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MySizedBox(h: 0.03, w: 0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String day, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.045,
            height: MediaQuery.of(context).size.height *
                0.17, // Increased height of the progress bar
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300, // Background color for the bar
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: progress, // Fill from bottom to top
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6), // Space between progress bar and day label
          Text(
            day,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialCard(BuildContext context,
      {required IconData icon,
      Color? iconColor,
      List<Color>? iconGradient,
      required String userName,
      required String platform,
      required String followers,
      required String growth,
      required Color growthColor}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.03,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: iconGradient != null
                            ? LinearGradient(
                                colors: iconGradient,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          color: iconColor ?? Colors.white,
                          size: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(platform),
                  ],
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  followers,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: growthColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Wrap(
                    children: [
                      Icon(
                        Icons.arrow_upward_outlined,
                        color: growthColor,
                      ),
                      Text(
                        growth,
                        style: TextStyle(
                          color: growthColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 14),
            child: Text(
              'Followers',
              style: TextStyle(fontSize: 19, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20.0;
    double radius = (size.width / 2) - (strokeWidth / 2);

    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint orangePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint purplePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the orange arc (58%)
    double orangeArcAngle = 2 * 3.141592653589793 * 0.58;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      orangeArcAngle,
      false,
      orangePaint,
    );

    // Draw the purple arc (42%)
    double purpleArcAngle = 2 * 3.141592653589793 * 0.42;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2 + orangeArcAngle,
      purpleArcAngle,
      false,
      purplePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
