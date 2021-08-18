import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.searchController,
    @required this.onChanged,
  });

  final TextEditingController searchController;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    InputBorder kInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: NewsCubit.get(context).isDark ? Color(0xFF333739) : Colors.white,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                NewsCubit.get(context).isDark ? Colors.black54 : Colors.black26,
            spreadRadius: 1,
            offset: Offset(4.0, 3.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: searchController,
        validator: (String value) {
          if (value.isEmpty) return 'Value is empty';
          return null;
        },
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: NewsCubit.get(context).isDark ? Colors.white : Colors.black,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: searchController.text.length > 0
              ? IconButton(
                  onPressed: searchController.clear,
                  icon: Icon(Icons.clear, color: Colors.grey),
                )
              : SizedBox(),
          fillColor:
              NewsCubit.get(context).isDark ? Color(0xFF333739) : Colors.white,
          filled: true,
          enabledBorder: kInputBorder,
          focusedBorder: kInputBorder,
          border: kInputBorder,
        ),
      ),
    );
  }
}
