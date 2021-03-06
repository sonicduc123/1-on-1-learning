import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/post_api.dart';
import 'package:let_tutor/data/network/put_api.dart';
import 'package:let_tutor/models/user.dart';
import 'package:let_tutor/ui/account/widgets/avatart.dart';
import 'package:let_tutor/ui/account/widgets/date_picker.dart';
import 'package:let_tutor/ui/account/widgets/language_picker.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/input_with_icon.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef UserChangeCallback = Function(User user);

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.user, required this.callback})
      : super(key: key);

  final User user;
  final UserChangeCallback callback;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.user.name!;
    getPassword();
    if (widget.user.language != null) {
      languageController.text = widget.user.language!;
    }
    if (widget.user.country != null) {
      locationController.text = widget.user.country!;
    }
    if (widget.user.birthday != null) {
      birthdayController.text = widget.user.birthday!;
    } else {
      DateTime now = DateTime.now();
      birthdayController.text = now.toString().substring(0, 10);
    }
    super.initState();
  }

  void getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    passwordController.text = prefs.getString("password")!;
  }

  Future<void> onSavePress() async {
    setState(() {
      isLoading = true;
    });
    // change user infor
    await PutAPI.changeUserInfor(nameController.text, languageController.text,
        locationController.text, birthdayController.text);

    // change password
    await PostAPI.changePassword(passwordController.text);

    setState(() {
      widget.user.name = nameController.text;
      widget.user.language = languageController.text;
      widget.user.country = locationController.text;
      widget.user.birthday = birthdayController.text;
      isLoading = false;
      widget.callback(widget.user);
    });

    if (!isLoading) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Your information have changed successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = Avatar(
      user: widget.user,
      callback: widget.callback,
    );

    Widget name = EditableText(
      textAlign: TextAlign.center,
      controller: nameController,
      focusNode: FocusNode(),
      cursorColor: Colors.black,
      backgroundCursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onSubmitted: print,
    );

    Widget email = Text(widget.user.email!);

    Widget password =
        createInputWithIcon(Icons.lock, 'Password', passwordController);

    Widget language = LanguagePicker(controller: languageController);

    Widget location = Row(
      children: [
        const Icon(Icons.location_on, color: Colors.blue, size: 30),
        CountryCodePicker(
          onChanged: (countryCode) {
            locationController.text = countryCode.code!;
          },
          initialSelection: locationController.text,
          favorite: const ['VN'],
          showCountryOnly: true,
          showOnlyCountryWhenClosed: true,
          alignLeft: false,
          searchDecoration:
              const InputDecoration(hintText: 'Search name, code, dial number'),
        )
      ],
    );

    Widget birthday = DatePicker(dateController: birthdayController);

    Widget saveButton = createButtonExpanded('Save', action: () async {
      if (formKey.currentState!.validate()) {
        await onSavePress();
      }
    });

    return Scaffold(
      appBar: createAppBar('Profile', true, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                avatar,
                space(20),
                name,
                space(20),
                email,
                space(20),
                password,
                space(20),
                language,
                space(20),
                location,
                space(20),
                birthday,
                space(50),
                saveButton,
                space(10),
                if (isLoading) const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
