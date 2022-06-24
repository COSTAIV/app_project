import 'package:city_app/models/Stop.dart';

class City {
	String name = "";
	List<Stop?> stops = List<Stop?>.filled(9 , null); // inizialmente vuoto, max length 9

	// costruttore con parametri
	City(String n, List<Stop?> s) {
		name = n;
		for (int i = 0; i < stops.length; i++) {
		  stops[i] = s[i];
		}
	}
}