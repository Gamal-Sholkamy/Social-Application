import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_application/screens/new_post/newPost.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                const Card(
                  elevation: 8.0,
                  margin: EdgeInsets.all(8),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: AssetImage("assets/images/3.jpg"),
                    fit: BoxFit.cover,
                    height: 200.0,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Communicate with your friends",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.lightBlue)),
                ),
              ],
            ),
            ListView.separated(
              physics:const NeverScrollableScrollPhysics() ,
              shrinkWrap: true,
                itemBuilder: (context,index)=>buildPostItem(context),
                separatorBuilder: (context,index)=>const SizedBox(height: 8,),
                itemCount: 10)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewPostScreen()));
        },
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }


  Widget buildPostItem(context)=>Card (
    elevation: 2.0,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/1.jpg"),
              //child: Image(image: AssetImage("assets/images/6.jpg"),)
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Gamal Sholkamy",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 18,
                    )
                  ],
                ),
                Row(
                  children: [

                    Text(
                      DateFormat.MMMd().format(DateTime.now()!),
                      style: const TextStyle(
                          fontSize: 14, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        const Text(
          "I'm not sure this is actually a problem with i3status-rust, since we can't modify any of our code to fix external font problems, but I'll leave the issue open for now. I'll very welcome to suggestions.",
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(height: 1.3, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            spacing: 3,
            children: [
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Software_Engineering",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Mobile_Developer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Flutter_Developer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#SoftWare",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Mobile_Developer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  child: const Text(
                    "#Flutter_Developer",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            image: AssetImage("assets/images/2.jpg"),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.favorite_outline),
            Text("1450"),
            Spacer(),
            Icon(Icons.comment),
            Text("320 comments"),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const CircleAvatar(radius:16,
                 backgroundImage: AssetImage("assets/images/7.jpg"),),
               const SizedBox(width: 5,),
               InkWell(
                 child: Container(
                     width: 120,
                     height: 40,
                     child: const Text("write a comment",style: TextStyle(fontSize: 16),)
                 ),
               ),
             ],
           ),
            Row(
              children: [
                const SizedBox(width: 10,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: const[
                      Icon(Icons.favorite_outline),
                      Text("Like"),
                    ],
                  ),
                ),
                const SizedBox(width: 30,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: const[
                      Icon(Icons.ios_share_outlined),
                      Text("Share"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
