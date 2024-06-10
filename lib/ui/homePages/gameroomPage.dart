import 'package:flutter/material.dart';
import '../gameRoom/Createroom.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  // Controller to handle the input of the room code
  final TextEditingController _roomCodeController = TextEditingController();
  // Variable to store error messages
  String? errorMessage;

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _roomCodeController.dispose();
    super.dispose();
  }

  // Function to validate the room code
  bool validateRoomCode(String code) {
    // Check if the code is 6 characters long and contains at least one letter
    return code.length == 6 && code.contains(RegExp(r'[A-Za-z]'));
  }

  // Function to show the join room dialog
  void showJoinRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // Dialog title
          title: Center(
            child: Text(
              'Enter Room Code',
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontFamily: 'mafia',
              ),
            ),
          ),
          // Set the background color of the dialog
          backgroundColor: Colors.brown,
          // Dialog content
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField for entering the room code
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 39.9),
                child: TextField(
                  controller: _roomCodeController,
                  decoration: InputDecoration(
                    hintText: 'Type here....',
                    fillColor: Colors.yellow[100],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 17.0,
                      horizontal: 15.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'mafia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'mafia',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[850],
                  ),
                ),
              ),
              // Display error message if any
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
          // Dialog actions
          actions: <Widget>[
            // Cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Join button
            ElevatedButton(
              onPressed: () {
                // Validate the entered room code
                setState(() {
                  String enteredCode = _roomCodeController.text;
                  if (validateRoomCode(enteredCode)) {
                    // Handle successful room code validation (e.g., join room)
                    print('Room code validated: $enteredCode');
                    Navigator.pop(context);
                  } else {
                    // Show error message for invalid room code
                    errorMessage = 'Invalid room code!';
                  }
                });
              },
              child: Text(
                'Join',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set background image for the container
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/home.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 70),
            // Title text
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(
                "    Create\nFree Room",
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'mafia',
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[400],
                ),
              ),
            ),
            // Row for create and join buttons
            Row(
              children: [
                // Create room button
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Room(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/room.png', height: 70),
                  ),
                ),
                // Join room button
                Expanded(
                  child: IconButton(
                    onPressed: () => showJoinRoomDialog(context),
                    icon: Image.asset('assets/join.png', height: 70),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
