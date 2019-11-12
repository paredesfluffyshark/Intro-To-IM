//establishes the types of variables
Table table;
PFont f;
color dark_pink;
PImage title;
color pink;


void setup(){
  //creating all the necessary color values used in the program
  int white = 255;
  pink = color(255,160,190);
  dark_pink = color(155,20,20);
  //settting up the background
  background(pink);
  //establishing the margin for all the text
  int margin = 70;
  //setting the size of the canvas
  size (1400,800);
  //loading the table to get the data from 
  table = loadTable("madlibs_processing.csv", "header");
  
  //creating the list of nouns, plural nouns, plural animals, colors, adjectives (in that order) 
  String noun[] = table.getStringColumn ("noun");
  String plural_noun[] = table.getStringColumn ("plural_noun");
  String plural_animal[] = table.getStringColumn ("plural_animal");
  String colorvalue[] = table.getStringColumn ("colorvalue");
  String adjective[] = table.getStringColumn ("adjective");
  String verb[] = table.getStringColumn ("verb");
  
  //aligning all the text to the left side of the canvas
  textAlign(LEFT);
  //creates the font object and sets the size and font type
  f = createFont("Courier", 32);
  //selects the font
  textFont(f,32);
  //sets the height and width of the madlibs page title
  float title_width = 620.15625;
  float title_height = 220.5;
  //loads the title image into the program
  title = loadImage("unicornpoop.png");
  // displays the title image
  image(title,(width/2 -title_width/2), 0, title_width, title_height);
 
 // saves the initial orientation of the canvas
  pushMatrix();
  //translates the canvas down by a scale of the title's height multiplied by 0.85
  translate (0, title_height*0.85);
  
  
  
  //sets the "Unicorns aren't like other " string to the variable first_line and fills with the color "white"
  fill(white);
  String first_line = "Unicorns aren't like other ";
  // determines the width in pixels of "first_line"
  float first_line_width = textWidth(first_line);
  // displays the text at x = margin and y = 100
  text(first_line,margin,100);
  
  
  
  
  //fills the text with the color "dark pink" to seperate it from the non-randomized text
  fill(dark_pink);
  // selects the randomized part of speech (in this case, the plural noun) by having the random function select and integer 
  //between 0 and 59, then using that integer, index a random element of the plural_noun array
  String plural_noun1 = plural_noun[int(random(0,60))];
  // determines the width in pixels of "plural_noun1"
  float plural_noun1_width = textWidth(plural_noun1);
  // prints the randomly selected plural_noun at x = the width of the previous section of the first line plus the margin
  text(plural_noun1,(first_line_width + margin),100);

  //fills the text with white to seperate it from the text that is randomly selected
  fill(white);
  // stores the string "; they're " in the variable "first_line_continued"
  String first_line_continued = "; they're ";
  // determines the width in pixels of the string "; they're " and stores it int he variable "first_line_continued_width"
  float first_line_continued_width = textWidth(first_line_continued);
  // prints the continuation of the frist line at x = the width of the randomly selected plural_noun plus the width of "Unicorns aren't like other " plus the margin
  text(first_line_continued,(plural_noun1_width + first_line_width + margin),102);
  
  fill(dark_pink);
  String adjective1 = adjective[int(random(0,60))] + ".";
  float adjective1_width = textWidth(adjective1);
  text(adjective1,(plural_noun1_width + first_line_width + first_line_continued_width + margin),100);
  
  
  //the following lines (those with the second, third, fourth, fifth, sixth and seventh in their title and the 
  //randomized parts of speech follow a similar pattern tothe block code for the first line in the canvas
  
  
  
  // BEGINNING OF THE SECOND LINE
  fill(white);
  String second_line = "They look like ";
  float second_line_width = textWidth(second_line);
  text(second_line,margin,164);
  
  fill(dark_pink);
  String plural_animals1 = plural_animal[int(random(0,35))];
  float plural_animals1_width = textWidth(plural_animals1);
  text(plural_animals1,(second_line_width + margin),164);
  
  fill(white);
  String second_line_continued = ", with ";
  float second_line_continued_width = textWidth(second_line_continued);
  text(second_line_continued,(plural_animals1_width + second_line_width + margin),164);
  
  fill(dark_pink);
  String plural_noun2 = plural_noun[int(random(0,60))];
  float plural_noun2_width = textWidth(plural_noun2);
  text(plural_noun2,(second_line_continued_width + plural_animals1_width + second_line_width + margin),164);
  
  fill(white);
  String second_line_continued_further = " for feet and a ";
  float second_line_continued_further_width = textWidth(second_line_continued_further);
  text(second_line_continued_further,(plural_noun2_width +second_line_continued_width + plural_animals1_width + second_line_width + margin),164);
  
  fill(dark_pink);
  String adjective2 = adjective[int(random(0,60))];
  float adjective2_width = textWidth(adjective2);
  text(adjective2,(second_line_continued_further_width + plural_noun2_width +second_line_continued_width + plural_animals1_width + second_line_width + margin),164);
  

  // BEGINNING OF THE THIRD LINE
  fill(white);
  String third_line = "mane of hair. But unicorns are ";
  float third_line_width = textWidth(third_line);
  text(third_line,margin,228);
  
  fill(dark_pink);
  String colorvalue1 = colorvalue[int(random(0,60))];
  float colorvalue1_width = textWidth(colorvalue1);
  text(colorvalue1, (third_line_width + margin), 228);
  
  fill(white);
  String third_line_continued = " and have a ";
  float third_line_continued_width = textWidth(third_line_continued);
  text(third_line_continued, (third_line_width + colorvalue1_width + margin), 228);
  
  fill(dark_pink);
  String adjective3 = adjective[int(random(0,60))] + " ";
  float adjective3_width = textWidth(adjective3);
  text(adjective3,(third_line_continued_width + third_line_width + colorvalue1_width + margin),228);
  
  
  
  // BEGINNING OF THE FOURTH LINE
  fill(dark_pink);
  String noun1 = noun[int(random(0,60))];
  float noun1_width = textWidth(noun1);
  text(noun1,margin,292);
  
  fill(white);
  String fourth_line = " on their heads. Some ";
  float fourth_line_width = textWidth(fourth_line);
  text(fourth_line,(noun1_width +margin),292);
  
  fill(dark_pink);
  String plural_noun3 = plural_noun[int(random(0,60))];
  float plural_noun3_width = textWidth(plural_noun3);
  text(plural_noun3, (noun1_width + fourth_line_width + margin), 292);
  
  fill(white);
  String fourth_line_continued = " don't believe unicorns are ";
  float fourth_line_continued_width = textWidth(fourth_line_continued);
  text(fourth_line_continued, (plural_noun3_width + noun1_width + fourth_line_width + margin), 292);
  
  
  // BEGINNING OF THE FIFTH LINE
  fill(white);
  String fifth_line = "real but I believe in them. I would love to ";
  float fifth_line_width = textWidth(fifth_line);
  text(fifth_line,margin,356);
  
  fill(dark_pink);
  String verb1 = verb[int(random(0,60))];
  float verb1_width = textWidth(verb1);
  text(verb1, (fifth_line_width + margin), 356);
  
  fill(white);
  String fifth_line_continued = " on a unicorn";
  float fifth_line_continued_width = textWidth(fifth_line_continued);
  text(fifth_line_continued, (verb1_width + fifth_line_width + margin),356);
  
  
  
  // BEGINNING OF THE SIXTH LINE
  fill(white);
  String sixth_line = "very soon. I always thought unicorns were ";
  float sixth_line_width = textWidth(sixth_line);
  text(sixth_line,margin,420);

  fill(dark_pink);
  String adjective4 = adjective[int(random(0,60))];
  float adjective4_width = textWidth(adjective4);
  text(adjective4,(sixth_line_width + margin), 420);
  
  fill(white);
  String sixth_line_continued_further = ", but maybe not.";
  text(sixth_line_continued_further,(adjective4_width + sixth_line_width + margin),420);
  
  
  // BEGINNING OF THE SEVENTH LINE
  fill(white);
  String seventh_line = "Do unicorns poop ";
  float seventh_line_width = textWidth(seventh_line);
  text(seventh_line,margin,484);
  
  fill(dark_pink);
  String plural_noun4 = plural_noun[int(random(0,60))] + " ";
  float plural_noun4_width = textWidth(plural_noun4);
  text(plural_noun4,(seventh_line_width + margin), 484);
  
  fill(white);
  String seventh_line_continued = "or is their poop ";
  float seventh_line_continued_width = textWidth(seventh_line_continued);
  text(seventh_line_continued,(plural_noun4_width + seventh_line_width + margin),484);
  
  fill(dark_pink);
  String adjective5 = adjective[int(random(0,60))];
  float adjective5_width = textWidth(adjective5);
  text(adjective5,(plural_noun4_width + seventh_line_continued_width + seventh_line_width + margin), 484);
  
  fill(white);
  String seventh_line_continued_more = " like";
  text(seventh_line_continued_more,(adjective5_width + plural_noun4_width + seventh_line_continued_width + seventh_line_width + margin),484);
  
  fill(white);
  String eighth_line = "any other animal's? Hopefully I'll ";
  float eighth_line_width = textWidth(eighth_line);
  text(eighth_line,margin,548);
  
  fill(dark_pink);
  String verb2 = verb[int(random(0,60))];
  float verb2_width = textWidth(verb2);
  text(verb2,(eighth_line_width + margin), 548);
  
  fill(white);
  String eighth_line_continued = " a unicorn one day.";
  text(eighth_line_continued,(verb2_width + eighth_line_width + margin),548);
  
  
  //returns the orientation to the original setting
  popMatrix();
}
