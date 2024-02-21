import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),
            backgroundColor: Colors.green,
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.group)),
              Tab(
                child: Text('Chats'),
              ),
              Tab(
                child: Text('Updates'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ]),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (
                    context,
                  ) =>
                      [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('New group'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('Settings'),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Text('Log out'),
                        )
                      ])
            ],
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(index.isOdd
                              ? 'https://images.unsplash.com/photo-1541271696563-3be2f555fc4e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                              : 'https://images.unsplash.com/photo-1552334949-51934e5f2d38?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
                      title: Text(index.isOdd ? 'study group' : 'Family group'),
                      subtitle: Text(index.isOdd
                          ? 'what happening in group?'
                          : 'New group created'),
                      trailing: Text(index.isOdd ? '12:00 a.m' : '02:00 p.m'),
                    );
                  }),
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(index.isEven
                            ? 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                            : 'https://images.unsplash.com/photo-1546961342-ea5f71b193f3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                      title: Text(index.isEven ? 'Mushy' : 'Kasuti'),
                      subtitle: Text(index.isEven
                          ? 'How was the game today?'
                          : 'I am coming home'),
                      trailing: Text('10:00 a.m'),
                    );
                  }),
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(index.isOdd
                                ? 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                : 'https://images.unsplash.com/photo-1548382131-e0ebb1f0cdea?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          ),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: index < 5 ? Colors.green : Colors.grey,
                            width: 4,
                          ),
                        ),
                      ),

                      title: Text('Amaal'),
                      subtitle: Text('08:12 p.m'),
                      // trailing: Icon(Icons.camera_alt)
                    );
                  }),
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(index.isEven
                              ? 'https://images.unsplash.com/photo-1564460576398-ef55d99548b2?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                              : 'https://images.unsplash.com/photo-1599147977279-23eead82f2a9?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                        title: Text(index.isEven ? 'Ruhaan' : 'Ayaan'),
                        subtitle: Text(index.isEven
                            ? 'You missed a voice call!'
                            : 'You missed a video'),
                        trailing:
                            Icon(index.isEven ? Icons.call : Icons.videocam),
                      )),
            ],
          )),
    );
  }
}
