import 'package:flutter/material.dart';
import 'package:smart_feeder/navigation/navigation_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Material(
          color: /*const Color.fromRGBO(252, 213, 167, 1)*/ Colors.white60,
          child:
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
              child:
                Column(
                  children:[
                    headerWidget(context),
                    const Divider(color: Colors.black, thickness: 0.3,),
                    NavigationItem(
                      name: 'Alimentadores',
                      icon: Icons.link_sharp,
                      onPressed: () => onItemPressed(context, index: 0),
                    ),
                    NavigationItem(
                      name: 'Mascotas',
                      icon: Icons.pets,
                      onPressed: () => onItemPressed(context, index: 1),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child:
                           Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child:
                                 NavigationItem(
                                   name: 'Configuración',
                                   icon: Icons.miscellaneous_services,
                                   onPressed: () => onItemPressed(context, index: 80),
                                 ),
                               ),
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child:
                                 NavigationItem(
                                   name: 'Cerrar Sesion',
                                   icon: Icons.logout_sharp,
                                   onPressed: () => onItemPressed(context, index: 90),
                                 ),
                               )
                             ],
                           )
                      )
                    ),
                  ]
                ),
              ),
            ),
          );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.of(context).pushNamed('/feeders');
        break;
      case 1:
        Navigator.of(context).pushNamed('/pets');
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget(BuildContext context){
    return Column(
      children: [
        CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage('assets/images/girl_random.png'),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text('Hola Aaaaa!', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('aaa@bbb.com', style: TextStyle(fontSize: 14, color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => loadProfile(context),
                    child: Text('Ver Perfil')
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  loadProfile(BuildContext context){
    Navigator.of(context).pushNamed('/profile');
  }

  cerrarSesion(BuildContext context){
    Navigator.of(context).pushNamed('/login');
  }
}
