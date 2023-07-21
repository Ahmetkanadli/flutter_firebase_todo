
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../Providers/date_time_provider.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tarih",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Ink(
                child: InkWell(
                  onTap: (){
                    _showDatePicker(context,ref);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:   Row(
                      children: [
                        const Icon(CupertinoIcons.calendar),
                        const Gap(10),
                        Text(date)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Saat",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: (){
                _showTimePicker(context,ref);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Row(
                  children: [
                    const Icon(CupertinoIcons.clock),
                    const Gap(10),
                    Text(time)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final getValue = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2090)
    );
    if(getValue != null){
      final format = DateFormat.yMd();
      ref.read(dateProvider.notifier).update((state) => format.format(getValue));
    }

  }
  Future<void> _showTimePicker(BuildContext context, WidgetRef ref) async {
    final getTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(getTime != null){
      ref.read(timeProvider.notifier).update((state) => getTime.format(context));
    }
  }
}


