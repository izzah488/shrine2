import 'package:flutter/material.dart';
import 'color.dart';
import 'supplemental/cut_corners_border.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'backdrop.dart';

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
     // TODO: Make currentCategory field take _currentCategory (104)
     currentCategory: Category.all,
    // TODO: Pass _currentCategory for frontLayer (104)
frontLayer: HomePage(category: _currentCategory),
     // TODO: Change backLayer field value to CategoryMenuPage (104)
     backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: const Text('SHRINE'),
              backTitle: const Text('MENU'),
            ),
  });
  }
}

// Theme Creation
ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kShrineBrown900,
      backgroundColor: kShrinePink100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBrown900,
      ),
    ),
  );
}

// Text Theme Creation
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: base.headlineSmall!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}

// Optional: Category Menu Page (if needed)
class CategoryMenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;

  const CategoryMenuPage({
    Key? key,
    required this.currentCategory,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 40.0),
        color: kShrinePink100,
        child: ListView(
          children: Category.values.map((category) {
            return ListTile(
              title: Text(
                category.toString().split('.').last.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => onCategoryTap(category),
              selected: currentCategory == category,
            );
          }).toList(),
        ),
      ),
    );
  }
}

