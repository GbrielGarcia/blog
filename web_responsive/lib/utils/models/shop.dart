class ShopModel {
  final String? id;
  final String? nameShop;
  final String? description;
  final String? countryShop;
  final String? longUrl;
  final String? shortUrl;
  final String? phone;
  final String? phoneCode;
  final String? fontText;
  final String? shopLogo;
  final String? colorText;
  final String? colorBackground;
  final String? colorIcons;

  ShopModel({
    this.id,
    this.nameShop,
    this.description,
    this.countryShop,
    this.longUrl,
    this.shortUrl,
    this.phone,
    this.phoneCode,
    this.fontText,
    this.shopLogo,
    this.colorText,
    this.colorBackground,
    this.colorIcons,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameShop': nameShop,
      'description': description,
      'countryShop': countryShop,
      'longUrl': longUrl,
      'shortUrl': shortUrl,
      'phone': phone,
      'phoneCode': phoneCode,
      'fontText': fontText,
      'shopLogo': shopLogo,
      'colorText': colorText,
      'colorBackground': colorBackground,
      'colorIcons': colorIcons,
    };
  }

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      id: map['id'],
      nameShop: map['nameShop'],
      description: map['description'],
      countryShop: map['countryShop'],
      longUrl: map['longUrl'],
      shortUrl: map['shortUrl'],
      phone: map['phone'],
      phoneCode: map['phoneCode'],
      fontText: map['fontText'],
      shopLogo: map['shopLogo'],
      colorText: map['colorText'],
      colorBackground: map['colorBackground'],
      colorIcons: map['colorIcons'],
    );
  }

  ShopModel copyWith({
    String? id,
    String? nameShop,
    String? description,
    String? countryShop,
    String? longUrl,
    String? shortUrl,
    String? phone,
    String? phoneCode,
    String? shopLogo,
    String? colorText,
    String? colorBackground,
    String? colorIcons,
  }) {
    return ShopModel(
      id: id ?? this.id,
      nameShop: nameShop ?? this.nameShop,
      description: description ?? this.description,
      countryShop: countryShop ?? this.countryShop,
      longUrl: longUrl ?? this.longUrl,
      shortUrl: shortUrl ?? this.shortUrl,
      phone: phone ?? this.phone,
      phoneCode: phoneCode ?? this.phoneCode,
      shopLogo: shopLogo ?? this.shopLogo,
      colorText: colorText ?? this.colorText,
      colorBackground: colorBackground ?? this.colorBackground,
      colorIcons: colorIcons ?? this.colorIcons,
    );
  }
}
