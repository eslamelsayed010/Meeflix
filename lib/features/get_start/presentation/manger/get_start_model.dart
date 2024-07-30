import 'package:lomaTV/core/utils/assets.dart';

class GetStartModel {
  final String image;
  final String title;
  final String supTitle;

  GetStartModel({
    required this.image,
    required this.title,
    required this.supTitle,
  });
}

List<GetStartModel> getStartModel = [
  GetStartModel(
    image: AssetsData.image1,
    title: 'An endless number of movies, promotions and more',
    supTitle: 'Watch wherever you are. Cancel whenever you want.',
  ),
  GetStartModel(
    image: AssetsData.image2,
    title: 'We provide plans to suit all tastes',
    supTitle: 'Plan prices start from 70 EGP..',
  ),
  GetStartModel(
    image: AssetsData.picture4,
    title: 'Cancel online at any time',
    supTitle: 'No need to wait, sign up today.',
  ),
  GetStartModel(
    image: AssetsData.picture1,
    title: 'Watch anywhere',
    supTitle:
        'Enjoy streaming on your phone, tablet, laptop, or even on your TV.',
  ),
];
