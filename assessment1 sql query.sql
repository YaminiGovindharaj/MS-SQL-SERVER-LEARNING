create database crimechallenge	
use crimechallenge

---- Create tables
CREATE TABLE Crimes (
 CrimeID INT PRIMARY KEY,
 cage int,
 IncidentType VARCHAR(255),
 IncidentDate DATE,
 Location VARCHAR(255),
 Description TEXT,
 Status VARCHAR(20)
);

CREATE TABLE Victimsall (
 VictimID INT PRIMARY KEY,
 CrimeID INT,
 Age int,
 vName VARCHAR(255),
 ContactInfo VARCHAR(255),
 Injuries VARCHAR(255),
 FOREIGN KEY (CrimeID) REFERENCES Crimes(CrimeID)
);

CREATE TABLE Suspects (
 SuspectID INT PRIMARY KEY,
 CrimeID INT,
 sName VARCHAR(255),
 Description TEXT,
 CriminalHistory TEXT,
 FOREIGN KEY (CrimeID) REFERENCES Crimes(CrimeID)
);


-- Insert sample data
INSERT INTO Crimes (CrimeID, cage,  IncidentType, IncidentDate, Location, Description, Status)
VALUES
 (1, 32,'Robbery', '2023-09-15', '123 Main St, Cityville', 'Armed robbery at a convenience store', 'Open');
 INSERT INTO Crimes (CrimeID, cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(2, 23,'Homicide', '2023-09-20', '456 Elm St, Townsville', 'Investigation into a murder case', 'Under
Investigation');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(3, 61,'Theft', '2023-09-10', '789 Oak St, Villagetown', 'Shoplifting incident at a mall', 'Closed');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(4,63,'kidnap',  '2023-08-10', '109 Oak St, Villagetown' , 'kidnapped a child from school', 'opened');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(5,42,'murder',  '2023-12-12', '109 Oak St, tirupattur' , 'murder a child', 'opened');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(6,32,'Rape',  '2023-11-10', '109 Oak St, kaniyakumari' , 'raped a girl from school', 'under investigation');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(7,63,'blackmailing',  '2023-5-10', '109 Oak St, ambur' , 'blackmailing a women', 'opened'); 
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(8,52,'Hacking',  '2023-6-10', '122 sugaSt, chennai' , 'hacked a bank account', 'closed');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(9,24,'stolen gold', '2023-7-10', '111 ai St, vellore' , 'kidnapped a child from school', 'opened');
 INSERT INTO Crimes (CrimeID,cage, IncidentType, IncidentDate, Location, Description, Status)
VALUES(10, 52,'kidnap', '2023-9-10', '102 tpt, Villagetown' , 'kidnapped a child from school', 'opened');
 
 select * from Crimes;
 ----

 INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (1, 1, 25, 'John Doe', 'johndoe@example.com', 'Minor injuries');
 INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (2, 2,30, 'Jane Smith', 'janesmith@example.com', 'Deceased');
 INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (3, 3,45,'Alice Johnson', 'alicejohnson@example.com', 'major injuries');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (4, 4,50,'yamini', 'yaminijon@example.com', 'Minor injuries');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (5, 5,42,'priya', 'priya@example.com', 'major injuries');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (6, 6,65,'niro', 'niroon@example.com', 'None');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (7, 7,62,'Alibabu', 'alibabuexample.com', 'major injuries');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (8, 8,52,'sugapriya', 'sugapriya@example.com', 'None');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (9, 9,74,'Ali', 'alin@example.com', 'major injuries');
  INSERT INTO Victimsall (VictimID, CrimeID, Age, vName, ContactInfo, Injuries)
VALUES
 (10,10,62,'Govindaraj', 'govin@example.com', 'Minor injuries');
  

  select * from Victimsall
----

  INSERT INTO Suspects (SuspectID, CrimeID, sName, Description, CriminalHistory)
VALUES
 (1, 1, 'Robber 1', 'Armed and masked robber', 'Previous robbery convictions'),
 (2, 2, 'Unknown', 'Investigation ongoing', NULL),
 (3, 3, 'Suspect 2', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(4, 4, 'Suspect 4', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(5, 5, 'Suspect 3', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(6, 6, 'Suspect 5', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(7, 7, 'Suspect 6', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(8, 8, 'Suspect 7', 'Shoplifting suspect', 'Prior shoplifting arrests'),
(9, 9, 'Suspect 8', 'Shoplifting suspect', 'Prior shoplifting arrests' ),
(10, 10, 'Suspect 11', 'Shoplifting suspect', 'Prior shoplifting arrests');

select * from Suspects

 --1.Select all open incidents

 select* from Crimes
 where Status = 'open';

 --. 2.Find the total number of incidents.
 select COUNT(*) as totalincidents from Crimes;

 --3.List all unique incident types

 select distinct incidenttype from crimes;

 -- 4.Retrieve incidents that occurred between '2023-09-01' and '2023-09-10';

 select * from Crimes
 where	IncidentDate Between '2023-09-01' and '2023-09-10';

 --5.List persons involved in incidents in descending order of age

select vName, age from Victimsall
order by Age desc

 --6.Find the average age of persons involved in incident

select AVG(Age) AS AvgAge
from  Victimsall;

 -- 7.List incident types and their counts, only for open cases.

select  Incidenttype, COUNT(*) as incidentcount
from Crimes
where Status = 'open'
group by IncidentType
 
 --8. Find persons with names containing 'Doe'.

 select* from Victimsall where vName like '%doe'

 --9.Retrieve the names of persons involved in open cases and closed case

 select V.vname, c.status from Victimsall v
 join Crimes c on v. CrimeID = c.CrimeID
 where c.Status in ('open','closed')
 union
 select S.sName , c.status from Suspects S
 join Crimes c on S.CrimeID= c.CrimeID
 where c.Status in ('open','closed');

 --10. . List incident types where there are persons aged 30 or 35 involved

 select distinct c. IncidentType
 from Crimes c
 join Victimsall v on c.CrimeID = v.CrimeID
 where v.age in(30, 35)
 union
 select distinct c. IncidentType
 from Crimes c
 

 --.11. Find persons involved in incidents of the same type as 'Robbery

 select vname from Victimsall
 where CrimeID in( select CrimeID from Crimes where IncidentType= 'Robbery')

 select sname from Suspects
 where CrimeID in( select CrimeID from Crimes where IncidentType= 'Robbery')

  --12.List incident types with more than one open case.

  select incidentType, COUNT(*) as opencases
  from Crimes
  where Status = 'open'
  group by IncidentType
  having COUNT(*) >1; ---nobody 

 --13. List all incidents with suspects whose names also appear as victum in other incidents


select distinct c.*
FROM Crimes c
JOIN Suspects s ON c.CrimeID = s.CrimeID
JOIN Victimsall v ON s.sName = v.vName AND s.CrimeID <> v.CrimeID;



 --14.Retrieve all incidents along with victim and suspect details

SELECT distinct c.CrimeID, c.IncidentType,  c.IncidentDate,  c.Location, c.Status, s.sName AS SuspectName, v.vName AS VictimName FROM Crimes c
LEFT JOIN Suspects s ON c.CrimeID = s.CrimeID
LEFT JOIN Victimsall v ON c.CrimeID = v.CrimeID;

 --15.Find incidents where the suspect is older than any victim

 SELECT DISTINCT VictimID
FROM VictimsAll
WHERE Age < ANY (SELECT Age FROM Victimsall);


 --16.Find suspects involved in multiple incidents

 select sName, COUNT(*) as incidentcount
 from Suspects
 group by sName
 having COUNT(*) > 1;

--17. List incidents with no suspects involved.

select * from Crimes
where CrimeID not in (select distinct CrimeID from Suspects);

--18.List all cases where at least one incident is of type 'Homicide' and all other incidents are of type
--'Robbery'

select  distinct c.CrimeID 
from Crimes c
where EXISTS (select 1 FROM Crimes c2 WHERE c2.CrimeID = c.CrimeID AND c2.IncidentType = 'Homicide')
AND NOT EXISTS (select 1 FROM Crimes c3 WHERE c3.CrimeID = c.CrimeID AND c3.IncidentType NOT IN ('Homicide', 'Robbery'));


--19.Retrieve a list of all incidents and the associated suspects, showing suspects for each incident, or
--'No Suspect' if there are none

select c. *, coalesce(s.sname, ' No Suspect') as suspectname
from Crimes c
left join Suspects s on c.CrimeID = s.CrimeID;

 --20.List all suspects who have been involved in incidents with incident in 'robbery' or 'assault'

 select distinct s.sname 
 from Suspects s
 join Crimes c on s.CrimeID = c.CrimeID
 where c.IncidentType in ('robbery', 'assault');







 
