import 'package:proyecto_primer_dep/src/utils/icon_string.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_primer_dep/src/providers/menu_provider.dart';
import 'package:flutter/cupertino.dart';



class HomePageTemp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Componente Temporal'),

      ),

      body: _lista(context),

    );

  }



  Widget _lista(BuildContext context) {

    return FutureBuilder(

      future: menuProvider.cargarData(),

      builder: (context, snapshot) {

        print(snapshot.data);

        return ListView(children: _listaItems(snapshot.data, context));

      },

    );

  }



  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opcion = [];

    data.forEach((opt) {

      final witgetvalue = ListTile(

        title: Text(opt['texto']),

        leading: getIcon(opt['icon']),

        trailing: Icon(

          Icons.keyboard_arrow_right_outlined,

          color: Colors.blue.shade500,

        ),

        onTap: () {

          showDialog(

              context: context,

              builder: (BuildContext context) =>

                  _buildPopupDialog(context, opt['texto']));

        },

      );

      opcion..add(witgetvalue)..add(Divider());
    });

    return opcion;

  }

}
Widget _buildPopupDialog(BuildContext context, String opt) {

    return new AlertDialog(

      title: const Text('Buenas tardes, en que puedo ayudarte'),

      content: new Column(

        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

          Text("Hola soy " + opt),

        ],

      ),

      actions: <Widget>[

        new FlatButton(

          onPressed: () {

            Navigator.of(context).pop();

          },

          textColor: Theme.of(context).primaryColor,

          child: const Text('Close'),

        ),

      ],

    );

  }

