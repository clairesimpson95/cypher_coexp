CREATE INDEX ON :Protein(uniprot)
CREATE INDEX ON :NormalProtein(uniprot)
CREATE INDEX ON :MatchProtein(uniprot)
CREATE INDEX ON :PrimaryProtein(uniprot)

LOAD CSV FROM 'file:///normal.csv' AS line
MERGE (a:Protein {uniprot: trim(line[0])})
MERGE (b:Protein {uniprot: trim(line[1])})
MERGE (a)-[:COEXP_NORMAL {weight: trim(line[2])}]->(b)
MERGE (b)-[:COEXP_NORMAL {weight: trim(line[2])}]->(a)
SET a:NormalProtein
SET b:NormalProtein

LOAD CSV FROM 'file:///match.csv' AS line
MERGE (a:Protein {uniprot: trim(line[0])})
MERGE (b:Protein {uniprot: trim(line[1])})
MERGE (a)-[:COEXP_MATCH {weight: trim(line[2])}]->(b)
MERGE (b)-[:COEXP_MATCH {weight: trim(line[2])}]->(a)
SET a:MatchProtein
SET b:MatchProtein

LOAD CSV FROM 'file:///primary.csv' AS line
MERGE (a:Protein {uniprot: trim(line[0])})
MERGE (b:Protein {uniprot: trim(line[1])})
MERGE (a)-[:COEXP_PRIMARY {weight: trim(line[2])}]->(b)
MERGE (b)-[:COEXP_PRIMARY {weight: trim(line[2])}]->(a)
SET a:PrimaryProtein
SET b:PrimaryProtein

LOAD CSV FROM 'file:///uniprot.csv' AS line
MATCH (n:Protein {uniprot: line[1]})
SET n.ensemble = line[2]
SET n.name = line[3]
SET n.description = line[4]
