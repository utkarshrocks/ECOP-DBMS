import 'package:ecop/API/Cop/AllFIRCopAPI.dart';
import 'package:ecop/API/Cop/MyCasesCopAPI.dart';
import 'package:ecop/API/Cop/MyFIRCopAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class CopHome extends StatefulWidget {
  @override
  _CopHomeState createState() => _CopHomeState();
}

class _CopHomeState extends State<CopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_police),
        title: Center(child: Text("COP")),
        actions: [
          IconButton(onPressed: (){
            Navigator.popAndPushNamed(context, LoginRouteCode);
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(
          width: Width,
          height: Height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Line("Cop Id", Cop.CopId),
              Line("Name", Cop.Name),
              Line("Mobile", Cop.Mobile),
              Line("Post", Cop.Post),
              Line("Station Posted", Cop.StationPosted),
              Line("City", Cop.City),
              Line("Postal Code", Cop.PostalCode),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){
                  AllFIRCopAPI().then((value){
                    Navigator.pushNamed(context, AllAvailableFIRRouteCode);
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.all_inbox,color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("ALL FIR",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      ],
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: (){
                      MyFIRCopAPI().then((value){
                        Navigator.pushNamed(context, MyAllFIRCopRouteCode);
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text("My FIR",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      MyCasesCopAPI().then((value){
                        if(value){
                          Navigator.pushNamed(context, MyAllCasesCopRouteCode);
                        }else MakeToast("Error Try Again", context);
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text("My Cases",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget Line(String a, String b){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Text(b,style: TextStyle(fontSize: 20),)
      ],
    );
  }
}