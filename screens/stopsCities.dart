import 'package:city_app/utils/stops_names.dart';
import 'package:city_app/utils/stops_images.dart';
import 'package:city_app/utils/descriptions.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class IconStepperDemos extends StatefulWidget {
  const IconStepperDemos({Key? key}) : super(key: key);

  static const route = '/stops/';
  static const routename = 'StopsCities';

  
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<IconStepperDemos> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 0.
  int upperBound = 10; // upperBound MUST BE total number of icons minus 1.
  int n_steps= 50;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Padova', //qui metto city.name
            style: TextStyle(color: Colors.white),
          ),
            backgroundColor: Color.fromARGB(255, 5, 185, 137).withOpacity(0.5),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NumberStepper(
                numbers :[
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                  8,
                  9,
                  10,
                ],
                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,
                // This ensures step-tapping updates the activeStep. 
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
                activeStepColor: Color.fromARGB(255, 5, 185, 137),
              ),
              header(),// qui aggiungo tra le parentesi la citta con il nome delle tappe
                Container(
                  height: 200.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    image:DecorationImage(                      
                      image: NetworkImage(
                        stopImage() //qui aggiungo la citta a cui ci riferiamo
                        ),
                      fit: BoxFit.fill,                     
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              Column(
                children: [
                  Text('curiosità', style: TextStyle(fontSize: 20),)
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(2),
                  height: double.infinity,
                  width:double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17), //border corner radius
                    boxShadow:[ 
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                      ),
                    ],
                  ),
                  child: Text( 
                    descriptionText(), //qui aggiungo a che citta ci stiamo riferendo
                    style: TextStyle( 
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool _steppingEnabledChecked(){
    if (n_steps >0 && n_steps<100)
      return true ;
    else 
      return false;      
  }
  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 5, 185, 137),        
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      label: Text('Next'),
      icon: Icon(Icons.navigate_next_outlined),      
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 5, 185, 137),        
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      icon: Icon(Icons.navigate_before_outlined),
      label: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 5, 185, 137),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return Padova_stops.stop2;
      case 2:
        return Padova_stops.stop3;
      case 3:
        return Padova_stops.stop4;
      case 4:
        return Padova_stops.stop5;
      case 5:
        return Padova_stops.stop6;
      case 6:
        return Padova_stops.stop7;        
      case 7:
        return Padova_stops.stop8;
      case 8:
        return Padova_stops.stop9;
      default:
        return Padova_stops.stop1;
    }
  }
  String stopImage() {
    switch (activeStep) {
      case 1:
        return Padova_stops_images.im2;//scrovegni
      case 2:
        return Padova_stops_images.im3;//bo
      case 3:
        return Padova_stops_images.im4;//ragione
      case 4:
        return Padova_stops_images.im5;//prato
      case 5:
        return Padova_stops_images.im6;//s.antonio
      case 6:
        return Padova_stops_images.im7;//iris        
      case 7:
        return Padova_stops_images.im8;//ikea
      case 8:
        return Padova_stops_images.im9;//naviglio
      default:
        return Padova_stops_images.im1;//stazione
    }
  }
  String descriptionText() {
    switch (activeStep) {
      case 1:
        return Padova_descriptions.des2;
      case 2:
        return Padova_descriptions.des3;
      case 3:
        return Padova_descriptions.des4;
      case 4:
        return Padova_descriptions.des5;
      case 5:
        return Padova_descriptions.des6;
      case 6:
        return Padova_descriptions.des7;        
      case 7:
        return Padova_descriptions.des8;
      case 8:
        return Padova_descriptions.des9;
      default:
        return Padova_descriptions.des1;
    }
  }
}