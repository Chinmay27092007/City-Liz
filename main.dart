import 'package:flutter/material.dart';

void main() {
  runApp(const CityMonitorApp());
}

const navy = Color(0xFF0B1425);
const panel = Color(0xFF16243A);
const blue = Color(0xFF2589FF);
const green = Color(0xFF24C78A);
const orange = Color(0xFFFFA43A);
const red = Color(0xFFFF5964);

class CityMonitorApp extends StatelessWidget {
  const CityMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CITY MONITOR',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  int selectedZone = 0;

  final List<String> pages = [
    'Dashboard',
    'City Zones',
    'Sensors',
    'Parallel Processing',
    'Pipeline Simulation',
    'Algorithm Laboratory',
    'Computer Architecture',
    'Incidents',
    'Analytics',
    'Settings',
  ];

  final List<IconData> pageIcons = [
    Icons.dashboard_rounded,
    Icons.location_city,
    Icons.sensors,
    Icons.memory,
    Icons.account_tree,
    Icons.hub,
    Icons.developer_board,
    Icons.warning_amber,
    Icons.analytics,
    Icons.settings,
  ];

  final List<Map<String, dynamic>> zones = [
    {'name': 'Central Business', 'traffic': 72, 'status': 'Warning'},
    {'name': 'Residential', 'traffic': 32, 'status': 'Normal'},
    {'name': 'Industrial', 'traffic': 89, 'status': 'Critical'},
    {'name': 'Educational', 'traffic': 45, 'status': 'Normal'},
    {'name': 'Commercial', 'traffic': 63, 'status': 'Warning'},
    {'name': 'Transport', 'traffic': 95, 'status': 'Critical'},
  ];

