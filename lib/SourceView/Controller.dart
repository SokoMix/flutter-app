import 'Model.dart';

class Controller
{
  late Model model;
  Controller()
  {
    model = Model();
  }

  void addUser(String login, String pswd, String fName, String sName)
  {
    model.addUser('${model.getLastId()}:$login:$pswd:$fName:$sName');
  }

  void deleteUser(String id)
  {
    List<String> users = model.getUsers();
    for (int i = 0; i < users.length; i++)
    {
      if (users[i].split(':')[0] == id)
      {
        model.deleteUser(i);
        break;
      }
    }
  }

  int loginUser(String login, String pswd)
  {
    List<String> users = model.getUsers();
    for (int i = 0; i < users.length; i++)
      {
        List<String> temp = users[i].split(':');
        if (temp[1] == login && temp[2] == pswd)
          {
            return int.parse(temp[0]);
          }
      }
    return -1;
  }
}