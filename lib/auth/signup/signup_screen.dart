
import 'package:flutter/material.dart';
import 'package:padora/auth/signup/block/signup_block.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController=TextEditingController();
  FocusNode _lastNameFocus=FocusNode();
  TextEditingController _lastNameController=TextEditingController();
  FocusNode _emailFocus=FocusNode();
  TextEditingController _emailController=TextEditingController();
  FocusNode _passwordFocus=FocusNode();
  TextEditingController _passwordController=TextEditingController();
  FocusNode _confromPasswordFocus=FocusNode();
  TextEditingController _conformPasswordController=TextEditingController();


  final bloc = SignupBlock();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 108),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "PADORA",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-156,
                padding: EdgeInsets.only(top: 24),
                margin: EdgeInsets.only(top: 196, left: 24, right: 24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Form(
                        key: this._formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: <Widget>[
                              _firstNameField(bloc), //First Name
                              SizedBox(
                                height: 24,
                              ),
                              _lastNameField(bloc), //Last Name
                              SizedBox(
                                height: 24,
                              ),
                              _emailField(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              _passwordField(bloc),//Password
                              SizedBox(
                                height: 24,
                              ),
                              _conformPasswordField(bloc),
                              SizedBox(
                                height: 24,
                              ),

                              Container(
                                width: double.maxFinite,
                                child: RaisedButton(
                                  color: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(4.0),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    if (this._formKey.currentState.validate()) {
                                      setState(() {
                                        this._formKey.currentState.save();
                                      });
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 4,
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(top: 12,bottom: 24),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    Text(
                                      "Login!",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ],

                                ),

                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstNameField(SignupBlock bloc){
    return StreamBuilder(
      stream: bloc.firstNameStream,
      builder: (context,snapdata){
        return  TextFormField(
          controller: _firstNameController,
          onFieldSubmitted: (_)=>{
            FocusScope.of(context).requestFocus(_lastNameFocus)

          },
          decoration: InputDecoration(
              labelText: "First Name",
              errorText: snapdata.error,
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white),
          style: TextStyle(color: Colors.black),
          onChanged: bloc.changeFirstName,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );

      },
    );

  }

  Widget _lastNameField(SignupBlock bloc){
    return StreamBuilder(
      stream: bloc.lastNameStream,
      builder: (context,snapdata){
        return   TextFormField(
          controller: _lastNameController,
          focusNode: _lastNameFocus,
          onFieldSubmitted: (_)=>{
            FocusScope.of(context).requestFocus(_emailFocus)

          },
          decoration: InputDecoration(
              labelText: "Last Name",
              errorText: snapdata.error,
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white),
          style: TextStyle(color: Colors.black),

          onChanged: bloc.changeLastName,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );

  }

  Widget _emailField(SignupBlock bloc){
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context,snapdata){
         return    TextFormField(
           controller: _emailController,
           focusNode: _emailFocus,
           onFieldSubmitted: (_)=>{
             FocusScope.of(context).requestFocus(_passwordFocus)
           },
           decoration: InputDecoration(
               labelText: "Email Id",
               errorText: snapdata.error,
               labelStyle: TextStyle(color: Colors.grey),
               fillColor: Colors.white),
           style: TextStyle(color: Colors.black),
           onChanged: bloc.changeEmail,
           textInputAction: TextInputAction.next,
           keyboardType: TextInputType.emailAddress,
         ); //Email;
      },
    );

  }

  Widget _passwordField(SignupBlock bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context,snapdata){
        return TextFormField(
          controller: _passwordController,
          focusNode: _passwordFocus,
          onFieldSubmitted: (_)=>{
            FocusScope.of(context).requestFocus(_confromPasswordFocus)
          },

          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              errorText: snapdata.error,
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white),
          style: TextStyle(color: Colors.black),
          onChanged: bloc.changePassword,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
        );
      },
    );

  }

  Widget _conformPasswordField(SignupBlock bloc){
    return StreamBuilder(
      stream: bloc.conformPasswordStream,
      builder: (context,snapdata){
         return TextFormField(
           controller: _conformPasswordController,
           focusNode: _confromPasswordFocus,
           onFieldSubmitted: (_)=>{

           },
           obscureText: true,
           decoration: InputDecoration(
               labelText: "Conform Password",
               errorText: snapdata.error,
               labelStyle: TextStyle(color: Colors.grey),
               fillColor: Colors.white),
           style: TextStyle(color: Colors.black),
           onChanged: bloc.changeConformPassword,
           textInputAction: TextInputAction.done,
           keyboardType: TextInputType.text,
         );
      },
    );

  }
}
