// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(const IceCreamApp());

class IceCreamApp extends StatelessWidget {
  const IceCreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IceCreamMenu(),
    );
  }
}

class IceCreamMenu extends StatelessWidget {
  // Lista de datos simulada
  final List<Map<String, String>> products = [
    {'nombre': 'Helado de fresa', 'imagen': 'https://raw.githubusercontent.com/a23308051281165-debug/ImagenesHelados/refs/heads/main/helado-de-fresa.jpg'},
    {'nombre': 'Helado de chocolate', 'imagen': 'https://raw.githubusercontent.com/a23308051281165-debug/ImagenesHelados/refs/heads/main/20210330080108helado-de-chocolate.jpg'},
    {'nombre': 'Helado de vainilla', 'imagen': 'https://raw.githubusercontent.com/a23308051281165-debug/ImagenesHelados/refs/heads/main/helado-de-vainilla.webp'},
    {'nombre': 'Helado de chicle', 'imagen': 'https://raw.githubusercontent.com/a23308051281165-debug/ImagenesHelados/refs/heads/main/Bubble-GumTwist-Eis-360x203.jpg'},
  ];

  final Color primaryPurple = const Color(0xFFD1A3D1); // El tono lila de tu imagen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'ORDENAR',
          style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Barra de Calificación
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: primaryPurple.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Calificacion", style: TextStyle(color: primaryPurple, fontSize: 18)),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                      Icon(Icons.star, color: Colors.yellow, size: 24),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Tabs / Categorías
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Helados', 'Paletas', 'Aguas', 'Fruta congelada'].map((tab) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(border: Border.all(color: primaryPurple)),
                  child: Text(tab, style: TextStyle(color: primaryPurple, fontSize: 14)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Lista de productos
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Textos
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index]['nombre']!,
                                style: TextStyle(color: primaryPurple, fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "sjakhjashdjkashdjkashdjka hdjkashjkdhasjkdhasdhsaj kh",
                                style: TextStyle(color: Color(0xFFB589B5), fontSize: 12),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Imagen con bordes redondeados
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            products[index]['imagen']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
