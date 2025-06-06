import '../../../../core/data/models/book_model/book_model.dart';
import '../../manager/similler/simeller_books_cubit.dart';
import 'details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimellerBooksCubit>(context).fetchSimellerBooksData(
      category: widget.bookModel.volumeInfo.categories?[0]??'',
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(bookModel: widget.bookModel,),
    );
  }
}
