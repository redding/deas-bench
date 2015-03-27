# deas-bench

A project to bench Deas versions against themselves and others

## Notes

* sinatra runs with template caching on
* all erb cases use erubis - both for sinatra and deas
* deas-0.28.0 and prior uses sinatra for routing, handling, and rendering
* deas-0.29.0 switches to deas-erubis for template rendering
* deas-0.31.0 uses an optimized deas-erubis

## Results

### 01_hello

Single "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       430.86 |     120.76KB |
|   deas-0.29.0 |       423.75 |     119.04KB |
|   deas-0.28.0 |       408.36 |     114.73KB |
|   deas-0.27.0 |       437.01 |     122.48KB |
|   deas-0.25.0 |       430.22 |     120.85KB |
| sinatra-1.4.5 |       453.31 |     127.46KB |

### 02_erb_basic

Single endpoint rendering with no partials or layouts.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       401.50 |     132.66KB |
|   deas-0.29.0 |       378.01 |     125.05KB |
|   deas-0.28.0 |       345.73 |     114.39KB |
|   deas-0.27.0 |       367.40 |     121.55KB |
|   deas-0.25.0 |       361.68 |     119.52KB |
| sinatra-1.4.5 |       378.87 |     125.33KB |

### 03_erb_partial

Single endpoint rendering a partial with no layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       401.78 |     152.93KB |
|   deas-0.29.0 |       359.35 |     136.44KB |
|   deas-0.28.0 |       310.37 |     117.74KB |
|   deas-0.27.0 |       315.94 |     119.85KB |
|   deas-0.25.0 |       324.00 |     122.90KB |
| sinatra-1.4.5 |       328.43 |     124.58KB |

### 04_erb_layout

Single endpoint rendering in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       377.67 |     139.23KB |
|   deas-0.29.0 |       328.40 |     120.86KB |
|   deas-0.28.0 |       314.84 |     116.02KB |
|   deas-0.27.0 |       319.87 |     117.73KB |
|   deas-0.25.0 |       325.91 |     119.81KB |
| sinatra-1.4.5 |       333.98 |     122.77KB |

### 05_erb_layout_partial

Single endpoint rendering a partial in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       383.91 |     157.36KB |
|   deas-0.29.0 |       320.99 |     131.62KB |
|   deas-0.28.0 |       288.86 |     118.34KB |
|   deas-0.27.0 |       296.02 |     121.40KB |
|   deas-0.25.0 |       299.37 |     122.91KB |
| sinatra-1.4.5 |       321.89 |     131.71KB |

### 06_hello_many_routes

"Hello World" endpoint with many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
|   deas-0.31.0 |       318.83 |      89.50KB |
|   deas-0.29.0 |       320.44 |      89.95KB |
|   deas-0.28.0 |       316.95 |      89.38KB |
|   deas-0.27.0 |       321.30 |      90.19KB |
|   deas-0.25.0 |       321.90 |      90.36KB |
| sinatra-1.4.5 |       320.44 |      90.22KB |

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
