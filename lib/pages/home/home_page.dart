import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeBloc()..add(LoadUserDatas()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<HomeBloc>(context);
            if (state is UserDataLoaded) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: IconButton(
                              onPressed: () => bloc.add(SignOutEvent()),
                              icon: const Icon(Icons.logout),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * .05),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Welcome \n${state.usermodel?.fullName} !!",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff14B8A6),
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                            // textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * .05),
                      FadeInUp(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/Verified-pana.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade700,
                  strokeWidth: 3,
                  backgroundColor: const Color(0xff14B8A6),
                ),
              ),
            );
          },
        ),
      );
}
