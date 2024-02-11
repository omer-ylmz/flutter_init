import 'package:bolum_25_json_ve_api_kavramlari/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  late final Future<List<UserModel>>
      _userList; //uygulamada set state olursa her seferinde future çalışmasını böylece engelleriz

  @override
  void initState() {
    super.initState();
    _userList = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Remote Api with Dio",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
          future: _userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  var user = userList[index];
                  return ListTile(
                    title: Text(user.email),
                    subtitle: Text(user.address.toString()),
                    leading: Text(user.id.toString()),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<List<UserModel>> _getUserList() async {
    try {
      //uzak apiden veri çekmek için kullanılır, geri jsona çevirmeye locale göre gerek yoktur
      var response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      List<UserModel> _userList = [];
      if (response.statusCode == 200) {
        //http dünyasında 200 bu işlemin başarılı şekilde yaptığı koddur
        _userList =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      }
      return _userList;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
