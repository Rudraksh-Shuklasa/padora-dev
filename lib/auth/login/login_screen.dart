import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padora/auth/login/block/login_block.dart';
import 'package:padora/utils/constants/image_constansts.dart';
import 'package:padora/utils/constants/route_constansts.dart';
import 'package:padora/utils/navigation.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final bloc = LoginBlock();
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
                height: MediaQuery.of(context).size.height - 196,
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
                        "LOGIN",
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
                              _emailField(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              _passwordField(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )),
                              SizedBox(
                                height: 24,
                              ),
                              _loginButton(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                height: 4,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              _facebookButton(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              _gmailButton(bloc),
                              SizedBox(
                                height: 24,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 4,
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(top: 10),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "New user? ",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: ()=>{NavigationUtils.push(context, ROUTE_REGISTER)},
                                      child: Text(
                                        "Sign up!",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
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

  Widget _facebookButton(LoginBlock provider){
    return StreamBuilder(
      stream: provider.submitValue,
      builder: (context,snapData){
        return  InkWell(
          onTap: ()=>{
            provider.handleSignIn().then((val){
              print(val);
            })
          },
          child:
          Container(
            color: Color(0xFF2f5597),
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  IC_FACEBOOK,
                  height: 18,
                  width: 18,

                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Login with Facebook",
                  style: GoogleFonts.pTSerifCaption(textStyle: TextStyle(color: Colors.white, fontSize: 14),),
                )
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _gmailButton(LoginBlock provider){
    return StreamBuilder(
      stream: provider.submitValue,
      builder: (context,snapData){
         return  InkWell(
           onTap: ()=>{
             provider.signInWithGoogle().then((val){
               print(val);
             })
           },
           child: Container(
             color: Color(0xFFd74938),
             padding: EdgeInsets.symmetric(vertical: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   "G",
                   style: TextStyle(
                       color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                 ),
                 SizedBox(
                   width: 12,
                 ),
                 Text(
                     "Login with Google",
                     style:  GoogleFonts.pTSerifCaption(textStyle: TextStyle(color: Colors.white, fontSize: 14),)
                 )
               ],
             ),
           ),
         );
      },
    );
  }

  Widget _emailField(LoginBlock provider){
    return  StreamBuilder(
      stream: provider.emailStream,
      builder: (context,snapshot){
        return TextFormField(
          decoration: InputDecoration(
              labelText: "Email id",
              labelStyle: TextStyle(color: Colors.grey),
              errorText: snapshot.error,
              fillColor: Colors.white),

          style: TextStyle(color: Colors.black),
          onChanged: provider.ChangeEmail,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );
      },

    );
  }

  Widget _passwordField(LoginBlock provider){
    return StreamBuilder(
      stream: provider.passwordStream,

      builder: (context,snapshot){
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              errorText: snapshot.error,
              labelStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white),
          style: TextStyle(color: Colors.black),
          onChanged: provider.ChangePassword,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
        );
      },
    );
  }
  Widget _loginButton(LoginBlock provider){
    return StreamBuilder(
      stream: provider.submitValue,
      builder: (context,snapshot){
        return  Container(
          width: double.maxFinite,
          child: RaisedButton(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white, fontSize: 16),
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(4.0),
                side: BorderSide(color:!snapshot.hasData?Colors.grey: Colors.black)),
            onPressed: !snapshot.hasData?null :(){
              setState(() {
                provider.submitLogin(context);
              });
            }
          ),
        );
      },

    );
  }

}
