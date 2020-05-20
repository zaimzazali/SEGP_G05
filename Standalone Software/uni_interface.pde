
import de.bezier.data.sql.*;
import controlP5.*;
import java.util.*;


void setup() {
  size(1200, 800);
  cp5 = new ControlP5(this);
  cp5.setColorActive( color(0, 255, 0));

  //Checkbox for projects
  checkbox = addCheckBox("checkBox", 0, 0, "hassProj", 0);

  //TextField to filter projects by name
  addTextField();
  buttonSearch = cp5.addButton("search").setPosition(600, 40).setSize(200, 20);
  buttonSearch.setColorBackground( color( 20, 190, 0 ) );

  //Refresh database update view
  buttonClear = cp5.addButton("refresh") .setPosition(0, 40).setSize(400, 20);
  buttonClear.setColorBackground( color( 190, 0, 0 ) );

  //Show projects stats 
  projectKnob = addStats("knob", 80, 70, "Have Project", color(0, 160, 100) );
  notProjectKnob= addStats("knobB", 180, 70, "Not Have Project", color(200, 0, 0) );

  //Text Area containing project description
   addTextArea(800, 180, "text");

  //Table 
  addScrollableL("id", 0, 160, idCol, 90);
  addScrollableL("name", 100, 160, nameCol, 90);
  addScrollableL("email", 200, 160, emailCol, 90);
  addScrollableL("tel", 300, 160, telCol, 90);
  studProgram = addScrollableL("studProgram", 400, 160, idCol, 90);
  studProgram.setWidth(150);
  
  
  //Project info
  projectTitle = addScrollableL("projTitle",700, 160, idCol, color(180, 180, 0));
  projDesc = addScrollableL("projDesc", 800, 160, idCol, color(180, 180, 0));
  projDesc.setWidth(400);
  program = addScrollableL("program", 700, 280, idCol, color(180, 180, 0));
  dept = addScrollableL("dept", 800, 280, idCol, color(180, 180, 0));
  dept.setWidth(400);
  
  //Supervisor info
  supervisor = addScrollableL("supervisor",700, 320, idCol, color(0, 180, 180));
  supEmail = addScrollableL("supEmail", 900, 320, idCol, color(0, 180, 180));

  //Student info 
  studName = addScrollableL("studName", 800, 320, idCol, color(0, 180, 180));
  studSchool = addScrollableL("studSchool", 550, 160, idCol, 90);
  studSchool.setWidth(150);
  lectPhone = addScrollableL("lectPhone", 800, 320, idCol, color(0, 180, 180));

  //Count projects available and update stats
  countProject();

  //Get data from database
  sendQuery(allStudentsDataQuery + endOfQuery);
  lockScrollable();
}




void sendQuery(String query) {
  dbconnection = new MySQL ( this, "database-segp.ccxcz400iffs.eu-west-2.rds.amazonaws.com", database, user, pass );
  if (dbconnection.connect()) {

    dbconnection.query( query);
    while (dbconnection.next())
    {
      //Insert every row queried into an array of strings
      populateCol();
    }
    dbconnection.close();
  } else
  {
    println("connection failed !");
  }
  
  //Insert the arrays created into the table
  populateTable();
}


void controlEvent(ControlEvent theEvent) {
  //If the checkbox is clicked
   
  if (theEvent.isFrom(toggle)) {
    //Clear table student
    clearTable(colnames);
    //Clear supervisor data
    clearSupervisor();
    clearColumnsList();
    if(!toggleValue){
      sendQuery(studentWithProjectQuery + endOfQuery);
      toggleValue = true;
      toggle.setColorActive(color(0,255,0));
    }
    else{
      sendQuery(allStudentsDataQuery + endOfQuery);
      toggleValue = false;
      toggle.setColorActive(color(255,0,0));
    }
  }
  
}




public void search() {
  String name = cp5.get(Textfield.class, "").getText();
  if (name.length() > 0) {
    //Search student by his name
    clearTable(colnames);
    clearColumnsList();
    sendQuery(allStudentsDataQuery+ " AND studName = '" + name + "';");
  }
}
public void refresh() {
  countProject();
  clearTable(colnames);
  clearColumnsList();
  clearSupervisor();
  sendQuery(allStudentsDataQuery);
  cp5.get(Textfield.class, "").clear();
}

void lockScrollable() {
  String[]colnames = {"name", "email", "tel", "supervisor", "supEmail","projTitle","program", "dept","studProgram","studSchool","projTitle","lectPhone","projDesc"};
  for (int i = 0; i < colnames.length; i++) {
    cp5.get(ScrollableList.class, colnames[i]).lock();
  }
}



CheckBox  addCheckBox(String name, int xpos, int ypos, String itemName, int itemVal) {
  //Add checkbox for students with or wirhout project
  CheckBox checkbox = cp5.addCheckBox(name)
    .setPosition(xpos, ypos)
    .setSize(0, 0)
    .setItemsPerRow(6)
    .setSpacingColumn(0)
    .setSpacingRow(20)
    .addItem(itemName, itemVal);

  checkbox.setColorBackground( color( 255, 0, 0 ) );
  
 
toggle = cp5.addToggle("toggle")
     .setPosition(0,0)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setColorActive(color(255,0,0)) 
.setColorBackground(color(200)) 
.setCaptionLabel(itemName) 

.setColorLabel(color(0,0,0)) ;
     ;
  return checkbox;
}
void addTextField() {
  PFont font = createFont("arial", 12);
  cp5.addTextfield("")
    .setPosition(400, 40)
    .setSize(200, 20)
    .setFont(font)
    .setFocus(false)
    .setColorForeground(255)

    ;
}


void draw() {

 
  background(170);
}
