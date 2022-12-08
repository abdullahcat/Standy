import 'package:flutter/material.dart';
import 'package:currentproject/Services/dimensions.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:currentproject/Widgets/theme_buttons.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: Dimensions.screenHeight * 2 / 3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Header3(text: 'Where do you want to go?'),
                ElevatedButton(
                    style: ThemeButton_Circular_On,
                    onPressed: (() {}),
                    child: const Text('Filter'))
              ],
            ),
            const Divider(
              height: 15,
            ),
            Wrap(
              spacing: 10,
              children: List<Widget>.generate(
                14,
                (int index) {
                  return FilterChip(
                    checkmarkColor: Colors.black,
                    label: Text('Item $index'),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }
}
