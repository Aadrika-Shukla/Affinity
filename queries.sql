/* 
   a. How many types of tigers can be found in the taxonomy 
   table of the dataset? What is the "ncbi_id" of the Sumatran Tiger?
*/
SELECT COUNT(*) AS tiger_count
FROM taxonomy
WHERE species = 'Panthera tigris';

-- Find the ncbi_id of the Sumatran Tiger
SELECT ncbi_id
FROM taxonomy
WHERE species = 'Panthera tigris sumatrae';

-- b. Find columns that can be used to connect tables (foreign keys)
SELECT 
    table_name,
    column_name,
    referenced_table_name,
    referenced_column_name
FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL;

-- c. Find the type of rice with the longest DNA sequence
SELECT 
    t.species AS rice_type,
    MAX(rs.length) AS longest_dna_sequence
FROM rfamseq rs
JOIN taxonomy t ON rs.ncbi_id = t.ncbi_id
WHERE t.genus = 'Oryza'
GROUP BY t.species
ORDER BY longest_dna_sequence DESC
LIMIT 1;

-- d. Paginate list of family names with longest DNA sequences
SELECT 
    t.family AS family_name,
    MAX(rs.length) AS max_sequence_length
FROM rfamseq rs
JOIN taxonomy t ON rs.ncbi_id = t.ncbi_id
GROUP BY t.family
HAVING max_sequence_length > 1000000
ORDER BY max_sequence_length DESC
LIMIT 15 OFFSET 120; -- Page 9 with 15 results per page (assuming zero-based indexing)


