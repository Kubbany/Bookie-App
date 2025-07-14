import 'package:flutter/material.dart';

Future<T?> showFilterBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  T? selectedItem,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isSelected = item == selectedItem;
                    return ListTile(
                      title: Text(item.toString()),
                      trailing: isSelected ? const Icon(Icons.check, color: Colors.green) : null,
                      onTap: () => Navigator.pop(context, isSelected ? null : item),
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
