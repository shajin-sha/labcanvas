import 'package:flutter/material.dart';
import 'package:seo/io/seo_widget.dart';

class LabCanvasAppBar extends StatelessWidget {
  const LabCanvasAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Seo.text(text: "labcanvas", child: Text("labcanvas", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold))),
                const SizedBox(width: 5),
                Chip(label: Text('BETA', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10, color: Colors.white)), backgroundColor: Theme.of(context).colorScheme.secondary, labelPadding: EdgeInsets.zero, padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2), visualDensity: VisualDensity.compact),
              ],
            ),
            Text(
              'Graphical Abstract Ai',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
