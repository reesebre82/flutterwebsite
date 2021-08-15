import 'package:flutter/material.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/Contact/EmailSender.dart';

class ContactForm extends StatefulWidget {
  double width;
  double height;
  ContactForm({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1000)
      return Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: widget.width * 0.5,
              height: widget.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: ColorPalette.grey,
                                child: TextField(
                                  style: TextStyle(
                                    color: ColorPalette.white,
                                  ),
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17, color: Color(0xFFD3D3D3)),
                                    hintText: 'Name',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  color: ColorPalette.grey,
                                  child: TextField(
                                    style: TextStyle(
                                      color: ColorPalette.white,
                                    ),
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFFD3D3D3)),
                                      hintText: 'Email',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  color: ColorPalette.grey,
                                  child: TextField(
                                    style: TextStyle(
                                      color: ColorPalette.white,
                                    ),
                                    controller: subjectController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xFFD3D3D3)),
                                      hintText: 'Subject',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: Container(
                        color: ColorPalette.grey,
                        child: TextField(
                          maxLines: 10,
                          style: TextStyle(
                            color: ColorPalette.white,
                          ),
                          controller: messageController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 17, color: Color(0xFFD3D3D3)),
                            hintText: 'Message',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        print("wooo");
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: ColorPalette.blueMunsell,
                            duration: Duration(milliseconds: 2000),
                            content: Container(
                                height: 30,
                                child: Center(child: Text("Message Sent!"))),
                          ),
                        );
                        // EmailSender.sendRegistrationNotification("testing");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: ColorPalette.mindaro,
                          child: Center(
                            child: Text("Send Email"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: widget.width * 0.75,
            height: widget.height,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: ColorPalette.grey,
                    child: TextField(
                      style: TextStyle(
                        color: ColorPalette.white,
                      ),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 17, color: Color(0xFFD3D3D3)),
                        hintText: 'Name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: ColorPalette.grey,
                    child: TextField(
                      style: TextStyle(
                        color: ColorPalette.white,
                      ),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 17, color: Color(0xFFD3D3D3)),
                        hintText: 'Email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: ColorPalette.grey,
                    child: TextField(
                      style: TextStyle(
                        color: ColorPalette.white,
                      ),
                      controller: subjectController,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 17, color: Color(0xFFD3D3D3)),
                        hintText: 'Subject',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: ColorPalette.grey,
                    child: TextField(
                      maxLines: 10,
                      style: TextStyle(
                        color: ColorPalette.white,
                      ),
                      controller: messageController,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 17, color: Color(0xFFD3D3D3)),
                        hintText: 'Message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      print("wooo");
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: ColorPalette.blueMunsell,
                          duration: Duration(milliseconds: 2000),
                          content: Container(
                              height: 30,
                              child: Center(child: Text("Message Sent!"))),
                        ),
                      );
                      //
                    },
                    child: Container(
                      color: ColorPalette.mindaro,
                      child: Center(
                        child: Text("Send Email"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
