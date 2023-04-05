import 'package:flutter/material.dart';

void main() {
  runApp(ElectronicVotingSystemApp());
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
          titleLarge : TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
          bodyLarge : TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
          ),
          labelLarge : TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          textTheme: TextTheme(
            titleLarge : TextStyle(
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
  final List<Map<String, dynamic>> _sections = [        {            'title': 'Candidates',            'icon': Icons.people,            'page': CandidatesPage(),    },        {            'title': 'Voting',            'icon': Icons.how_to_vote,            'page': VotingPage(),    },        {            'title': 'Blockchain',            'icon': Icons.security,            'page': BlockchainPage(),    },        {            'title': 'Support',            'icon': Icons.support_agent,            'page': SupportPage(),    },        {            'title': 'About us',            'icon': Icons.info,            'page': AboutUsPage(),    },        {            'title': 'Security',            'icon': Icons.lock,            'page': SecurityPage(),    },        {            'title': 'News and Updates',            'icon': Icons.new_releases,            'page': NewsPage(),    },    ];

  void _navigateToAuthenticationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthenticationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAExJpavOcG81D6KYNE2zGtlaH1iPq9lJvTw&usqp=CAU',
              height: 100,
            ),
            
          ],
        ),
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
                  MaterialPageRoute(builder: (context) => _sections[index]['page']),
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
            SizedBox(height: 24.0),
            Text('Welcome to EVoting',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: ()=> _navigateToAuthenticationPage(context),
              icon: Icon(Icons.login),
              label: Text('Login'),
            ),
            SizedBox(height: 12.0),
            OutlinedButton.icon(
              onPressed: () {
                // TODO: Implement signup button functionality
              },
              icon: Icon(Icons.person_add),
              label: Text('Signup'),
            ),
            SizedBox(height: 24.0),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      body: Center(
        child: Text('Learn more about the candidates running in the election and their party affiliations.'),
      ),
    );
  }
}

class VotingPage extends StatelessWidget {
  void _navigateToAuthenticationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthenticationPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('prove your identity to proceed',
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: ()=> _navigateToAuthenticationPage(context),
              icon: Icon(Icons.login),
              label: Text('Login'),
            ),
            SizedBox(height: 12.0),
            
          ],
        ),

      ),
    );
  }
}

class BlockchainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blockchain'),
      ),
      body: Center(
        child: Text('Discover how blockchain technology ensures the integrity and security of the voting process.'),
      ),
    );
  }
}

 class SupportPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Support'),
),
body: Center(
child: Text('Need help or have a question? Contact our support team for assistance.'),
),
);
}
}

class AboutUsPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('About us'),
),
body: Center(
child: Text('Learn more about the team behind Electronic Voting System and our mission to revolutionize democracy.'),
),
);
}
}

class SecurityPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Security'),
),
body: Center(
child: Text('Find out how we keep your vote safe and secure through cutting-edge security measures and protocols.'),
),
);
}
}

class NewsPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('News and Updates'),
),
body: Center(
child: Text('Stay up-to-date with the latest news and updates from Electronic Voting System.'),
),
);
}
}