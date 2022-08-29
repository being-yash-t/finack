import 'package:finack/src/core/constants/firebase.dart';
import 'package:flutter/material.dart';

class CBottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  const CBottomNavBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  })  : assert(items.length < 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.bottomNavigationBarTheme.backgroundColor,
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Flex(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            direction: Axis.horizontal,
            children: items.map<Widget>((e) {
              final index = items.indexOf(e);
              final isSelected = index == currentIndex;
              return Flexible(
                child: InkWell(
                  onTap: () => onTap(items.indexOf(e)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedContainer(
                          duration: kAnimationDuration,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme
                                    .bottomNavigationBarTheme.selectedItemColor
                                : theme
                                    .bottomNavigationBarTheme.backgroundColor,
                            boxShadow: [
                              if (isSelected)
                                const BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                )
                            ],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 12,
                            ),
                            child: AnimatedSwitcher(
                              child: e.icon,
                              duration: kAnimationDuration,
                            ),
                          ),
                        ),
                        if (e.label != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 4),
                            child: Text(
                              e.label!,
                              style: items.indexOf(e) == currentIndex
                                  ? theme.bottomNavigationBarTheme
                                      .selectedLabelStyle
                                  : theme.bottomNavigationBarTheme
                                      .unselectedLabelStyle,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
