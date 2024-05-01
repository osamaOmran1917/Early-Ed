class UserModel {
  static const String collectionName = 'users';
  String? id,
      userName,
      email,
      type, // Type has to be one of these three strings ("st", "pa", "te") which refers to either student, parent or teacher. --- .يجب أن يكون النوع نص من هذه الثلاثة نصوص بين الأقواس.
      parentOrChildName,
      password;
  List? mathGrades, scienceGrades, englishGrades, arabicGrades, feedbacks;

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
      this.password, this.feedbacks});

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
            password: data['password'], feedbacks: data['feedbacks']);

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
      'feedbacks': feedbacks
    };
  }
}