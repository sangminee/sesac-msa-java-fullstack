SELECT
    e.last_name       AS �����,
    d.department_name AS �μ���,
    lo.city           AS ����,
    c.country_name    AS ����,
    r.region_name     AS ���,
    m.last_name       AS �����
FROM
    ace.employees   e
    LEFT JOIN ace.departments d ON e.department_id = d.department_id
    LEFT JOIN ace.locations   lo ON d.location_id = lo.location_id
    LEFT JOIN ace.countries   c ON lo.country_id = c.country_id
    LEFT JOIN ace.regions     r ON c.region_id = r.region_id
    LEFT JOIN ace.employees   m ON e.manager_id = m.employee_id