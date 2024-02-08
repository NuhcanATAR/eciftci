import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceServiceCardWidget extends StatelessWidget {
  const MaintenanceServiceCardWidget(
      {required this.data, required this.routerService, super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.maintenanceServiceDetailViewNavigatorRouter(
          context,
          data,
        );
      },
      child: Card(
        child: ListTile(
          title: LabelMediumBlackBoldText(
            text:
                "Bakım Tarihi: ${data['DAYCARE']}.${data['MONTHCARE']}.${data['YEARCARE']}",
            textAlign: TextAlign.left,
          ),
          subtitle: LabelMediumGreyText(
            text: data['EXPLANATION'],
            textAlign: TextAlign.left,
          ),
          trailing: GestureDetector(
            onTap: () {
              BlocProvider.of<MaintenanceServiceCubit>(context)
                  .maintenanceServiceDelete(data);
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