  final List<Map<String, dynamic>> incidents = [
    {
      'title': 'Heavy Traffic Congestion',
      'zone': 'Transport Zone',
      'severity': 'High',
      'status': 'In Progress'
    },
    {
      'title': 'Air Quality Alert',
      'zone': 'Industrial Zone',
      'severity': 'Medium',
      'status': 'Assigned'
    },
    {
      'title': 'Sensor Disconnected',
      'zone': 'Commercial Zone',
      'severity': 'Low',
      'status': 'New'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navy,
        title: Row(
          children: [
            const LizardLogo(size: 38),
            const SizedBox(width: 10),
            const Text(
              'CITY MONITOR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.white),
          const SizedBox(width: 18),
          const CircleAvatar(
            backgroundColor: blue,
            child: Text('A'),
          ),
          const SizedBox(width: 15),
        ],
      ),
      drawer: Drawer(
        backgroundColor: panel,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const LizardLogo(size: 75),
              const SizedBox(height: 10),
              const Text(
                'CITY MONITOR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              const Divider(height: 35),
              Expanded(
                child: ListView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      selected: selectedPage == index,
                      selectedTileColor: blue.withOpacity(.2),
                      leading: Icon(
                        pageIcons[index],
                        color: selectedPage == index ? blue : Colors.white70,
                      ),
                      title: Text(pages[index]),
                      onTap: () {
                        setState(() => selectedPage = index);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: _buildPage(),
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (selectedPage) {
      case 0:
        return dashboard();
      case 1:
        return zonePage();
      case 2:
        return sensorPage();
      case 3:
        return parallelPage();
      case 4:
        return pipelinePage();
      case 5:
        return algorithmPage();
      case 6:
        return architecturePage();
      case 7:
        return incidentPage();
      case 8:
        return analyticsPage();
      default:
        return settingsPage();
    }
  }

  Widget heading(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 22),
      ],
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 15),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }

  Widget dashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'City Overview',
          'Smart city operation and monitoring dashboard',
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            statCard('City Zones', '06', Icons.location_city, blue),
            statCard('Connected Sensors', '24', Icons.sensors, green),
            statCard('Active Incidents', '08', Icons.warning, red),
            statCard('System Health', '96%', Icons.monitor_heart, green),
          ],
        ),
        const SizedBox(height: 25),
        sectionTitle('CITY ZONE MONITORING'),
        const SizedBox(height: 12),
        cityVisualization(),
        const SizedBox(height: 25),
        sectionTitle('TRAFFIC CONDITIONS'),
        const SizedBox(height: 12),
        ...zones.map((zone) => zoneTile(zone)),
        const SizedBox(height: 25),
        sectionTitle('RECENT INCIDENTS'),
        ...incidents.map((incident) => incidentTile(incident)),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: blue,
      ),
    );
  }

  Widget cityVisualization() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.grid_view, color: blue),
              SizedBox(width: 8),
              Text(
                'INTERACTIVE CITY ZONES',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: zones.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.55,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final zone = zones[index];
              final color = zoneColor(zone['status']);

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  setState(() {
                    selectedZone = index;
                    selectedPage = 1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(.7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apartment, color: color),
                      const SizedBox(height: 7),
                      Text(
                        'Zone ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        zone['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '${zone['traffic']}% congestion',
                        style: TextStyle(color: color, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Illustrative zone visualization • Simulated data',
            style: TextStyle(color: Colors.white38, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Color zoneColor(String status) {
    if (status == 'Critical') return red;
    if (status == 'Warning') return orange;
    return green;
  }

  Widget zoneTile(Map<String, dynamic> zone) {
    final color = zoneColor(zone['status']);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(zone['name'])),
              Text(
                zone['status'],
                style: TextStyle(color: color),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: zone['traffic'] / 100,
            color: color,
            backgroundColor: Colors.white12,
          ),
          const SizedBox(height: 6),
          Text(
            '${zone['traffic']}% congestion',
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget incidentTile(Map<String, dynamic> incident) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber, color: orange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incident['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  incident['zone'],
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            incident['severity'],
            style: const TextStyle(color: orange),
          ),
        ],
      ),
    );
  }

  Widget zonePage() {
    final zone = zones[selectedZone];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('City Zones', 'Monitor each city zone independently'),
        ...List.generate(zones.length, (index) {
          return InkWell(
            onTap: () => setState(() => selectedZone = index),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedZone == index ? blue.withOpacity(.2) : panel,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedZone == index ? blue : Colors.white10,
                ),
              ),
              child: Text(
                'Zone ${index + 1}  •  ${zones[index]['name']}',
              ),
            ),
          );
        }),
        const SizedBox(height: 20),
        sectionTitle('SELECTED ZONE DETAILS'),
        const SizedBox(height: 12),
        statCard(
          'Traffic Congestion',
          '${zone['traffic']}%',
          Icons.traffic,
          zoneColor(zone['status']),
        ),
        const SizedBox(height: 12),
        statCard('Connected Sensors', '04', Icons.sensors, green),
        const SizedBox(height: 12),
        statCard('Air Quality Index', '78', Icons.air, orange),
        const SizedBox(height: 12),
        statCard('Temperature', '29°C', Icons.thermostat, blue),
      ],
    );
  }

  Widget sensorPage() {
    final sensors = [
      ['Traffic Sensor 01', 'Traffic', 'Online'],
      ['Air Quality Sensor 02', 'Environment', 'Online'],
      ['Temperature Sensor 03', 'Temperature', 'Online'],
      ['Noise Sensor 04', 'Noise', 'Offline'],
      ['CCTV Device 05', 'Monitoring', 'Online'],
      ['Emergency Sensor 06', 'Emergency', 'Online'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Sensor Management', 'Monitor connected city devices'),
        statCard('Total Sensors', '24', Icons.sensors, blue),
        const SizedBox(height: 15),
        ...sensors.map((sensor) {
          final online = sensor[2] == 'Online';
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.sensors, color: online ? green : red),
              title: Text(sensor[0]),
              subtitle: Text(sensor[1]),
              trailing: Text(
                sensor[2],
                style: TextStyle(color: online ? green : red),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget parallelPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Parallel Processing',
          'MIMD and SIMD processing demonstration',
        ),
        sectionTitle('MIMD — MULTIPLE INSTRUCTION, MULTIPLE DATA'),
        const SizedBox(height: 12),
        ...List.generate(6, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.memory, color: blue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Worker ${index + 1} • ${zones[index]['name']}',
                  ),
                ),
                const Text('Ready', style: TextStyle(color: green)),
              ],
            ),
          );
        }),
        const SizedBox(height: 20),
        sectionTitle('SIMD — BULK SENSOR PROCESSING'),
        const SizedBox(height: 12),
        const Text(
          'Apply the same filtering operation to multiple sensor readings.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 15),
        statCard(
          'Sample Sensor Values',
          '42, 56, 78, 91',
          Icons.data_array,
          blue,
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Demo processing completed!'),
              ),
            );
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('Run Processing Demo'),
        ),
        const SizedBox(height: 12),
        const Text(
          'Educational simulation only. Actual Node.js Worker Threads '
          'must be implemented in the backend.',
          style: TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  Widget pipelinePage() {
    final stages = [
      ['FETCH', 'Receive sensor information'],
      ['DECODE', 'Parse and normalize data'],
      ['EXECUTE', 'Run monitoring algorithms'],
      ['MEMORY', 'Update application state'],
      ['WRITE-BACK', 'Update dashboard and alerts'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Pipeline Simulation', 'Five-stage instruction pipeline'),
        ...stages.asMap().entries.map((entry) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: blue.withOpacity(.4)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  child: Text('${entry.key + 1}'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.value[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        entry.value[1],
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        FilledButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pipeline demo started')),
            );
          },
          child: const Text('Start Pipeline'),
        ),
      ],
    );
  }

  Widget algorithmPage() {
    final algorithms = [
      ['Dijkstra Algorithm', 'Shortest path calculation', Icons.route],
      ['A* Search', 'Heuristic-based pathfinding', Icons.search],
      ['Minimum Spanning Tree', 'Infrastructure connectivity', Icons.hub],
      ['Priority Queue', 'Incident prioritization', Icons.priority_high],
      ['Earliest Deadline First', 'Task scheduling', Icons.schedule],
      ['Load Balancing', 'Distribute worker workloads', Icons.balance],
      ['Anomaly Detection', 'Detect unusual sensor readings', Icons.warning],
      ['Sliding Window', 'Analyze traffic trends', Icons.analytics],
      ['Sensor Fusion', 'Combine sensor information', Icons.merge],
      ['MapReduce', 'Aggregate data by zone', Icons.data_object],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Algorithm Laboratory',
          'Explore algorithms used in city monitoring',
        ),
        ...algorithms.map((algorithm) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(13),
            ),
            child: ListTile(
              leading: Icon(algorithm[2] as IconData, color: blue),
              title: Text(algorithm[0] as String),
              subtitle: Text(algorithm[1] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${algorithm[0]} demonstration selected'),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }

  Widget architecturePage() {
    final components = [
      ['CPU', 'Processes instructions and controls execution'],
      ['Control Unit', 'Coordinates operations'],
      ['ALU', 'Performs arithmetic and logic operations'],
      ['Registers', 'Store temporary information'],
      ['Main Memory', 'Stores instructions and data'],
      ['Data Bus', 'Transfers information'],
      ['Address Bus', 'Identifies memory locations'],
      ['Control Bus', 'Carries control signals'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading(
          'Computer Architecture',
          'Architecture concepts used in CITY MONITOR',
        ),
        ...components.map((component) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  component[0],
                  style: const TextStyle(
                    color: blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  component[1],
                  style: const TextStyle(color: Colors.white60),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 15),
        sectionTitle('INSTRUCTION CYCLE'),
        const SizedBox(height: 12),
        const Text(
          'Fetch → Decode → Execute → Memory → Write-back',
          style: TextStyle(fontSize: 16, color: green),
        ),
      ],
    );
  }

  Widget incidentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Incident Management', 'City alerts and emergency tracking'),
        ...incidents.map((incident) => incidentTile(incident)),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () {
            setState(() {
              incidents.add({
                'title': 'New Demo Incident',
                'zone': 'Central Business',
                'severity': 'Medium',
                'status': 'New',
              });
            });
          },
          icon: const Icon(Icons.add),
          label: const Text('Create Demo Incident'),
        ),
      ],
    );
  }

  Widget analyticsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Analytics & Reports', 'City performance overview'),
        statCard('Average Congestion', '66%', Icons.traffic, orange),
        const SizedBox(height: 15),
        statCard('Sensor Availability', '96%', Icons.sensors, green),
        const SizedBox(height: 15),
        statCard('Resolved Incidents', '42', Icons.check_circle, blue),
        const SizedBox(height: 15),
        sectionTitle('ZONE CONGESTION'),
        const SizedBox(height: 15),
        ...zones.map((zone) => zoneTile(zone)),
      ],
    );
  }

  Widget settingsPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading('Settings', 'Application preferences'),
        SwitchListTile(
          value: true,
          onChanged: (_) {},
          title: const Text('Live Simulation'),
          subtitle: const Text('Simulated sensor updates'),
        ),
        SwitchListTile(
          value: true,
          onChanged: (_) {},
          title: const Text('Notifications'),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline, color: blue),
          title: Text('About CITY MONITOR'),
          subtitle: Text('City Operation and Monitoring System'),
        ),
      ],
    );
  }
}

