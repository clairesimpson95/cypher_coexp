MATCH (p1:LuadHotspotProtein), (p2:EpigeneticRegulator),
      path = shortestpath((p1)-[:COEXP_NORMAL*]-(p2))
RETURN p1.name, p2.name, length(path)

MATCH (p1:LuadHotspotProtein), (p2:EpigeneticRegulator),
      path = shortestpath((p1)-[:COEXP_MATCH*]-(p2))
RETURN p1.name, p2.name, length(path)

MATCH (p1:LuadHotspotProtein), (p2:EpigeneticRegulator),
      path = shortestpath((p1)-[:COEXP_PRIMARY*]-(p2))
RETURN p1.name, p2.name, length(path)
