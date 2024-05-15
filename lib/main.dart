// import 'package:clase_virtual/Nueva%20carpeta/src/otros/divider.dart';
// import 'package:clase_virtual/src/1-layouth/layouth.dart';
// import 'package:clase_virtual/src/1-layouth/layouth_row.dart';
// import 'package:clase_virtual/src/4-forms/form_option.dart';
// import 'package:clase_virtual/src/3-image/img.dart';
// import 'package:clase_virtual/src/3-image/img_full.dart';
// import 'package:clase_virtual/src/1-layouth/layouth_reload.dart';
// import 'package:clase_virtual/src/2-drawer/drawer_page_statefull.dart';
// import 'package:clase_virtual/src/4-forms/form_text_field.dart';
// import 'package:clase_virtual/src/4-forms/form_text_field_password.dart';
// import 'package:clase_virtual/src/5-estados/ciclo_vida.dart';
// import 'package:clase_virtual/src/5-estados/observer.dart';
// import 'package:clase_virtual/src/6-consumo_api/api.dart';
import 'package:clase_virtual/src/7-pokedex/table_pokemon.dart';
import 'package:clase_virtual/src/7-pokedex/table_pokemon_dio.dart';
import 'package:clase_virtual/src/8-menu/menu.dart';

import 'package:clase_virtual/src/themes/theme_desing.dart';
import 'package:flutter/material.dart';
// import 'package:hola_mundo/src/2-drawer/drawer_page.dart';

void main() {
  // todo inicia en el main()
  runApp(const MyApp());
}

/// widgets sin estado(StatelessWidget),
/// como texto o icono que solo muestre información o una imagen respectivamente
class MyApp extends StatelessWidget {
  //identificador o Key
  const MyApp({super.key});

  @override
  //BuildContext es nada más que una referencia a la ubicación de un Widget
  Widget build(BuildContext context) {
    // const bool debugShowCheckedModeBanner =false;
    // debugShowCheckedModeBanner : false;

    /*#1- retorna un Widget de MaterialApp - (diseño de Material Design)*/
    //
    //  MaterialApp es un widget fundamental en Flutter
    //  que proporciona una estructura básica para la construcción de aplicaciones
    //  que siguen las directrices de diseño de Material Design
    // #2
    // return const MaterialApp(
    //   home: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text('hola mundo'),
    //     ],
    //   ),
    // );

// #2-
    /* return const MaterialApp(
      //Scafold - implementa un diseño de Material
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(child: Text('Hola Mundo')),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Hola Mundo')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );*/

// #3-
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      //Scafold - implementa un diseño de Material
      // theme: ThemeData(
      //   useMaterial3: true,
      //   // colorSchemeSeed: Colors.cyan[400],
      // ),
      theme: ThemeDesing().themeApp(),

      //home: const Layouth(), //1
      //home: const LayouthRow()
      //home: const LayouthReload() //1
      //home: const DrawerPage() //2
      // home: const DrawerPageStateFull() //2

      // home: Img(),//3
      //home: const ImgFull(), //3
      // home: const FormTextField()
      //home: const FormTextFieldPass(),
      // home: const Formulario(),
      //home: const DividerC(),
      //home: const CicloVida(),
      //home: const Observer(),
      // home: const Api(),
      // home: const TablePokemon(),
      home: const TablePokemonDio(),
      //home: const Menu(),
    );
  }
}
