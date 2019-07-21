# Rust CI Tests
This shows how to best optimize Rust for CI work

This helps optimize

1. Build times
2. Files left over in cache after builds

The tests will build a simple Rust project that prints a random number from the rand crate. There are four separate commits that are each compiled with `cargo run`. Each one adds a bit more code, and so Rust's incremental build must be used.

Each commit is compiled into a different layer of the Docker image, so that it can be examined with [dive](https://github.com/wagoodman/dive).

After building the Docker image, we can see the times to build each of the commits.

Initial build: ~50 seconds


Once we dive the image, we notice that there are a few folders that are changed for each commit compile. target/debug/{debug|incremental} both have edited files.

![Target differences](/img/target-diff.png)

## References

[Blog for incremental builds](https://blog.rust-lang.org/2016/09/08/incremental.html)
[Description of contents in /target](https://stackoverflow.com/a/47533016)