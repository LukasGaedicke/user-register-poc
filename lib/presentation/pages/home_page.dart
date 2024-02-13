import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_registration/presentation/bloc/home/home_bloc.dart';
import 'package:user_registration/resources/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context)!.settings.arguments as String;
    context.read<HomeBloc>().add(GetHomeInformationEvent(uid));

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.home),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              Strings.welcomeToUserRegistrationApp,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {},
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return Column(
                      children: [
                        Text(
                          '${Strings.accessLevelIs}: ${state.user.accessLevel}',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          '${Strings.user}: ${state.user.firstName} ${state.user.lastName}',
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          '${Strings.email}: ${state.user.email}',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    );
                  }
                  if (state is HomeFailure) {
                    return Text(
                      state.message,
                      style: const TextStyle(fontSize: 24),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: const Text(
                  Strings.exit,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
