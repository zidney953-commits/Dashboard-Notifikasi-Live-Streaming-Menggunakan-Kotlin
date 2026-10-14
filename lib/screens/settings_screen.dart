import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Pengaturan',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
                title: const Text('Notifikasi Live'),
                subtitle: const Text('Terima pemberitahuan saat live dimulai.'),
              ),
              const Divider(height: 1),
              SwitchListTile(
                value: soundEnabled,
                onChanged: (value) {
                  setState(() {
                    soundEnabled = value;
                  });
                },
                title: const Text('Suara Notifikasi'),
                subtitle: const Text('Aktifkan suara saat notifikasi masuk.'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Tentang Aplikasi'),
            subtitle: Text(
              'Prototype Dashboard Notifikasi Live Streaming\nDikembangkan menggunakan Flutter.',
            ),
          ),
        ),
      ],
    );
  }
}
