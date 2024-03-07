// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:proje_4/data/local_storage.dart';
import 'package:proje_4/main.dart';
import 'package:proje_4/models/task_model.dart';
import 'package:proje_4/widgets/custom_search_delegate.dart';
import 'package:proje_4/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;
  late LocalStorage _localStorage;

  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _allTasks = <Task>[];
    _getAllTaskFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                _showAddTaskBottomSheet(context);
              },
              child: const Text("Bugün neler yapacaksın")),
          //iphonelerden başlık ortaya geldiği için onu engellemeye çalıştık
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  _showSearchPage();
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  _showAddTaskBottomSheet(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: _allTasks.isNotEmpty
            ? ListView.builder(
                itemCount: _allTasks.length,
                itemBuilder: (context, index) {
                  var _oankiListeElemani = _allTasks[index];
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
                        _allTasks.removeAt(index);
                        _localStorage.deleteTask(task: _oankiListeElemani);
                        setState(() {});
                      },
                      child: TaskItem(task: _oankiListeElemani));
                },
              )
            : const Center(
                child: Text("Hadi Görev Ekle"),
              ));
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    //küçük bir pencere açan ekran
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            //keyboard açılınca hemen onun üstünde yer alması için
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: TextField(
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: "Görev Nedir ?", border: InputBorder.none),
              onSubmitted: (value) {
                Navigator.of(context).pop();
                if (value.length >= 3) {
                  _selectTime(context, value);
                }
              },
            ),
          ),
        );
      },
    );
  }

  //Saat seçme işlemimiz
  Future<void> _selectTime(BuildContext context, String taskName) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      var yeniEklenecekGorev =
          Task.create(name: taskName, createdAt: selectedTime);

      _allTasks.insert(0, yeniEklenecekGorev);
      await _localStorage.addTask(task: yeniEklenecekGorev);
      setState(() {});
    }
  }

  void _getAllTaskFromDb() async {
    _allTasks = await _localStorage.getAllTask();
    setState(() {});
  }

  void _showSearchPage() async {
    await showSearch(
        context: context, delegate: CustomSearchDelegate(allTasks: _allTasks));
    _getAllTaskFromDb();
    setState(() {});
  }
}
