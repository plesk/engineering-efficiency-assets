DROP VIEW IF EXISTS security_dashboard_data;

CREATE VIEW security_dashboard_data
AS
SELECT
    dojo_finding.title,
    dojo_finding.created,
    auth_user.username as mitigated_by,
    COALESCE(dojo_finding.mitigated, dojo_finding.last_reviewed, dojo_finding.last_status_update) as last_handle_date,
    CASE
        WHEN dojo_finding.risk_accepted THEN 'Risk accepted'
        WHEN dojo_finding.false_p THEN 'False positive'
        WHEN dojo_finding.is_mitigated THEN 'Mitigated'
        WHEN dojo_finding.out_of_scope THEN 'Out of scope'
    END AS resolution_status,
    dojo_finding.active,
    dojo_finding.severity,
    CASE
        WHEN severity = 'Critical' THEN 1000
        WHEN severity = 'High' THEN 100
        WHEN severity = 'Medium' THEN 10
        WHEN severity = 'Low' THEN 1
        WHEN severity = 'Info' THEN 1
    END AS severity_weight,
    dojo_finding.cve,
    dojo_finding.description,
    dojo_finding.component_name,
    dojo_finding.service,
    dojo_product.id   AS product_id,
    dojo_product.name AS product_name,
    dojo_product.prod_type_id AS product_type_id,
    dojo_product_type.name AS product_type_name,
    dojo_finding.file_path,
    dojo_finding.id,
    dojo_test.test_type_id,
    dojo_test_type.name as test_type_name,
    dojo_engagement.source_code_management_uri,
    dojo_finding.line AS line_number,
    CASE
        WHEN severity = 'Critical' THEN dojo_sla_configuration.critical
        WHEN severity = 'High' THEN dojo_sla_configuration.high
        WHEN severity = 'Medium' THEN dojo_sla_configuration.medium
        WHEN severity = 'Low' THEN dojo_sla_configuration.low
    END AS days_to_fix_by_sla
FROM dojo_finding
         INNER JOIN dojo_test ON test_id=dojo_test.id
         INNER JOIN dojo_test_type ON dojo_test.test_type_id=dojo_test_type.id
         INNER JOIN dojo_engagement ON dojo_test.engagement_id=dojo_engagement.id
         INNER JOIN dojo_product ON dojo_engagement.product_id=dojo_product.id
         LEFT JOIN auth_user ON auth_user.id=dojo_finding.mitigated_by_id
         LEFT JOIN dojo_sla_configuration ON dojo_sla_configuration.id=dojo_product.sla_configuration_id
         INNER JOIN dojo_product_type ON dojo_product.prod_type_id=dojo_product_type.id
WHERE duplicate=FALSE
-- Filter your data here if needed
;

GRANT SELECT ON security_dashboard_data TO metrics_readonly_account