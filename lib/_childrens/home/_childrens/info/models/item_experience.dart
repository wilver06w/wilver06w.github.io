import 'package:equatable/equatable.dart';

class ItemExperience extends Equatable {
  const ItemExperience({
    required this.title,
    required this.profile,
    required this.date,
    required this.description,
    required this.resposabilitys,
  });

  final String title;
  final String profile;
  final String date;
  final String description;
  final List<String> resposabilitys;

  factory ItemExperience.fromJson(Map<String, dynamic> json) {
    return ItemExperience(
      title: json['title'],
      profile: json['profile'],
      date: json['date'],
      description: json['description'],
      resposabilitys: json['resposabilitys'],
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      profile,
      date,
      description,
      resposabilitys,
    ];
  }
}
