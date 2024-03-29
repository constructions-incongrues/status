SHELL=/bin/bash

domains:
	plesk db "SELECT CONCAT('[', GROUP_CONCAT(JSON_OBJECT('name', d.name, 'url', CONCAT('https://', d.name)) SEPARATOR ','), ']') FROM domains d, DomainServices ds, IpAddressesCollections ipc, IP_Addresses ip WHERE d.id = ds.dom_id AND ds.type = 'web' AND ds.ipCollectionId = ipc.ipCollectionId AND ip.id	 = ipc.ipAddressId and d.status = 0 ORDER BY d.id ASC\G" | yq -P