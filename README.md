# Engineering Efficiency Assets
The set of the assets to build Grafana dashboards with the metrics to analyse the effectiveness of your engineering practices

# How to use DORA metrics dashboard

- Install Postgres and Grafana locally or just use `docker-compose` from the root directory
- Create an empty database with the name you like
- Run `dora-metrics/create-tables.sql` script on the created database
- Open Grafana and create the datasource for the database you created. If you use the provided `docker-compose`, hostname is `postgres:5432`
- Import `dora-metrics/dashboard.json` into your Grafana and choose the data source you created on the previous step.

## Recommended links:
- Must-read book [Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations](https://www.amazon.com/Accelerate-Software-Performing-Technology-Organizations/dp/1942788339)
- [How to Misuse DORA DevOps Metrics](https://www.youtube.com/watch?v=0vi7XW15UIg) by Bryan Finster
- [dora.dev](https://dora.dev/) run by Google Cloud

# How to use security index dashboard
- Install DefectDojo in [any way convenient to you](https://github.com/DefectDojo/django-DefectDojo?tab=readme-ov-file#supported-installation-options)
- Connet to the DefectDojo database and run `./security-index/create-view.sql` to create the reading view. Script is writen for Postgres database, but it can be easily changed to work on MySQL too.
- Create database user that you will use later to connect Grafana to the DefectDojo database. Give this user read access to the `security_dashboard_data` view created on the previous step.
- Open Grafana and create the datasource for the DefectDojo database using the user created on the previous step.
- Import `security-index/dashboard.json` into your Grafana and choose the data source you created on the previous step.
