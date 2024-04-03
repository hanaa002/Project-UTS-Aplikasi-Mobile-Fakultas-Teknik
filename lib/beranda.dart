import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/components.dart';
import 'package:profile_app/model.dart';
import 'package:profile_app/prodi_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  Fakultas? fakultas;
  List<Prodi> prodilist = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    String jsonString = await rootBundle.loadString('assets/data_prodi.json');
    var data = jsonDecode(jsonString);

    setState(() {
      fakultas = Fakultas.fromJson(data);
      prodilist = fakultas!.prodi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
          avatar: 'assets/logo.png',
          header: 'assets/headerteknik.jpg',
          content: [
            Text(
              fakultas?.deskripsi ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: prodilist.length +
              1, // Jumlah item ditambah 1 untuk ExpansionTile
          itemBuilder: (context, index) {
            if (index == prodilist.length) {
              // Item terakhir untuk ExpansionTile
              return ExpansionTile(
                title: Text('Alamat dan Lokasi'),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamat:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'Gunung Manyar, Jl. Rungkut Madya, Gn. Anyar, Kec. Gn. Anyar, Surabaya, Jawa Timur 60294'),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            launch(
                                'https://www.google.com/maps/d/viewer?mid=1bFhLVt73EzRjRvXzQWpd_A2XuYU&hl=en_US&ll=-7.3336968587677775%2C112.78865674735654&z=17');
                          },
                          child: Text(
                            'Lihat Lokasi di Google Maps',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // Item-item Prodi
              return SizedBox(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProdiDetail(prodi: prodilist[index]),
                          ),
                        );
                      },
                      title: Text(prodilist[index].name),
                      leading: Hero(
                          tag: 'logo${prodilist[index].name}',
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(prodilist[index].logo)))),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
