import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

// Variables
var logger = Logger();
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

// Classes and methods
class TabsWeb extends StatefulWidget {
  final title;
  final route;

  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style:
              isSelected
                  ? GoogleFonts.roboto(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -8)),
                    ],
                    fontSize: 25.0,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.0,
                    decorationColor: Colors.tealAccent,
                  )
                  : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 3),
        TabsWeb(title: "Home", route: '/'),
        Spacer(),
        TabsWeb(title: "Works", route: '/works'),
        Spacer(),
        TabsWeb(title: "Blog", route: '/blog'),
        Spacer(),
        TabsWeb(title: "About", route: '/about'),
        Spacer(),
        TabsWeb(title: "Contact", route: '/contact'),
        Spacer(),
      ],
    );
  }
}

Widget urlLauncher(String imagePath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imagePath, color: Colors.black, width: 35.0),
    onPressed: () async {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception("Could not launch $url");
      }
    },
  );
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Drawer(
      width: widthDevice / 3,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/me.png"),
            ),
          ),
          SizedBox(height: 15.0),
          SansBold("Mosab AbuMoammar", 30.0),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                "assets/instagram.svg",
                "https://www.instagram.com/mosab_nr/",
              ),
              urlLauncher("assets/twitter.svg", "https://x.com/mosab_nr"),
              urlLauncher("assets/github.svg", "https://github.com/mosab-nr"),
            ],
          ),
        ],
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;

  const TabsMobile({super.key, required this.text, required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: CircleAvatar(
                radius: 72.0,
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/me.png"),
                ),
              ),
            ),
          ),
          TabsMobile(text: "Home", route: '/'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Works", route: '/works'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Blog", route: '/blog'),
          SizedBox(height: 20.0),
          TabsMobile(text: "About", route: '/about'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Contact", route: '/contact'),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                "assets/instagram.svg",
                "https://www.instagram.com/mosab_nr/",
              ),
              urlLauncher("assets/twitter.svg", "https://x.com/mosab_nr"),
              urlLauncher("assets/github.svg", "https://github.com/mosab-nr"),
            ],
          ),
        ],
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm({
    super.key,
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.maxLines,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sans(text, 16.0),
            SizedBox(height: 5.0),
            SizedBox(
              width: containerWidth,
              child: TextFormField(
                validator: validator,
                controller: controller,
                maxLines: maxLines == null ? null : maxLines,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.tealAccent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(height: 10),
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class AbleCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbleCustom({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference response = FirebaseFirestore.instance.collection(
    'messages',
  );

  Future addResponse(
    final firstName,
    final lastName,
    final email,
    final phoneNumber,
    final message,
  ) {
    return response
        .add({
          'first name': firstName,
          'last name': lastName,
          'email': email,
          'phone Number': phoneNumber,
          'message': message,
        })
        .then((value) {
          logger.d("Success");
          return true;
        })
        .catchError((error) {
          logger.d(error);
          return false;
        });
  }
}

Future DialogError(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: SansBold(title, 20.0),
        ),
  );
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 30.0),
          SansBold("Contact me", 40.0),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "First name is required";
                      }
                    },
                    controller: _firstNameController,
                    text: "First Name",
                    containerWidth: 350.0,
                    hintText: "Please type your first name",
                  ),
                  SizedBox(height: 15.0),
                  TextForm(
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Email is required";
                      }
                    },
                    controller: _emailController,
                    text: "Email",
                    containerWidth: 350.0,
                    hintText: "Please enter your email address",
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Last name is required";
                      }
                    },
                    controller: _lastNameController,
                    text: "Last Name",
                    containerWidth: 350.0,
                    hintText: "Please type your last name",
                  ),
                  SizedBox(height: 15.0),
                  TextForm(
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Phone number is required";
                      }
                    },
                    controller: _phoneController,
                    text: "Phone Number",
                    containerWidth: 350.0,
                    hintText: "Please type your phone number",
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
            controller: _messageController,
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hintText: "Please type your message",
            maxLines: 10,
          ),
          SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.tealAccent,
            height: 60.0,
            minWidth: 200.0,
            child: SansBold("Submit", 20.0),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold("Contact me", 35.0),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "First name is required";
              }
            },
            controller: _firstNameController,
            text: "First Name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
          ),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Last name is required";
              }
            },
            controller: _lastNameController,
            text: "Last Name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
          ),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Email is required";
              }
            },
            controller: _emailController,
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type email",
          ),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Phone number is required";
              }
            },
            controller: _phoneController,
            text: "Phone",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
          ),
          TextForm(
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
            controller: _messageController,
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type message",
            maxLines: 10,
          ),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: SansBold("Submit", 20.0),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: EdgeInsets.all(7.0),
    child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
  );
}
