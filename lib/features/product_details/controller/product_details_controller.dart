import 'package:get/get.dart';
import '../model/product_details_model.dart';

class ProductDetailsController extends GetxController {

  final product = ProductDetailsModel(
    name: "Headphone",
    price: "\$22.50",
    image: "assets/images/headphone.png",
    description:
        "PipeMaster Plumbing is not just a service; it's a commitment to providing reliable and efficient plumbing solutions.",
  );

}