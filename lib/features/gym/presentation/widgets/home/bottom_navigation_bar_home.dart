import 'package:flutter/material.dart';

class BottomNavigationBarHome extends StatefulWidget {
  final int index;
  final Function(int index) onTapped;
  const BottomNavigationBarHome({
    super.key,
    required this.index,
    required this.onTapped,
  });

  @override
  State<BottomNavigationBarHome> createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(BottomNavigationBarHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80, bottom: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 4),
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Botón de inicio
              GestureDetector(
                onTap: () => widget.onTapped(0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.index == 0 ? Colors.white : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.home_outlined,
                      color: widget.index == 0 ? Colors.black : Colors.grey,
                      size: 34,
                    ),
                  ),
                ),
              ),
              // Botón de rutinas
              GestureDetector(
                onTap: () => widget.onTapped(1),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.index == 1 ? Colors.white : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.fitness_center_outlined,
                      color: widget.index == 1 ? Colors.black : Colors.grey,
                      size: 34,
                    ),
                  ),
                ),
              ),
              // Botón de notificaciones
              GestureDetector(
                onTap: () => widget.onTapped(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.index == 3 ? Colors.white : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.notifications_active_outlined,
                      color: widget.index == 3 ? Colors.black : Colors.grey,
                      size: 34,
                    ),
                  ),
                ),
              ),
              // Botón de perfil
              GestureDetector(
                onTap: () => widget.onTapped(4),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        widget.index == 4 ? Colors.white : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_outlined,
                      color: widget.index == 4 ? Colors.black : Colors.grey,
                      size: 34,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
