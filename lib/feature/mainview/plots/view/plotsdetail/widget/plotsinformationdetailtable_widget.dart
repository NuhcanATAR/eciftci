import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsInformationDetailTableWidget extends StatelessWidget {
  const PlotsInformationDetailTableWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // plots status
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Arazi Durumu",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['ACTIVE'] == true ? "Arazi Aktif" : "Arazi Kapalı",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // city
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "İl",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['CITY'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // district
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "İlçe",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['DISTRICT'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // neighborhoodVillage
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Mahalle-Köy",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['NEIGHBORHOODVILLAGE'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // neighborhoodNumber
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Mahalle No",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['NEIGHBORHOODNUMBER'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // island
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Ada",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['ISLAND'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // parcel
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Parsel",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['PARCEL'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // titleDeedArea
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Tapu Alanı",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['TITLEDEEDAREA'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // qalification
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Nitelik",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['QUALIFICATION'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // groundType
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Zemin Tipi",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['GROUNDTYPE'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // sheet
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Pafta",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['SHEET'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // location
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: LabelMediumBlackText(
                    text: "Mevkii",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              LabelMediumBlackBoldText(
                text: data['LOCATION'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
