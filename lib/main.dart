import 'package:flutter/material.dart';
import 'package:registrationform/showdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Registration form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences preferences;
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool _name = false;
  bool _email = false;
  bool _phoneNo = false;
  bool _date = false;
  bool _username = false;
  bool _password = false;
  bool _confirmpass = false;

  String _bday = "";

  String shared_NAME = "name";
  String shared_USERNAME = "username";
  String shared_EMAIL = "email";
  String shared_PHONE = "phone";
  String shared_BDATE = "bdate";

  void prefinit() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    prefinit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onEditingComplete: () {},
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    errorText: _name ? 'value cant be empty' : null,
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value.toString().trim().length == 0 || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onEditingComplete: () {},
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    errorText: _email ? 'value cant be empty' : null,
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (!value.toString().contains("@") || value.isEmpty) {
                      return 'Check your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onEditingComplete: () {},
                  controller: phoneNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone number',
                    errorText: _phoneNo ? 'value cant be empty' : null,
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value.toString().trim().length == 0 || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text(
                      _bday.isEmpty
                          ? 'Select Your Birthdate '
                          : 'Birthdate is $_bday ',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: _date ? Colors.blue : Colors.red),
                      textAlign: TextAlign.left,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onEditingComplete: () {},
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    errorText: _username ? 'value cant be empty' : null,
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value.toString().trim().length == 0 || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  onEditingComplete: () {},
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    errorText: _name ? 'value cant be empty' : null,
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value.toString().trim().length == 0 || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  onEditingComplete: () {},
                  controller: confirmPassController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    errorText: _confirmpass ? 'value cant be empty' : null,
                    labelText: 'Confirm Password',
                  ),
                  validator: (value) {
                    if (value.toString().trim().length == 0 || value.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    if (value.toString().trim().length == 0 ||
                        value != passwordController.text) {
                      return 'password and confirm password is not match';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  // onPressed: () => onlogin(),
                  //
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    print("selected time : $selectedDate ");

                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("if");
                      // preferences =  SharedPreferences.getInstance();
                      if (preferences != null) {
                        print("------------- if --------------------");
                        preferences.setString(
                            shared_NAME, nameController.text.toString());

                        preferences.setString(
                            shared_EMAIL, emailController.text.toString());

                        preferences.setString(
                            shared_PHONE, phoneNumController.text.toString());

                        preferences.setString(shared_BDATE, _bday.toString());

                        preferences.setString(shared_USERNAME,
                            userNameController.text.toString());
                        // if (selectedDate.day == DateTime.now().day &&
                        //     selectedDate.month == DateTime.now().month &&
                        //     selectedDate.year == DateTime.now().year) {
                        //   setState(() {
                        //     _date= false;
                        //   });
                        //
                        //   print(" if selected time : $selectedDate ");
                        // } else {
                        //   print("else selected time : $selectedDate ");

                        if (_date) {
                          nameController.text = "";
                          emailController.text = "";
                          phoneNumController.text = "";
                          setState(() {
                            _bday = "";
                          });

                          userNameController.text = "";
                          passwordController.text = "";
                          confirmPassController.text = "";
                          _date = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Showdata()),
                          );
                        }
                      } else {
                        print("------------- else --------------------");
                        prefinit();
                      }
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Showdata()),
                    // );
                  },

                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 1),
        lastDate: DateTime(DateTime.now().year + 1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _bday =
            "${selectedDate.day.toString()}/${selectedDate.month.toString()} /${selectedDate.year}";
        _date = true;
        // print("picked : $selectedDate ");
        // print("day: ${selectedDate.day}");
        // print("yr: ${selectedDate.year}");
        // print("month : ${selectedDate.month}");
      });
  }
}

// name, email, phone number, date of birth, username, password, confirmation password
