void clearTable(String[] colnames) {
  //Clear all the rows in the student table
  for (int i = 0; i < colnames.length; i++) {
    cp5.get(ScrollableList.class, colnames[i]).clear();
  }
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
