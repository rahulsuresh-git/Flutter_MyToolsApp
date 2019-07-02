import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetableInput extends StatefulWidget {
  @override
  _TimetableInputState createState() => _TimetableInputState();
}

class _TimetableInputState extends State<TimetableInput> {
  bool _validate = true;
  final Firestore _db = Firestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AController = TextEditingController();
  final BController = TextEditingController();
  final CController = TextEditingController();
  final DController = TextEditingController();
  final EController = TextEditingController();
  final FController = TextEditingController();
  final GController = TextEditingController();
  String _batch = "";
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      AController.text = prefs.getString('A');
      BController.text = prefs.getString('B');
      CController.text = prefs.getString('C');
      DController.text = prefs.getString('D');
      EController.text = prefs.getString('E');
      FController.text = prefs.getString('F');
      GController.text = prefs.getString('G');
      _batch = prefs.getString('batch');
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  asyncFunc() async {
    // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('A', AController.text.toUpperCase());
    prefs.setString('B', BController.text.toUpperCase());
    prefs.setString('C', CController.text.toUpperCase());
    prefs.setString('D', DController.text.toUpperCase());
    prefs.setString('E', EController.text.toUpperCase());
    prefs.setString('F', FController.text.toUpperCase());
    prefs.setString('G', GController.text.toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Step One"),
        ),
        body: Form(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Theory Slots",
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 5)),
                Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    height: 35,
                    width: 160,
                    child: Center(
                      child: Text(
                        'You are in ' + _batch,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Center(
                  child: Text("Note: Type in the format 'SUBJECT+VENUE'",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                Center(
                  child: Text("Example: OS TP601",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextField(

                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                          
                        decoration: InputDecoration(
                          labelText: "A Slot ",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: AController,
                        
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "B Slot ",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: BController,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "C Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: CController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "D Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: DController,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "E Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                        controller: EController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    new Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          labelText: "F Slot",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorText: _validate
                              ? null
                              : 'Registration Number is not in the right format!',
                        ),
                        controller: FController,
                        keyboardType: TextInputType.text,
                        autocorrect: true,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: InputDecoration(
                    labelText: "G Slot",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorText: _validate
                        ? null
                        : 'Registration Number is not in the right format!',
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  controller: GController,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Card(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () async {
                      await asyncFunc();
                      await _firebaseAuth.currentUser().then((userId) {
                        DocumentReference ref =
                            _db.collection("timetable").document(userId.uid);
                        ref.setData({
                          'A': AController.text,
                          'B': BController.text,
                          'C': CController.text,
                          'D': DController.text,
                          'E': EController.text,
                          'F': FController.text,
                          'G': GController.text,
                          'tt': true,
                        }, merge: true);
                      });
                      print(_batch);
                      if (_batch == "Batch 2")
                        Navigator.pushNamed(context, '/TimetableInputTwoBTwo');
                      else if (_batch == "Batch 1")
                        Navigator.pushNamed(context, '/TimetableInputTwoBOne');
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Save and Proceed',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                new InkWell(
                  child: new Text(
                    "Why should I enter manually?",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onTap: () async {
                    Toast.show(
                        message:
                            "Accessing/Scraping Academia data without Zoho's legal permission is strictly prohibited.",
                        duration: Delay.LONG,
                        textColor: Colors.black);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
