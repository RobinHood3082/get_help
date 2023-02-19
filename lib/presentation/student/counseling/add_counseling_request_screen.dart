import 'package:flutter/material.dart';
import 'package:get_help/core/utils/notifier_state.dart';
import 'package:get_help/presentation/student/counseling/counseling_provider.dart';
import 'package:get_help/presentation/widgets/custom_drawer.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';
import 'package:provider/provider.dart';

class AddCounselingRequestScreen extends StatefulWidget {
  const AddCounselingRequestScreen({super.key});

  @override
  State<AddCounselingRequestScreen> createState() =>
      _AddCounselingRequestScreenState();
}

class _AddCounselingRequestScreenState
    extends State<AddCounselingRequestScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController headingController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final notifier =
        Provider.of<StudentCounselingProvider>(context, listen: false);
    return ScaffoldWrapper(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Request for counseling',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Consumer<StudentCounselingProvider>(
            builder: (context, value, child) {
              if (value.notifierState == NotifierState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Request heading',
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: headingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // contentPadding: EdgeInsets.all(10),
                          // label: Text('Request heading'),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xFFBDD2B6)),
                              borderRadius: BorderRadius.circular(15)
                              // gapPadding: 20.0,
                              ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text('Request description'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        minLines: 2,
                        maxLines: 15,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // contentPadding: EdgeInsets.all(10),
                          // label: Text('Request description'),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color(0xFFBDD2B6)),
                              borderRadius: BorderRadius.circular(15)
                              // gapPadding: 20.0,
                              ),
                        ),
                      ),
                      CheckboxListTile(
                        // contentPadding: EdgeInsetsGeometry.lerp(a, b, t)
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        value: notifier.checkedAnonymous,
                        title: const Text('Post anonymously'),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          notifier.checkAnonymous();
                        },
                      ),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            notifier.addPost(headingController.text,
                                descriptionController.text);
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
