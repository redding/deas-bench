# deas-bench

A project to bench Deas versions against themselves and others

## Results

### 01_hello

Single "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       417.44 |     117.00KB |
|   deas-0.28.0 |       418.24 |     117.63KB |
|   deas-0.27.0 |       404.93 |     114.04KB |
|   deas-0.25.0 |       417.49 |     117.15KB |
| sinatra-1.4.5 |       440.80 |     123.82KB |

### 02_erb_basic

Single endpoint rendering with no partials or layouts.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       356.52 |     117.82KB |
|   deas-0.28.0 |       323.01 |     106.75KB |
|   deas-0.27.0 |       348.29 |     114.96KB |
|   deas-0.25.0 |       348.03 |     115.02KB |
| sinatra-1.4.5 |       366.94 |     121.12KB |

### 03_erb_partial

Single endpoint rendering a partial with no layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       347.44 |     131.79KB |
|   deas-0.28.0 |       292.33 |     110.90KB |
|   deas-0.27.0 |       310.93 |     117.95KB |
|   deas-0.25.0 |       307.21 |     116.68KB |
| sinatra-1.4.5 |       322.33 |     122.27KB |

### 04_erb_layout

Single endpoint rendering in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       318.90 |     117.37KB |
|   deas-0.28.0 |       291.88 |     107.59KB |
|   deas-0.27.0 |       316.45 |     116.61KB |
|   deas-0.25.0 |       317.88 |     117.13KB |
| sinatra-1.4.5 |       312.37 |     115.11KB |

### 05_erb_layout_partial

Single endpoint rendering a partial in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       299.86 |     123.11KB |
|   deas-0.28.0 |       281.80 |     115.59KB |
|   deas-0.27.0 |       283.48 |     116.27KB |
|   deas-0.25.0 |       274.93 |     112.50KB |
| sinatra-1.4.5 |       309.77 |     126.75KB |

### 06_hello_many_routes

"Hello World" endpoint with many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.29.0 |       300.76 |      84.43KB |
|   deas-0.28.0 |       300.38 |      84.33KB |
|   deas-0.27.0 |       300.80 |      84.30KB |
|   deas-0.25.0 |       304.89 |      85.45KB |
| sinatra-1.4.5 |       320.88 |      90.35KB |

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
