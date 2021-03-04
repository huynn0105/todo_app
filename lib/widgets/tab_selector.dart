import 'package:flutter/material.dart';
import 'package:todo_app/models/visibility_filter.dart';

class TabSelector extends StatelessWidget {
  final VisibilityFilter activeTab;
  final Function(VisibilityFilter) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: VisibilityFilter.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(VisibilityFilter.values[index]),
      items: VisibilityFilter.values.map((tab) {
        switch(tab){
          case VisibilityFilter.all:
            return BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "All",
            );
          case VisibilityFilter.completed:
            return BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: "completed",
            );
          case VisibilityFilter.incomplete:
            return BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: "incomplete",
            );
        }
      }).toList(),
    );
  }
}