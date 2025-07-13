import 'package:flutter/material.dart';

void main (){
  runApp(
      MyApp()
  );
}

// widget responsável por configurações do APP
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


// widget responsável pela pagina do APP
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int count_total = 0;
  int max_permitido = 5;
  void decrement(){
    // print('decrement');
    setState(() {
      count--;
    });

    print(count);
  }
  void increment(){
    // print('increment');
    setState(() {
      count++;
      count_total++;
    });
    print(count);
  }
  void zerar_contador(){
    setState(() {
      count = 0;
      count_total = 0;
    });
  }

  void mais_permitido_increments(){
    setState(() {
      max_permitido++;
    });
  }
  void menos_permitido_decrements(){
    setState(() {
      max_permitido--;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count >= max_permitido;
  bool get isEmptyTotal => count_total != 0;
  bool get isZerado => max_permitido == 0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Controle Acesso',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
          )
      ),
      backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fundoApp.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( isFull ? (isZerado ? 'Fechado' : 'Lotado') : 'Pode entrar',
              style: TextStyle(
                  fontSize: 46,
                  color: isFull ? Colors.red : Colors.lightGreenAccent,
                  fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 105,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  'Total: $count_total',
                  style: const TextStyle(
                      fontSize: 35,
                  ),
                ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: isFull ? null : increment,
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          fontSize: 35
                      ),
                    ),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        fixedSize: const Size(150, 100),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(25)
                        )
                    )
                ),
                SizedBox(width: 30),
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    'Sair',
                    style: TextStyle(
                        fontSize: 35
                    ),
                  ),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      fixedSize: const Size(150, 100),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: TextButton(
                          onPressed: isEmptyTotal ? zerar_contador : null,
                          child: Text(
                            'Limpar',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              fixedSize: Size(150, 75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                          )
                      ),
                  ),

              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: isZerado ? null : menos_permitido_decrements,
                      child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white
                          ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(
                          '$max_permitido',
                          style: TextStyle(
                            fontSize: 50
                          )
                      ),
                  ),
                  TextButton(
                      onPressed: mais_permitido_increments,
                      child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.black
                          ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent
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

