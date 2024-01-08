create table public.build_run
(
    build_run_id                   varchar(255) primary key not null,
    project_key                    varchar(32)              not null,
    repository_group               varchar(64)              not null,
    repository_name                varchar(128)             not null,
    branch_name                    varchar(128)             not null,
    total_duration_in_seconds      integer,
    tests_duration_in_seconds      integer,
    build_number                   integer,
    build_result                   varchar(32)              not null,
    build_is_succeeded             boolean,
    is_integration_build           boolean,
    is_deployment_build            boolean,
    is_lead_time_calculation_build boolean,
    is_feature_branch_build        boolean,
    triggered_at                   timestamp without time zone        not null,
    completed_at                   timestamp without time zone        not null
);

create table public.build_commit
(
    commit_id    varchar(64)       not null,
    commit_date  timestamp without time zone not null,
    author_email varchar(64)       not null,
    build_run_id varchar(255)      not null,
    primary key (commit_id, build_run_id),
    foreign key (build_run_id) references public.build_run (build_run_id)
        match simple on update cascade on delete cascade
);


create table public.build_run_test
(
    synthetic_id       serial primary key,
    test_name          varchar(512) not null,
    test_status        varchar(32)  not null,
    test_duration      double precision       not null,
    exclude_from_stats boolean                not null,
    build_run_id       varchar(255) not null,
    foreign key (build_run_id) references public.build_run (build_run_id)
        match simple on update cascade on delete cascade
);

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/578/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 293, null, 578, 'SUCCESS', true, false, true, true, false, '2023-12-13 05:14:35.000000', '2023-12-13 05:19:29.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/579/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 532, null, 579, 'FAILURE', false, false, true, true, false, '2023-12-13 13:27:01.000000', '2023-12-13 13:35:53.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/533/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 233, null, 533, 'SUCCESS', true, false, true, true, false, '2023-12-04 08:33:57.000000', '2023-12-04 08:37:51.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/528/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 318, null, 528, 'SUCCESS', true, false, true, true, false, '2023-12-04 08:10:26.000000', '2023-12-04 08:15:44.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/527/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 562, null, 527, 'SUCCESS', true, false, true, true, false, '2023-12-01 17:11:59.000000', '2023-12-01 17:21:22.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/544/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 179, null, 544, 'SUCCESS', true, false, true, true, false, '2023-12-05 09:03:30.000000', '2023-12-05 09:06:30.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/555/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 179, null, 555, 'SUCCESS', true, false, true, true, false, '2023-12-06 09:30:24.000000', '2023-12-06 09:33:23.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/571/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 208, null, 571, 'SUCCESS', true, false, true, true, false, '2023-12-08 12:40:52.000000', '2023-12-08 12:44:20.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/550/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 181, null, 550, 'SUCCESS', true, false, true, true, false, '2023-12-05 09:28:58.000000', '2023-12-05 09:31:59.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/551/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 247, null, 551, 'SUCCESS', true, false, true, true, false, '2023-12-06 09:15:26.000000', '2023-12-06 09:19:33.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/562/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 217, null, 562, 'SUCCESS', true, false, true, true, false, '2023-12-06 14:07:19.000000', '2023-12-06 14:10:57.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/563/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 205, null, 563, 'SUCCESS', true, false, true, true, false, '2023-12-08 11:38:50.000000', '2023-12-08 11:42:16.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/575/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 200, null, 575, 'SUCCESS', true, false, true, true, false, '2023-12-11 10:41:17.000000', '2023-12-11 10:44:37.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/577/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 226, null, 577, 'SUCCESS', true, false, true, true, false, '2023-12-12 08:39:33.000000', '2023-12-12 08:43:19.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/549/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 173, null, 549, 'SUCCESS', true, false, true, true, false, '2023-12-05 09:25:58.000000', '2023-12-05 09:28:51.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/557/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 191, null, 557, 'SUCCESS', true, false, true, true, false, '2023-12-06 09:35:49.000000', '2023-12-06 09:39:01.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/564/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 210, null, 564, 'SUCCESS', true, false, true, true, false, '2023-12-08 11:49:27.000000', '2023-12-08 11:52:58.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/588/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 232, null, 588, 'SUCCESS', true, false, true, true, false, '2023-12-18 06:28:09.000000', '2023-12-18 06:32:02.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/602/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 170, null, 602, 'SUCCESS', true, false, true, true, false, '2023-12-18 10:01:26.000000', '2023-12-18 10:04:16.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/612/', 'Demo project', 'Frontend', 'Demo git repo 1', 'master', 190, null, 612, 'SUCCESS', true, false, true, true, false, '2023-12-19 08:18:24.000000', '2023-12-19 08:21:34.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/580/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 258, null, 580, 'SUCCESS', true, false, true, true, false, '2023-12-14 08:25:39.000000', '2023-12-14 08:29:58.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/583/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 400, null, 583, 'SUCCESS', true, false, true, true, false, '2023-12-15 07:43:41.000000', '2023-12-15 07:50:21.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/593/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 571, null, 593, 'FAILURE', false, false, true, true, false, '2023-12-18 06:49:28.000000', '2023-12-18 06:59:00.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/597/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 193, null, 597, 'SUCCESS', true, false, true, true, false, '2023-12-18 09:41:54.000000', '2023-12-18 09:45:07.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/589/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 255, null, 589, 'SUCCESS', true, false, true, true, false, '2023-12-18 06:32:54.000000', '2023-12-18 06:37:10.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/604/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 184, null, 604, 'SUCCESS', true, false, true, true, false, '2023-12-18 10:06:47.000000', '2023-12-18 10:09:52.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/610/', 'Demo project', 'Frontend', 'Demo git repo 3', 'master', 201, null, 610, 'SUCCESS', true, false, true, true, false, '2023-12-19 08:11:04.000000', '2023-12-19 08:14:26.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/620/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 242, null, 620, 'SUCCESS', true, false, true, true, false, '2023-12-20 12:20:03.000000', '2023-12-20 12:24:06.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/623/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 256, null, 623, 'SUCCESS', true, false, true, true, false, '2023-12-21 12:09:28.000000', '2023-12-21 12:13:44.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/624/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 253, null, 624, 'SUCCESS', true, false, true, true, false, '2023-12-22 10:39:28.000000', '2023-12-22 10:43:41.000000');

