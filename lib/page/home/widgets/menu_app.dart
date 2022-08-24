import 'package:flutter/material.dart';
import 'package:new_app/page/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MenuApp({Key? key, required this.top, required this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: showMenu ? 1 : 0,
        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          child: Column(
            children: [
              Image.network(
                "https://imagensemoldes.com.br/wp-content/uploads/2020/08/QR-Code-PNG-1024x1024.png",
                height: 90,
                color: Colors.white,
              ),
              const Text.rich(
                TextSpan(text: 'Banco ', children: [
                  TextSpan(
                      text: '260 - Nu Pagamentos S.A',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height:  5,),
              const Text.rich(
                TextSpan(text: 'Agência ', children: [
                  TextSpan(
                      text: '001',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height:  5,),
              const Text.rich(
                TextSpan(text: 'Conta ', children: [
                  TextSpan(
                      text: '0000000-0',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                      children: [
                        const ItemMenu(icon: Icons.info_outline, text: 'Me ajuda',),
                        const ItemMenu(icon: Icons.person_outline, text: 'Perfil',),
                        const ItemMenu(icon: Icons.settings_outlined, text: 'Configurar conta',),
                        const ItemMenu(icon: Icons.credit_card, text: 'Configurar cartão',),
                        const ItemMenu(icon: Icons.store_mall_directory, text: 'Pedir conta PJ',),
                        const ItemMenu(icon: Icons.phone_android, text: 'Configurações do app',),
                        SizedBox(height: 25,),
                        Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: .7, color: Colors.white54)
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent.withOpacity(0.1),

                            ),
                            child: const Text('SAIR DO APP', style: TextStyle(fontSize: 12),),
                            onPressed: () {},
                          ),
                        ),
                      ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
