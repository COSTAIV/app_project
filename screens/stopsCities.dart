import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

import 'package:city_app/models/City.dart';

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
  int stopIndex = 0; // Index used to navigate the City stop array
  int upperBound = 9; // upperBound MUST BE total number of icons minus 1.
  int n_steps= 50;
  
  City? city;
  
  @override
  Widget build(BuildContext context) {

    city = ModalRoute.of(context)?.settings.arguments as City;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _toExploreCities(context);
            },
            icon: Icon(Icons.arrow_back_rounded)
          ),
          title: Text(
            city?.name ?? "",
            style: TextStyle(color: Colors.white),
            textScaleFactor: 0.9,
          ),
            backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
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
                    stopIndex = index >= 9 ? 0 : index ;
                    
                  });
                },
                activeStepColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
              ),
              header(),
              SizedBox(height: 10),
                Container(
                  height: 200.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    image:DecorationImage(                      
                      image: NetworkImage(
                        city?.stops[stopIndex]?.img ?? "" 
                        ),
                      fit: BoxFit.fill,                     
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              /*Column(
                children: [
                  Text('Fun facts', style: TextStyle(fontSize: 20),)
                ],
              ),*/
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(2),
                  height: double.infinity,
                  width:double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
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
                  child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,//.horizontal
                          child: Padding(
                            padding: EdgeInsets.all(20), //You can use EdgeInsets like above
                            child: Text( 
                                        city?.stops[stopIndex]?.desc ?? "", 
                                        style: TextStyle( 
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
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
        primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),        
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
            stopIndex = activeStep >= 9 ? 0 : activeStep;
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
        primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),        
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            if (activeStep >= 0 && activeStep < 9) {
              activeStep--;
              stopIndex--;
            }
            else {
              activeStep--;
              stopIndex = activeStep;
            }
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
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              city?.stops[stopIndex]?.name ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toExploreCities(BuildContext context) {
    Navigator.pop(context, '/exploreCities/');
  }
  
}