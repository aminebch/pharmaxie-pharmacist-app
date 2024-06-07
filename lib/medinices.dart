class MedicinesModel {
  bool available;
  String name;

  MedicinesModel({
    required this.available,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'name': name,
    };
  }

  factory MedicinesModel.fromJson(Map<String, dynamic> json) {
    return MedicinesModel(
      available: json['available'],
      name: json['name'],
    );
  }
}
