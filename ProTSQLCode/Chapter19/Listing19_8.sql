-- Listing 19-8

EXEC  sp_estimate_data_compression_savings 'Person',
    'Person',
    NULL,
    NULL,
    'PAGE';

