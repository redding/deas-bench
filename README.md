# deas-bench

A project to bench Deas versions against themselves and others

## Results

### 01_hello

Single "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       454.33 |     127.61KB |
|   deas-0.25.0 |       422.50 |     118.55KB |
|   deas-0.27.0 |       430.40 |     120.90KB |
|   deas-0.28.0 |       432.93 |     121.75KB |

### 02_erb_basic

Single endpoint rendering with no partials or layouts.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       336.07 |     110.93KB |
|   deas-0.25.0 |       343.47 |     113.79KB |
|   deas-0.27.0 |       350.36 |     115.92KB |
|   deas-0.28.0 |       334.31 |     110.62KB |

### 03_erb_partial

Single endpoint rendering a partial with no layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       306.22 |     115.87KB |
|   deas-0.25.0 |       309.91 |     117.26KB |
|   deas-0.27.0 |       304.84 |     115.21KB |
|   deas-0.28.0 |       300.33 |     113.64KB |

### 04_erb_layout

Single endpoint rendering in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       290.96 |     106.84KB |
|   deas-0.25.0 |       307.90 |     113.47KB |
|   deas-0.27.0 |       308.91 |     113.57KB |
|   deas-0.28.0 |       306.91 |     113.25KB |

### 05_erb_layout_partial

Single endpoint rendering a partial in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       276.88 |     113.02KB |
|   deas-0.25.0 |       283.93 |     116.32KB |
|   deas-0.27.0 |       287.72 |     117.59KB |
|   deas-0.28.0 |       274.88 |     112.48KB |

### 06_hello_many_routes

"Hello World" endpoint with many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| sinatra-1.4.5 |       329.87 |      92.73KB |
|   deas-0.25.0 |       320.90 |      90.35KB |
|   deas-0.27.0 |       317.92 |      89.10KB |
|   deas-0.28.0 |       314.42 |      88.26KB |

## Usage

```
$ bundle exec ./bench FOLDER
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
