import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kiviquotes/sources.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  bool searchbar = false;
  TextEditingController searchController = TextEditingController();
  int bottomBarIndex = 0;
  int sliderPageIndex = 0;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff303030),
        elevation: 0,
        leading: Transform.scale(
          scale: 0.6,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: (){
              (_animationController.isCompleted)?_animationController.reverse():_animationController.forward();
              print(_animationController.status);
            },
            icon: AnimatedIcon(
              size: 50,
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              color: const Color(0xFF303030),
            ),
          ),
        ),
        actions: [
          Transform.scale(
            scale: 0.6,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: (){
                  searchbar = !searchbar;
                  setState((){});
              },
              icon:  searchbar?const Icon(Icons.close, size: 50,):const Icon(Icons.search_rounded, size: 50),
            ),
          ),
        ],
        title: (searchbar)? TextField(
          onSubmitted: (val){
            query = searchController.text;
            Navigator.pushNamed(context, "quotes_list_page");
            searchController.clear();
          },
          controller: searchController,
          decoration: const InputDecoration(
            fillColor: Color(0xffEDEDED),
            filled: true,
            hintText: "Search Quotes",
            border: InputBorder.none,
          ),
        ):const Text("Kivi Quote's", style: TextStyle( fontWeight: FontWeight.w600, fontSize: 22),),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 10,bottom: 90),
        children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                    items: images.map((e) => Container(
                      margin: const EdgeInsets.only(left:10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        )
                      ),
                    )).toList(),
                    options: CarouselOptions(
                      onPageChanged: (val,_){
                        sliderPageIndex = val;
                        setState((){});
                      },
                      autoPlay: true,
                      aspectRatio: 1.50,
                      enableInfiniteScroll: true,
                      viewportFraction: 1
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.map((e) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2.5,vertical: 20),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: images[sliderPageIndex]==e?Colors.white:Colors.white.withOpacity(0.30),
                    ),
                  )).toList(),
                ),
              ],
            ),
            Column(
              children: homePageLists.map(
                      (e) =>  e.isGrid?Column(
                        children: [
                          Padding(
                            padding:  const EdgeInsets.only(top: 20,bottom: 10,right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(e.title, style: const TextStyle(color: Color(0xff303030), fontSize: 22, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 100,
                              ),
                              children: e.quoteCategoryList.map((e) => InkWell(
                                onTap: (){
                                  query = e;
                                  Navigator.pushNamed(context, "quotes_list_page");
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff303030),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("$e\nQuotes",style: const TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.center,),
                                ),
                              )).toList(),
                            ),
                          ),
                        ],
                      ):Column(
                        children: [
                          Padding(
                            padding:  const EdgeInsets.only(top: 10,bottom: 0,right: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(e.title, style: const TextStyle(color: Color(0xff303030), fontSize: 22, fontWeight: FontWeight.w600),),
                                TextButton(onPressed: (){e.isGrid = !e.isGrid; setState((){});}, child: const Text("View More >",style: TextStyle(fontSize: 15, color: Color(0xff303030)),))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: e.quoteCategoryList.map((e) => InkWell(
                                  onTap: (){
                                    query = e;
                                    Navigator.pushNamed(context, "quotes_list_page");
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 172,
                                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff303030),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("$e\nQuotes",style: const TextStyle(color: Colors.white,fontSize: 18,),textAlign: TextAlign.center,),
                                  ),
                                )).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
              ).toList(),
            )


        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xff303030),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          IconButton(
              onPressed: (){
                setState((){
                  bottomBarIndex = 0;
                });
              },
              icon: bottomBarIndex!=0?Icon(Icons.home_outlined, color: Colors.grey.shade600,size: 30):const Icon(Icons.home, color: Colors.white,size: 30),
          ),
          IconButton(
            onPressed: (){
              setState((){
                bottomBarIndex = 1;
              });
            },
            icon: bottomBarIndex!=1?Icon(Icons.favorite_outline, color: Colors.grey.shade600,size: 30):const Icon(Icons.favorite_rounded, color: Colors.white,size: 30),
          ),
          IconButton(
             onPressed: (){
               setState((){
                 bottomBarIndex = 2;
               });
             },
            icon: bottomBarIndex!=2?Icon(Icons.checklist_rtl_rounded, color: Colors.grey.shade600,size: 30):const Icon(Icons.checklist_rtl_rounded, color: Colors.white,size: 30),
           ),
         ],
        ),
      ),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
