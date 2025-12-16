import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tobo_apk/provider/profile_prov.dart';
import 'package:tobo_apk/provider/randomimage_prov.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProv>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Consumer<ProfileProv>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<RandomImageProvider>(
                builder: (context, provider, child) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(provider.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Text("ID: ${value.data['id'] ?? '-'}"),
              Text("Title: ${value.data['title'] ?? '-'}"),
              Text("Body: ${value.data['body'] ?? '-'}"),
              Gap(24),
              Gap(32),
              ElevatedButton(
                onPressed: () async {
                  context.read<RandomImageProvider>().updateImageUrl();
                  await provider.updateData(
                    "Akhirnya",
                    "GG Gaming",
                    Random().nextInt(1000),
                  );
                  print(provider.data);
                },
                child: Text('Fetch Random Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
