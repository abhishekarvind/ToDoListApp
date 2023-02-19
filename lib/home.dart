import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List toDolist=[];
  TextEditingController textcon =TextEditingController();
  void add(){
    setState(() {
      toDolist.add(textcon.text);
    });
    textcon.clear();
  }
  void removeval(int index){
    Future.delayed(
      const Duration(seconds: 2),(){
        setState(() {
          toDolist.removeAt(index);
        });
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30,left: 10),
              child: Text("To do List",style:
                TextStyle(fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white
                )
                ,),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 9,
                child:ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: toDolist.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        background: Card(
                          color: const Color(0xff18122B),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text("🔥🔥🔥🔥",style: TextStyle(
                                fontSize: 30,
                                color: Colors.white70,
                              ),),

                            ),
                          ),
                        ),
                        key: Key(toDolist[index]),
                        onDismissed: (direction){
                          removeval(index);
                        },
                        child: Card(
                          color: const Color(0xff443C68),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child:ListTile(
                                  title: Text(toDolist[index].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white70
                                  ),
                                  ),
                                  trailing: IconButton(onPressed:(){
                                    removeval(index);
                                  }, icon: const Icon(Icons.done,
                                    color: Colors.white70,
                                  ))
                                ),
                              ),
                            ),
                          )
                        ),
                      ),
                    );
                  }
                )
            ),
            Flexible(
              flex:1,
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width*0.80,
                      decoration: BoxDecoration(
                        color: const Color(0xff18122B),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: textcon,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                        ),
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                          ),
                        ),
                      )),
                  IconButton(onPressed: (){
                    add();
                  }, icon: const Icon(Icons.add,size: 30,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
