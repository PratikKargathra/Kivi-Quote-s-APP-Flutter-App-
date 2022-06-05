import 'package:flutter/material.dart';
import 'package:kiviquotes/sources.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  int bottomBarIndex=0;
  late List<Quote>? dbFetchData;
  late Future<List<Quote>?> finalDBData;
  late List<Quote>? apiData;
  @override
  initState(){
    super.initState();
    finalDBData = initProcess();
  }
  Future<List<Quote>?> initProcess()async{
    dbFetchData = await DBHelper.dbHelper.fetchData();
    if(dbFetchData!.isEmpty || dbFetchData == null){
      apiData = await APIHelper.apiHelper.getQuotesList();
      apiData?.forEach((e) {DBHelper.dbHelper.insertDataIntoTable(e);});
      return initProcess();
    }
    return  DBHelper.dbHelper.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const  Color(0xff303030),
        title: Text("$query Quotes"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: finalDBData,
        builder: (BuildContext context, AsyncSnapshot snapshot){
         List<Quote>? allQuotes = snapshot.data;
         if(snapshot.hasError){
           return Center(child: Text("${snapshot.error}"),);
         }
          else if(snapshot.hasData){
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: allQuotes!.map((e) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.quote, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:  const Color(0xffEDEDED),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              Tooltip(
                                waitDuration: const Duration(milliseconds: 500),
                                triggerMode: TooltipTriggerMode.tap,
                                message: "Quotes Copied",

                                child: IconButton(
                                  icon: const Icon(Icons.copy_rounded, color: Color(0xff303030),),
                                  onPressed: (){
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.share_rounded, color: Color(0xff303030),),
                                onPressed: (){

                                },
                              ),
                              Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                message: "Quotes Copied",
                                child: IconButton(
                                  icon: const Icon(Icons.favorite, color: Color(0xff303030),),
                                  onPressed: (){

                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite, color: Color(0xff303030),),
                                onPressed: (){

                                },
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              )).toList(),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
