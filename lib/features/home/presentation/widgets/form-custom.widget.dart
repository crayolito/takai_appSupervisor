import 'package:app_supervisor/blocs/auth/authetication_bloc.dart';
import 'package:app_supervisor/config/constant/paletaColores.constant.dart';
import 'package:app_supervisor/features/home/presentation/widgets/buttonAuth.widget.dart';
import 'package:app_supervisor/features/home/presentation/widgets/textFormFieldCustom.widget.dart';
import 'package:app_supervisor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormCustomAuth extends StatefulWidget {
  const FormCustomAuth({
    super.key,
  });

  @override
  State<FormCustomAuth> createState() => _FormCustomAuthState();
}

class _FormCustomAuthState extends State<FormCustomAuth> {
  String nitSupervisor = "";
  String ci = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final autheticationBloc = BlocProvider.of<AutheticationBloc>(context);

    return Positioned(
      top: size.height * 0.6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        height: size.height * 0.395,
        width: size.width,
        child: Column(
          children: [
            CustomTextFormField(
                placeholder: "Nit Supervisor",
                icon: Icons.lock_clock_outlined,
                color: kPrimaryColor,
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  setState(() {
                    nitSupervisor = value;
                  });
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextFormField(
                placeholder: "CI",
                icon: Icons.credit_card_outlined,
                color: kPrimaryColor,
                keyboardType: TextInputType.text,
                onChanged: (String value) {
                  setState(() {
                    ci = value;
                  });
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            ButtonAuthentication(
                titulo: "Ingresar",
                onTap: () {
                  context.push("/categoriasLicencias");
                }),
            SizedBox(
              height: size.height * 0.085,
            ),
            // READ : MESSAGE DE PETICION DE REGISTRO
            const MessageRegistrationRequest()
          ],
        ),
      ),
    );
  }
}

class MessageRegistrationRequest extends StatelessWidget {
  const MessageRegistrationRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Solo para supervisores\n',
              style: estilosText!.registroLetra1),
          TextSpan(
            text: 'Debes estar verificado',
            style: estilosText!.registroLetra2,
          ),
        ],
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
