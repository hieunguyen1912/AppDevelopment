import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/provider/cart_provider.dart';
import 'package:tmdt_app/views/screens/main_screens.dart';

class CartScreens extends ConsumerStatefulWidget {
  const CartScreens({super.key});

  @override
  _CartScreensState createState() => _CartScreensState();
}

class _CartScreensState extends ConsumerState<CartScreens> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProviedr);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 20,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/cartb.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 322,
                  top: 52,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/icons/not.png',
                        width: 26,
                        height: 25,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: badges.Badge(
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: Colors.yellow.shade900,
                          ),
                          badgeContent: Text(
                            cartData.length.toString(),
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 61,
                    top: 51,
                    child: Text(
                      'My Cart',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: cartData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'your shopping cart is empty you can add product to your cart from the button bellow',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        letterSpacing: 1.7,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      },
                      child: Text(
                        'Shop Now',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  final cartItem = cartData.values.toList()[index];

                  return Center(
                    child: Text(
                      cartItem.productName,
                    ),
                  );
                },
              ));
  }
}
