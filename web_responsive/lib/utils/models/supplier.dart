class SupplierModel {
  final String? id;
  final String? nameSupplier;
  final String? shorShopLink;
  final String? email;
  final String? password;
  final DateTime? registrationDate;

  SupplierModel({
    this.id,
    this.nameSupplier,
    this.shorShopLink,
    this.email,
    this.password,
    this.registrationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameSupplier': nameSupplier,
      'shorShopLink': shorShopLink,
      'email': email,
      'password': password,
      'registrationDate': registrationDate?.toIso8601String(),
    };
  }

  factory SupplierModel.fromMap(Map<String, dynamic> map) {
    return SupplierModel(
      id: map['id'],
      nameSupplier: map['nameSupplier'],
      shorShopLink: map['shorShopLink'],
      email: map['email'],
      password: map['password'],
      registrationDate: map['registrationDate'] != null
          ? DateTime.parse(map['registrationDate'])
          : null,
    );
  }

  SupplierModel copyWith({
    String? id,
    String? nameSupplier,
    String? shorShopLink,
    String? email,
    String? password,
    DateTime? registrationDate,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      nameSupplier: nameSupplier ?? this.nameSupplier,
      shorShopLink: shorShopLink ?? this.shorShopLink,
      email: email ?? this.email,
      password: password ?? this.password,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }
}
