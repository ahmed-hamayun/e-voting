import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(ElectronicVotingSystemApp());
}

class Candidate {
  final String name;
  final String details;

  Candidate({required this.name, required this.details});
}

class CandidatesList extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate(name: 'Candidate 1', details: 'Party: PTI \nSign: BAT'),
    Candidate(name: 'Candidate 2', details: 'Party: PMLN \nSign: LION'),
    Candidate(name: 'Candidate 3', details: 'Party: MQM \nSign: ARROW'),
    Candidate(name: 'Candidate 4', details: 'Party: FREE \nSign: BUCKET'),
    Candidate(name: 'Candidate 5', details: 'Party: UUU \nSign: STAMP'),
  ];
  //Create image list
  final List<String> images = [
    'https://i.ibb.co/nBjTvpM/logo-removebg-preview.png',
    'https://i.ibb.co/nBjTvpM/logo-removebg-preview.png',
    'https://i.ibb.co/nBjTvpM/logo-removebg-preview.png',
    'https://i.ibb.co/nBjTvpM/logo-removebg-preview.png',
    'https://i.ibb.co/nBjTvpM/logo-removebg-preview.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Candidates List')),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];
          final imagelist = images[index];
          return ListTile(
            title: Text(candidate.name,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Canterbury')),
            trailing: ElevatedButton(
              onPressed: () => _showDetails(context, candidate, imagelist),
              child: Text('See Details'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onPrimary: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetails(
      BuildContext context, Candidate candidate, String imagelist) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(candidate.name),
        content: Wrap(
          children: [
            Text(candidate.details),
            //Add image
            Image.network(imagelist),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ElectronicVotingSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EVoting',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
          bodyLarge: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          textTheme: TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _sections = [
    {
      'title': 'Candidates',
      'icon': Icons.people,
      'page': CandidatesPage(),
    },
    {
      'title': 'Voting',
      'icon': Icons.how_to_vote,
      'page': VotingPage(),
    },
    // {
    //   'title': 'Blockchain',
    //   'icon': Icons.security,
    //   'page': BlockchainPage(),
    // },
    {
      'title': 'Support',
      'icon': Icons.support_agent,
      'page': SupportPage(),
    },
    {
      'title': 'About us',
      'icon': Icons.info,
      'page': AboutUsPage(),
    },
    // {
    //   'title': 'Security',
    //   'icon': Icons.lock,
    //   'page': SecurityPage(),
    // },
    {
      'title': 'News and Updates',
      'icon': Icons.new_releases,
      'page': NewsPage(),
    },
  ];

  void _navigateToAuthenticationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthenticationPage()),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _sections.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(_sections[index]['icon']),
              title: Text(_sections[index]['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _sections[index]['page']),
                );
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Add image https://i.ibb.co/pft37DH/A-letter-tech-logo-1.png
            Image.network(
              'https://i.ibb.co/jwjZ4xv/A-letter-tech-logo-3.png',
              height: 100.0,
              //Resize image
              width: 300.0,
            ),
            //animated text (Jumps in ) saying welcome to evoting
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText('E-Voting',
                    textStyle:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red
                    ]),
              ],
            ),
            //Add a  animation text saying Voting Made then in rotation (Easy,Secure,Faster)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Voting Made',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(width: 20.0, height: 100.0),
                AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(
                      'Easy',
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Canterbury',
                          fontWeight: FontWeight.bold),
                    ),
                    RotateAnimatedText(
                      'Secure',
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Canterbury',
                          fontWeight: FontWeight.bold),
                    ),
                    RotateAnimatedText(
                      'Faster',
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Canterbury',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: () => _navigateToAuthenticationPage(context),
              icon: Icon(Icons.login),
              label: Text('Prove Identity'),
            ),
            SizedBox(height: 12.0),
            // OutlinedButton.icon(
            //   onPressed: () {
            //     // TODO: Implement signup button functionality
            //   },
            //   icon: Icon(Icons.person_add),
            //   label: Text('Signup'),
            // ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              // TODO: Implement home button functionality

              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthenticationPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please complete the authentication process to proceed',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              'Enter your details',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Select a verification technique',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _VerificationOption(
                  icon: Icons.fingerprint,
                  label: 'Fingerprint',
                  onPressed: () {
                    // TODO: Handle fingerprint authentication
                  },
                ),
                _VerificationOption(
                  icon: Icons.lock_outline,
                  label: 'Password',
                  onPressed: () {
                    // TODO: Handle password authentication
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VerificationOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _VerificationOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 64.0,
          onPressed: onPressed,
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}

class CandidatesPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CandidatesList(), // Use the CandidatesList widget as a child
    );
  }
}

class VotingPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CandidateProfileWidget(
              name: 'candidate 1',
              avatarUrl: 'https://images.cdn4.stockunlimited.net/clipart/avatar-of-election-candidate-with-a-check-mark_1534298.jpg',
              partyAffiliation: 'PTI',
            ),
            CandidateProfileWidget(
              name: 'candidate 2',
              avatarUrl: 'https://images.cdn4.stockunlimited.net/clipart/avatar-of-election-candidate-with-a-check-mark_1534298.jpg',
              partyAffiliation: 'PMLN',
            ),
            CandidateProfileWidget(
              name: 'candidate 3',
              avatarUrl: 'https://images.cdn4.stockunlimited.net/clipart/avatar-of-election-candidate-with-a-check-mark_1534298.jpg',
              partyAffiliation: 'PPP',
            ),
            CandidateProfileWidget(
              name: 'candidate 4',
              avatarUrl: 'https://images.cdn4.stockunlimited.net/clipart/avatar-of-election-candidate-with-a-check-mark_1534298.jpg',
              partyAffiliation: 'MQM',
            ),
            CandidateProfileWidget(
              name: 'candidate 5',
              avatarUrl: 'https://images.cdn4.stockunlimited.net/clipart/avatar-of-election-candidate-with-a-check-mark_1534298.jpg',
              partyAffiliation: 'PDM',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


class CandidateProfileWidget extends StatefulWidget {
  final String name;
  final String avatarUrl;
  final String partyAffiliation;

  const CandidateProfileWidget({
    required this.name,
    required this.avatarUrl,
    required this.partyAffiliation,
  });

  @override
  _CandidateProfileWidgetState createState() => _CandidateProfileWidgetState();
}

class _CandidateProfileWidgetState extends State<CandidateProfileWidget> {
  bool _voted = false;

  void _showVoteSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You have voted for ${widget.name}.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(widget.avatarUrl),
        ),
        SizedBox(height: 16),
        Text(
          widget.name,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          widget.partyAffiliation,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _voted ? null : () {
            setState(() {
              _voted = true;
            });
            _showVoteSnackbar();
          },
          child: Text(_voted ? 'Voted' : 'Vote Now'),
        ),
      ],
    );
  }
}


// class BlockchainPage extends StatelessWidget {
//   void _navigateToHomePage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Blockchain'),
//       ),
//       body: Center(
//         child: Text(
//             'Discover how blockchain technology ensures the integrity and security of the voting process.'),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.deepPurple,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () => _navigateToHomePage(context),
//               // TODO: Implement home button functionality

//               icon: Icon(Icons.home, color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SupportPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileWidget(
              name: 'Ahmed',
              avatarUrl:
                  'https://static.vecteezy.com/system/resources/previews/000/439/863/original/vector-users-icon.jpg',
              email: 'i191709@nu.edu.pk',
            ),
            ProfileWidget(
              name: 'muneeb',
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNUGFZDrnAumJwM5JkKRRA0xCLvqmkzBFoT4fR33pL4YlwoE7yyEVB3GPgoM-QZIHRU7s&usqp=CAU',
              email: 'i190591@nu.edu.pk',
            ),
            ProfileWidget(
              name: 'asad',
              avatarUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGP0LOh8SpUJCGgsBxnYVT1lvY4DNW_f_lBA&usqp=CAU',
              email: 'i191666@nu.edu.pk',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String email;

  const ProfileWidget({
    required this.name,
    required this.avatarUrl,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        SizedBox(height: 16),
        Text(
          name,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(
          email,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class AboutUsPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Center(
        child: Text(
            'Learn more about the team behind Evote and our mission to revolutionize democracy.'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              // TODO: Implement home button functionality

              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class SecurityPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
      ),
      body: Center(
        child: Text(
            'Find out how we keep your vote safe and secure through cutting-edge security measures and protocols.'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              // TODO: Implement home button functionality

              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News and Updates'),
      ),
      body: Center(
        child: Text(
            'Stay up-to-date with the latest news and updates from Evote.'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigateToHomePage(context),
              // TODO: Implement home button functionality

              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