// Original simple monitor-lizard-inspired vector mark.
// Replace with your finalized logo asset when available.
class LizardLogo extends StatelessWidget {
  final double size;

  const LizardLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: LizardPainter(),
      ),
    );
  }
}

class LizardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = blue
      ..style = PaintingStyle.fill;

    final white = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final s = size.width / 100;

    canvas.save();
    canvas.scale(s);

    // Body
    canvas.drawOval(
      const Rect.fromLTWH(25, 38, 48, 25),
      p,
    );

    // Head
    canvas.drawOval(
      const Rect.fromLTWH(65, 35, 28, 18),
      p,
    );

    // Tail
    final tail = Path()
      ..moveTo(27, 48)
      ..quadraticBezierTo(3, 39, 7, 16)
      ..quadraticBezierTo(22, 35, 40, 40)
      ..close();
    canvas.drawPath(tail, p);

    // Four legs
    canvas.drawLine(
      const Offset(35, 55),
      const Offset(24, 76),
      p
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      const Offset(58, 57),
      const Offset(69, 76),
      p
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      const Offset(39, 43),
      const Offset(29, 27),
      p
        ..strokeWidth = 7
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawLine(
      const Offset(60, 43),
      const Offset(72, 25),
      p
        ..strokeWidth = 7
        ..strokeCap = StrokeCap.round,
    );

    // Feet
    canvas.drawCircle(const Offset(23, 77), 5, p);
    canvas.drawCircle(const Offset(70, 77), 5, p);
    canvas.drawCircle(const Offset(28, 27), 4, p);
    canvas.drawCircle(const Offset(73, 24), 4, p);

    // Eye
    canvas.drawCircle(const Offset(83, 41), 3, white);
    canvas.drawCircle(
      const Offset(84, 41),
      1.5,
      Paint()..color = navy,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
