import '../../manager/search/searh_cubit.dart';
import 'search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
 const SearchView({super.key,});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    BlocProvider.of<SearhCubit>(context).searchBooks(query: 'computer science');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchViewBody(),
    );
  }
}
