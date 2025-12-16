import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header with logo + brand text
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 84,
                              height: 48,
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                'assets/logo.png',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Color(0xFF2C5DD6),
                                  child: Icon(Icons.person, color: Colors.white, size: 28),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'CODING ANARCHIST',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: const Color(0xFF2C5DD6),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),

                  // Email
                  const Text('Email Address'),
                  const SizedBox(height: 6),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      hintText: 'you@example.com',
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Password
                  const Text('Password'),
                  const SizedBox(height: 6),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      hintText: '••••••••',
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Remember + forgot
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) {
                          bool checked = false;
                          return Row(
                            children: [
                              Checkbox(
                                value: checked,
                                onChanged: (v) {
                                  setState(() => checked = v ?? false);
                                },
                              ),
                              const Text('Remember me'),
                            ],
                          );
                        },
                      ),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('Forgot Password')),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Login button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C5DD6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Login', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
