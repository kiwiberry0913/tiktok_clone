import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool isWriting = false;

  void _onStartWriting() {
    setState(() {
      isWriting = true;
    });
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
    setState(() {
      isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1691772916944-e82cb4865791?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"),
                child: Text('Keri'),
              ),
              Positioned(
                left: 30,
                top: 30,
                child: Container(
                  height: Sizes.size20,
                  width: Sizes.size20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreen,
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3.0),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            "Keri",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _closeKeyboard,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size20,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size20,
                          ),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            !isMine ? Sizes.size20 : Sizes.size5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "This is a message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                color: Colors.grey.shade50,
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                  horizontal: Sizes.size16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size44,
                        child: GestureDetector(
                          onTap: _onStartWriting,
                          child: TextField(
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    Sizes.size20,
                                  ),
                                  topRight: Radius.circular(
                                    Sizes.size20,
                                  ),
                                  bottomLeft: Radius.circular(
                                    Sizes.size20,
                                  ),
                                  bottomRight: Radius.circular(
                                    Sizes.size1,
                                  ),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size10,
                              ),
                              hintText: "Send a message...",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.all(Sizes.size10),
                                child: FaIcon(
                                  FontAwesomeIcons.faceLaugh,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h10,
                    FaIcon(FontAwesomeIcons.telegram,
                        size: Sizes.size36, color: Colors.grey.shade300),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
