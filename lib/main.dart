import 'package:expenses_tracker/screen/start_screen.dart';
import 'package:flutter/material.dart';

final color =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(221, 16, 183, 244));
final kcolor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(115, 47, 70, 71),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        iconTheme: IconThemeData(
          color: kcolor.onBackground,
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          // backgroundColor: color.surface,
          modalBackgroundColor: kcolor.surface,
        ),
        primaryTextTheme: const TextTheme().copyWith(),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolor.primary,
          foregroundColor: kcolor.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolor.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolor.onBackground,
            foregroundColor: kcolor.background,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          // backgroundColor: color.primary,

          foregroundColor: kcolor.onBackground,
        )),
        useMaterial3: true,
        colorScheme: kcolor,
        textTheme: const TextTheme().copyWith(
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kcolor.onBackground,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: kcolor.onBackground,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            // fontWeight: FontWeight.bold,
            color: kcolor.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          // backgroundColor: color.surface,
          modalBackgroundColor: color.surface,
        ),
        primaryTextTheme: const TextTheme().copyWith(),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: color.primary,
          foregroundColor: color.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: color.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: color.primary,
            foregroundColor: color.onPrimary,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
          // backgroundColor: color.primary,
          foregroundColor: color.primary,
        )),
        useMaterial3: true,
        colorScheme: color,
        textTheme: const TextTheme().copyWith(
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color.onBackground,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: color.onBackground,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            // fontWeight: FontWeight.bold,
            color: color.onPrimaryContainer,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}
