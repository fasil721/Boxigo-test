import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeBloc()..add(LoadUserDatas()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<HomeBloc>(context);
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (state is UserDataLoaded)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("${state.user?.displayName}"),
                          )
                        else
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
                    const SizedBox(height: 10),
                    Flexible(
                      child: Center(
                        child: FadeInUp(
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
