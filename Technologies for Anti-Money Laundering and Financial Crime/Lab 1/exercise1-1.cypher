CREATE (uni: University {name: "University of Greenwich"} )
CREATE (module1: Module {name:"COMP1830"}), (module2: Module {name: "COMP1831" })
CREATE (student1: Student {name:"Rasvan"}), (student2: Student {name:"Rajesh"}), (student3: Student {name:"George"}), (student4: Student {name:"Peter"}), (student5: Student {name:"Olivia"}), (student6: Student {name:"Katie"}), (student7: Student {name:"Julia"})
CREATE (tech1: Technology {name: "Neo4J"}), (tech2: Technology {name:"Python"}), (tech3: Technology {name:"ML"})

MATCH (s: Student), (u:University)
CREATE (s)-[:STUDIES_IN]->(u)

MATCH (s: Student), (module: Module {name:"COMP1830"})
WHERE s.name in ["Rasvan","Rajesh","George"]
CREATE (s)-[:ATTENDS]->(module)

MATCH (s: Student), (module: Module {name:"COMP1831"})
WHERE s.name in ["Katie","Peter","Olivia","George","Julia"]
CREATE (s)-[:ATTENDS]->(module)

MATCH (s: Student {name: "George"}), (tech: Technology)
WHERE tech.name in ["Python", "Neo4J"]
CREATE (s)-[:WORKED_WITH]->(tech)

MATCH (s: Student {name: "Peter"}), (tech: Technology)
WHERE tech.name in ["ML"]
CREATE (s)-[:WORKED_WITH]->(tech)

MATCH (s: Student {name: "Rajesh"}), (tech: Technology)
WHERE tech.name in ["Python"]
CREATE (s)-[:WORKED_WITH]->(tech)
