import 'package:flutter/material.dart';

import '../models/live_stream.dart';
import '../widgets/status_badge.dart';

class LiveDetailScreen extends StatelessWidget {
  final LiveStream live;

  const LiveDetailScreen({super.key, required this.live});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Live Streaming')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: Icon(Icons.live_tv, size: 80)),
          ),
          const SizedBox(height: 20),
          StatusBadge(isLive: live.isLive),
          const SizedBox(height: 12),
          Text(
            live.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(live.channel),
          const SizedBox(height: 20),
          _InfoTile(icon: Icons.schedule, title: 'Mulai', value: live.startedAt),
          _InfoTile(
            icon: Icons.people,
            title: 'Penonton',
            value: '${live.viewers} orang',
          ),
          const SizedBox(height: 12),
          Text(
            'Deskripsi',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(live.description),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: live.isLive
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pada versi berikutnya tombol ini diarahkan ke link live.'),
                        ),
                      );
                    }
                  : null,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Buka Live Streaming'),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
