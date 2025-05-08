import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HealthSettingsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HealthSettingsPage extends StatefulWidget {
  const HealthSettingsPage({super.key});

  @override
  State<HealthSettingsPage> createState() => _HealthSettingsPageState();
}

class _HealthSettingsPageState extends State<HealthSettingsPage> {
  double atopyLevel = 0;
  double rhinitisLevel = 0;
  double eyeAllergyLevel = 0;
  bool hasAsthma = false;
  final TextEditingController ageController = TextEditingController();

  Widget _buildSlider(String title, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title: ${value.round()}단계', style: const TextStyle(fontSize: 16)),
        Slider(
          value: value,
          onChanged: onChanged,
          divisions: 4,
          min: 0,
          max: 4,
          label: value.round().toString(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🩺 건강 상태 설정")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildSlider("아토피", atopyLevel, (val) => setState(() => atopyLevel = val)),
            _buildSlider("알레르기성 비염", rhinitisLevel, (val) => setState(() => rhinitisLevel = val)),
            _buildSlider("알레르기성 눈 가려움", eyeAllergyLevel, (val) => setState(() => eyeAllergyLevel = val)),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text("천식 있음"),
              value: hasAsthma,
              onChanged: (val) => setState(() => hasAsthma = val ?? false),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "나이",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 여기에 저장 혹은 다음 단계로 이동하는 로직 작성
                print("아토피: ${atopyLevel.round()}");
                print("비염: ${rhinitisLevel.round()}");
                print("눈 가려움: ${eyeAllergyLevel.round()}");
                print("천식: $hasAsthma");
                print("나이: ${ageController.text}");
              },
              child: const Text("저장 및 다음"),
            ),
          ],
        ),
      ),
    );
  }
}