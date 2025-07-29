import 'package:flutter/material.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/custom_dropdown.dart';
import 'widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();

  String? selectedGender;
  final List<String> genderList = ['Laki-laki', 'Perempuan'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        tglLahirController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: "Nama",
              controller: namaController,
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Email / Username",
              controller: emailController,
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              obscureText: true,
              icon: Icons.lock,
            ),
            const SizedBox(height: 16),
            CustomDropdown(
              label: "Jenis Kelamin",
              value: selectedGender,
              items: genderList,
              onChanged: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Tanggal Lahir",
              controller: tglLahirController,
              readOnly: true,
              icon: Icons.calendar_today,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 32),
            CustomButton(text: "Register", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
