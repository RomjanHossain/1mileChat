class User {
  final String bio;
  final String email;
  final int firendsCount;
  final bool isAdmin;
  final String userName;
  final String uid;
  final String profilePic;
  User({
    this.bio,
    this.email,
    this.firendsCount,
    this.isAdmin = false,
    this.uid,
    this.userName,
    this.profilePic,
  });
}
