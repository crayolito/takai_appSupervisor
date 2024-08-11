import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:app_supervisor/config/constant/paletaColores.constant.dart';
import 'package:app_supervisor/features/geolocalizacion/presentation/widgets/itemSearchBar.dart';
import 'package:app_supervisor/features/home/domain/entities/licencia.dart';
import 'package:app_supervisor/features/home/presentation/widgets/textFormFieldCustom.widget.dart';
import 'package:app_supervisor/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchLicenciaScreen extends StatelessWidget {
  const SearchLicenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    // NOTE: Navbar de la pantalla de busqueda
                    const NavbarCustom(),
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        padding: EdgeInsets.only(
                            left: size.width * 0.015,
                            right: size.width * 0.015,
                            bottom: size.height * 0.005),
                        height: size.height * 0.83,
                        width: size.width,
                        child: ListView.builder(
                            itemCount: listaLicencias.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 3)),
                                          title: Text(
                                            "Inspeccion",
                                            textAlign: TextAlign.center,
                                            style: estilosText!.titulo2,
                                          ),
                                          content: SizedBox(
                                            height: size.height * 0.25,
                                            width: size.width * 0.75,
                                            child: Column(
                                              children: [
                                                CustomTextFormField(
                                                    placeholder:
                                                        "Tipo Inspeccion",
                                                    icon: Icons.settings,
                                                    color: kPrimaryColor,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    onChanged:
                                                        (String value) {}),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                CustomTextFormField(
                                                    placeholder: "Descripcion",
                                                    icon: Icons
                                                        .drive_file_rename_outline_sharp,
                                                    color: kPrimaryColor,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    onChanged:
                                                        (String value) {}),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      icon: Icon(
                                                        Icons.cancel,
                                                        color: kPrimaryColor,
                                                        size: size.width * 0.08,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.check,
                                                        color: kPrimaryColor,
                                                        size: size.width * 0.08,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: ItemLicencia(
                                    licencia: listaLicencias[index],
                                    index: index),
                              );
                            })),
                  ],
                ),
              ),
              //  NOTE: Filtrado de los items de la lista de puntos de corte
              const SearchBarComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarCustom extends StatefulWidget {
  const NavbarCustom({
    super.key,
  });

  @override
  State<NavbarCustom> createState() => _NavbarCustomState();
}

class _NavbarCustomState extends State<NavbarCustom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
      ),
      width: size.width,
      height: size.height * 0.16,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kTerciaryColor,
              size: size.width * 0.08,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          Text(
            "LICENCIAS",
            style: estilosText!.titulo4,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.sliders,
                color: kPrimaryColor,
                size: size.width * 0.08,
              ))
        ],
      ),
    );
  }
}

String obtenerIconoAleatorio(List<String> iconLinks) {
  final random = Random();
  int index = random.nextInt(iconLinks.length);
  return iconLinks[index];
}

class ItemLicencia extends StatelessWidget {
  const ItemLicencia({
    super.key,
    required this.licencia,
    required this.index,
  });

  final int index;
  final DataLicencia licencia;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInLeft(
      child: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
        ),
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
        ),
        // height: size.height * 0.23,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: size.height * 0.14,
              width: size.width * 0.82,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Licencia ${licencia.nroLicencia}",
                      textAlign: TextAlign.center,
                      style: estilosText!.tituloItemPC,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.read_more,
                          size: size.width * 0.1,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        licencia.propietario,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.security_sharp,
                          size: size.width * 0.08,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        licencia.nroLicencia,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.date_range,
                          size: size.width * 0.08,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        licencia.fechaEmision,
                        textAlign: TextAlign.start,
                        style: estilosText!.subTituloItemPC,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
