import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.white),
      home: const MySettingsPage(title: 'Settings'),
    );
  }
}

class MySettingsPage extends StatefulWidget {
  final String title;

  const MySettingsPage({super.key, required this.title});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> with TickerProviderStateMixin {
  String username = "Username";
  String email = "useremail@example.com";
  String currentLanguage = "English";
  String currentTheme = "System";
  double textSize = 14.0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateProfile(String newUsername, String newEmail) {
    setState(() {
      username = newUsername;
      email = newEmail;
    });
  }

  void updateLanguage(String newLanguage) {
    setState(() {
      currentLanguage = newLanguage;
    });
  }

  void updateTheme(String newTheme) {
    setState(() {
      currentTheme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: ListView(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(
                          currentUsername: username,
                          currentEmail: email,
                          onProfileUpdated: updateProfile,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),

          // App Settings
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("App Settings", style: Theme.of(context).textTheme.titleLarge),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to Change Password Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text("Text Customisation"),
            trailing: Text("Current Notification Settings"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Text Customisation'),
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Text Size'),
                            Slider(
                              value: textSize,
                              min: 10.0,
                              max: 30.0,
                              onChanged: (double value) {
                                setState(() {
                                  textSize = value;
                                });
                              },
                            ),
                            const Text('Text Spacing'),
                            TextSpacingButtons(
                              onSpacingChanged: (String spacing) {},
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Save"),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            trailing: const Text("Current Notification Settings"),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SwitchListTile(
                          title: const Text('Email Notifications'),
                          value: true,
                          onChanged: (bool value) {},
                        ),
                        SwitchListTile(
                          title: const Text('Push Notifications'),
                          value: true,
                          onChanged: (bool value) {},
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            trailing: Text(currentLanguage),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Select Your Preferred Language'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile(
                          title: const Text("Hindi"),
                          value: "Hindi",
                          groupValue: currentLanguage,
                          onChanged: (String? value) {
                            if (value != null) {
                              updateLanguage(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        RadioListTile(
                          title: const Text("English"),
                          value: "English",
                          groupValue: currentLanguage,
                          onChanged: (String? value) {
                            if (value != null) {
                              updateLanguage(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        RadioListTile(
                          title: const Text("Gujarati"),
                          value: "Gujarati",
                          groupValue: currentLanguage,
                          onChanged: (String? value) {
                            if (value != null) {
                              updateLanguage(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        RadioListTile(
                          title: const Text("Tamil"),
                          value: "Tamil",
                          groupValue: currentLanguage,
                          onChanged: (String? value) {
                            if (value != null) {
                              updateLanguage(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        RadioListTile(
                          title: const Text("Telugu"),
                          value: "Telugu",
                          groupValue: currentLanguage,
                          onChanged: (String? value) {
                            if (value != null) {
                              updateLanguage(value);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // App Theme
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("App Theme", style: Theme.of(context).textTheme.titleLarge),
          ),
          ThemeButtons(
            currentTheme: currentTheme,
            onThemeChanged: (String theme) {
              updateTheme(theme);
            },
          ),

          // General
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("General", style: Theme.of(context).textTheme.titleLarge),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Rate the App"),
            onTap: () {
              // Implement rate functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text("Feedback"),
            onTap: () {
              // Implement feedback functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text("Contact Us"),
            onTap: () {
              // Implement contact functionality
            },
          ),
          const Divider(),

          // Sign Out Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.red),
              ),
              onPressed: () {
                // Implement sign out functionality
              },
              child: const Text("Sign Out", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String currentUsername;
  final String currentEmail;
  final Function(String, String) onProfileUpdated;

  const EditProfilePage({
    super.key,
    required this.currentUsername,
    required this.currentEmail,
    required this.onProfileUpdated,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.currentUsername);
    emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration:
                    const InputDecoration(border: OutlineInputBorder(), labelText: 'Username'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration:
                    const InputDecoration(border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget.onProfileUpdated(usernameController.text, emailController.text);
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                child:
                    const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextSpacingButtons extends StatefulWidget {
  final Function(String) onSpacingChanged;

  const TextSpacingButtons({super.key, required this.onSpacingChanged});

  @override
  _TextSpacingButtonsState createState() => _TextSpacingButtonsState();
}

class _TextSpacingButtonsState extends State<TextSpacingButtons> {
  String selectedSpacing = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSpacing = 'Small';
              widget.onSpacingChanged(selectedSpacing);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSpacing == 'Small' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('Small'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSpacing = 'Medium';
              widget.onSpacingChanged(selectedSpacing);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSpacing == 'Medium' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('Medium'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSpacing = 'Large';
              widget.onSpacingChanged(selectedSpacing);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedSpacing == 'Large' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('Large'),
        ),
      ],
    );
  }
}

class ThemeButtons extends StatefulWidget {
  final String currentTheme;
  final Function(String) onThemeChanged;

  const ThemeButtons({super.key, required this.currentTheme, required this.onThemeChanged});

  @override
  _ThemeButtonsState createState() => _ThemeButtonsState();
}

class _ThemeButtonsState extends State<ThemeButtons> {
  String selectedTheme = 'System';

  @override
  void initState() {
    super.initState();
    selectedTheme = widget.currentTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTheme = 'System';
              widget.onThemeChanged(selectedTheme);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTheme == 'System' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('System'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTheme = 'Light';
              widget.onThemeChanged(selectedTheme);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTheme == 'Light' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('Light'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTheme = 'Dark';
              widget.onThemeChanged(selectedTheme);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTheme == 'Dark' ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
          ),
          child: const Text('Dark'),
        ),
      ],
    );
  }
}
