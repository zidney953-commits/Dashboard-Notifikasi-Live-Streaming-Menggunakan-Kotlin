import 'package:flutter/material.dart';

import 'models/app_notification.dart';
import 'models/live_stream.dart';
import 'screens/home_screen.dart';
import 'screens/live_detail_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const LiveStreamingApp());
}

class LiveStreamingApp extends StatefulWidget {
  const LiveStreamingApp({super.key});

  @override
  State<LiveStreamingApp> createState() => _LiveStreamingAppState();
}

class _LiveStreamingAppState extends State<LiveStreamingApp> {
  int selectedIndex = 0;

  final List<AppNotification> notifications = [
    AppNotification(
      title: 'Live streaming dimulai',
      message: 'Kajian Teknologi Informasi sedang berlangsung sekarang.',
      time: 'Baru saja',
    ),
    AppNotification(
      title: 'Jadwal live hari ini',
      message: 'Siaran berikutnya dimulai pukul 19.30 WIB.',
      time: '10 menit lalu',
      isRead: true,
    ),
  ];

  final LiveStream currentLive = const LiveStream(
    id: 'LIVE-001',
    title: 'Kajian Teknologi Informasi',
    channel: 'Channel Kampus',
    thumbnail: '',
    startedAt: '08.30 WIB',
    viewers: 128,
    isLive: true,
    description:
        'Siaran langsung kegiatan dan informasi teknologi untuk mahasiswa.',
  );

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(
        live: currentLive,
        notifications: notifications,
        onOpenLive: () => openLiveDetail(),
        onAddNotification: addSimulationNotification,
      ),
      NotificationsScreen(
        notifications: notifications,
        onMarkAllRead: markAllNotificationsRead,
      ),
      SettingsScreen(),
    ];
  }

  void openLiveDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LiveDetailScreen(live: currentLive)),
    );
  }

  void addSimulationNotification() {
    setState(() {
      notifications.insert(
        0,
        AppNotification(
          title: 'Notifikasi baru',
          message: 'Sistem menerima pembaruan live streaming.',
          time: 'Baru saja',
        ),
      );
      selectedIndex = 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notifikasi simulasi berhasil ditambahkan.'),
      ),
    );
  }

  void markAllNotificationsRead() {
    setState(() {
      for (final notification in notifications) {
        notification.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LiveStream Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LiveStream Dashboard'),
          centerTitle: false,
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none),
              selectedIcon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}
