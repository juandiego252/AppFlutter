import 'package:flutter/material.dart';
import 'package:taller_flutter/secondScreen.dart';

class FirstScreen extends StatelessWidget {
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de entrada 1
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electrónico',
                ),
              ),
            ),

            // Campo de entrada 2
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),

            // Botón para iniciar sesión
            ElevatedButton(
              onPressed: () {
                // Obtener los valores ingresados
                String correo_usuario = correoController.text;
                String password_usuario = passwordController.text;

                // Valores quemados para comparación
                String correo_quemado = "admin@gmail.com";
                String password_quemado = "123";

                // Comparar correo y contraseña ingresados con los valores quemados
                if (correo_quemado == correo_usuario && password_quemado == password_usuario) {
                  // Navegar a la segunda pantalla si la comparación es verdadera
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        data: 'Correo: $correo_usuario, Contraseña: $password_usuario',
                      ),
                    ),
                  );
                } else {
                  // Aquí puedes mostrar un mensaje de error o tomar otra acción si la comparación es falsa
                  // Por ejemplo, mostrar un diálogo o Snackbar indicando credenciales incorrectas
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Correo o contraseña incorrectos'),
                    ),
                  );
                }
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
