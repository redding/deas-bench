# deas-bench

A project to bench Deas versions against themselves and others

## Results

### 01_hello

Single "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       428.91 |     120.49KB |
|   deas-0.27.0 |       419.98 |     117.85KB |
|   deas-0.25.0 |       424.93 |     119.51KB |
| sinatra-1.4.5 |       452.88 |     127.07KB |

### 02_erb_basic

Single endpoint rendering with no partials or layouts.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       346.80 |     114.61KB |
|   deas-0.27.0 |       356.80 |     117.77KB |
|   deas-0.25.0 |       363.82 |     120.36KB |
| sinatra-1.4.5 |       379.54 |     125.28KB |

### 03_erb_partial

Single endpoint rendering a partial with no layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       311.86 |     118.44KB |
|   deas-0.27.0 |       310.76 |     118.16KB |
|   deas-0.25.0 |       320.87 |     121.58KB |
| sinatra-1.4.5 |       326.50 |     123.99KB |

### 04_erb_layout

Single endpoint rendering in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       313.51 |     115.67KB |
|   deas-0.27.0 |       316.25 |     116.40KB |
|   deas-0.25.0 |       317.35 |     116.66KB |
| sinatra-1.4.5 |       326.92 |     120.32KB |

### 05_erb_layout_partial

Single endpoint rendering a partial in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       283.48 |     116.41KB |
|   deas-0.27.0 |       281.76 |     115.43KB |
|   deas-0.25.0 |       285.43 |     117.07KB |
| sinatra-1.4.5 |       319.66 |     130.80KB |

### 06_hello_many_routes

"Hello World" endpoint with many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       308.93 |      86.72KB |
|   deas-0.27.0 |       308.99 |      86.88KB |
|   deas-0.25.0 |       317.39 |      88.95KB |
| sinatra-1.4.5 |       319.35 |      89.78KB |

## Usage

### Bench a single version

```
$ bundle exec ./bench VERSION_FOLDER
```

For example:

```
$ bundle exec ./bench 01_hello/sintra-1.4.5/

starting the local `01_hello/sintra-1.4.5/` server...
** cd [...]/deas-bench/01_hello/sintra-1.4.5 && BUNDLE_GEMFILE=[...]/deas-bench/01_hello/sintra-1.4.5/Gemfile bundle exec --verbose rackup --host 0.0.0.0 --port 9292 config.ru
[2014-09-27 12:56:49] INFO  WEBrick 1.3.1
[2014-09-27 12:56:49] INFO  ruby 1.8.7 (2012-02-08) [i686-darwin13.0.0]
[2014-09-27 12:56:49] INFO  WEBrick::HTTPServer#start: pid=44072 port=9292

benching against the local server...
** rm -f [...]/deas-bench/01_hello/sintra-1.4.5/bench_results.txt
** curl -I http://0.0.0.0:9292
** wrk -d2s -c10 -t2 http://0.0.0.0:9292 > [...]/deas-bench/01_hello/sintra-1.4.5/bench_results.txt

results:
** cat [...]/deas-bench/01_hello/sintra-1.4.5/bench_results.txt
Running 2s test @ http://0.0.0.0:9292
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    24.60ms   20.20ms  69.89ms   82.35%
    Req/Sec   220.76     78.45   350.00     64.71%
  895 requests in 2.00s, 251.39KB read
  Socket errors: connect 0, read 4, write 0, timeout 0
Requests/sec:    447.43
Transfer/sec:    125.68KB

stopping the local server...
```

### Bench many (all) versions at once

```
$ bundle exec ./bench_all [TOP_FOLDER]
```

For example:

```
$ bx ./bench_all 06_hello_many_routes/
06_hello_many_routes
bundle exec ./bench 06_hello_many_routes/deas-0.28.0
bundle exec ./bench 06_hello_many_routes/deas-0.27.0
bundle exec ./bench 06_hello_many_routes/deas-0.25.0
bundle exec ./bench 06_hello_many_routes/sinatra-1.4.5

### 06_hello_many_routes

"Hello World" endpoint with many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.28.0 |       308.93 |      86.72KB |
|   deas-0.27.0 |       308.99 |      86.88KB |
|   deas-0.25.0 |       317.39 |      88.95KB |
| sinatra-1.4.5 |       319.35 |      89.78KB |
```
