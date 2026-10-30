
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortalApp());
}

const Color purple = Color(0xFF8062B9);
const Color pink = Color(0xFFE7A6C8);
const Color skyBlue = Color(0xFF8BC9E8);
const Color backgroundColor = Color(0xFFF8F3FC);

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
        ),
        scaffoldBackgroundColor: backgroundColor,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case '/':
            page = const HomePage();
            break;
          case '/profile':
            page = const ProfilePage();
            break;
          case '/details':
            page = const DetailsPage();
            break;
          default:
            page = const HomePage();
        }

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation,
                  secondaryAnimation) =>
              page,
          transitionDuration:
              const Duration(milliseconds: 600),
          reverseTransitionDuration:
              const Duration(milliseconds: 400),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic,
            );

            return FadeTransition(
              opacity: curved,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.12, 0),
                  end: Offset.zero,
                ).animate(curved),
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}

// HOME PAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool expanded = false;
  String selectedCourse = 'Flutter';

  final List<Map<String, dynamic>> courses = [
    {
      'name': 'Flutter',
      'subtitle': 'Mobile Application Development',
      'icon': Icons.phone_android,
      'color': Colors.blue,
    },
    {
      'name': 'Cloud Computing',
      'subtitle': 'Cloud Technologies and Services',
      'icon': Icons.cloud,
      'color': Colors.teal,
    },
    {
      'name': 'Programming',
      'subtitle': 'Data Structures and Algorithms',
      'icon': Icons.code,
      'color': Colors.deepOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Portal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: purple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF9F1FC),
              Color(0xFFEDE5FA),
              Color(0xFFE5F5FC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF554174),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Your academic space, all in one place.',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 22),

            // Animated student profile card
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutCubic,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    purple,
                    Color(0xFFA984D0),
                    Color(0xFFB9A0DC),
                  ],
                ),
                borderRadius: BorderRadius.circular(
                    expanded ? 30 : 20),
                boxShadow: [
                  BoxShadow(
                    color: purple.withOpacity(0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Hero(
                    tag: 'studentAvatar',
                    child: const CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: purple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mercy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Computer Science and Engineering',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  // Extra animated information
                  AnimatedCrossFade(
                    firstChild: const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Divider(color: Colors.white54),
                          Text(
                            'Flutter Laboratory',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Student Dashboard',
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondChild: const SizedBox(
                      width: double.infinity,
                    ),
                    crossFadeState: expanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:
                        const Duration(milliseconds: 400),
                  ),

                  const SizedBox(height: 15),

                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    icon: Icon(
                      expanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                    ),
                    label: Text(
                      expanded
                          ? 'Show Less'
                          : 'View More',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'My Courses',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF554174),
              ),
            ),

            const SizedBox(height: 12),

            // Animated course cards
            ...courses.map((course) {
              bool selected =
                  selectedCourse == course['name'];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCourse = course['name'];
                  });
                },
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: selected
                        ? (course['color'] as Color)
                            .withOpacity(0.16)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(
                        selected ? 22 : 15),
                    border: Border.all(
                      color: selected
                          ? course['color'] as Color
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            course['color'] as Color,
                        child: Icon(
                          course['icon'] as IconData,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['name'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              course['subtitle'] as String,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedSwitcher(
                        duration:
                            const Duration(milliseconds: 300),
                        child: Icon(
                          selected
                              ? Icons.check_circle
                              : Icons.arrow_forward_ios,
                          key: ValueKey(selected),
                          color: course['color'] as Color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 8),

            // Selected course information
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Container(
                key: ValueKey(selectedCourse),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Currently selected: $selectedCourse',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: purple,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Navigation buttons
            const Text(
              'Explore Student Portal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF554174),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.person),
              label: const Text('View Student Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
            ),

            const SizedBox(height: 10),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              icon: const Icon(Icons.school),
              label: const Text('View Academic Details'),
              style: OutlinedButton.styleFrom(
                foregroundColor: purple,
                padding: const EdgeInsets.all(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE7E1F5),
              Color(0xFFFCE6F2),
              Color(0xFFE0F4FC),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'studentAvatar',
                      child: const CircleAvatar(
                        radius: 55,
                        backgroundColor: purple,
                        child: Icon(
                          Icons.person,
                          size: 65,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Student Profile',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: purple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Mercy',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'B.Tech - Computer Science and Engineering',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Flutter Laboratory',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 25),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/details');
                      },
                      icon: const Icon(Icons.info_outline),
                      label: const Text('View Academic Details'),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// DETAILS PAGE
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> details = [
      {
        'title': 'Flutter',
        'subtitle': 'Mobile Application Development',
        'icon': Icons.phone_android,
      },
      {
        'title': 'Cloud Computing',
        'subtitle': 'Cloud Technologies and Services',
        'icon': Icons.cloud,
      },
      {
        'title': 'Programming',
        'subtitle': 'Data Structures and Algorithms',
        'icon': Icons.code,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Details'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE1F3FC),
              Color(0xFFF5E8F6),
              Color(0xFFFCE8F2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Icon(
              Icons.school_rounded,
              size: 75,
              color: purple,
            ),
            const SizedBox(height: 12),
            const Text(
              'Academic Overview',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: purple,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explore the subjects in the student dashboard.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            ...details.map((item) {
              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.all(12),
                  leading: CircleAvatar(
                    backgroundColor: skyBlue,
                    child: Icon(
                      item['icon'] as IconData,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    item['subtitle'] as String,
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


