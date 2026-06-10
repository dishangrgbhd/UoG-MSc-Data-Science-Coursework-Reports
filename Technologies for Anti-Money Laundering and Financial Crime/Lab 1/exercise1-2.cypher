MATCH (s: Student)-[:ATTENDS]->(m: Module {name: "COMP1831"}),
      (s)-[:WORKED_WITH]->(t1: Technology {name: "Neo4J"}),
      (s)-[:WORKED_WITH]->(t2: Technology {name: "Python"})
RETURN s.name