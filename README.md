# deas-bench

A project to bench Deas versions against themselves and others

## Results

#### Deas 0.25.0: Hello

```
Requests/sec:    437.40
Transfer/sec:    122.59KB
```

#### Sinatra 1.4.5: Hello

```
Requests/sec:    445.86
Transfer/sec:    125.24KB
```

## Usage

```
$ bundle exec ./bench FOLDER
```

For example:

```
$ bundle exec ./bench deas_latest_hello/

starting the local `deas_latest_hello/` server...
** cd [...]/deas/bench/deas_latest_hello && BUNDLE_GEMFILE=[...]/deas-bench/deas_latest_hello/Gemfile bundle exec --verbose rackup --host 0.0.0.0 --port 9292 config.ru
[2014-09-25 21:14:31] INFO  WEBrick 1.3.1
[2014-09-25 21:14:31] INFO  ruby 1.8.7 (2012-02-08) [i686-darwin13.0.0]
[2014-09-25 21:14:31] INFO  WEBrick::HTTPServer#start: pid=5896 port=9292

benching against the local server...
** rm -f [...]/deas-bench/deas_latest_hello/bench_results.txt
** curl -I http://0.0.0.0:9292
** wrk -d2s -c10 -t2 http://0.0.0.0:9292 > [...]/deas-bench/deas_latest_hello/bench_results.txt

results:
** cat [...]/deas-bench/deas_latest_hello/bench_results.txt
Running 2s test @ http://0.0.0.0:9292
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    33.32ms   26.85ms  79.25ms   70.67%
    Req/Sec   206.64    117.07   351.00     61.33%
  830 requests in 2.00s, 233.45KB read
  Socket errors: connect 0, read 5, write 0, timeout 0
Requests/sec:    414.80
Transfer/sec:    116.67KB

stopping the local server...
```
