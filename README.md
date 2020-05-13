# COMSM1401 - Software Engineering & Group Project

The aims of this unit are to introduce students to the basic principles of software engineering, reinforce their software development skills, and to apply these skills as part of a team. This unit teaches the use of well-established software engineering techniques, and involves you working in groups to design, specify and implement some software system.

> **Software Engineering** : structured programming; modularisation; object-oriented techniques; specification; verification; validation; testing; debugging; the software engineering life-cycle; extreme programming.

> **Project Management** : introduction to project management - how to manage teams; PM and team roles; requirement specification; task allocation; scheduling and planning.

---

## Group 5

_"We are here to develop an End-To-End System to help students to survive their university life gracefully, sort of"_

### Group members

|                         Ruoyan                          |                         Huiyu                         |                        Zhen Fan                         |                      Matteo Lecca                       |                        Zaim Zazali                         |
| :-----------------------------------------------------: | :---------------------------------------------------: | :-----------------------------------------------------: | :-----------------------------------------------------: | :--------------------------------------------------------: |
|                         ab12345                         |                        pj19174                        |                         ab12345                         |                         ab12345                         |                          gv19698                           |
|                     Web Application                     |                    Web Application                    |                       IoT Device                        |                   Standalone Software                   |                          Back-End                          |
| <img src="./readme_assets/pic_default.png" width="150"> | <img src="./readme_assets/pic_huiyu.png" width="150"> | <img src="./readme_assets/pic_default.png" width="150"> | <img src="./readme_assets/pic_default.png" width="150"> | <img src="./readme_assets/pic_zaimzazali.png" width="150"> |

---

## How our Group operates

The development team has been splitted into several Agile Pods which based on function group illustrated as below :-

<p align="center">
  <img src="./readme_assets/agile_pods.png" width="700">
</p>

With the limited number of man-powers and resources, the mobility for each of the project members is highly encouraged among one team to another. This would promote a rotational job scope and give exposures to project members with broaden views and different tasks and perspectives. Nevertheless, each individual main scope would be showned in the section of 'Group members' above.

---

## About our Project

### System Overview

The aim of this project is to develop a holistic end-to-end system that would be benefiting its users in terms of **_*Transparency*_**, **_*Accuracy*_**, **_*Simplicity*_**, **_*Seamless Operation*_**, and **_*Fast Execution*_**.

> **Situation** : <br>
> Students who are required to do a Dissertation or Thesis in the final semester of their studies would require to either;
>
> 1. Propose their own Final Project topic **or**
> 2. Select one of the listed research topics published by their respective schools.
>
> **Problem** : <br>
> There are several identified problems that are associated with the current system which would involve some manual human-interventions.
>
> 1. The available topics listing is **not up-to-date** as it would require someone in-charged to update and add new topics in the spreadsheet.
> 2. Some information regarding the topic availability is **not updated in real-time**.
> 3. There is **no proper medium of communication** between students and the lecturers.
> 4. By not having a proper medium, some of the communications (such as emails) would be **overlooked** by the lecturers.
>
> **Solution** : <br>
> This project would deliver **three different kind of products** that complement one another to form a holistic system that aims to tackle these problems and improve the current solution with a structured and well-defined system.
>
> Below are the products and their respective users :-
>
> 1. **Standalone Software** - _Schools / Departments_
> 2. **Web Application** - _Lecturers_
> 3. **IoT Device** - _Students_

Sub-sections below will explain on the system itself in more detail.

<br>

### System Design

Below is the overview architecture of the entire system.

<p align="center">
  <img src="./readme_assets/system_arch.png" width="600">
</p>

The whole system would be involving different kind of products with different of functionalities.

<br>

> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>Standalone Software</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Schools / Departments</b></div></div>
> <br>
> Functionalities :-
>
> <ol style="padding-left: 16%">
>   <li>It is the single-point monitoring system that comes together with the data visualisations.<br>It acts as a Dashboard that gives end-to-end information and insights.</li>
>   <li>To monitor the allocations of the final project topics to current active students.<br>It checks for students that have secured their research topic, and for those who are still yet to confirm any topics.</li>
>   <li>The data will be updated in real-time to give the latest information to the Unit Director and Coordinator which allows them to plan their next steps ahead of time.</li>
>   <li>To mitigate issues related to students who could not secure any topics at the last minute of the project proposal period.</li>
> </ol>
> <br>
> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>Web Application</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Lecturers</b></div></div>
> <br>
> Functionalities :-
>
> <ol style="padding-left: 16%">
>   <li>It is a web platform that allows any available Lecturers to publish their current on-going or newly proposed projects online, which will be visible to students.</li>
>   <li>It is a channel for the lecturers to provide a detailed information regarding the project scope, project objectives, project grants, availability status, supervisors, desired students, and any other crucial information that are related to the project.</li>
>   <li>The lecturers could accept or decline any project requests from students.</li>
>   <li>Its data will also be up-to-date real-time and will provide the latest information to students in order to prevent any conflicting issues.</li>
> </ol>
> <br>
> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>IoT Device (M5 Stack)</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Students</b></div></div>
> <br>
> Functionalities :-
>
> <ol style="padding-left: 16%">
>   <li>It is a simple compact device that will be used by the active students which allows them to check for any available final project topics, and book them.</li>
>   <li>From the device, the student could view the list of projects together with the project details.</li>
>   <li>If there is a project that meet the student's interest, the student could book the topic and wait for the approval from the lecturer who posted the topic.</li>
>   <li>While there is no confirmed student that booked the topic, any students could book the topic and express their interests for it, until the topic is confirmed.</li>
> </ol>

<br>
To sum everything up, below is a story which will give you an idea on how these products would complement each other forming an end-to-end system.
<br><br>

> There are two best friends, Adam and George, who are currently studying for MSc Computer Science at the University of Bristol. The length of the masters programme is one year, and it is splitted into several blocks such as Teaching Block 1 (TB1), Teaching Block 2 (TB2), and a Dissertation which will be happening in the Summer Vacation period. <br><br>
> During TB2, all of the MSc Computer Science students are asked to either propose their own idea for the Dissertation, or simply choose one of the topics listed by the Computer Science department. By using the M5 Stack device, every student can log into the device by using their own university credentials. Thus, Adam and George both logged into the M5 Stack to see what's on the system. <br><br>
> Once both of them logged in, they can see that there is a list of Final Project topics that they can choose from. Both of them read each topic one by one to see whether the topic matched with their interest or not. After they have found some of the interested topics, both of them click a button on the M5 Stack to book the topics. Now, they will have to wait for the approval from each of the project's supervisor. <br><br>
> On the other side, which is from the lecturers' (or project supervisors') perspectives, they will receive a notification regarding the project booking requests. By using the web platform, each lecturer could log into the platform either to post new project topics which will be listed in the M5 Stack topic listing, or to check each request one by one.<br><br>
> Now, let say a lecturer, Dr Luke, who posted about five topics on the list, he has received about seven requests for each of the topics. He now can scroll each request and perhaps make a next move to interview the candidates or if he wants to hand-pick the candidates straight away without interviewing them, he can simply clicks the 'Accept' button for to confirm the acceptance of the particular candidate. The other requests associated with the topic will be rejected straight away. The acceptance will be recorded in the database.<br><br>
> This dynamic information will be used to update the topic listing in the M5 Stack, from 'available' to 'taken', for the specific topic that has confirmed the student. Those who got accepted will be receiving the confirmation email through their university email address, and those who got rejected will also receive a rejection email. These emails will be blasted automatically by the web platform. Fortunately, Adam has secured a topic for his Disseration, but George has got the rejections from all of his topic choices.<br><br>
> As the story covers the Students' and Lecturers' parts, it will now cover the usage of the Standalone Software. The software is installed on the premise systems or computers, that is on the Person-In-Charge (PIC) workstation, who is responsible to monitor the Final Project allocations. The person would need to log into the software to access it. <br><br>
> The very first panel that will be shown is a dashboard panel which will display the count of the available project topics, total number of students, total number of students who have secured a topic, and total number of students who do not have any topic to begin their Dissertation. With the data, the PIC can plan the next steps to tackle any anticipated issues, such as limited number of project topics to cater any supports to students who are struggling to find a topic for their Dissertation (such as George). Of course, the PIC will also have the accessibility of the project details and other administration matters.

