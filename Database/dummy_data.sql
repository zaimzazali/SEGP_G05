INSERT INTO Dev_SE5.list_school (schoolName)
VALUES
    ('School of Arts'),
    ('School of Humanities'),
    ('School of Modern Languages'),
    ('Centre for Academic Language and Development'),
    ('Centre for Innovation'),
    ('School of Computer Science, Electrical and Electronic Engineering, and Engineering Mathematics'),
    ('School of Civil, Aerospace and Mechanical Engineering'),
    ('Bristol Dental School'),
    ('Bristol Medical School'),
    ('Bristol Veterinary School'),
    ('Centre for Health Sciences Education'),
    ('School of Biological Sciences'),
    ('School of Biochemistry'),
    ('School of Cellular and Molecular Medicine'),
    ('School of Physiology, Pharmacology and Neuroscience'),
    ('School of Psychological Science'),
    ('School of Chemistry'),
    ('School of Earth Sciences'),
    ('School of Geographical Sciences'),
    ('School of Mathematics'),
    ('School of Physics'),
    ('School of Education'),
    ('School for Policy Studies'),
    ('School of Economics, Finance and Management'),
    ('School of Sociology, Politics and International Studies'),
    ('University of Bristol Law School');


INSERT INTO Dev_SE5.list_studyLevel (studyLevelName)
VALUES
    ('Undergraduate'),
    ('Postgraduate');


INSERT INTO Dev_SE5.list_programmes (programmeName, programmeLevel, school)
VALUES
    ('(G400) Computer Science', 1, 6),
    ('(G403) Computer Science', 1, 6),
    ('(GH45) Computer Science and Electronics', 1, 6),
    ('(GH46) Computer Science and Electronics', 1, 6),
    ('(GH4P) Computer Science and Electronics with Study Abroad', 1, 6),
    ('Computer Science with Study Abroad', 1, 6),
    ('(GG14) Mathematics and Computer Science', 1, 6),
    ('(GG1K) Mathematics and Computer Science', 1, 6),
    ('(G404) Computer Science with Innovation', 1, 6),
    ('(MSc) Data Science', 2, 6),
    ('(MSc) Digital Health', 2, 6),
    ('(MSc) Computer Science', 2, 6),
    ('(PhD / MSc Research) Computer Science', 2, 6),
    ('(PhD) Interactive Artificial Intelligence', 2, 6),
    ('(PhD) Computational Statistics and Data Science', 2, 6);


INSERT INTO Dev_SE5.student_info (studID, studName, studEmail, studTelNum, studProgramme)
VALUES
    ('aa12345', 'student_name_01', 'stud_01@gmail.com', '07711111111', 12),
    ('bb12345', 'student_name_02', 'stud_02@gmail.com', '07722222222', 12),
    ('cc12345', 'student_name_03', 'stud_03@gmail.com', '07733333333', 12),
    ('dd12345', 'student_name_04', 'stud_04@gmail.com', '07744444444', 12),
    ('ee12345', 'student_name_05', 'stud_05@gmail.com', '07755555555', 12),
    ('ff12345', 'student_name_06', 'stud_06@gmail.com', '07766666666', 12),
    ('gg12345', 'student_name_07', 'stud_07@gmail.com', '07777777777', 12),
    ('hh12345', 'student_name_08', 'stud_08@gmail.com', '07788888888', 12),
    ('ii12345', 'student_name_09', 'stud_09@gmail.com', '07799999999', 12);


INSERT INTO Dev_SE5.lecturer_info (lectID, lectName, lectEmail, lectTelNum, school)
VALUES
    ('aa11111', 'lecturer_name_01', 'lect_01@bristol.ac.uk', '07811111111', 6),
    ('bb22222', 'lecturer_name_02', 'lect_02@bristol.ac.uk', '07822222222', 6),
    ('cc33333', 'lecturer_name_03', 'lect_03@bristol.ac.uk', '07833333333', 6),
    ('dd44444', 'lecturer_name_04', 'lect_04@bristol.ac.uk', '07844444444', 6),
    ('ee55555', 'lecturer_name_05', 'lect_05@bristol.ac.uk', '07855555555', 6),
    ('ff66666', 'lecturer_name_06', 'lect_06@bristol.ac.uk', '07866666666', 6),
    ('gg77777', 'lecturer_name_07', 'lect_07@bristol.ac.uk', '07877777777', 6),
    ('hh88888', 'lecturer_name_08', 'lect_08@bristol.ac.uk', '07888888888', 6),
    ('ii99999', 'lecturer_name_09', 'lect_09@bristol.ac.uk', '07899999999', 6);


INSERT INTO Dev_SE5.final_projects (projectID, projectName, projectDetails, preferenceStudent, isAvailable, lecturer)
VALUES
    ('project_01', 'project_name_01', 'project_details_01', 'Conversion student', true, 'aa11111'),
    ('project_02', 'project_name_02', 'project_details_02', 'Advanced Computer Science student', true, 'aa11111'),
    ('project_03', 'project_name_03', 'project_details_03', 'Any', true, 'aa11111'),
    ('project_04', 'project_name_04', 'project_details_04', 'None', true, 'bb22222'),
    ('project_05', 'project_name_05', 'project_details_05', 'None', true, 'bb22222'),
    ('project_06', 'project_name_06', 'project_details_06', 'Conversion student', true, 'bb22222');


INSERT INTO Dev_SE5.student_project (studID, projectID)
VALUES
    ('bb12345', 'project_01'),
    ('ee12345', 'project_03');

