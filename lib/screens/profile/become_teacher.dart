import 'package:flutter/material.dart';

import 'components/step_1_content.dart';
import 'components/step_two_content.dart';

class BecomeTeacher extends StatefulWidget {
  const BecomeTeacher({Key? key}) : super(key: key);

  @override
  State<BecomeTeacher> createState() => _BecomeTeacherState();
}

class _BecomeTeacherState extends State<BecomeTeacher> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Become Tutor"),
      ),
      backgroundColor: Colors.white,
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 1) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            isActive: _index == 0,
            title: const Text('Profile'),
            content: const StepOneContent(),
          ),
          Step(
            isActive: _index == 1,
            title: const Text('Video'),
            content: const StepTwoContent(),
          ),
          
          Step(
            isActive: _index == 2,
            title: const Text('Approval'),
            content: const Text('Please wait for the operator approval'),
          ),
        ],
      ),
    );
  }
}
