import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.searchController, required this.onChanged});

  final TextEditingController searchController;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            spreadRadius: 1,
            offset: Offset(4.0, 3.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: searchController,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Value is empty';
          return null;
        },
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        onChanged: (value) {
          onChanged(value);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: searchController.text.length > 0
              ? IconButton(
                  onPressed: searchController.clear,
                  icon: Icon(Icons.clear, color: Colors.grey),
                )
              : SizedBox(),
          fillColor: Theme.of(context).colorScheme.background,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.background)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.background)),
        ),
      ),
    );
  }
}
