import 'package:app_supervisor/config/constant/paletaColores.constant.dart';
import 'package:app_supervisor/features/home/presentation/widgets/form-custom.widget.dart';
import 'package:app_supervisor/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const decoration1 = BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://res.cloudinary.com/da9xsfose/image/upload/v1723259715/jil3srmbcg72inysuyzq.jpg"),
            fit: BoxFit.cover));
    final decoration2 = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kTolor, width: 3.5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          )
        ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.515,
              width: size.width,
              decoration: decoration1,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.4))),
            ),
            const ContainerCustom(),
            Positioned(
              top: size.height * 0.17,
              left: size.width * 0.125,
              child: SizedBox(
                width: size.width * 0.75,
                height: size.height * 0.07,
                child: Text("LicenseGuard",
                    textAlign: TextAlign.center,
                    style: estilosText!.tituloAuth),
              ),
            ),
            Positioned(
              top: size.height * 0.28,
              left: size.width * 0.15,
              child: SizedBox(
                // color: Colors.amber,
                width: size.width * 0.7,
                height: size.height * 0.14,
                child: Text("Tu compromiso con la transparencia comienza aquí.",
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: estilosText!.subTituloAuth),
              ),
            ),
            const FormCustomAuth(),
            Positioned(
                top: size.height * 0.46,
                left: size.width * 0.42,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.02),
                  height: size.height * 0.1,
                  width: size.width * 0.15,
                  decoration: decoration2,
                  child: Image.network(
                      "https://res.cloudinary.com/da9xsfose/image/upload/v1723313986/c0qay5edtvzznankgoyn.png"),
                )),
          ],
        ),
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: _CurvoContainer(),
        ));
  }
}

class _CurvoContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    // lapiz.color = Color(0xFFFFEFCD);
    lapiz.color = Colors.white;

    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;
    lapiz.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter, // Ajusta este valor
      colors: [Colors.black, Colors.white],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.61));

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.42);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.61, size.width, size.height * 0.42);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
