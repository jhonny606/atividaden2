import 'package:flutter/material.dart';

void main() => runApp(FormularioUm());

class FormularioUm extends StatelessWidget {


  

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Formulario com Validação';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.purple,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5),
              child: Image.asset("imagens/flut.png",
              width: 400,
              ),
              ),
              Text("Cadastre-se", style: TextStyle(fontSize: 60, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
              MaterialButton(
                splashColor: Colors.purple[900],
                color: Colors.purple[400],
                child: Text("Entrar",
                style: TextStyle(
                fontSize: 20,
                 color: Colors.white,
                 ),
                 ),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0)
                   ),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCustomForm()),
            );},
              ),
            ]
        ),
      )
    )
    );
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({ Key? key }) : super(key: key);

  @override
  MyCustomFormState createState () {
    return MyCustomFormState();

  }
}

class MyCustomFormState extends State<MyCustomForm>{

    bool _isChecked = false;


  final _formkey = GlobalKey<FormState>();

  @override
  Widget build (BuildContext context){

    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          TextFormField(
            decoration: InputDecoration(labelText: 'Digite seu nome'),
            validator: (value){
              if(value == null || value.isEmpty) {
                return "Entre com um texto";
              }
              return null; 
            },


          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
              ),
          TextFormField(
            decoration: InputDecoration(labelText: 'E-mail'),


          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
              ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Senha'),


          ),
          Padding(
            padding: const EdgeInsets.all(16),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
            ),

          CheckboxListTile(
            title: const Text('Aceito os termos'),
            activeColor: Colors.amber,
            checkColor: Colors.amberAccent,
            selected: _isChecked,
            value: _isChecked,
            onChanged: (value){},
          ),

          ElevatedButton(
            onPressed: (){
              if(_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Processando dados...")),
                );
              }
            },

            child: const Text("Enviar"),
          ),
        ],
      ),
      );
  }
}