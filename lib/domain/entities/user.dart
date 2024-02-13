class UserDomain {
  final String firstName;
  final String lastName;
  final String email;
  final String accessLevel;
  final String password;

  // A cargo de escopo do problena, o accessLevel foi adicionado arbitrariamente aqui. O accessLevel não é um atributo concreto da entidade usuário.
  // Dessa forma, com a definição de novos requisitos
  // e a ampliação do escopo, deve-se considerar criar uma entidade específica para o Nível de Acesso das funcionalidades do app.
  UserDomain(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.accessLevel,
      required this.password});
}
