import 'package:flutter/material.dart';
import 'package:lomaTV/core/widgets/custom_text_form_field.dart';
import 'package:lomaTV/features/search/presentation/mange/search_cubit/search_cubit.dart';
import 'package:lomaTV/features/search/presentation/views/widgets/search_bloc_builder/state_result_search_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFormField(
              isFilled: false,
              controller: textController,
              hintText: 'Enter Your Film',
              labelText: 'Search Now',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'enter the name of film !';
                }
                return null;
              },
              onFieldSubmitted: (data) {
                if (formKey.currentState!.validate()) {
                  SearchCubit.get(context).fetchSearchMovie(movieName: data);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              suffixIconPressed: () {
                if (formKey.currentState!.validate()) {
                  SearchCubit.get(context)
                      .fetchSearchMovie(movieName: textController.text);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const StateResultSearchBlocBuilder(),
        ],
      ),
    );
  }
}
