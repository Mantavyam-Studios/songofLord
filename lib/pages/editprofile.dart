import "package:flutter/material.dart";

class EditePage extends StatelessWidget {
  const EditePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey, // Adjust color as needed
            ),
          ),
        leading: Container(

        child: Image.asset("assets/images/back.png")
        ),
      title: Row( 
        children: [Text("Settings",style: TextStyle(fontSize: 14)),SizedBox(width:25),Text("Edite Profile",style: TextStyle(fontSize: 18))])),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/shiv.jpeg"),
              )
              
            ),
         Container(
        child:  TextButton.icon(
         onPressed: () {},
        icon: Icon(Icons.edit_note,color: Colors.black,size:25),
         label: Text(" Change Image",style: TextStyle(fontSize: 20,color: Colors.black)),
           ),
           decoration: BoxDecoration(
           border: Border.all(
            color: Colors.black
           ),
            borderRadius:  BorderRadius.circular(25)
           )
           ),
           const Divider(
          
           ),

           Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment:CrossAxisAlignment.start,
           children: [
            Container(margin: EdgeInsets.only(left: 18),child:Text("Full Name")),
              Container(
            margin: EdgeInsets.all(20),
            child: TextField(
             decoration: InputDecoration(
              labelText: "Full Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )
             )
            ),
            


          ),
          Container(margin: EdgeInsets.only(left: 18),child:Text("Full Name")),
              Container(
            margin: EdgeInsets.all(20),
            child: TextField(
             decoration: InputDecoration(
              labelText: "Email Address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )
             )
            ),
            


          )

           ],),
           

          ],
        ),
      )
      );
      
      

      
    
  }
}
