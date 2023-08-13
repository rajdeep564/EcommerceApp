import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final List<String> filters = const [
    'ALL',
    'NIKE',
    'ADIDAS',
    'ASIAN',
    'GO 21'
  ];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                );
    return    Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                 Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Shoes\nCollection',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                      
                            ),
                            ),
                ),
             Expanded(child: TextField(
              decoration: InputDecoration(
                border:border ,
                focusedBorder: border,
                hintText: 'search',
                prefixIcon: Padding(
                  padding:  EdgeInsets.fromLTRB(15, 0, 0,0),
                  child: Icon(Icons.search,),
                ),
              ),
            ),
            ),
            ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder:(context,index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal :8.0),
                    child: Chip(
                      backgroundColor :const Color.fromRGBO(245, 247, 249, 1),
                       label: Text(filter,),
                    
                    labelStyle: const TextStyle(
                      fontSize: 15,

                    ),
                    padding: const EdgeInsets.symmetric(vertical:15,horizontal: 20),),
                  );
                },
                ),
            )
            
          ],
          
        ),
      ),
    );
  }
}