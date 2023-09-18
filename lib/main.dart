import 'package:flutter/material.dart';

void main() {
  runApp(const AssignmentApp());
}

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  static const List<String> images = [
    "https://avatars.githubusercontent.com/u/43510799?v=4?s=100",
    "https://c4.wallpaperflare.com/wallpaper/701/216/855/cat-4k-high-resolution-image-wallpaper-preview.jpg",
    "https://images.pexels.com/photos/1170986/pexels-photo-1170986.jpeg?cs=srgb&dl=pexels-evg-kowalievska-1170986.jpg&fm=jpg",
    "https://st.depositphotos.com/1735158/2383/i/450/depositphotos_23835875-stock-photo-cat-and-flower-on-the.jpg",
    "https://images.unsplash.com/photo-1601275226085-f446243383cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGRvbWVzdGljJTIwY2F0fGVufDB8fDB8fHww&w=1000&q=80",
    "https://images.unsplash.com/photo-1653906070964-f729cb93f0a7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8SmxMVWRQb051ckl8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=420&q=60",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to My Photo Gallery!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(9),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for photos...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(
                        color: Colors.white,
                        child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(child: Text(
                          "Photo $index",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ),
                      ),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Image $index clicked!"),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          color: Colors.grey,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:  (context, index) =>  ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage(images[index])),
                  title: Text('Photo ${index+1}'),
                  subtitle: Text("Description of photo ${index+1}"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Photos Uploaded Successfully!"),
                  ),
                );
              },
              child: const Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}