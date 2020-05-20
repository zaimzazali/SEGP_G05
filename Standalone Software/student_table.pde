
ScrollableList addScrollableL(String colName, int xpos, int ypos, List<String> rows, color backCol) {
  //Default scrobbableList
  l  = cp5.addScrollableList(colName)
    .setPosition(xpos, ypos)
    .setSize(100, 600)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(rows)
    .setLabel(colName)
    .setType(ControlP5.LIST);
    
  l.setColorBackground( color( backCol ) );
  l.setColorValue(255);     
  l.setColorLabel(0) ;
  return l;
}

void populateCol() {
  //Get student's data from query
  String name = dbconnection.getString("studName");
  String email = dbconnection.getString("studEmail");
  String tel = dbconnection.getString("studTelNum");
  String id = dbconnection.getString("studID");
  String prog = dbconnection.getString("programmeName");
  String school =  dbconnection.getString("schoolName").substring(0,30);
  school+="...";
  
  //Display data into the table
  nameCol.add(name);
  emailCol.add(email);
  telCol.add(tel);
  idCol.add((id));
  progCol.add(prog);
  schoolCol.add(school);
}


Knob addStats( String name, int xpos, int ypos, String caption, color col) {
  return cp5.addKnob(name)
    .setRange(0, 100)
    .setPosition(xpos, ypos)
    .setRadius(35)
    .setDragDirection(Knob.VERTICAL)
    .lock()
    .setColorForeground(color(255))
    .setColorBackground(col)
    .setColorActive(color(255, 255, 0))
    .setCaptionLabel(caption)
    ;
}


void countProject() {

  String query = "with nr_stud as (SELECT 0+ count(1)as c from student_info ),"+
    "nr_proj as (SELECT 0+ count(1) as c from student_project)"+
    "select nr_proj.c/nr_stud.c  * 100 as perc from nr_stud join nr_proj ;";
  dbconnection = new MySQL ( this, "database-segp.ccxcz400iffs.eu-west-2.rds.amazonaws.com", database, user, pass );
  if (dbconnection.connect()) {

    dbconnection.query( query);
    dbconnection.next();

    float projYes = dbconnection.getFloat("perc");
    println(projYes);
    projectKnob.setValue(projYes);
    notProjectKnob.setValue(100 - projYes);
  } else
  {
    println("connection failed !");
  }
}
