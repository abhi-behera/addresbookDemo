class MenuItem {
  final String? fieldId;
  final String? fieldName;
  final String? fieldIcon;
  final String? fieldRoute;
  final bool? isMandate;

  MenuItem({
    required this.fieldId,
    required this.fieldName,
    required this.fieldIcon,
    required this.fieldRoute,
    required this.isMandate,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      fieldId: json['FiedId'],
      fieldName: json['FieldName'],
      fieldIcon: json['FieldIcon'],
      fieldRoute: json['FieldRoute'],
      isMandate: json['IsMandate'],
    );
  }
}
