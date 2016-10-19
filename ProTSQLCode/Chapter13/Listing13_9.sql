-- Listing 13-9

SELECT Resume.query
(
N'//*:Name.First,
//*:Name.Middle,
//*:Name.Last,
//*:Edu.Level'
)
FROM HumanResources.JobCandidate;
