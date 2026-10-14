class LiveStream {
  final String id;
  final String title;
  final String channel;
  final String thumbnail;
  final String startedAt;
  final int viewers;
  final bool isLive;
  final String description;

  const LiveStream({
    required this.id,
    required this.title,
    required this.channel,
    required this.thumbnail,
    required this.startedAt,
    required this.viewers,
    required this.isLive,
    required this.description,
  });
}