<br>

#### Communication Protocol

There are several protocols used, experienced, and included during the development phase for this project, and to connect the products or devices to one another.

| Protocol                                    | Usage                                                                                                                                      |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Transmission Control Protocol (TCP)         | To communicate with the database instance that is hosted on the Cloud from Amazon Web Services (AWS).                                      |
| Simple Mail Transport Protocol (SMTP)       | To send out the confirmation or rejection emails to students. \*\*                                                                         |
| File Transfer Protocol (FTP)                | To transfer files (webpage materials) from the local development machines to the AWS EC2 (Virtual Machine) on the Cloud. \*\*              |
| Hyper Text Transfer Protocol (HTTP)         | To estestablish a connection with the Server to transfer the webpage documents to other systems or client machines that requested it. \*\* |
| Hyper Text Transfer Protocol Secure (HTTPS) | If the web platform is hosted properly on the Cloud, it is always good (a must) to secure the connection in an encrypted format. \*\*      |

_\*\* These are the protocols used during the development and testing. However, due to time constraints, the implementations of these protocols were halted and revoked as they would make the prototype unstable to demonstrate._

<br>

#### Data Persistence Mechanisms

This project is currently using one of the familiar database engine, that is MariaDB which is hosted on the Cloud by the AWS Relational Database Service (RDS) to store the data.

Amazon RDS provides an essential features in order to ensure the data stored through their services is stored and accessed securely. It provides a network-level isolation by using the Amazon Virtual Private Cloud (VPC), and Internet Protocol (IP) addresses filteration in order to control the connections back and forth the database. Moreover, it provides an encryption of data at rest and in transit. However, some of the features would come by default and some would be requiring some extra configurations.

| Data Encryption | Approach                                                                                                                                                    |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| At Rest         | Data stored in the storage is encrypted by using the industry standard of AES-256 encryption algorithm.                                                     |
| In Transit      | It encrypts the communications between the applications and the database instance by using the Secure Sockets Layer (SSL) / Transport Layer Security (TLS). |

<br>

#### Data Model

Below is the simplest practical model design and currently in use for this particular project at this particular sprint. With more sprints ahead, it would be scaled up to meet the full fledge system requirements. It shows how the data would relate to one another and portrays the relationship of the real world entities.

<p align="center">
  <img src="./readme_assets/dbeaver_model.png" width="800">
</p>

<br>

> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>Standalone Software</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Schools / Departments</b></div></div>
> <br>
> Accessibility to database :-
>
> <ol style="padding-left: 26%">
>   <li>It SELECT only from the views (Cyan coloured).</li>
>   <li>All relevant attributes or columns have been provided to allow the software to manipulate and process the data to come out with the insights (counts of student, etc...).</li>
> </ol>
> <br>
> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>Web Application</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Lecturers</b></div></div>
> <br>
> Accessibility to database :-
>
> <ol style="padding-left: 26%">
>   <li>It INSERT the data into the 'final_projects' table.</li>
> </ol>
> <br>
> <div><div style="float:left">Product</div><div style="padding-left: 10%">: <b>IoT Device (M5 Stack)</b></div></div>
> <div><div style="float:left">User</div><div style="padding-left: 10%">: <b>Students</b></div></div>
> <br>
> Accessibility to database :-
>
> <ol style="padding-left: 26%">
>   <li>It SELECT the 'view_projects' view and displays the project list.</li>
>   <li>It INSERT the data into the 'student_project' table once the student booked a particular topic.</li>
>   <li>It UPDATE the 'isAvailable' attribute in the 'final_projects' table to 'false' once a student confirmed the topic.</li>
> </ol>

<br>

### System Implementation

### Project Evaluation

---

### References

1. https://csijh.gitlab.io/COMSM1401/ - Example projects from previous years
2. https://help.github.com/en/github - GitHub.com Help Documentation
3. https://csijh.gitlab.io/COMSM0104/ - Web Technologies (COMSM0104)
