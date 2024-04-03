import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model.dart';

class ProdiDetail extends StatefulWidget {
  final Prodi prodi;

  const ProdiDetail({Key? key, required this.prodi}) : super(key: key);

  @override
  _ProdiDetailState createState() {
    return _ProdiDetailState();
  }
}

class _ProdiDetailState extends State<ProdiDetail> {
  var headerStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  var titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  var contentStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    var prestasi = widget.prodi.prestasi;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prodi.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.all(6),
          child: Column(
            children: [
              Hero(
                tag: 'logo${widget.prodi.name}',
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    widget.prodi.logo,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        'Profil',
                        style: titleStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.visibility),
                      title: Text(
                        'Visi',
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        widget.prodi.visi,
                        style: contentStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text(
                        'Misi',
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        widget.prodi.misi,
                        style: contentStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text(
                        'Akreditasi',
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        widget.prodi.akreditasi,
                        style: contentStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Ketua Program Studi',
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        widget.prodi.kaprodi,
                        style: contentStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text(
                        'Dosen',
                        style: titleStyle,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.prodi.dosen
                            .map((e) => Text(
                                  e.name + ' - ' + e.jabatan,
                                  style: contentStyle,
                                ))
                            .toList(),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        'Email',
                        style: titleStyle,
                      ),
                      subtitle: InkWell(
                        onTap: () async {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: widget.prodi.email,
                          );
                          final String url = emailLaunchUri.toString();

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          widget.prodi.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(
                        'Laman Website Resmi',
                        style: titleStyle,
                      ),
                      subtitle: InkWell(
                        onTap: () async {
                          final url = widget.prodi.website;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          widget.prodi.website,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Prestasi Resmi Mahasiswa',
                        style: titleStyle,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.prodi.prestasi.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.star),
                          title: Text(
                            widget.prodi.prestasi[index].name +
                                ' - ' +
                                widget.prodi.prestasi[index].event,
                            style: contentStyle,
                          ),
                          subtitle: Text(
                            'Tahun: ${prestasi[index].tahun}',
                            style: contentStyle,
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
