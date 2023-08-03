abstract class RegisterEvents {
  const RegisterEvents();
}

class UserNameEvent extends RegisterEvents {
  final String username;
  const UserNameEvent(this.username);
}

class EmailEvent extends RegisterEvents {
  final String email;
  const EmailEvent(this.email);
}
