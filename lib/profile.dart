import 'package:flutter/material.dart';
import 'package:profile_app/components.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        avatar: 'assets/profil.jpg',
        header: 'assets/profil.jpg',
        content: [
          Text(
            'Tim Hana & Aisma',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Sistem Informasi',
            style: TextStyle(
                color: Colors.white, fontSize: 1, fontWeight: FontWeight.w400),
          ),
          Text(
            'NPM : 068 & 083',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            _buildProfileBox(
              name: 'Aisma Nurlaili',
              birthPlace: 'Surabaya',
              birthDate: '24 Oktober 2003',
              address: 'Jl.Jojoran 1 Blok AC no.8',
              phoneNumber: '081253004900',
              email: '22082010083@student.upnjatim.ac.id',
              github: 'https://github.com/aismaanly',
              education:
                  'IPA/SMAN 4 Surabaya\nSistem Informasi UPN Veteran Jawa Timur',
            ),
            SizedBox(height: 20),
            _buildProfileBox(
              name: 'Raihana Sakhi Aswanda',
              birthPlace: 'Jombang',
              birthDate: '2 Juli 2004',
              address: 'Jl.Kutisari Utara III No 48',
              phoneNumber: '085851161298',
              email: '22082010068@student.upnjatim.ac.id',
              github: 'https://github.com/hanaa002',
              education:
                  'IPA/SMAN Kesamben\nSistem Informasi UPN Veteran Jawa Timur',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileBox({
    required String name,
    required String birthPlace,
    required String birthDate,
    required String address,
    required String phoneNumber,
    required String email,
    required String github,
    required String education,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 241, 241, 241),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nama'),
            subtitle: Text(name),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tempat tanggal lahir '),
            subtitle: Text('$birthPlace, $birthDate'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Alamat'),
            subtitle: Text(address),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('No.HP'),
            subtitle: Text(phoneNumber),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(email),
          ),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Github'),
            subtitle: Text(github),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Riwayat Pendidikan'),
            subtitle: Text(education),
          ),
          ListTile(
            leading: Icon(Icons.emoji_events),
            title: Text('Penghargaan'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }
}
