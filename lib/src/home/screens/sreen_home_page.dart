import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/colors_standard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: _movies(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 2,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const Text(
        'BranefMovies',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.normal,
          fontFamily: 'Romanesco',
        ),
      ),
    );
  }

  Widget _movies() {
    return Column(
      children: [
        const SizedBox(height: 30),
        _movieItem('Avengers: End Game', '2019 | 3h'),
        const SizedBox(height: 30),
        _movieItem('Avengers: End Game', '2019 | 3h'),
        const SizedBox(height: 30),
        _movieItem('Avengers: End Game', '2019 | 3h'),
        const SizedBox(height: 30),
        _movieItem('Avengers: End Game', '2019 | 3h'),
        const SizedBox(height: 30),
        _movieItem('Avengers: End Game', '2019 | 3h'),
      ],
    );
  }

  Widget _movieItem(String title, String details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              details,
              style: const TextStyle(
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondaryPink),
              ),
              child: const Text('Detalhes'),
            ),
          ],
        ),
      ],
    );
  }
}
