class Stop {
	String name = "";
	String img = "";
	String desc = "";

	// costruttore .create con i parametri
	Stop.create(String n, String i, String d) {
		name = n;
		img = i;
		desc = d;
	}

	// costruttore senza parametri
	Stop() {
		name = "";
		img = "";
		desc = "";
	}
}
  