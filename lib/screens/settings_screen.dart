import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac10_recipes/ThemeCubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, currentTheme) {
          Color backgroundColor;
          switch (currentTheme) {
            case AppTheme.light:
              backgroundColor = Colors.white;
              break;
            case AppTheme.dark:
              backgroundColor = Colors.black;
              break;
            case AppTheme.beige:
              backgroundColor = const Color(0xFFF5F5DC);
              break;
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Настройки'),
            ),
            body: Container(
              color: backgroundColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Текущая тема: $currentTheme',
                      style: TextStyle(
                        fontSize: 24,
                        color: currentTheme == AppTheme.dark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 26),
                    ElevatedButton(
                      onPressed: () {
                        // Вызываем метод toggleTheme через Cubit
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(256, 56),
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Переключить тему'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// class _SettingsScreenState extends State<SettingsScreen> {
//   late final ThemeService themeService;
//
//   @override
//   void initState() {
//     super.initState();
//     themeService = getIt<ThemeService>();
//   }
//
//   void _toggleTheme() {
//     setState(() {
//       themeService.toggleTheme();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = themeService.theme;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Настройки'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Текущая тема: $currentTheme',
//               style: const TextStyle(
//                 fontSize: 24,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 26),
//             ElevatedButton(
//               onPressed: _toggleTheme,
//               style: ElevatedButton.styleFrom(
//                 fixedSize: const Size(256, 56),
//                 backgroundColor: Colors.indigo,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text('Переключить тему'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





