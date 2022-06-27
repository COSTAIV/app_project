
import 'package:flutter/material.dart';
import 'package:city_app/models/City.dart';
import 'package:city_app/models/Stop.dart';
import 'package:city_app/screens/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExploreCities extends StatelessWidget {
  ExploreCities({Key? key}) : super(key: key);

  static const route = '/exploreCities/';
  static const routename = 'ExploresCities';

  late BuildContext ctx;
City Venezia = City(
  "Venezia", 
  List<Stop>.from([ 
    Stop.create("Stazione di Venezia Santa Lucia", "https://www.venezia.net/wp-content/uploads/2012/10/venezia-stazione-santa-lucia.jpg", "Construction of Santa Lucia railway station began in 1860 under the Austrian Empire. In order to make room for both the station building and its forecourt, a convent and the Church of Santa Lucia were demolished in 1861. The station in turn took up the name of this church. The current station building is one of the few modernist buildings facing the Grand Canal."),
    Stop.create("Bacareto da Lele", "https://cdn1.veneziaautentica.com/wp-content/uploads/2016/07/SAM8961.jpg", "the \"Bacareto da Lele\" is a mandatory stop for peopole doing the \"Bacaro tour\", known for the quality of the panini served with cheese and cold cuts, the honest prices and \"le ombre\". "),
    Stop.create("Ponte dell'Accademia", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Accademia_bridge_in_Venice_%28South_East_exposure%29.jpg/1200px-Accademia_bridge_in_Venice_%28South_East_exposure%29.jpg", "It is is one of only four bridges to span the Grand Canal in Venice, Italy. It crosses near the southern end of the canal, and is named for the Accademia di Belle Arti di Venezia. The original steel structure, designed by Alfred Neville, opened on 20 November 1854 but was demolished and replaced by a wooden bridge in 1933."),
    Stop.create("Piazza San Marco", "https://thumbs.dreamstime.com/b/piazza-san-marco-venezia-97966427.jpg", "The Piazza San Marco is not far above sea level and during the Acqua Alta, the \"high water\" from storm surges from the Adriatic or heavy rain, it is quick to flood. It is not recommended to stop for a spritz in the bars facing the square because of it\'s high cost, but a view like this is priceless."),
    Stop.create("Osteria da Bacco", "https://media-cdn.tripadvisor.com/media/photo-s/11/8f/2f/65/osteria-da-bacco-snc.jpg", "After a visit to Piazza S. Marco there is nothing better than continuing the \"Bacaro tour\" in this Osteria, big spritz and delicious \"cicchetti\" will lift your spirits and give you the energy to continue the tour!"),
    Stop.create("Ponte di Rialto", "https://upload.wikimedia.org/wikipedia/commons/9/95/Venezia_-_Ponte_di_Rialto.jpg", "The Rialto Bridge  is the oldest of the four bridges spanning the Grand Canal in Venice. It has been rebuilt several times since its first construction as a pontoon bridge in 1173, and is now a significant tourist attraction in the city. It is made up of two ramps lead up to a central portico. On either side of the portico, the covered ramps carry rows of shops."),
    Stop.create("Fondaco dei Tedeschi", "https://asset-lasamcd.dfs.com/image/upload/v1635927142/New%20DFS.com%20Assets/04%20Store%20Page/Venice/dfscom_store-page_venice_top-banner_mobile_2x.jpg", "It was the headquarters and restricted living quarters of the city's German (Tedeschi) merchants. The building was originally constructed in the 13th century and stayed until the Napoleonic occupation. It was one of the city's most powerful colonies of merchants, and consequently the fondaco became an important trading centre for goods. Today it hosts many luxory shops and has a terrace with a beutiful view of Venice\'s rooftops."),
    Stop.create("Casinò di Venezia", "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Ca%27_Vendramin_Calergi.jpg/800px-Ca%27_Vendramin_Calergi.jpg", "On the main facade, the one on the Grand Canal, you may notice a weird writing: Non nobis Domine, non nobis, sed nomini tuo da gloriam (Not unto us, not unto us O Lord, but unto thy name let the glory be given). This latin writing is often associated with the Templars, since it was the beginning part of a psalm that was used as a prayer of thanksgiving and expression of humility, during the Crusades."),
    Stop.create("Ponte delle Guglie", "https://media-cdn.sygictraveldata.com/media/1200x630/612664395a40232133447d33247d383534393939363030", "The Ponte delle Guglie is one of two bridges in Venice, Italy, to span the Cannaregio Canal. An earlier wooden bridge was built in 1285. It was replaced by the current stone and brick bridge in 1580. It is the only bridge in Venice adorned with spires from whence it takes its name (\"Bridge of Spires\").") 
  ])
);
City Roma = City(
  "Roma", 
  List<Stop>.from([ 
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", "") 
  ])
);
City Padova = City(
  "Padova", 
  List<Stop>.from([ 
    Stop.create("Stazione dei treni", "https://cdn.archilovers.com/projects/c_383_037e4d6dee6446579c6b5c9fcf17d213.jpg", "First opened in 1842, in the passenger building it has both passenger facilities and commercial activities. Don\'t miss your train!"),
    Stop.create("Cappella degli Scrovegni e Eremitani", "https://upload.wikimedia.org/wikipedia/commons/4/44/La_Cappella_degli_Scrovegni.JPG", "Nominated UNESCO heritage site, it is the place where it is stored in near perfect conditions one of the most known and appreciated pieces of the Giotto\'s artistic collection: the \'Giudizio Universale\'"),
    Stop.create("Palazzo Bo", "https://ilbolive.unipd.it/sites/default/files/2018-11/img_2614.jpg", "Historical venue of the University of Padova since 1493. To this day it hosts the rectorate, the Law School and the oldest Anatomical Theatre in the world"),
    Stop.create("Palazzo della ragione e piazza delle erbe", "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Exterior_of_Palazzo_della_Ragione_%28Padua%29.jpg/1200px-Exterior_of_Palazzo_della_Ragione_%28Padua%29.jpg", "The corner of the palace underneath the \'Volto della Corda\' is commonly called \'canton de le busie\' (corner of lies) because it was the place where traders met. Near the \'Volto\' the old padua\'s measurements are sculpted on white stones, they were useful not to get tricked by vendors"),
    Stop.create("Prato della valle", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/28/12/9a/prato-della-valle.jpg?w=1200&h=-1&s=1", "In the Roman era it hosted a vast theatre, today it is a big elliptical square that not only is the biggest in Padua, but also in Europe (88620 mq), second only to the Red Square in Moscow "),
    Stop.create("Basilica di S.Antonio", "https://www.paroladivita.org/var/paroladivita/storage/images/primo-piano/reportage.-la-basilica-del-santo-a-padova/2291763-2-ita-IT/Reportage.-La-Basilica-del-Santo-a-Padova_articleimage.jpg", "Construction of the Basilica was completed in 1310. The interior of the church contains numerous funerary monuments, some of noteworthy artistic value. Relics of St Anthony are to be found in the ornate Baroque Treasury Chapel. The chin and tongue of St. Anthony are displayed in a gold reliquary at the Basilica."),
    Stop.create("Parco Iris", "https://citynews-padovaoggi.stgy.ovh/~media/horizontal-mid/12215231983253/parco-iris-panoramica-alto-2.jpg", "It is a beautiful park ideal for physical activity or relaxing laying on the grass, take a break from the city and breathe!"),
    Stop.create("Ikea", "https://citynews-padovaoggi.stgy.ovh/~media/original-hi/52677538776932/il-negozio-ikea-di-padova-2.jpg", "An unusual stop, but surely at least one time every person living near Padova went here."),
    Stop.create("DEI e Naviglio", "https://www.mivado.it/wp-content/uploads/2020/06/mivado-navigli-padova.jpg", "The place where the developers passed their university years, DEI where they studied and Navigli where they relaxed and socialized with the other students.") 
  ])
);
City NewYork = City(
  "New York", 
  List<Stop>.from([ 
    Stop.create("Museum of the City of New York ", "https://aws-tiqets-cdn.imgix.net/images/content/1569751e951d40d18ef0f6faddb2c3bd.jpg?auto=format&fit=crop&ixlib=python-3.2.1&q=70&s=437753e2e6e6e37a9b9e7aa8162f23d6", "The museum's collection of over 1.5 million items include paintings, drawings, prints,and photographs featuring New York City and its residents, as well as costumes, decorative objects and furniture, antique toys, ship models, rare books and manuscripts, marine and military collections, police and fire collections, and a theater collection which documents the golden age of Broadway theater. There are also dioramas about the city's history as well as its physical environment."),
    Stop.create("Times Square", "https://modulo.net/files/chunks/59005e8c0fc46eee718b4567/5a1d5910a0d55665320000af.jpg", "Brightly lit by numerous billboards and advertisements, it is sometimes referred to as \"the Crossroads of the World\". It is one of the world's busiest pedestrian areas, also the hub of the Broadway Theater District and a major center of the world's entertainment industry. It is the site of the annual New Year's Eve ball drop, which began on December 31, 1907, and continues to attract over a million visitors to Times Square every year."),
    Stop.create("Empire State Building", "https://image.newyorkcity.it/wp-content/uploads/2013/02/Empire-State-Building-Tickets.jpg", "The Empire State Building is a 102-story Art Deco skyscraper built from 1930 to 1931. Its name is derived from \"Empire State\", the nickname of the state of New York. The 80th, 86th, and 102nd floors contain observatories. The 86th floor observatory contains both an enclosed viewing gallery and an open-air outdoor viewing area, allowing for it to remain open 365 days a year regardless of the weather. The 102nd floor observatory is completely enclosed and much smaller in size. "),
    Stop.create("Washington Square Park", "https://3evlzmko7591que7cpvox4ta-wpengine.netdna-ssl.com/wp-content/uploads/2021/09/Washington-Square-Park-copyright-Espiegle-Adobe-1200x628-1-1024x536.jpg", "The park is an open space, dominated by the Washington Square Arch at the northern gateway to the park. In addition to the Arch and the fountain the park also hosts commemorative statuary of George Washington, Italian patriot and soldier Giuseppe Garibaldi,  and Alexander Lyman Holley. One of the defining characteristics of Washington Square Park is the presence of street performers "),
    Stop.create("9/11 Memorial & Museum", "https://www.fulltravel.it/wp-content/uploads/2014/04/911-Memorial-Museum-New-York.jpg", "The September 11 Museum was dedicated on May 15, 2014 its collection includes more than 40,000 images, 14,000 artifacts, more than 3,500 oral recordings, and over 500 hours of video to commemorate the infamous 9/11 attack. The underground museum has artifacts from September 11, 2001, including steel from the Twin Towers (such as the Last Column, the last piece of steel to leave Ground Zero in May 2002) and wrecked emergency vehicles (including a fire engine deformed from the collapse)."),
    Stop.create("Battery Park", "https://www.newyorkfacile.it/wp-content/uploads/battery-park-new-york.jpg", "The park and surrounding area is named for the artillery batteries that were built in the late 17th century to protect the settlement behind them. Battery Park contains over 20 monuments many of which are clustered in an area called \"Monument Walk\".  "),
    Stop.create("Brooklyn Bridge", "https://upload.wikimedia.org/wikipedia/commons/0/00/Brooklyn_Bridge_Manhattan.jpg", "Opened on May 24, 1883, the Brooklyn Bridge was the first fixed crossing of the East River. It was also the longest suspension bridge in the world at the time of its opening. The Bridge is a popular site for clusters of love locks, even if the practice is officially illegal in New York City"),
    Stop.create("MoMA", "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/MoMa_NY_USA_1.jpg/1200px-MoMa_NY_USA_1.jpg", "Considered by many to have the best collection of modern Western masterpieces in the world, MoMA's holdings include more than 150,000 individual pieces in addition to approximately 22,000 films and 4 million film stills. Some of the most famous paintings are Vincent van Gogh\'s The Starry Night, Andy Warhol\'s Campbell\'s Soup Cans "),
    Stop.create("Guggenheim Museum", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Solomon_R._Guggenheim_Museum_%2848059131351%29.jpg/1280px-Solomon_R._Guggenheim_Museum_%2848059131351%29.jpg", "Housed on a 20th-century architecture landmark designed by Frank Lloyd Wright. The cylindrical building, wider at the top than at the bottom, was conceived as a \"temple of the spirit\". Its unique ramp gallery extends up from ground level in a long, continuous spiral along the outer edges of the building to end just under the ceiling skylight. ") 
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
City London = City(
  "London", 
  List<Stop>.from([ 
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", ""),
    Stop.create("", "", "") 
  ])
);
City CiudadDeMexico = City(
  "Ciudad de Mexico", 
  List<Stop>.from([ 
    Stop.create("Museo Nacional de Antropología", "https://upload.wikimedia.org/wikipedia/commons/3/34/National_Museum_of_Anthropology_and_History.jpg", "This massive building in Chapultepec Park is among the city's most famed museums, second only to perhaps the Museo Frida Kahlo. Though the late Mexican architect Pedro Ramírez Vázquez designed it in 1964, the mammoth building still looks as avant-garde today as it did then. (How exactly does that giant concrete slab float above a pond?) The museum holds the world's largest collection of ancient Mexican artifacts. Some of the most iconic Mesoamerican artifacts discovered to date can be found across 23 rooms. If you want to understand Mexico's history, then a visit here is a must."),
    Stop.create("Castillo de Chapultepec", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/59/37/8f/caption.jpg?w=1200&h=-1&s=1", "Chapultepec Castle is located on top of Chapultepec Hill in Mexico City's Chapultepec park. The name Chapultepec is the Nahuatl word chapoltepēc which means \"on the hill of the grasshopper\". The castle has such unparalleled views and terraces that explorer James F. Elton wrote they \“can't be surpassed in beauty in any part of the world.\" It is located at the entrance to Chapultepec Park at a height of 2,325 meters above sea level. Site of the hill was a sacred place for Aztecs, and the buildings atop it have served several purposes during its history, including that of Military Academy, Imperial residence, Presidential residence, observatory, and since the 1940s, the National Museum of History."),
    Stop.create("El Ángel de la Independencia", "https://images.fidhouse.com/fidelitynews/wp-content/uploads/sites/9/2015/01/MexicoIndependenceAngel-1024x680.jpg", "The Angel of Independence, most commonly known by the shortened name El Ángel and officially known as Monumento a la Independencia (\"Monument to Independence\"), is a victory column on a roundabout on the major thoroughfare of Paseo de la Reforma in downtown Mexico City. El Ángel was built in 1910 during the presidency of Porfirio Díaz by architect Antonio Rivas Mercado, to commemorate the centennial of the beginning of Mexico's War of Independence. In later years it was made into a mausoleum for the most important heroes of that war. It is one of the most recognizable landmarks in Mexico City, and it has become a focal point for both celebration and protest. It resembles the July Column in Paris, the Berlin Victory Column in Berlin and Columbus Monument in New York City. "),
    Stop.create("Plaza Garibaldi", "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Plaza_Garibaldi.jpg/640px-Plaza_Garibaldi.jpg", "Mexico's roving mariachi bands have been found in this plaza, a few blocks north of the Palacio de Bellas Artes, since the mid-1900s. Though the plaza has deteriorated over the years, it's seen a resurgence thanks to a city-driven effort to clean up the neighborhood by installing new sidewalks and street lamps. It's a cultural meeting point of sorts, where travelers can come day or night (though the best time to go is after 11 p.m.), to watch bands solicit bar patrons, cars, and passersby to buy a song."),
    Stop.create("Palacio de Mineria", "https://upload.wikimedia.org/wikipedia/commons/0/02/FacadeColegioMineriaDF.JPG", "The Palace of Mining, also Palace of Mines, is a building in Mexico City, Mexico, considered to be a fine example of Neoclassical architecture in the Americas. It was designed and built between 1797 and 1813 by Valencian Spanish sculptor and architect Manuel Tolsá. It was built to house the Royal School of Mines and Mining of the Royal Court at the request of its director, Fausto Elhuyar, a scientifically-trained mineralogist. Later it housed other institutions such as the National University, the School of Engineering, College of Mines and the Physics Institute of the National Autonomous University of Mexico."),
    Stop.create("Plaza de la Constitución", "https://images.fidhouse.com/fidelitynews/wp-content/uploads/sites/9/2015/01/Plaza-de-la-Constitucion-78515-42303297.jpg", "The Zócalo is the common name of the main square in central Mexico City. Prior to the colonial period, it was the main ceremonial center in the Aztec city of Tenochtitlan. The plaza used to be known simply as the \"Main Square\" or \"Arms Square\", and today its formal name is Plaza de la Constitución (Constitution Square). This name does not come from any of the Mexican constitutions that have governed the country but rather from the Cádiz Constitution, which was signed in Spain in the year 1812. Even so, it is almost always called the Zócalo today. Plans were made to erect a column as a monument to Independence, but only the base, or zócalo (meaning \"plinth\"), was built. The plinth was buried long ago, but the name has lived on. Many other Mexican towns and cities, such as Oaxaca, Mérida, and Guadalajara, have adopted the word zócalo to refer to their main plazas, but not all. "),
    Stop.create("Templo Mayor", "https://images.fidhouse.com/fidelitynews/wp-content/uploads/sites/9/2015/01/Templo-Mayor-Citt%C3%A0-del-Messico-78532-53278881.jpg", "Templo Mayor was the centerpiece of Tenochtitlán, the ancient Aztec capital, constructed in 1325 in the marshes of Lake Texcoco. The temple was mowed over and replaced by a cathedral during the Spanish conquest in 1521. Today, the hulking stone ruins lie at the heart of Centro Histórico, embedded in the blueprint of downtown. Surrounded by streets and buildings, it is hard to imagine the temples in their original Aztecan glory, but the nicely organized museum helps paint the full picture."),
    Stop.create("Teotihuacan Pyramids", "https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/de/be/19.jpg", "The ancient Mesoamerican pyramids of Teotihuacán, in the Valley of Mexico, once served as the largest city in the pre-Columbian Americas. It is thought that during the first millennium A.D. the city had around 125,000 people, including multi-ethnic groups such as the Otomi, Zapotec, Mixtec, Maya, and Nahua. If you have a few days in Mexico City, it's worth the day trip. (Teotihuacán is about an hour outside the city by car.) Leave early in the morning so you can be back in the city by mid-day—and bring sunscreen!"),
    Stop.create("Basílica de Guadalupe", "https://upload.wikimedia.org/wikipedia/commons/a/a2/Basilica_of_Our_Lady_of_Guadalupe_%28new%29.JPG", "The Basilica of Our Lady of Guadalupe  is a Catholic church, basilica, and National shrine of Mexico which houses the cloak containing the image of Our Lady of Guadalupe. The 1709 shrine was built in the North of Mexico City near the hill of Tepeyac, where the Virgin Mary is believed to have appeared to Saint Juan Diego Cuauhtlatoatzin. The basilica structure which now contains Juan Diego's cloak was completed in 1974.") 
  ])
);

  @override
  Widget build(BuildContext context) {
    ctx =context;
    final n;
      
    

    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore cities',
          style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 48, 41, 255).withOpacity(0.8),
          leading: IconButton(
            onPressed: () {
              _toProfilePage(context);
            },
            icon: Icon(Icons.arrow_back_rounded)
          ),
        ),
        body: _exploreCity(),
        
                 
        /*endDrawer: Drawer(
          
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
                _toProfilePage(context);
              },
              child: Text('Back to Profile Page'),
              ),
            ],
          ),
        ),*/
      ),
    );
   //build
  } 
  
  //Returns the ListView as
  Widget _exploreCity() => ListView(
    
        children: [
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final sp = snapshot.data as SharedPreferences;
                if (sp.getDouble('week_steps') == null) {
                  sp.setDouble('week_steps', 0);
                  return Text("");
                } else {
                  double? n= sp.getDouble('week_steps');
                  return Text("");
                }
              }
              else {
                return CircularProgressIndicator();
              }
            }),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Venezia',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 8700 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n >= 8700){
                  _toStopsCities(ctx, Venezia);
                }
                else{
                 
                }                 
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Roma',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 17000 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n >= 17000){
                  _toStopsCities(ctx, Roma);
                }
                else{
                 
                } 
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
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
                if (n >= 27500){
                  _toStopsCities(ctx, Padova);
                }
                else{
                 
                } 
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'New York',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 47800 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n >= 47800){
                  _toStopsCities(ctx, NewYork);
                }
                else{
                 
                } 
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
               if (n >= 75300){
                  _toStopsCities(ctx, Paris);
                }
                else{
                 
                }            
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'London',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text('The city unlocks with at least 105500 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n >= 105500){
                  _toStopsCities(ctx, London);
                }
                else{
                 
                }  
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
               if (n >= 161400){
                  _toStopsCities(ctx, CiudadDeMexico);
                }
                else{
                 
                }               
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

  void _toProfilePage(BuildContext context) {
  Navigator.of(context).pushReplacementNamed(ProfilePage.route);
}
      
} 

 