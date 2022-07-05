import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalCustomers = 0;

  void increment() {
    setState(() {
      totalCustomers++;
    });
    debugPrint('$totalCustomers');
  }

  void decrement() {
    setState(() {
      totalCustomers--;
    });
    debugPrint('$totalCustomers');
  }

  bool get isEmpty => totalCustomers == 0;
  bool get isFull => totalCustomers == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/restaurant.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 32),
              child: Text(
                '$totalCustomers',
                style: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w900,
                  color: isFull ? Colors.redAccent : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 68),
                    primary: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 38,
                ),
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 68),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
