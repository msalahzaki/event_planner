import 'package:event_planner/core/utils/app_color.dart';
import 'package:event_planner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/category_model.dart';
import '../home_page/category_widget.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<CategoryModel> categories = Categories.getCategories();
 String? eventDate ;
  int selectedCategory = 0;
  String? eventTime;

  TextEditingController eventTitleController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var local;

  @override
  initState(){
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    local = AppLocalizations.of(context)!;
    eventDate ??=local.choose_date ;
    eventTime ??= local.choose_time ;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.primaryLight),
        backgroundColor: AppColor.semiblue,
        centerTitle: true,
        title: Text(
          local.create_event,
          style: AppStyles.normal20blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category Image
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: size.height * .2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(categories[selectedCategory].image),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
                // List Of Categories
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              selectedCategory = index;
                              setState(() {});
                            },
                            child: CategoryWidget(
                              icon: categories[index].icon,
                              label: categories[index].name,
                              isSelected: index == selectedCategory,
                              bgColorSelected: AppColor.primaryLight,
                              bgColorunSelected: AppColor.transpernt,
                              labelColorSelected: AppColor.semiblue,
                              labelColorunSelected: AppColor.primaryLight,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                local.title,
                style: AppStyles.normal16black,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              TextFormField(
                validator: titleAndDescriptionValidate,
                controller: eventTitleController,
                style: AppStyles.normal16gray,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.note_alt_outlined),
                  hintText: local.event_title,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                local.description,
                style: AppStyles.normal16black,
              ),
              TextFormField(
                controller: eventDescriptionController,
                validator: titleAndDescriptionValidate,
                maxLines: 5,
                style: AppStyles.normal16gray,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  hintText: local.event_description,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    local.event_date,
                    style: AppStyles.normal16black,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        pickdate();
                      },
                      child: Text(
                        eventDate!,
                        style: AppStyles.normal16blue,
                      )),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  Text(
                    local.event_time,
                    style: AppStyles.normal16black,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        pickdtime();
                      },
                      child: Text(eventTime!, style: AppStyles.normal16blue)),
                ],
              ),
              Text(
                local.location,
                style: AppStyles.normal16black,
              ),
              ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColor.primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.primaryLight),
                    child: const Icon(
                      Icons.my_location_outlined,
                      color: AppColor.white,
                    ),
                  ),
                  title: Text(local.choose_event_location,
                      style: AppStyles.normal16blue),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColor.primaryLight,
                  )),
              SizedBox(
                height: size.height * .01,
              ),
              ElevatedButton(
                  onPressed: submit,
                  child: Text(
                    local.add_event,
                    style: AppStyles.bold20white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
  Future<void> pickdate () async{
    DateTime? pickeddate = await showDatePicker(context: context,initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (pickeddate != null){
      eventDate = pickeddate.toString().split(" ")[0];
      setState(() {
      });
    }}

  Future<void> pickdtime () async{
    TimeOfDay? pickedTime = await showTimePicker(context: context,initialTime: TimeOfDay.now());
    if (pickedTime != null){
      eventTime = pickedTime.format(context);
      setState(() {
      });
    }}

  String? titleAndDescriptionValidate(String? text) {
    if (text == null || text.trim().length < 3) {
      return ("Please Enter Valid Event details ");
    } else
      return null;
  }

  submit() {
    if (formkey.currentState!.validate()) {
      if (eventDate == null || eventDate!.contains(local.choose_date)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("please Enter Valid Date"),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (eventTime == null || eventTime!.contains(local.choose_time)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("please Enter Valid Time"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
