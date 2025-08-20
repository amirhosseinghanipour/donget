class User {
  final String uid;
  final String name;
  final String email;
  final String package;
  final String expiryDate;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.package,
    required this.expiryDate,
  });

  factory User.demo() {
    return const User(
      uid: 'EQE13255',
      name: 'Martin Hamilton',
      email: 'Martin.Hammilton1177@gmail.com',
      package: 'Dolphin',
      expiryDate: '30 November 2025',
    );
  }
}
