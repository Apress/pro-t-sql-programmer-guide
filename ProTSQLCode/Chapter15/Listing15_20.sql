-- Listing 15-20

ALTER TABLE [HumanResources].[Employee]
ADD OrganizationNodeString AS OrganizationNode.ToString() PERSISTED;
