import 'package:equatable/equatable.dart';

class ItemProject extends Equatable {
  const ItemProject({
    required this.title,
    required this.subtitle,
    required this.about,
    required this.technologies,
    this.routeGif = '',
    this.routeImage = '',
    required this.urlSite,
  });

  final String title;
  final String subtitle;
  final String about;
  final String urlSite;
  final String routeGif;
  final String routeImage;
  final List<String> technologies;

  factory ItemProject.fromJson(Map<String, dynamic> json) {
    return ItemProject(
      title: json['title'],
      subtitle: json['subtitle'],
      urlSite: json['urlSite'],
      about: json['about'],
      routeGif: json['route_gif'],
      routeImage: json['route_image'],
      technologies: json['technologies'],
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      subtitle,
      urlSite,
      about,
      routeGif,
      routeImage,
      technologies,
    ];
  }
}
