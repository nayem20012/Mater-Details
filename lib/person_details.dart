

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Details extends StatelessWidget {

  String name ;
  String mobile;
  String email ;
  String image ;


  Details({super.key, required this.name, required this.mobile, required this.email, required this.image});




  callNumber() async {
    Uri dialNumber = Uri(scheme: 'tel', path: mobile );
    await launchUrl(dialNumber);
  }

  emailTo() async {
    Uri dialEmail = Uri(scheme: 'mailto', path: email );
    await launchUrl(dialEmail);
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width *0.3 , // Image radius
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text("Name: $name", style: const TextStyle(fontSize: 14),),
                      const SizedBox(height: 4,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          GestureDetector(onTap: callNumber,
                              child: const Icon(Icons.call)),
                          const SizedBox(width: 8,),
                          Text("Mobile: $mobile", style: const TextStyle(fontSize: 14),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(onTap: emailTo,child: const Icon(Icons.mail)),
                          const SizedBox(width: 8,),
                          Text("E-mail: $email", style: const TextStyle(fontSize: 14),),

                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
