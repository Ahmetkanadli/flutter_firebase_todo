import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:notes/todoItem.dart';
import 'package:notes/widgets/add_new_item.dart';

import 'Providers/fetchProvider.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {
    //final todoData = ref.read(fetchStreamProvider);
    final data = ref.watch(fetchStreamProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: const Row(
          children: [
            CircleAvatar(
              child: Icon(CupertinoIcons.person),
            ),
            SizedBox(
              width: 300,
              child: ListTile(
                title: Text("Merhaba"),
                subtitle: Text("Ahmet Kanadlı"),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,bottom: 10,left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Text("Bugün Yapacakların",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        "13 temmuz",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Gap(100),
                  ElevatedButton(
                    onPressed: () {
                      _openDialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.add_circled),
                        Gap(10),
                        Text("Ekle"),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(

                    ),
                  )
                ],
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: double.infinity,
                    minHeight: 0
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: data.value?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: todoItem(getIndex: index),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  void _openDialog(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      builder: (context) => addNewItem(),
    );
  }
}
