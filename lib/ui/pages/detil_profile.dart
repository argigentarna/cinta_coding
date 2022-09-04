// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../providers/login_provider.dart';
import '../../shared/themes.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_tile.dart';
import 'package:provider/provider.dart';

class DetilProfile extends StatelessWidget {
  const DetilProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        'Detil Posting',
        context,
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: Consumer<LoginProvider>(
          builder: (_, data, ch) => data.countDataUser() == 0
              ? const SizedBox()
              : ListView(
                  children: [
                    ProfileTile(
                      title: 'Username',
                      value: data.dataUser!.username.toString(),
                    ),
                    ProfileTile(
                      title: 'Email',
                      value: data.dataUser!.email.toString(),
                    ),
                    ProfileTile(
                      title: 'Address',
                      value: data.dataUser!.address!.street.toString(),
                    ),
                    ProfileTile(
                      title: 'Phone',
                      value: data.dataUser!.phone.toString(),
                    ),
                    CustomButton(
                      title: 'Logout',
                      onPress: () {
                        LoginProvider prov = Provider.of<LoginProvider>(
                          context,
                          listen: false,
                        );
                        prov.logout(context);
                      },
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
