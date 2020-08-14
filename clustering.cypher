CALL algo.louvain('NormalProtein', 'COEXP_NORMAL',
  {write:true, writeProperty:'normal_community'})
YIELD nodes, communityCount, iterations, loadMillis, computeMillis, writeMillis;

CALL algo.louvain('PrimaryProtein', 'COEXP_PRIMARY',
  {write:true, writeProperty:'primary_community'})
YIELD nodes, communityCount, iterations, loadMillis, computeMillis, writeMillis;

CALL algo.louvain('MatchProtein', 'MATCH_NORMAL',
  {write:true, writeProperty:'match_community'})
YIELD nodes, communityCount, iterations, loadMillis, computeMillis, writeMillis;
