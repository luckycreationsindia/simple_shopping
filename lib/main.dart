import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/models/product_list.dart';
import 'package:simple_shopping/src/utils/color_schemes.g.dart';
import 'package:simple_shopping/src/utils/commons.dart';
import 'package:simple_shopping/src/utils/my_router.dart';
import 'package:simple_shopping/src/utils/sample_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SampleData().generateProductData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartNotifier()),
        ChangeNotifierProvider(create: (_) => ProductList()),
      ],
      child: MaterialApp.router(
        title: Commons.appTitle,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(lightColorScheme),
        darkTheme: _buildTheme(darkColorScheme),
        routeInformationParser: customRouter.routeInformationParser,
        routerDelegate: customRouter.routerDelegate,
      ),
    );
  }

  ThemeData _buildTheme(ColorScheme colorScheme) {
    var baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      iconTheme: IconThemeData(
        color: colorScheme.primary,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.primary,
        labelStyle: TextStyle(color: colorScheme.onPrimary),
        selectedColor: colorScheme.secondary,
        selectedShadowColor: colorScheme.onSecondary,
        checkmarkColor: colorScheme.onSecondary,
      ),
      backgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.ubuntuTextTheme(baseTheme.textTheme),
    );
  }
}
