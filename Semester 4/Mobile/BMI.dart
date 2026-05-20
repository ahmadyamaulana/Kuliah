// ignore_for_file: prefer_const_constructors

import 'package:bmi/utils/theme.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final int age;
  final int weight;
  final int height;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.age,
    required this.weight,
    required this.height,
  });

  String getCategory() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  Color getBMIColor() {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 196, 196),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 430,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(25),
          ),
          clipBehavior: Clip.antiAlias,
          child: Scaffold(
            backgroundColor: bgColor,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    Center(
                      child: Column(
                        children: const [
                          Text(
                            "BMI",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                          ),
                          Text(
                            "CALCULATOR",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          infoItem("$weight KG"),
                          infoItem("$height CM"),
                          infoItem("$age Years"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: getBMIColor(),
                          width: 16,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bmi.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: getBMIColor(),
                              ),
                            ),
                            Text(
                              getCategory(),
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: getBMIColor(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // BMI CATEGORY CARD
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "BMI Categories",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: primaryRed,
                            ),
                          ),

                          const SizedBox(height: 20),

                          bmiCategoryItem(
                            color: Colors.blue,
                            title: "Underweight",
                            range: "< 18.5",
                          ),

                          bmiCategoryItem(
                            color: Colors.green,
                            title: "Normal",
                            range: "18.5 - 24.9",
                          ),

                          bmiCategoryItem(
                            color: Colors.orange,
                            title: "Overweight",
                            range: "25 - 29.9",
                          ),

                          bmiCategoryItem(
                            color: Colors.red,
                            title: "Obese",
                            range: ">= 30",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: primaryRed,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Our Recommendations",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: primaryRed,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          recommendation(
                            "Drink enough water every day",
                          ),
                          recommendation(
                            "Exercise regularly",
                          ),
                          recommendation(
                            "Maintain a balanced diet",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: const [
                              secondaryRed,
                              primaryRed,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Retry",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget recommendation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.black,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoItem(String value) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: primaryRed,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            color: primaryRed,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget bmiCategoryItem({
    required Color color,
    required String title,
    required String range,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            range,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
