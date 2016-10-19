-- Listing 13-25

DECLARE @x xml = '';
SELECT @x.query('(1, <myNode>Testing</myNode>)');
