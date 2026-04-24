import 'package:firsproject/views/mainView/home_view.dart';
import 'package:flutter/material.dart';

import '../home_screen_view.dart';

class DifficultyView extends StatelessWidget {
  const DifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
            height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/arkaplan.png"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),

          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                const Text("Choose a difficulty level",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
                DifficultyButton(buttonText: "Easy", color: Colors.lightGreen, onPressed: (){
                  seviyemethod(context, DifficultyLevel.kolay);
                 }, difficultyLevel: DifficultyLevel.kolay),
                SizedBox(height: 10,),
                DifficultyButton(buttonText: "Medium", color: Colors.deepOrangeAccent, onPressed: (){

                  seviyemethod(context, DifficultyLevel.orta);
                }, difficultyLevel: DifficultyLevel.orta),
                SizedBox(height: 10,),
                DifficultyButton(buttonText: "Hard", color: Colors.redAccent, onPressed: (){

                  seviyemethod(context, DifficultyLevel.zor);
                }, difficultyLevel: DifficultyLevel.zor),
              ],
            ),
          ),


        ),
      ),
    );
  }

  void seviyemethod(BuildContext context, DifficultyLevel level) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  CatchTheFlutter(difficultyLevel: level)));
  }
}



class DifficultyButton extends StatelessWidget{
  @override

  final String buttonText;
  final Color color;
  final VoidCallback onPressed;
  final DifficultyLevel difficultyLevel;

  const DifficultyButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    required this.difficultyLevel,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child:Text(buttonText), style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),

    ),);
  }

}

