import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/plots/widget/plotscard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PlotsSearchView extends StatefulWidget {
  const PlotsSearchView({super.key});

  @override
  State<PlotsSearchView> createState() => _PlotsSearchViewState();
}

class _PlotsSearchViewState extends MainPlotsBase<PlotsSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Arazi Arama",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          // search widget
          buildSearchWidget,
          // goes list
          buildGoesListWidget,
        ],
      ),
    );
  }

  // search widget
  Widget get buildSearchWidget => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: TextField(
          textAlign: TextAlign.left,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 18,
            ),
            hintText: 'Arazi başlığı arayın',
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: (val) {
            setState(() {
              plotsModelService.plotsSearch = val;
            });
          },
        ),
      );

  // goes list
  Widget get buildGoesListWidget => Expanded(
        flex: 3,
        child: StreamBuilder<QuerySnapshot>(
          stream: PlotsServiceDB.LANDPLOTS.plotsListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: context.padding.low,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (data['TITLE'] != null &&
                        data['TITLE'].toString().toLowerCase().startsWith(
                            plotsModelService.plotsSearch.toLowerCase())) {
                      return PlotsCardWidget(
                        data: data,
                        routerService: routerService,
                      );
                    }

                    return const Center();
                  },
                ),
              ),
            );
          },
        ),
      );
}
