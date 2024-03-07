import 'package:flutter/material.dart';
import 'package:proje_4/data/local_storage.dart';
import 'package:proje_4/main.dart';
import 'package:proje_4/models/task_model.dart';
import 'package:proje_4/widgets/task_list_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  late final List<Task> allTasks;

  CustomSearchDelegate({required this.allTasks});

  @override

  //arama kısmının sağ tarafındaki ikonları
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            //widgetın verdiği özellik
            query.isEmpty ? null : query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  //arama kısmının sol tarafındaki ikonları
  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //widgetın verdiği özellik
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.red,
        size: 24,
      ),
    );
  }

  //bir arama yapıp arama sonucunda çıkanları nasıl göstereceğinizi
  @override
  Widget buildResults(BuildContext context) {
    //bütün görevlere
    List<Task> filteredList = allTasks
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredList.length > 0
        ? ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              var _oankiListeElemani = filteredList[index];
              return Dismissible(
                  //sildikten sonra arkaya bir yazı eklemek için
                  background: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Bu Görev Silindi")
                    ],
                  ),
                  //silinecek elemanın benzersiz bir değerini key olarak vermek zorundayız
                  key: Key(_oankiListeElemani.id),
                  onDismissed: (direction) {
                    filteredList.removeAt(index);
                    locator<LocalStorage>()
                        .deleteTask(task: _oankiListeElemani);
                  },
                  child: TaskItem(task: _oankiListeElemani));
            },
          )
        : Center(
            child: Text("Aradığınızı Bulamadık"),
          );
  }

  //kullanıcı bir harf iki harf ya da birşey yazmadığında gösterilecekler
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
