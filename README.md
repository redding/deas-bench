# deas-bench

A project to bench Deas versions against themselves and others

## Results

### 01 Hello

A single, basic "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       445.86 |     125.24KB |
|   Deas 0.25.0 |       437.40 |     122.59KB |
|   Deas 0.27.0 |       435.37 |     122.44KB |
|   Deas 0.28.0 |       432.44 |     121.75KB |

### 02 Erb Basic

A single endpoint that renders a basic template with no partials or layouts.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       342.95 |     113.20KB |
|   Deas 0.25.0 |       345.00 |     114.29KB |
|   Deas 0.27.0 |       348.32 |     115.25KB |
|   Deas 0.28.0 |       342.24 |     113.10KB |

### 03 Erb with Partial

A single endpoint that renders a template that renders a partial with no layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       295.73 |     111.76KB |
|   Deas 0.25.0 |       313.54 |     118.77KB |
|   Deas 0.27.0 |       312.85 |     118.37KB |
|   Deas 0.28.0 |       301.86 |     114.22KB |

### 04 Erb with Layout

A single endpoint that renders a template that renders in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       291.35 |     107.39KB |
|   Deas 0.25.0 |       327.96 |     120.56KB |
|   Deas 0.27.0 |       326.43 |     120.00KB |
|   Deas 0.28.0 |       304.50 |     112.08KB |

### 05 Erb with Layout and Partial

A single endpoint that renders a template that renders a partial in a layout.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       266.89 |     109.50KB |
|   Deas 0.25.0 |       294.42 |     120.46KB |
|   Deas 0.27.0 |       285.44 |     116.79KB |
|   Deas 0.28.0 |       278.57 |     114.26KB |

### 06 Hello many routes

A single, basic "Hello World" endpoint alongside many other endpoints.

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       320.01 |      89.96KB |
|   Deas 0.25.0 |       320.64 |      90.00KB |
|   Deas 0.27.0 |       321.00 |      90.38KB |
|   Deas 0.28.0 |       315.47 |      88.55KB |

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
