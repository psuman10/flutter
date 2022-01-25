
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Car Rental', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                         Gap(4),
                        Text('Your Choice', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC2D5)),
                      const Gap(5),
                      InkWell(
                        child: Text('Search', style: TextStyle(color: Colors.grey.shade500, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                         onTap: () {
                         
                         },
                      ) 
                    ],
                  ),
                ),
                const Gap(40)
              ],
            )
          ),
         
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   Text('Cars', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  InkWell(
                    child: Text('View all',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  )
                ],
              )
          ),
          const Gap(15),
          const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              
          ),
        ],
      ),
    );
  }
}
