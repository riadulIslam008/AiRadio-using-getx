import 'dart:convert';

class MyRadio {
    int id;
    String name;
    String tagline;
    String color;
    String desc;
    String url;
    String icon;
    String image;
    String lang;
    String category;
    bool disliked;
    int order;
  MyRadio({
    required this.id,
    required this.name,
    required this.tagline,
    required this.color,
    required this.desc,
    required this.url,
    required this.icon,
    required this.image,
    required this.lang,
    required this.category,
    required this.disliked,
    required this.order,
  });

  MyRadio copyWith({
    int? id,
    String? name,
    String? tagline,
    String? color,
    String? desc,
    String? url,
    String? icon,
    String? image,
    String? lang,
    String? category,
    bool? disliked,
    int? order,
  }) {
    return MyRadio(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      color: color ?? this.color,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      lang: lang ?? this.lang,
      category: category ?? this.category,
      disliked: disliked ?? this.disliked,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'color': color,
      'desc': desc,
      'url': url,
      'icon': icon,
      'image': image,
      'lang': lang,
      'category': category,
      'disliked': disliked,
      'order': order,
    };
  }

  factory MyRadio.fromMap(Map<String, dynamic> map) {
    return MyRadio(
      id: map['id'],
      name: map['name'],
      tagline: map['tagline'],
      color: map['color'],
      desc: map['desc'],
      url: map['url'],
      icon: map['icon'],
      image: map['image'],
      lang: map['lang'],
      category: map['category'],
      disliked: map['disliked'],
      order: map['order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadio.fromJson(String source) => MyRadio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyRadio(id: $id, name: $name, tagline: $tagline, color: $color, desc: $desc, url: $url, icon: $icon, image: $image, lang: $lang, category: $category, disliked: $disliked, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MyRadio &&
      other.id == id &&
      other.name == name &&
      other.tagline == tagline &&
      other.color == color &&
      other.desc == desc &&
      other.url == url &&
      other.icon == icon &&
      other.image == image &&
      other.lang == lang &&
      other.category == category &&
      other.disliked == disliked &&
      other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      tagline.hashCode ^
      color.hashCode ^
      desc.hashCode ^
      url.hashCode ^
      icon.hashCode ^
      image.hashCode ^
      lang.hashCode ^
      category.hashCode ^
      disliked.hashCode ^
      order.hashCode;
  }
}
