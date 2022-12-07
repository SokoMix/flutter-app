class Model
{
  List<String>? _users = []; // формат 'id:login:password:FirstName:LastName'
  void addUser(String user)
  {
    _users?.add(user);
  }

  int getLastId() => (_users ?? []).length;

  List<String> getUsers() => _users ?? [];

  void deleteUser(int id)
  {
    _users?.removeAt(id);
  }
}