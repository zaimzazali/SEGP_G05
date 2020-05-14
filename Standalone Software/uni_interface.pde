
import de.bezier.data.sql.*;
import controlP5.*;
import java.util.*;
String user     = "matteo";
String pass     = "password";
ArrayList<String> nameCol = new ArrayList<String>();
ArrayList<String> emailCol = new ArrayList<String>();
ArrayList<String> telCol = new ArrayList<String>();
ArrayList<String> idCol = new ArrayList<String>();
ArrayList<String> progCol = new ArrayList<String>();
ArrayList<String> schoolCol = new ArrayList<String>();

String studentWithProjectQuery =
"SELECT * from student_info join list_programmes join list_school join student_project "+
"where student_info.studProgramme = list_programmes.programmeID and "+
"list_programmes.school = list_school.schoolID and student_info.studID = student_project.studID";

String allStudentsDataQuery = 
"SELECT * from student_info join list_programmes join list_school "+
"where student_info.studProgramme = list_programmes.programmeID and "+
"list_programmes.school = list_school.schoolID";

String idQuery = "lect_proj AS (SELECT  lecturer,final_projects.projectID as projectID FROM final_projects join stud_proj where final_projects.projectID  = stud_proj.projectID)"+
    "SELECT * FROM final_projects"+
    " join lect_proj join lecturer_info join list_school where final_projects.projectID  = lect_proj.projectID "+ 
    "and lectID = lect_proj.lecturer and list_school.schoolID = lecturer_info.school";
    
String endOfQuery = ";";


String[]colnames = {"name", "id", "email", "tel", "supervisor", "supEmail", "program", "dept","studProgram","studSchool","projTitle"};
String[]listnames = {"nameCol", "idCol", "emailCol", "telCol", "progCol","schoolCol"};

String database = "Dev_SE5";
boolean toggleValue = false;
CallbackListener cb;
ScrollableList l, supervisor, supEmail, dept, program,
studName, studProgram, lectPhone, studSchool, projectTitle, projDesc;
CheckBox checkbox, checkbox1;
ControlP5 cp5;
MySQL dbconnection;
Button buttonSearch, buttonClear, buttonRefresh;
Knob projectKnob, notProjectKnob;
Textarea projDescTextArea;
Toggle toggle;

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


void clearTable(String[] colnames) {
  //Clear all the rows in the student table
  for (int i = 0; i < colnames.length; i++) {
    cp5.get(ScrollableList.class, colnames[i]).clear();
  }
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


void id(int n) {
  clearSupervisor();
  String studID = (cp5.get(ScrollableList.class, "id").getItem(n).get("name").toString());
  String query;
  
  query = " WITH stud_proj AS ( SELECT projectID from student_project  where studID = '"+studID+"'),"+ idQuery + endOfQuery;


  dbconnection = new MySQL ( this, "database-segp.ccxcz400iffs.eu-west-2.rds.amazonaws.com", database, user, pass );
  if (dbconnection.connect()) {

    dbconnection.query( query);
    while (dbconnection.next()) {
      //Get data from query result
      String  projectName = (dbconnection.getString("projectName"));
      String projDesc = (dbconnection.getString("projectDetails"));
      String preferredStudent = (dbconnection.getString("preferenceStudent"));
      String lectName = (dbconnection.getString("lectName"));
      String lectEmail = (dbconnection.getString("lectEmail"));
      String lectTel = (dbconnection.getString("lectTelNum"));
      String schoolName = (dbconnection.getString("schoolName")).substring(0,80);
      schoolName +="...";
      //Display data
      supervisor.addItem(lectName, null);
      supEmail.addItem(lectEmail, null);
      projDescTextArea.setText(projDesc);
      dept.addItem(schoolName, null);
      program.addItem(preferredStudent, null);
      projectTitle.addItem(projectName,null);
      lectPhone.addItem(lectTel, null);
    }
    dbconnection.close();
  } else
  {
    println("connection failed !");
  }
}


void populateTable() {
  //Display data into the table
  cp5.get(ScrollableList.class, "id").addItems(idCol);
  cp5.get(ScrollableList.class, "name").addItems(nameCol);
  cp5.get(ScrollableList.class, "email").addItems(emailCol);
  cp5.get(ScrollableList.class, "tel").addItems(telCol);
  studProgram.addItems(progCol);
  studSchool.addItems(schoolCol);
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

void lockScrollable() {
  String[]colnames = {"name", "email", "tel", "supervisor", "supEmail","projTitle","program", "dept","studProgram","studSchool","projTitle","lectPhone","projDesc"};
  for (int i = 0; i < colnames.length; i++) {
    cp5.get(ScrollableList.class, colnames[i]).lock();
  }
}

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

void addTextArea(int xpos, int ypos, String name) {
  //Insert textArea containing project's description
  projDescTextArea = cp5.addTextarea(name)
    .setPosition(xpos, ypos)
    .setSize(400, 100)
    .setFont(createFont("arial", 12))
    .setLineHeight(14)
    .setColor(color(255))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
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

void clearSupervisor() {
  projDescTextArea.setText("");
  supervisor.clear();
  supEmail.clear();
  dept.clear();
  program.clear();
  lectPhone.clear();
  projectTitle.clear();
}
void clearColumnsList() {
  nameCol.clear();
  emailCol.clear();
  telCol.clear();
  idCol.clear();
  studProgram.clear();
   progCol.clear();
   schoolCol.clear();
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

void draw() {

 
  background(170);
}
