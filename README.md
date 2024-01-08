# Engineering Efficiency Assets
The set of the assets to build Grafana dashboards with the metrics to analyse the effectiveness of your engineering practices

# How to use DORA metrics dashboard

- Install Postgres and Grafana locally or just use `docker-compose` from the root directory
- Create an empty database with the name you like
- Run `dora-metrics/create-tables.sql` script on the created database
- Open Grafana and create the datasource for the database you created. If you use the provided `docker-compose`, hostname is `postgres:5432`
- Import `dora-metrics/dashboard.json` into your Grafana and choose the data source you created on the previous step.
