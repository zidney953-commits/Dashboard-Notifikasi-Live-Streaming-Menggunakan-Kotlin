import 'package:flutter/material.dart';

import '../models/app_notification.dart';
import '../models/live_stream.dart';
import '../widgets/status_badge.dart';

class HomeScreen extends StatelessWidget {
  final LiveStream live;
  final List<AppNotification> notifications;
  final VoidCallback onOpenLive;
  final VoidCallback onAddNotification;

  const HomeScreen({
    super.key,
    required this.live,
    required this.notifications,
    required this.onOpenLive,
    required this.onAddNotification,
  });

  int get unreadCount => notifications.where((item) => !item.isRead).length;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 500));
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Selamat datang 👋',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            'Pantau status live streaming dan notifikasi dalam satu dashboard.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _SummaryCard(
                  title: 'Status Live',
                  value: live.isLive ? 'LIVE' : 'OFFLINE',
                  icon: Icons.live_tv,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SummaryCard(
                  title: 'Penonton',
                  value: '${live.viewers}',
                  icon: Icons.people_alt_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SummaryCard(
                  title: 'Notifikasi',
                  value: '$unreadCount baru',
                  icon: Icons.notifications_active_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SummaryCard(
                  title: 'Mulai Live',
                  value: live.startedAt,
                  icon: Icons.schedule,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  color: Colors.indigo.shade50,
                  child: const Center(
                    child: Icon(Icons.live_tv, size: 64),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusBadge(isLive: live.isLive),
                      const SizedBox(height: 10),
                      Text(
                        live.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(live.channel),
                      const SizedBox(height: 8),
                      Text(live.description),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: onOpenLive,
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Lihat Detail Live'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Simulasi Sistem',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.notifications_active),
              ),
              title: const Text('Simulasikan notifikasi masuk'),
              subtitle: const Text(
                'Tombol ini meniru notifikasi yang nantinya dikirim FCM.',
              ),
              trailing: IconButton(
                onPressed: onAddNotification,
                icon: const Icon(Icons.add_alert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 12),
            Text(title),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
