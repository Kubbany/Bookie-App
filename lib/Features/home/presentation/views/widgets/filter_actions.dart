import 'package:flutter/material.dart';
import 'filter_button.dart';
import 'filter_bottom_sheet.dart';

class FilterActions extends StatefulWidget {
  final List<String> categories;
  final List<double> ratings;
  final Function(String? category, double? rating) onFilter;
  final VoidCallback onClear;

  const FilterActions({
    super.key,
    required this.categories,
    required this.ratings,
    required this.onFilter,
    required this.onClear,
  });

  @override
  State<FilterActions> createState() => _FilterActionsState();
}

class _FilterActionsState extends State<FilterActions> {
  String? selectedCategory;
  double? selectedRating;

  void selectCategory() async {
    final result = await showFilterBottomSheet<String>(
      context: context,
      title: 'Select Category',
      items: widget.categories,
      selectedItem: selectedCategory,
    );
    setState(() => selectedCategory = result);
    widget.onFilter(selectedCategory, selectedRating);
  }

  void selectRating() async {
    final result = await showFilterBottomSheet<double>(
      context: context,
      title: 'Select Rating',
      items: widget.ratings,
      selectedItem: selectedRating,
    );
    setState(() => selectedRating = result);
    widget.onFilter(selectedCategory, selectedRating);
  }

  void clear() {
    setState(() {
      selectedCategory = null;
      selectedRating = null;
    });
    widget.onClear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilterButton(
            label: selectedCategory ?? 'Category',
            onTap: selectCategory,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilterButton(
            label: selectedRating?.toString() ?? 'Rating',
            onTap: selectRating,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: clear,
        )
      ],
    );
  }
}
