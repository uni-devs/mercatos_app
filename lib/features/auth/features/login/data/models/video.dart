import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final int id;
  final String title;
  final String url;
  final int likes;
  final int comments;
  final String shareUrl;

  const Video({
    required this.likes,
    required this.comments,
    required this.shareUrl,
    required this.id,
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        likes,
        comments,
        shareUrl,
      ];
}
