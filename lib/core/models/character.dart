import 'dart:convert';

class Character {
  String name;
  String image;
  bool favorite;
  Character({
    this.name,
    this.image,
    this.favorite,
  });

  Character copyWith({
    String name,
    String image,
    bool favorite,
  }) {
    return Character(
      name: name ?? this.name,
      image: image ?? this.image,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'favorite': favorite,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Character(
      name: map['name'],
      image: map['image'],
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() =>
      'Character(name: $name, image: $image, favorite: $favorite)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Character &&
        o.name == name &&
        o.image == image &&
        o.favorite == favorite;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ favorite.hashCode;
}
