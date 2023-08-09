// ignore_for_file: prefer_const_constructors, must_be_immutable, no_logic_in_create_state, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({
    super.key,
    required this.amount,
  });

  String? amount;
  @override
  State<PaymentDetails> createState() => _PaymentDetailsState(
        amount: amount,
      );
}

class _PaymentDetailsState extends State<PaymentDetails> {
  _PaymentDetailsState({
    required this.amount,
  }) {
    amountController.text = amount!;
  }
  TextEditingController amountController = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();
  TextEditingController CVCCVV = TextEditingController();

  String? amount;
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CreditCardWidget(
              cardBgColor: Color.fromRGBO(49, 126, 79, 1),
              cardNumber: cardNumber.text,
              expiryDate: expirydate.text,
              cardHolderName: "",
              cvvCode: CVCCVV.text,
              showBackView: isCvvFocused,
              isHolderNameVisible: false,
              obscureCardNumber: false,
              obscureInitialCardNumber: false,
              obscureCardCvv: false,
              glassmorphismConfig: Glassmorphism(
                  blurX: 0,
                  blurY: 0,
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(38, 153, 82, 0.73),
                        Color.fromRGBO(14, 82, 40, 0.73),
                      ])),
              chipColor: Color.fromARGB(255, 192, 207, 26),
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("المبلغ",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "IBMPlexSansArabic",
                              color: Color.fromRGBO(49, 126, 79, 1))),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: amountController,
                    enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Color.fromRGBO(101, 119, 101, 1),
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(101, 119, 101, 1),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("رقم البطاقة",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "IBMPlexSansArabic",
                              color: Color.fromRGBO(49, 126, 79, 1))),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onTap: () {
                      setState(() {
                        isCvvFocused = false;
                      });
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: cardNumber,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: Color.fromRGBO(101, 119, 101, 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(49, 126, 79, 1),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(101, 119, 101, 1),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("تاريخ الانتهاء",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "IBMPlexSansArabic",
                                    color: Color.fromRGBO(49, 126, 79, 1))),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onTap: () {
                            setState(() {
                              isCvvFocused = false;
                            });
                          },
                          onChanged: (value) {
                            setState(() {});
                            if (value.length == 2) {
                              expirydate.text += '/';
                              expirydate.selection = TextSelection.fromPosition(
                                  TextPosition(offset: expirydate.text.length));
                            }
                          },
                          controller: expirydate,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                          ],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(49, 126, 79, 1),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(101, 119, 101, 1),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("CVV",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "IBMPlexSansArabic",
                                    color: Color.fromRGBO(49, 126, 79, 1))),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onTap: () {
                            setState(() {
                              isCvvFocused = true;
                            });
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: CVCCVV,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(49, 126, 79, 1),
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(49, 126, 79, 1),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "ادفع الان",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "IBMPlexSansArabic",
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  primary: Color.fromRGBO(49, 126, 79, 1),
                  fixedSize: Size(400, 60)),
            )
          ],
        ),
      ),
    ));
  }
}
