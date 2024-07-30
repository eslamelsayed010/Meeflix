import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lomaTV/core/utils/app_router.dart';
import 'package:lomaTV/core/utils/style/color_manager.dart';
import 'package:lomaTV/core/widgets/custom_button.dart';
import 'package:lomaTV/features/get_start/presentation/manger/get_start_model.dart';
import 'package:lomaTV/features/get_start/presentation/views/widget/get_start_app_bar.dart';
import 'package:lomaTV/features/get_start/presentation/views/widget/get_start_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartPageView extends StatefulWidget {
  const GetStartPageView({Key? key}) : super(key: key);

  @override
  State<GetStartPageView> createState() => _GetStartPageViewState();
}

class _GetStartPageViewState extends State<GetStartPageView> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) =>
              GetStartImage(getStartModel: getStartModel[index]),
          itemCount: getStartModel.length,
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: GetStartAppBar(),
        ),
        Positioned(
          bottom: (MediaQuery.of(context).size.height * .15),
          child: SmoothPageIndicator(
            controller: controller,
            count: getStartModel.length,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: ColorManager.red,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        ),
        CustomButon(
          text: 'Getting started',
          marginHorizontal: 10,
          marginBottom: 20,
          background: ColorManager.red,
          withBorder: false,
          radius: 0,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUpView);
          },
        ),
      ],
    );
  }
}
