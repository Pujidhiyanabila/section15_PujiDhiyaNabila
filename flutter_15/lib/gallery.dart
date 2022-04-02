import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (ctx, index) {
                final String imageUrl = faker.image
                    .image(random: true); //hanya digunakan pada variable itemBuilder

                return InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      Text(faker.lorem.word())
                    ],
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return Image.network(imageUrl);
                        });
                  },
                );
              },
              itemCount: 32,
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
