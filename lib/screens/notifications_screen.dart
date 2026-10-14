import 'package:flutter/material.dart';

import '../models/app_notification.dart';

class NotificationsScreen extends StatefulWidget {
  final List<AppNotification> notifications;
  final VoidCallback onMarkAllRead;

  const NotificationsScreen({
    super.key,
    required this.notifications,
    required this.onMarkAllRead,
  });

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Notifikasi',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: widget.onMarkAllRead,
                child: const Text('Tandai semua dibaca'),
              ),
            ],
          ),
        ),
        Expanded(
          child: widget.notifications.isEmpty
              ? const Center(child: Text('Belum ada notifikasi.'))
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: widget.notifications.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = widget.notifications[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(
                            item.isRead
                                ? Icons.notifications_none
                                : Icons.notifications_active,
                          ),
                        ),
                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: item.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('${item.message}\n${item.time}'),
                        isThreeLine: true,
                        onTap: () {
                          setState(() {
                            item.isRead = true;
                          });
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
