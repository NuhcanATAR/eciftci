import 'package:eciftci/feature/mainview/agriculturalcalendar/widget/eventcard_widget.dart';
import 'package:eciftci/feature/mainview/agriculturalcalendar/widget/eventcreatebutton_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/agirculturalcalendar_base/agirculturalcalendar_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:table_calendar/table_calendar.dart';

class AgriculturalCalendarView extends StatefulWidget {
  const AgriculturalCalendarView({super.key});

  @override
  State<AgriculturalCalendarView> createState() =>
      _AgriculturalCalendarViewState();
}

class _AgriculturalCalendarViewState
    extends MainAgriculturalCalendarBase<AgriculturalCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Tarım Takvimi",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            // table calendar widget
            buildTableCalendarWidget,
            // button
            buildNoteCreateBtnWidget,
            // note card
            buildNoteCardWidget,
          ],
        ),
      ),
    );
  }

  // table calendar widget
  Widget get buildTableCalendarWidget => TableCalendar(
        headerStyle: HeaderStyle(
            titleTextStyle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.titleMedium?.copyWith(
            color: MainAppColorConstant.mainColorBackground,
          ),
        )),
        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(color: Colors.black),
          weekendTextStyle: const TextStyle(color: Colors.red),
          // ...
          selectedDecoration: BoxDecoration(
            color: MainAppColorConstant.mainColorBackground,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(color: Colors.white),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(serviceModel.selectedDate, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            serviceModel.selectedDate = selectedDay;
            serviceModel.focusedDay = focusedDay;

            loadEventForDate(selectedDay);
          });
        },
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2100, 12, 31),
        focusedDay: serviceModel.focusedDay,
        calendarFormat: serviceModel.calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            serviceModel.calendarFormat = format;
          });
        },
      );

  // button
  Widget get buildNoteCreateBtnWidget => serviceModel.selectedNote.isEmpty
      ? EventCreateButtonWidget(
          showNoteDialog: showCreateEventViewDialog,
          maxWidth: maxWidth,
          dynamicHeight: dynamicHeight,
        )
      : const SizedBox();

  // note card
  Widget get buildNoteCardWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: serviceModel.selectedNote.isEmpty
            ? const SizedBox()
            : EventNoteCardWidget(
                maxWidth: maxWidth,
                serviceModel: serviceModel,
                agriculturalCalendarEventDelete:
                    agriculturalCalendarEventDelete,
              ),
      );
}
