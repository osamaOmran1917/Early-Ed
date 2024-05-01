class UserModel {
  static const String collectionName = 'users';
  String? id,
      userName,
      email,
      type, // Type has to be one of these four strings ("st", "pa", "te", "ad") which refers to either student, parent or teacher. --- .يجب أن يكون النوع نص من هذه الأربعة نصوص بين الأقواس.
      parentOrChildName,
      password,
      imageUrl,
      subject;
  int? level, age;
  List? mathGrades, scienceGrades, englishGrades, arabicGrades;

  UserModel(
      {this.id,
      this.userName,
      this.email,
      this.type,
      this.parentOrChildName,
      this.mathGrades,
      this.scienceGrades,
      this.englishGrades,
      this.arabicGrades,
      this.password,
      this.imageUrl,
      this.subject,
      this.level,
      this.age});

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            userName: data['userName'],
            email: data['email'],
            type: data['type'],
            parentOrChildName: data['parentOrChildName'],
            mathGrades: data['mathGrades'],
            scienceGrades: data['scienceGrades'],
            englishGrades: data['englishGrades'],
            arabicGrades: data['arabicGrades'],
            password: data['password'],
            imageUrl: data['imageUrl'],
            subject: data['subject'],
            level: data['level'],
            age: data['age']);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'type': type,
      'parentOrChildName': parentOrChildName,
      'mathGrades': mathGrades,
      'scienceGrades': scienceGrades,
      'englishGrades': englishGrades,
      'arabicGrades': arabicGrades,
      'password': password,
      'imageUrl': imageUrl,
      'subject': subject,
      'level': level,
      'age': age
    };
  }
}