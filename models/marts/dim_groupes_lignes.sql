SELECT
    id_group_ligne,
    nom_group_ligne
FROM  {{ref ('stg_referentiel_lignes_clean')}}
GROUP BY id_group_ligne, nom_group_ligne