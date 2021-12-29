select distinct  f."id_people",r."firma", r."adrec",r."dolgnost", f."nme", f."surname", f."otch" 
from "rabota" as r join "families" as f on r."id_people" = f."id_people"
where r."id_people"  in 
(select "id_people" from "families" where "id_people" in 
(select "id_children" from "deti_roditeli" union select "id_bliznec" from "deti_roditeli"))
and "firma" is not null 
