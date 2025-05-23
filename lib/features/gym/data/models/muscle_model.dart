import 'package:glow_fit_app/features/gym/domain/entities/muscle.dart';

class MuscleModel extends Muscle {
  MuscleModel({required String name}) : super(name: name);

  factory MuscleModel.fromJson(Map<String, dynamic> json) {
    return MuscleModel(name: json['name']);
  }

  Map<String, dynamic> toJson() => {'name': name};
}
