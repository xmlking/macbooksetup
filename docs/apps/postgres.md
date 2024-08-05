# PostgreSQL

Install local PostgreSQL database for your projects and PoCs.  
We will be using [TimescaleDB](https://www.timescale.com/) as **PostgreSQL** which add extentions `pgvectorscale` and `pgai` to support [AI](https://www.timescale.com/ai)

## Setup

1. At the command prompt, add the TimescaleDB Homebrew tap:

```shell
brew tap timescale/tap
```

2. Install TimescaleDB and psql:

```shell
Install TimescaleDB and psql:
```

3. Update your path to include psql.

```shell
brew link --force libpq
```

4. Run the timescaledb-tune script to configure your database:

```shell
timescaledb-tune --quiet --yes
```

5. Change to the directory where the setup script is located. It is typically, located at

`/opt/homebrew/Cellar/timescaledb/<VERSION>/bin/`, where `<VERSION>`is the version of `timescaledb` that you installed:

```shell
cd /opt/homebrew/Cellar/timescaledb/<VERSION>/bin/
```

6. Run the setup script to complete installation.

```shell
./timescaledb_move.sh
```

7. Login to PostgreSQL as postgres

```shell
sudo -u postgres psql
```

8. Set the password for postgres (optional)

```shell
\password postgres
```

When you have set the password, type `\q` to exit psql.
