import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedule_date_time_generator.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedules.dart';
import 'package:neocloud_mobile/screens/create/components/form_set_date_and_time.dart';
import 'package:neocloud_mobile/screens/create/components/form_set_time.dart';
import 'package:neocloud_mobile/screens/create/create_class_instance.dart';
import 'package:neocloud_mobile/screens/create/create_class_screen.dart';
import 'package:neocloud_mobile/screens/create/components/form_classwork.dart';
import 'package:neocloud_mobile/screens/create/create_faculty_screen.dart';
import 'package:neocloud_mobile/screens/create/select_faculty_screen.dart';
import 'package:neocloud_mobile/screens/create/select_user_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

showTopAlertDialog({required String text, bool isError = true}) {
  // Animation Controller
  AnimationController controller = AnimationController(
    vsync: Navigator.of(SizeConfig.appContext!).overlay!,
    duration: const Duration(milliseconds: 150),
  );

  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(builder: (context) {
    controller.forward();

    return Positioned(
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -.43),
            end: const Offset(0, -.40),
          ).animate(controller),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 1.3,
              ),
              decoration: BoxDecoration(
                  color: isError
                      ? const Color(0xFFeb4d4b)
                      : const Color(0xFF1dd1a1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: TextMedium(
                  title: text, color: kWhite, textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  });

  Future.delayed(const Duration(seconds: 3), () {
    controller.reverse();
    Future.delayed(
        const Duration(milliseconds: 500), () => overlayEntry.remove());
  });

  Overlay.of(SizeConfig.appContext!).insert(overlayEntry);
}

showCreateFacultyScreen() {
  return Navigator.of(SizeConfig.appContext!).push(
    DialogRoute(
        context: SizeConfig.appContext!,
        builder: (_) => const Center(
              child: CreateFacultyScreen(),
            )),
  );
}

showCreateClassScreen() {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return CreateClassScreen();
    },
  );
}

showCreateClassInstanceScreen() {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return CreateClassInstanceScreen();
    },
  );
}
showDialogWrapper({required Widget widget}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return SelectUsersScreen(
          users: usersToSelectFrom,
          selectedUsers: selectedUsers,
          selectionLimit: selectionLimit,
          press: press);
    },
  );
}

showSelectFacultyDialog({
  required List<FacultyModel> facultyToSelectFrom,
  required List<FacultyModel> selectedFaculties,
  required Function(List<FacultyModel> data) press,
  selectionLimit = 10,
}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return SelectFacultyScreen(
          faculties: facultyToSelectFrom,
          selectedFaculties: selectedFaculties,
          selectionLimit: selectionLimit,
          press: press);
    },
  );
}

showCreateScheduleDialog({
  required ClassModuleModel module,
  required int moduleCount,
  required Function(int moduleIndex, ClassModuleModel newModule) updateModule,
}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return FormSchedules(
          module: module, index: moduleCount, updateModule: updateModule);
    },
  );
}

showCreateClassworkDialog({
  required ClassScheduleModel schedule,
  required int index,
  required Function(int scheduleIndex, ClassScheduleModel newSchedule)
      updateSchedule,
}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return FormClassworkScreen(
          schedule: schedule, index: index, updateSchedule: updateSchedule);
    },
  );
}

showSetDateAndTime({
  required ClassScheduleModel schedule,
  required int index,
  required Function(int scheduleIndex, ClassScheduleModel newSchedule)
      updateSchedule,
}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (context) {
      return FormSetDateAndTime(
          schedule: schedule, index: index, updateSchedule: updateSchedule);
    },
  );
}

showSetTime({
  String title = 'Set Time',
  MyTimeOfDay? prevSelectedTime,
  MyTimeOfDay? defaultTime,
  required dynamic Function(MyTimeOfDay) press,
}) {
  return Navigator.of(SizeConfig.appContext!).push(DialogRoute(
    context: SizeConfig.appContext!,
    builder: (_) => Center(
      child: FormSetTime(
          title: title,
          press: press,
          defaultTime: defaultTime,
          prevSelectedTime: prevSelectedTime),
    ),
  ));
}

showScheduleTimeGenerator({
  required List<ClassModuleModel> modules,
  required Function(List<ClassModuleModel> modules) press,
}) {
  return showDialog(
    context: SizeConfig.appContext!,
    builder: (_) {
      return FormScheduleTimeGenerator(modules: modules, press: press);
    },
  );
}
