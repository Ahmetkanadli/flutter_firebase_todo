//orijinal


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'Providers/fetchProvider.dart';



class todoItem extends ConsumerWidget {
  todoItem({super.key,required this.getIndex});

  final int getIndex;

  @override
  build(BuildContext context,WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(data: (todoData) =>
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                color: Colors.red,
              ),

              width: 30,
            ),
            Expanded(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(todoData[getIndex].titleTask),
                      subtitle: Text(todoData[getIndex].description),
                      trailing: Transform.scale(
                        scale: 1.5,
                        child: GestureDetector(
                          onTap: (){
                            // todoData[getIndex].isComplited != todoData[getIndex].isComplited;
                          },
                          child: Checkbox(
                            value: todoData[getIndex].isComplited,
                            activeColor: Colors.blue.shade800,
                            shape: const CircleBorder(),
                            onChanged:(value){
                              print("değişti");
                              print(todoData[getIndex].isComplited);
                              todoData[getIndex].isComplited = value!;
                              print("2${todoData[getIndex].isComplited}");

                            },
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -12),
                      child: Container(
                        child: Column(
                          children: [
                            Divider(thickness: 1.5,color: Colors.grey.shade200,),
                            Row(
                              children: [
                                Text(todoData[getIndex].dateTask),
                                const Gap(45),
                                Text(todoData[getIndex].timeTask)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

              ),
            )
          ],),
        ),

        error: (error,stackTrace)=> Center(),
        loading: ()=> const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}


