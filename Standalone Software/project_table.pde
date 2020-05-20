void populateTable() {
  //Display data into the table
  cp5.get(ScrollableList.class, "id").addItems(idCol);
  cp5.get(ScrollableList.class, "name").addItems(nameCol);
  cp5.get(ScrollableList.class, "email").addItems(emailCol);
  cp5.get(ScrollableList.class, "tel").addItems(telCol);
  studProgram.addItems(progCol);
  studSchool.addItems(schoolCol);
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
