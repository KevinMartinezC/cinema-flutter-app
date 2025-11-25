import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStye = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false, //to remove big bottom padding
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity, //all the width available
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              Text("Cinema", style: titleStye),

              Spacer(),

              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
