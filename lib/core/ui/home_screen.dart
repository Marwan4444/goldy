import 'package:flutter/material.dart';
import 'package:goldy/core/constant/app_color.dart';
import 'package:goldy/core/constant/app_strings.dart';
import 'package:goldy/core/ui/gradient%20_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:AppColor.goldGradient
          ),
        ),
        elevation: 10,
        shadowColor: Colors.amber.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.diamond_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.backgroundColor
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientButton(
                  label: AppStrings.gold,
                  gradient:  AppColor.goldGradient,
                  textColor:AppColor.textColor,
                  onPressed: () {},
                ),
                const SizedBox(height: 25), 
                GradientButton(
                  label: AppStrings.silver,
                  gradient: AppColor.silverGradient,
                  textColor:AppColor.textColor,
                  onPressed: () {},
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
