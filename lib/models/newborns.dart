class NewBorn {
  String? id;
  String? type;
  Links? links;
  Attributes? attributes;

  NewBorn({id, type, links, attributes});

  NewBorn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['type'] = type;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Links {
  String? self;

  Links({self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['self'] = self;
    return data;
  }
}

class Attributes {
  String? gender;
  String? gestation;
  String? name;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Attributes({gender, gestation, name, userId, createdAt, updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    gestation = json['gestation'];
    name = json['name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['gender'] = gender;
    data['gestation'] = gestation;
    data['name'] = name;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
