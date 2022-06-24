
import 'package:flutter/material.dart';
import 'package:city_app/models/City.dart';
import 'package:city_app/models/Stop.dart';


class ExploreCities extends StatelessWidget {
  ExploreCities({Key? key}) : super(key: key);

  static const route = '/exploreCities/';
  static const routename = 'ExploresCities';

  late BuildContext ctx;

  City Padova = City(
  "Padova", 
  List<Stop>.from([ 
    Stop.create("Stazione dei treni", "https://cdn.archilovers.com/projects/c_383_037e4d6dee6446579c6b5c9fcf17d213.jpg", ""),
    Stop.create("Cappella degli Scrovegni e Eremitani", "https://upload.wikimedia.org/wikipedia/commons/4/44/La_Cappella_degli_Scrovegni.JPG", "Nominated UNESCO heritage site, it is the place where it is stored in near perfect conditions one of the most known and appreciated pieces of the Giotto\'s artistic collection: the \'Giudizio Universale\'"),
    Stop.create("Palazzo Bo", "https://ilbolive.unipd.it/sites/default/files/2018-11/img_2614.jpg", "Historical venue of the University of Padova since 1493. To this day it hosts the rectorate, the Law School and the oldest Anatomical Theatre in the world"),
    Stop.create("Palazzo della ragione e piazza delle erbe", "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Exterior_of_Palazzo_della_Ragione_%28Padua%29.jpg/1200px-Exterior_of_Palazzo_della_Ragione_%28Padua%29.jpg", "The corner of the palace underneath the \'Volto della Corda\' is commonly called \'canton de le busie\' (corner of lies) because it was the place where traders met. Near the \'Volto\' the old padua\'s measurements are sculpted on white stones, they were useful not to get tricked by vendors"),
    Stop.create("Prato della valle", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/28/12/9a/prato-della-valle.jpg?w=1200&h=-1&s=1", "In the Roman era it hosted a vast theatre, today it is a big elliptical square that not only is the biggest in Padua, but also in Europe (88620 mq), second only to the Red Square in Moscow "),
    Stop.create("Basilica di S.Antonio", "https://www.paroladivita.org/var/paroladivita/storage/images/primo-piano/reportage.-la-basilica-del-santo-a-padova/2291763-2-ita-IT/Reportage.-La-Basilica-del-Santo-a-Padova_articleimage.jpg", ""),
    Stop.create("Parco Iris", "https://citynews-padovaoggi.stgy.ovh/~media/horizontal-mid/12215231983253/parco-iris-panoramica-alto-2.jpg", ""),
    Stop.create("Ikea", "https://citynews-padovaoggi.stgy.ovh/~media/original-hi/52677538776932/il-negozio-ikea-di-padova-2.jpg", ""),
    Stop.create("DEI e Naviglio", "https://www.mivado.it/wp-content/uploads/2020/06/mivado-navigli-padova.jpg", "") 
  ])
);
City Paris = City(
  "Paris", 
  List<Stop>.from([ 
    Stop.create("Tour Eiffel", "immagine_dello_stop1.jpg", "Designed and constructed for the 1889 Exposition Universelle (the World's Fair), the Eiffel Tower was always meant to be a temporary structure, but it skirted demolition talks twice. The first time, at the beginning of the 1900s, the tower was kept around because of its transmission talents. Gustav Eiffel, chief architect of the Eiffel Tower, had a variety of scientific experiments tested on the tower with the hope that any discoveries would help prolong its lifespan. One of these included a wireless transmissions test, which the tower passed with flying colors."),
    Stop.create("Musée d\'Orsay", "immagine_dello_stop2.jpg", "Housed in a former railway station along the Left Bank, the Musée d'Orsay is regarded for its rich collection of impressionist works. You'll see paintings by French artists like Degas, Monet, Cezanne, and Van Gogh, among many, many others. The museum also houses a number of sculptures, as well as photography and even furniture displays. And if you climb to the museum's top balcony, you can catch a breathtaking view of the Sacré-Coeur Basilica through the museum's massive transparent clock."),
    Stop.create("Arc du Thriomphe", "immagine_dello_stop3.jpg", "Situated at the western end of the Champs-Élysées, the towering Arc de Triomphe was commissioned by Napoléon to honor the Grande Armee during the Napoleonic Wars. The arch, which is the largest of its kind in the world, is adorned with several impressive, intricately carved sculptures. Underneath the Arch travelers will find the names of the battles fought during the first French Republic and Napolean's Empire as well as generals who fought in them."),
    Stop.create("Sacré-Coeur et Montmartre", "immagine_dello_stop4.jpg", "Rising high above Paris, the Sacré-Coeur (meaning \"Sacred Heart\") looks more like a white castle than a basilica – but that's what it is. Towering over the eclectic neighborhood of Montmartre (once a hangout for Paris' bohemian crowd), this Roman-Byzantine masterpiece is easily recognized by its ornate ivory domes. As blanched as it may appear on the outside, the basilica's interior is a sight worth beholding: The ceilings glitter with France's largest mosaic, which depicts Jesus rising alongside the Virgin Mary and Joan of Arc. "),
    Stop.create("Musée du Louvre", "immagine_dello_stop5.jpg", "The museum first opened its doors in 1793 and features a grand total of 35,000 works of art. Here you can get up close to a variety of art from different time periods and cultures. The Louvre features everything from Egyptian mummy tombs to ancient Grecian sculptures (including the renowned Winged Victory of Smothrace and curvaceous Venus de Milo). There are also thousands of paintings to peruse as well. Masterpieces such as \"Liberty of Leading the People\" by Eugene Delacroix, \"The Raft of Medusa\" by Théodore Géricault and Leonardo da Vinci's \"Mona Lisa\" the museum's biggest star, can be found here. You can even get a glimpse of Napolean the Third's old apartment digs."),
    Stop.create("Île de la cité", "immagine_dello_stop6.jpg", "Île de la Cité is an island in the river Seine in the center of Paris. In the 4th century, it was the site of the fortress of the Roman governor. In 508, Clovis I, the first King of the Franks, established his palace on the island. In the 12th century, it became an important religious center, the home of Notre-Dame cathedral, and the royal chapel of Sainte-Chapelle, as well as the city's first hospital, the Hôtel-Dieu. It is also the site of the city's oldest surviving bridge, the Pont Neuf."),
    Stop.create("Place des Vosges", "immagine_dello_stop7.jpg", "Place des Vosges is one of the most beautiful squares in Le Marais or even Paris which is funny if you think about it. If someone described it as a, “small park completely walled in by four walls of houses that look exactly the same as one another,” you may not really want to go there!"),
    Stop.create("Musée de l\'Armée", "immagine_dello_stop8.jpg", "The Musée de l'Armée is a national military museum of France located at Les Invalides in the 7th arrondissement of Paris. It is served by Paris Métro stations Invalides, Varenne, and La Tour-Maubourg. The Musée de l'Armée was created in 1905 with the merger of the Musée d'Artillerie and the Musée Historique de l'Armée. The museum's seven main spaces and departments contain collections that span the period from antiquity through the 20th century. "),
    Stop.create("Versailles", "immagine_dello_stop9.jpg", "The Château de Versailles, the sprawling palace and former seat of power, is located 14 miles southwest of Paris in Versailles. Every year, millions of travelers make the trek from Paris to bear witness to the chateau's world-famous grandeur in person. But between all of the gold figurines, dramatic frescoes and cascading crystal chandeliers you'll no doubt find in bulk throughout the chateau, you might be surprised to learn that King Louis XIV's extravagant former residence had pretty humble-ish beginnings.") 
  ])
);
City CiudadDeMexico = City(
  "Ciudad de Mexico", 
  List<Stop>.from([ 
    Stop.create("Museo Nacional de Antropología", "immagine_dello_stop1.jpg", "This massive building in Chapultepec Park is among the city's most famed museums, second only to perhaps the Museo Frida Kahlo. Though the late Mexican architect Pedro Ramírez Vázquez designed it in 1964, the mammoth building still looks as avant-garde today as it did then. (How exactly does that giant concrete slab float above a pond?) The museum holds the world's largest collection of ancient Mexican artifacts. Some of the most iconic Mesoamerican artifacts discovered to date can be found across 23 rooms. If you want to understand Mexico's history, then a visit here is a must."),
    Stop.create("Castillo de Chapultepec", "immagine_dello_stop2.jpg", "Chapultepec Castle is located on top of Chapultepec Hill in Mexico City's Chapultepec park. The name Chapultepec is the Nahuatl word chapoltepēc which means \"on the hill of the grasshopper\". The castle has such unparalleled views and terraces that explorer James F. Elton wrote they \“can't be surpassed in beauty in any part of the world.\" It is located at the entrance to Chapultepec Park at a height of 2,325 meters above sea level. Site of the hill was a sacred place for Aztecs, and the buildings atop it have served several purposes during its history, including that of Military Academy, Imperial residence, Presidential residence, observatory, and since the 1940s, the National Museum of History."),
    Stop.create("El Ángel de la Independencia", "immagine_dello_stop3.jpg", "The Angel of Independence, most commonly known by the shortened name El Ángel and officially known as Monumento a la Independencia (\"Monument to Independence\"), is a victory column on a roundabout on the major thoroughfare of Paseo de la Reforma in downtown Mexico City. El Ángel was built in 1910 during the presidency of Porfirio Díaz by architect Antonio Rivas Mercado, to commemorate the centennial of the beginning of Mexico's War of Independence. In later years it was made into a mausoleum for the most important heroes of that war. It is one of the most recognizable landmarks in Mexico City, and it has become a focal point for both celebration and protest. It resembles the July Column in Paris, the Berlin Victory Column in Berlin and Columbus Monument in New York City. "),
    Stop.create("Plaza Garibaldi", "immagine_dello_stop4.jpg", "Mexico's roving mariachi bands have been found in this plaza, a few blocks north of the Palacio de Bellas Artes, since the mid-1900s. Though the plaza has deteriorated over the years, it's seen a resurgence thanks to a city-driven effort to clean up the neighborhood by installing new sidewalks and street lamps. It's a cultural meeting point of sorts, where travelers can come day or night (though the best time to go is after 11 p.m.), to watch bands solicit bar patrons, cars, and passersby to buy a song."),
    Stop.create("Palacio de Mineria", "immagine_dello_stop5.jpg", "The Palace of Mining, also Palace of Mines, is a building in Mexico City, Mexico, considered to be a fine example of Neoclassical architecture in the Americas. It was designed and built between 1797 and 1813 by Valencian Spanish sculptor and architect Manuel Tolsá. It was built to house the Royal School of Mines and Mining of the Royal Court at the request of its director, Fausto Elhuyar, a scientifically-trained mineralogist. Later it housed other institutions such as the National University, the School of Engineering, College of Mines and the Physics Institute of the National Autonomous University of Mexico."),
    Stop.create("Plaza de la Constitución", "immagine_dello_stop6.jpg", "The Zócalo is the common name of the main square in central Mexico City. Prior to the colonial period, it was the main ceremonial center in the Aztec city of Tenochtitlan. The plaza used to be known simply as the \"Main Square\" or \"Arms Square\", and today its formal name is Plaza de la Constitución (Constitution Square). This name does not come from any of the Mexican constitutions that have governed the country but rather from the Cádiz Constitution, which was signed in Spain in the year 1812. Even so, it is almost always called the Zócalo today. Plans were made to erect a column as a monument to Independence, but only the base, or zócalo (meaning \"plinth\"), was built. The plinth was buried long ago, but the name has lived on. Many other Mexican towns and cities, such as Oaxaca, Mérida, and Guadalajara, have adopted the word zócalo to refer to their main plazas, but not all. "),
    Stop.create("Templo Mayor", "immagine_dello_stop7.jpg", "Templo Mayor was the centerpiece of Tenochtitlán, the ancient Aztec capital, constructed in 1325 in the marshes of Lake Texcoco. The temple was mowed over and replaced by a cathedral during the Spanish conquest in 1521. Today, the hulking stone ruins lie at the heart of Centro Histórico, embedded in the blueprint of downtown. Surrounded by streets and buildings, it is hard to imagine the temples in their original Aztecan glory, but the nicely organized museum helps paint the full picture."),
    Stop.create("Teotihuacan Pyramids", "immagine_dello_stop8.jpg", "The ancient Mesoamerican pyramids of Teotihuacán, in the Valley of Mexico, once served as the largest city in the pre-Columbian Americas. It is thought that during the first millennium A.D. the city had around 125,000 people, including multi-ethnic groups such as the Otomi, Zapotec, Mixtec, Maya, and Nahua. If you have a few days in Mexico City, it's worth the day trip. (Teotihuacán is about an hour outside the city by car.) Leave early in the morning so you can be back in the city by mid-day—and bring sunscreen!"),
    Stop.create("Basílica de Guadalupe", "immagine_dello_stop9.jpg", "The Basilica of Our Lady of Guadalupe  is a Catholic church, basilica, and National shrine of Mexico which houses the cloak containing the image of Our Lady of Guadalupe. The 1709 shrine was built in the North of Mexico City near the hill of Tepeyac, where the Virgin Mary is believed to have appeared to Saint Juan Diego Cuauhtlatoatzin. The basilica structure which now contains Juan Diego's cloak was completed in 1974.") 
  ])
);

  @override
  Widget build(BuildContext context) {
    ctx =context;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore cities',
          style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 48, 41, 255).withOpacity(0.8),
          leading: IconButton(
            onPressed: () {
              _toStepsPage(context);
            },
            icon: Icon(Icons.arrow_back_rounded)
          ),
        ),
        body: _exploreCity(),
                 
        endDrawer: Drawer(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () {
                
              },
              child: Text('An option'),
              ),
              ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Another option'),
              ),
              ElevatedButton(
              onPressed: () {
                _toStepsPage(context);
              },
              child: Text('Back to StepsPage'),
              ),
            ],
          ),
        ),
      ),
    );
   //build
  } 
  
  //Returns the ListView as
  Widget _exploreCity() => ListView(
    
        children: [
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Padova',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 27500 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                
                _toStopsCities(ctx, Padova); 
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Paris', 
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 75300 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                 
                _toStopsCities(ctx, Paris);  
                            
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Ciudad de México', 
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 161400 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
               
                _toStopsCities(ctx, CiudadDeMexico);               
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
        ],
      );
  

      
  void _toStopsCities(BuildContext ctx, City city){
    Navigator.pushNamed(ctx, '/stops/', arguments: city);    
    print('Going to ${city.name}');
  }

  void _toStepsPage(BuildContext context) {
    Navigator.pop(context, '/stepsPage/');
  }
      
} 

 