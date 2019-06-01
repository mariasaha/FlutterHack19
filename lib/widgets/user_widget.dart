import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/user_bloc.dart';
import 'package:flutterhack/data/user_model.dart';

class UserWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: bloc.user,
      builder: (context, AsyncSnapshot<UserModel> user) {
        if( !user.hasData ) return SizedBox(height:0.0);
        return Text('${user.data.firstName} ${user.data.lastName}', style:TextStyle(fontWeight: FontWeight.w600));
      }
    );
  }


}