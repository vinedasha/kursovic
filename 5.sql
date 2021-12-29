select count(distinct id_bliznec)
from deti_roditeli
where id_children in  (select id_people
from families
where id_people in (select id_people
from family_obqed)) and id_bliznec is not null;
