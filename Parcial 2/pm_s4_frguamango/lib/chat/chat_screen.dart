import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jennifer"),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://scontent.fuio13-1.fna.fbcdn.net/v/t39.30808-6/492335229_1108383024661786_8689887300556157090_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=833d8c&_nc_ohc=ghrMDAphSOYQ7kNvwERfr62&_nc_oc=AdmMdQ8sUFAR31ejdIqD0q0JnlwiGs1h03g3h-qW5Ib6nf7fPIwpTDLmJEW0e8KasRA&_nc_zt=23&_nc_ht=scontent.fuio13-1.fna&_nc_gid=XjzoTXYGCsdU3kP6Ow_WXw&oh=00_AfN2gR-KWOUgv_-W48Uf_OIyJAvYps7vc35cvI57SycXpg&oe=684FF27F',
            ),
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Hola"),
            const Text("Te estoy esperando"),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text("Los chats");
                },
                itemCount: 10,
              ),
            ),
            const Text("Caja de texto"),
          ],
        ),
      ),
    );
  }
}
