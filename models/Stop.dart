class Stop {
  String name = ""; //name of the stop
  String img = ""; //url of the image
  String desc = ""; //description

  //costructor with parameters
  Stop.create(String n, String i, String d) {
    name = n;
    img = i;
    desc = d;
  }

  //costructor without parameters
  Stop() {
    name = "";
    img = "";
    desc = "";
  }
}
