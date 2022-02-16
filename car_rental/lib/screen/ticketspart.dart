import 'package:car_rental/http/httpbookcar.dart';
import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:car_rental/screen/main_screenpart.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unicons/unicons.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';


class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  // late Future<List<Cars>> futureCar;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
          ),
          child: SizedBox(
            height: size.width * 0.1,
            width: size.width * 0.1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                UniconsLine.bars,
                size: size.height * 0.025,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: size.width * 0.15,
        title: Image.asset(
          'assets/images/loogoo.jpg',
          height: size.height * 0.06,
          width: size.width * 0.35,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  UniconsLine.car,
                  size: size.height * 0.025,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ProgressHUD(
        child: loadBookings(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  Widget loadBookings() {
    
    return FutureBuilder(
      future: HttpConnectBooking().getBookingNewCar(),

      builder: (
        BuildContext context,
        AsyncSnapshot<List<BookingNewCar>?> model,
      
      ) {
        if (model.hasData) {
          return BookingList(model.data);
          
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget BookingList(bookings) {
    
    return SingleChildScrollView(
        child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
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
                            Text(
                              'Car Rental',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Gap(4),
                            Text(
                              'Your Choice',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/logo.jpg'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                    const Gap(25),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Row(
                        children: [
                          const Icon(FluentSystemIcons.ic_fluent_search_regular,
                              color: Colors.black),
                          const Gap(5),
                          InkWell(
                            child: const Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                    const Gap(30)
                  ],
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Cars',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    InkWell(
                      child: Text('View all',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    )
                  ],
                )),
            GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 5,
              ),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                return MainScreenPart(model: bookings[index]);
              },
            ),
          ],
        )
      ],
    ));
  }
}
