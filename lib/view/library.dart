import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:miniprojet/view/leaderboard.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final ScrollController _cont = ScrollController();
  final ScrollController _cont2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

            GestureDetector(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.scoreboard_outlined,
                  color: Color(0xFF6190BA),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("1023Pts",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color:Color(0xFF6190BA),
                        fontSize: 20,
                        
                    ),
                    ),
                  ),
                ],
              ),
            ),

          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search for a book by name "),
                Icon(Icons.search),
              ],
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(197, 97, 144, 186),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _cont,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(context: context, 
                              
                              builder: (context) => AlertDialog(
                                icon: Icon(Icons.book),
                                actions: [
                                   MaterialButton(onPressed: (){},
                                   child: Text("Download"),
                                   ),
                                  MaterialButton(onPressed: (){},
                                  child: Text("Read in App"),
                                  )

                                ],

                              )
                              
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 7),
                                          child: Image.asset('assets/book2.png'),
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.memory_rounded,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "Design",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Spacer(
                                              flex: 2,
                                            ),
                                            Icon(
                                              Icons.watch_later_outlined,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "2 Months",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 7),
                                          child: const Text(
                                            "Google UI/UX Certificate Preparation",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          overflow: TextOverflow.ellipsis,
                                          "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Because You read Google UI/UX Guides",
                                    style: TextStyle(
                                      color: Color(0xFF6190BA),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/book3.png',
                                        ),
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.memory_rounded,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Programming",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "2 Months",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                        "C# Fundamentals",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Because You read C vs C#",
                                style: TextStyle(
                                  color: Color(0xFF6190BA),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/book3.png',
                                        ),
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.memory_rounded,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Programming",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "2 Months",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                        
                                        "C# Fundamentals",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Because You read C vs C#",
                                style: TextStyle(
                                  color: Color(0xFF6190BA),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 7, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                            ),
                            onPressed: () {
                              _cont.animateTo(_cont.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: Icon(
                              Icons.arrow_left_rounded,
                              color: Color(0xFF6190BA),
                            )),
                        SizedBox(width: 10),
                        IconButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                            ),
                            onPressed: () {
                              _cont.animateTo(_cont.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: Icon(
                              Icons.arrow_right_rounded,
                              color: Color(0xFF6190BA),
                            ))
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 35,
          ),
          Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(197, 97, 144, 186),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: _cont2,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 200,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 7),
                                      child: Image.asset('assets/book2.png'),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.memory_rounded,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Design",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "2 Months",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                        "Google UI/UX Certificate Preparation",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Because You read Google UI/UX Guides",
                                style: TextStyle(
                                  color: Color(0xFF6190BA),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/book3.png',
                                        ),
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.memory_rounded,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Programming",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "2 Months",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                        
                                        "C# Fundamentals",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Because You read C vs C#",
                                style: TextStyle(
                                  color: Color(0xFF6190BA),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/book3.png',
                                        ),
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.memory_rounded,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Programming",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Icon(
                                          Icons.watch_later_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "2 Months",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: const Text(
                                        
                                        "C# Fundamentals",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Lorem ipsum dolor sit amet, consectetur adipising elit, sed do eiusmod tempor",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Because You read C vs C#",
                                style: TextStyle(
                                  color: Color(0xFF6190BA),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 7, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                            ),
                            onPressed: () {
                              _cont2.animateTo(_cont2.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: Icon(
                              Icons.arrow_left_rounded,
                              color: Color(0xFF6190BA),
                            )),
                        SizedBox(width: 10),
                        IconButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                            ),
                            onPressed: () {
                              _cont2.animateTo(_cont2.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: Icon(
                              Icons.arrow_right_rounded,
                              color: Color(0xFF6190BA),
                            ))
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
