import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../Providers/date_time_provider.dart';
import '../Providers/fetchProvider.dart';
import '../Providers/textField_providers.dart';
import '../model/model.dart';
import 'DateTime_widget.dart';

class addNewItem extends ConsumerStatefulWidget {
  const addNewItem({super.key});

  @override
  ConsumerState createState() => _addNewItemState();
}

class _addNewItemState extends ConsumerState<addNewItem> {

  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = ref.read(titleProvider).toString();
    descController.text = ref.read(descProvider).toString();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Yeni Görev Oluştur",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              Divider(thickness: 1.1, color: Colors.grey.shade200),
              const Gap(10),
              const Text(
                'Görev Baslığı',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,

                  ),
                  maxLines: 1,
                  onChanged: (value){
                    ref.watch(titleProvider.notifier).update((state) => value);
                  },


                ),
              ),
              const Gap(10),
              const Text(
                "Açıklama",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  controller: descController,
                  autofocus: true,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Açıklama Ekle',
                  ),
                  maxLines: 15,
                  onChanged: (value){
                    ref.watch(descProvider.notifier).update((state) => value);
                  },

                ),
              ),
              const Gap(10),
              const DateTimeWidget(),
              const Gap(15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("İptal Et")),
                  ),
                  const Gap(20),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        onPressed: () {
                          ref.read(seviceProvider).addNewTask(TodoModel(
                            titleTask: titleController.text,
                            description: descController.text,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                            isComplited: false,
                          ),ref);
                          Navigator.pop(context);
                          ref.watch(titleProvider.notifier).update((state) => '');
                          ref.watch(descProvider.notifier).update((state) => '');
                        },
                        child: const Text("Kaydet")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