INSERT INTO public.build_run (build_run_id, project_key, repository_group, repository_name, branch_name, total_duration_in_seconds, tests_duration_in_seconds, build_number, build_result, build_is_succeeded, is_integration_build, is_deployment_build, is_lead_time_calculation_build, is_feature_branch_build, triggered_at, completed_at)
VALUES ('https://company-ci.system.com/deploy-service-to-prod/625/', 'Demo project', 'Backend', 'Demo git repo 2', 'master', 193, null, 625, 'SUCCESS', true, false, true, true, false, '2023-12-22 13:29:00.000000', '2023-12-22 13:32:13.000000');

INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('9097a7f5a076', '2023-12-18 05:53:03.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/593/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('9097a7f5a076', '2023-12-18 05:53:03.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/597/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('a071e586bdbd', '2023-11-28 16:42:04.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('856df4eae4de', '2023-12-15 06:24:13.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/583/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('8aa9929515d8', '2023-12-13 11:50:48.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/579/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('8aa9929515d8', '2023-12-13 11:50:48.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('986525299239', '2023-12-13 08:12:58.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/579/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('986525299239', '2023-12-13 08:12:58.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('e3eb1f4e5917', '2023-12-13 14:52:25.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('d0fb27d8dd59', '2023-11-29 11:14:27.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('bd0707738dd9', '2023-12-12 11:46:55.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/579/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('bd0707738dd9', '2023-12-12 11:46:55.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b8989e217f82', '2023-12-04 06:25:42.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/533/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('917420456b37', '2023-12-15 06:36:08.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/583/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('22ed25b6a45a', '2023-12-04 07:33:33.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/533/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('22ed25b6a45a', '2023-12-04 07:33:33.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/544/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('12420de944fb', '2023-11-29 12:23:29.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('a7bd79e87589', '2023-12-08 09:12:53.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('9e455839881b', '2023-12-15 09:28:48.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/588/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('00469492f2ee', '2023-12-05 11:45:52.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/551/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b27a5c7307ee', '2023-12-05 15:26:20.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/557/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('c1e11bd3ced3', '2023-11-30 07:32:11.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('11a2dcfa2c4d', '2023-11-30 05:44:00.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/527/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('1d34f66c58c6', '2023-12-15 12:48:06.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/593/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('4a03d6d588db', '2023-12-14 15:25:40.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/583/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('0ad007581a68', '2023-11-30 05:41:54.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/533/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('3b4f1a3d389c', '2023-11-30 12:38:44.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('feec48dc73da', '2023-11-29 08:16:38.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('fc60a129aa68', '2023-12-15 13:02:32.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/588/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('c5e465dec8fb', '2023-12-11 13:18:23.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/577/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('56ba0c1015d0', '2023-12-07 14:37:46.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/564/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('8fb784110c8f', '2023-11-30 11:31:29.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('f24d76308855', '2023-12-21 09:51:30.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/623/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('2f17328872c2', '2023-12-07 09:00:15.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('778c5bc638a3', '2023-12-22 10:12:49.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/624/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('778c5bc638a3', '2023-12-22 10:12:49.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/625/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('c877aa20b396', '2023-12-01 07:56:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('3bdeca5dc810', '2023-12-10 08:33:18.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/575/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('0f75919a9d0d', '2023-12-18 08:54:54.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/597/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('8b9f6f2679b3', '2023-12-15 11:01:06.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/588/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('4b8c1d23e45d', '2023-12-01 16:28:19.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/527/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('a6488fb8da29', '2023-12-20 06:40:04.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/620/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('0e63503e7ad2', '2023-12-15 09:58:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/589/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('d9a671a2d2d5', '2023-11-28 14:19:11.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('bc7ace11eb22', '2023-12-07 05:58:15.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('58b2d99ff3fc', '2023-12-05 08:01:48.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('a17ddd04f766', '2023-12-05 05:10:37.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('6244c38dc425', '2023-12-18 13:40:16.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/610/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('36c009275e1d', '2023-12-13 12:37:44.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/579/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('36c009275e1d', '2023-12-13 12:37:44.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('e87aae832666', '2023-12-06 12:25:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/562/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b1b8e60c3b78', '2023-12-11 08:07:37.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/575/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b1849ac615b6', '2023-12-06 07:35:07.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/551/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('a306aefa48e9', '2023-12-18 07:11:15.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/602/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('83160b2a01ae', '2023-12-07 08:19:07.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('ef77dc73529f', '2023-12-11 08:19:13.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/575/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('c4863f69340e', '2023-12-04 13:39:45.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('dd33ca4177c5', '2023-12-01 12:18:38.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/533/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('97cf63859568', '2023-12-05 12:48:39.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/557/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('8da266f7245e', '2023-12-04 12:28:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/549/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('0a14fefd1591', '2023-12-01 11:49:48.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/527/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('371ce4196d3f', '2023-12-06 14:20:25.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('28e0e5530c98', '2023-12-07 14:38:00.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/571/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('bda7a9911763', '2023-12-04 08:41:52.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('daee9f7d341a', '2023-11-29 12:22:54.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('cb2fc2f63efd', '2023-12-13 16:33:08.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('4c39d3fa1b74', '2023-12-15 13:38:31.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/593/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('65ebecda16d5', '2023-12-06 08:20:07.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/551/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('63034f83216b', '2023-11-30 09:28:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('7025108babe9', '2023-12-05 15:16:14.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/555/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('651a4b41d36c', '2023-12-12 14:17:45.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/578/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('dde2f2bbc765', '2023-12-05 07:25:26.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('f3bbb59ccbb2', '2023-12-12 15:24:51.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/579/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('f3bbb59ccbb2', '2023-12-12 15:24:51.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('36cd99abf35b', '2023-12-01 11:54:41.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/527/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('ebc984278ba0', '2023-12-15 12:52:24.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/589/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('321de8ec7c5c', '2023-12-15 09:22:02.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/589/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('2f52e6db0b35', '2023-12-18 13:08:45.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/610/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('4a6ee25d4a3a', '2023-12-18 07:05:36.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/604/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('601f8cb464b0', '2023-12-18 13:33:47.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/612/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('ae1a530a0c22', '2023-12-21 16:02:51.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/624/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('130cda07befe', '2023-12-04 21:59:23.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/550/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b668ac136556', '2023-12-22 10:32:55.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/624/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('b668ac136556', '2023-12-22 10:32:55.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/625/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('401701218fd9', '2023-11-29 14:42:37.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('c37d5d322119', '2023-12-14 13:03:23.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/583/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('1f14c279af2f', '2023-11-30 12:21:42.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('7f1c71fef1fb', '2023-12-04 05:18:15.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('33714a5803a9', '2023-12-02 07:26:15.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/528/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('63785609e587', '2023-12-09 09:00:30.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/575/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('804ba49a0c9b', '2023-12-07 21:37:27.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/563/');
INSERT INTO public.build_commit (commit_id, commit_date, author_email, build_run_id) VALUES ('7bd4367990b3', '2023-12-14 06:51:49.000000', 'test-user@company.com', 'https://company-ci.system.com/deploy-service-to-prod/580/');
