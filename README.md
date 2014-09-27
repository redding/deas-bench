# deas-bench

A project to bench Deas versions against themselves and others

## Results

### 01 Hello

A single, basic "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       445.86 |     125.24KB |
|   Deas 0.25.0 |       437.40 |     122.59KB |

### 01 Erb Basic

A single, basic "Hello World" endpoint

|    Version    | Requests/sec | Transfer/sec |
| ------------- | ------------ | ------------ |
| Sinatra 1.4.5 |       342.95 |     113.20KB |
|   Deas 0.25.0 |       345.00 |     114.29KB |

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
