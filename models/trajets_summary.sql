SELECT
  sc.segment_client,
  tv.type_vehicule,
  COUNT(t.id_trajet) AS nombre_trajets,
  SUM(t.montant_total) AS total_revenus
FROM `VTC_Paris.trajets_faits` t
JOIN `VTC_Paris.clients` c ON t.id_client = c.id_client
JOIN `VTC_Paris.segments_clients` sc ON c.id_segment = sc.id_segment
JOIN `VTC_Paris.vehicules` v ON t.id_vehicule = v.id_vehicule
JOIN `VTC_Paris.types_vehicule` tv ON v.id_type_vehicule = tv.id_type_vehicule
GROUP BY sc.segment_client, tv.type_vehicule
ORDER BY total_revenus DESC