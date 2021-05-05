import 'package:flutter/material.dart';
import 'package:hagglex/config.dart';
import 'package:hagglex/pages/HomeScreen.dart';
import 'package:hagglex/widgets/Button.dart';


class SetupComplete extends StatefulWidget {
  @override
  _SetupCompleteState createState() => _SetupCompleteState();
}

class _SetupCompleteState extends State<SetupComplete> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text('Verify Your Account', style: h4,),
          Container(
            height: MediaQuery.of(context).size.height*.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 65,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // color: Colors.grey.withOpacity(0.3),
                          gradient: doneGradient,
                          borderRadius: BorderRadius.circular(100)
                          ),
                        child: Icon(Icons.done_outline,color: darkColor,),
                      ),
                      
                           SizedBox(height:15),
                          Text('Setup Completed', 
                          style: h5White, textAlign: TextAlign.center,),
                           SizedBox(height:15),
                          Text('Thank you for setting up you HaggleX account ', style: h6White,),
                    ],
                  ),
                ),
                    SizedBox(height:10),

                    // Text('Resend Code', style: h5Dark,),
                    
                    
                   


              ],
            ),
          ),
          Align(
            alignment:Alignment.bottomCenter,
            child:GestureDetector(
              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
              child: Button('START EXPLORING', 'color')
              )
            ),
        ],
      ),
    );
  }
}

class Search extends SearchDelegate{

  List<String> countries;

  @override
  List<Widget> buildActions(BuildContext context) {
      return<Widget>[
        IconButton(icon: 
        Icon(Icons.close), 
        onPressed: (){
            query="";
        })
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
      });
    }
  String selectedResult;
    @override
    Widget buildResults(BuildContext context) {
      return Container(
        color:darkColor,
        child: Center(
          child: Text(selectedResult !=null ? selectedResult:'')
        ),);
    }
  
  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList =['text 4', 'Text'];


    @override
    Widget buildSuggestions(BuildContext context) {
      
   List <String> suggestiontList =[];
  
      // print(_fetchData(context).length
        query.isEmpty ?   suggestiontList=listExample:
        suggestiontList.addAll(
     listExample);
    //  print(suggestiontList);
         return Container(
           color:darkColor,
           child: ListView.builder(
             itemCount: listExample.length,
             itemBuilder: (context, index){
               return suggestiontList.length >0 ? ListTile(
                 title: Text(suggestiontList[index].length>0?suggestiontList[index]:'nothing', style: text,),
                 onTap: (){
                   selectedResult =suggestiontList[index];
                   showResults(context);
                 },
               ): Center(child:Text('No gig found'));
             },
           ),
         );
       }
    

  }
  // IconButton(icon:Icon(Icons.search), onPressed(){}),


