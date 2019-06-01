import 'package:flutter/material.dart';
import 'package:flutterhack/boelens_bloc_provider.dart';
import 'package:flutterhack/user_bloc.dart';
import 'package:flutterhack/user_model.dart';

class UserWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: bloc.user,
      builder: (context, AsyncSnapshot<UserModel> user) {
        if( !user.hasData ) return SizedBox(height:0.0);
        return Text('${user.data.firstName} ${user.data.lastName}');
      }
    );
  }


}