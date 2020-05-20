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
    
String countProjectsQuery = "with nr_stud as (SELECT 0+ count(1)as c from student_info ),"+
    "nr_proj as (SELECT 0+ count(1) as c from student_project)"+
    "select nr_proj.c/nr_stud.c  * 100 as perc from nr_stud join nr_proj ;";
    
String endOfQuery = ";";
