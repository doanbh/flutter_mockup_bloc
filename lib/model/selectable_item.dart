import 'package:equatable/equatable.dart';
import 'package:flutter_mockup_bloc/utils/extension/string_extension.dart';

class SelectableItem extends Equatable {
  final String id;
  final String name;
  late final bool isSelected = false;

  SelectableItem({
    required this.id,
    required this.name,
  });

  // để name = '' do api search chỉ cần id
  // factory SelectableItem.fromId(String id) => SelectableItem(id: id, name: '');

  bool get available => id.isNotEmpty && name.isNotEmpty;
  bool get unavailable => available == false;

  factory SelectableItem.unavailable() => SelectableItem(id: '', name: '');

  factory SelectableItem.fromJsonCity(Map<String, dynamic> json) =>
      SelectableItem(
        id: json["code"].toString(),
        name: json["name"],
      );

  @override
  List<Object?> get props => [id, name, isSelected];

  // @override
  // bool get stringify => true;

  // @override
  // String toString() => "$runtimeType(id: $id, name: $name})";
}

extension SelectableItemExt on List<SelectableItem> {
  String get names => this.map((e) => e.name.capitalize).join(', ');

  static bool Function(SelectableItem) equalIdTester(String desiredId) =>
      (value) => desiredId == value.id;
}
