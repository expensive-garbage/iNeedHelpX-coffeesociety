import 'package:coffeesociety/models/stripepay_model.dart';
import 'package:coffeesociety/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PaymentWidget extends StatelessWidget {
  final StripePaymentsModel stripePaymentsModel;

  const PaymentWidget({Key? key, required this.stripePaymentsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5), blurRadius: 15)
          ]),
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  text: "ITEMS:",
                  color: Colors.grey,
                ),
              ),
              CustomText(
                text: stripePaymentsModel.cart!.length.toString(),
                color: Colors.black,
                weight: FontWeight.bold,
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: " ${stripePaymentsModel.amount}",
                  color: Colors.black,
                  weight: FontWeight.bold,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          Divider(),
          Column(
              children: stripePaymentsModel.cart!
                  .map((item) => ListTile(
                        title: CustomText(
                          text: item['name'],
                        ),
                        trailing: CustomText(
                          text: " ${item['cost']}",
                        ),
                      ))
                  .toList()),
          Divider(),
          ListTile(
            title: CustomText(
              text: _returnDate(),
              color: Colors.grey,
            ),
            trailing: CustomText(
              text: stripePaymentsModel.status,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  String _returnDate() {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(stripePaymentsModel.createdAt!);
    return timeago.format(date, locale: 'ca');
  }
}
