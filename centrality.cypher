CALL algo.pageRank('Protein','COEXP_PRIMARY' ,{write:true,writeProperty:'pagerank_primary'})

CALL algo.pageRank('Protein','COEXP_MATCH' ,{write:true,writeProperty:'pagerank_match'})

CALL algo.pageRank('Protein','COEXP_NORMAL' ,{write:true,writeProperty:'pagerank_normal'})


MATCH (n:Protein)
SET n.delta = n.pagerank_normal-n.pagerank_match
return n


MATCH(n)
SET n.primary_degree = size((n)-[:COEXP_PRIMARY]->())

MATCH(n)
SET n.match_degree = size((n)-[:COEXP_MATCH]->())

MATCH(n)
SET n.normal_degree = size((n)-[:COEXP_NORMAL]->())
