import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ItemDetailAppoint extends StatelessWidget {
  final String valueSate;
  final String valueStateAppoint;
  final String valueRegistry;
  final String valueObject;
  final String valueBHYT;
  final String valueName;
  final String valueBirthday;
  final String valueJob;
  final String valueSex;
  final String valuePeople;
  final String valueCountry;
  final String valueProvince;
  final String valuePhone;
  final String valueIdCart;
  final String valueCountryLiving;
  final String valueDistrict;
  final String valueCommune;
  final String valueHouse;
  final String valueRequest;
  final String valueRoom;
  final String valueDoctor;
  final String valueDate;
  final String valueContent;
  final String valueNote;
  final String trangThaiDenKham;

  const ItemDetailAppoint(
      {Key? key,
        required this.valueSate,
        required this.valueStateAppoint,
        required this.valueRegistry,
        required this.valueObject,
        required this.valueBHYT,
        required this.valueName,
        required this.valueBirthday,
        required this.valueJob,
        required this.valueSex,
        required this.valuePeople,
        required this.valueCountry,
        required this.valueProvince,
        required this.valuePhone,
        required this.valueIdCart,
        required this.valueCountryLiving,
        required this.valueDistrict,
        required this.valueCommune,
        required this.valueHouse,
        required this.valueRequest,
        required this.valueRoom,
        required this.valueDoctor,
        required this.valueDate,
        required this.valueContent,
        required this.valueNote,
        required this.trangThaiDenKham}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Column(
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 8, bottom: 8, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RowTextView(
                            lable: AppLocalizations.of(context)!.translate('state_physical_examination'),
                            content: valueSate, flexItemLeft: 2, flexItemRight: 3,
                          ),
                          RowTextView(
                            lable:AppLocalizations.of(context)!.translate('visit_state_physical_examination'),
                            content: valueStateAppoint,
                            // trangThaiDenKham: trangThaiDenKham,
                            flexItemLeft: 2, flexItemRight: 3,
                          ),
                          RowTextView(
                            lable:AppLocalizations.of(context)!.translate('channel'),
                            content: valueRegistry,
                            flexItemLeft: 2, flexItemRight: 3,
                          ),
                          RowTextView(
                            lable: AppLocalizations.of(context)!.translate('opposite_to'),
                            content: valueObject,
                            flexItemLeft: 2, flexItemRight: 3,
                          ),
                          RowTextView(
                            lable: AppLocalizations.of(context)!.translate('health_insurance_card_number'),
                            content: valueBHYT,
                            flexItemLeft: 2, flexItemRight: 3,
                          ),
                          RowTextView(
                            lable: '',
                            content: AppLocalizations.of(context)!.translate('confirm_health_insurance_card_number'),
                            // 'Xác thực thẻ bhyt',
                            flexItemLeft: 2, flexItemRight: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
        Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Column(children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 8, bottom: 8, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('patient_name'),
                          content: valueName,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('born'),
                          content: valueBirthday,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('job'),
                          content: valueJob,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('gender'),
                          content: valueSex,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('nation'),
                          content: valuePeople,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('nationality'),
                          content: valueCountry,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('born_province'),
                          content: valueProvince,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('phone_number'),
                          content: valuePhone,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('personal_id'),
                          content: valueIdCart,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('province_city'),
                          content: valueCountryLiving,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('district'),
                          content: valueDistrict,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('commune'),
                          content: valueCommune,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('apartment_number'),
                          content: valueHouse,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ])),
        Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Column(children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 8, bottom: 8, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RowTextView(lable: AppLocalizations.of(context)!.translate('request_physical_examination'), content: valueRequest, flexItemLeft: 2, flexItemRight: 3),
                        RowTextView(
                          lable: AppLocalizations.of(context)!.translate('clinic'),
                          content: valueRoom,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable:  AppLocalizations.of(context)!.translate('doctor'),
                          content: valueDoctor,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable:  AppLocalizations.of(context)!.translate('order_time'),
                          content: valueDate,
                          flexItemLeft: 2, flexItemRight: 3,
                          // check: true,
                          // icon: Icon(
                          //   Icons.date_range,
                          //   size: 15,
                          // ),
                        ),
                        RowTextView(
                          lable:  AppLocalizations.of(context)!.translate('physical_examination_name'),
                          content: valueContent,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                        RowTextView(
                          lable:  AppLocalizations.of(context)!.translate('note'),
                          content: valueNote,
                          flexItemLeft: 2, flexItemRight: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]))
      ],
    );
  }
}
