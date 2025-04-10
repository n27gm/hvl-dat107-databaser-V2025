select * from studenter;

-- a) og b) Hent studentnummer og navn til alle studenter
-- Først via:
SELECT student_no,
       XPath('/student/fornavn/text()', xml_info) fornavn,
       XPath('/student/etternavn/text()', xml_info) etternavn
FROM studenter;
--WHERE xpath_exists('/student[starts-with(fornavn,"N")]', xml_info);
-- Så løsning:
SELECT student_no,
       unnest(XPath('/student/fornavn/text()', xml_info)) || ' ' ||
       unnest(XPath('/student/etternavn/text()', xml_info)) navn
FROM studenter
WHERE xpath_exists('/student[starts-with(fornavn,"N")]', xml_info);

-- c) List ut alle fag som de ulike studentene har tatt (array). Student representert med student_no
select student_no, (XPath('/student/emner/emne/kode/text()', xml_info)) fag from studenter

-- d) List ut alle fag på separate linjer (gjentatt studentnr)
select s.student_no, x.kode, x.poeng
from studenter s
        cross join xmltable('/student/emner/emne' passing s.xml_info
                                columns kode text path 'kode',
                                        poeng integer path 'poeng') as x;

select s.student_no, n.fornavn, n.etternavn, x.kode, x.poeng
from studenter s cross join xmltable('/student' passing s.xml_info
                                columns fornavn text path 'fornavn',
                                     etternavn text path 'etternavn') as n
                 cross join xmltable('/student/emner/emne' passing s.xml_info
                                columns kode text path 'kode',
                                     poeng integer path 'poeng') as x;