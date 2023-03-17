# DY*: A Modular Symbolic Verification Framework for Executable Cryptographic Protocol Code

If you're specifically looking for the code referenced in our EuroS&P
2021 submission, clone this repository and check out the tag
`eurosp21` (`git checkout eurosp21`).

## Overview

We implemented and verified the Signal protocol on top of the DY\*
framework. Besides Signal as the largest case study, we also built
several small case studies upon the DY\* framework and verified the
following protocols: ISO KEM, ISO DH, and Needham-Schroeder(-Lowe).

## Running the case studies

The easiest way to try out the DY\* case studies quickly is to run
them from a docker image:

### Preparation

1. Download and install docker for your platform from the [docker
   website](https://www.docker.com/)

2. Make sure that the docker service is started

3. Run `./start_dev_env.sh`

   Note: If you get an error along the lines of _"The container name
   "fstar-emacs" is already in use by container [...]"_, run `docker rm
   fstar-emacs` and then try again.

4. Now you should see a shell prompt inside the docker
   container, in the `dolev-yao-star` directory.
   See the next subsections for further instructions (note that all
   verification/compilation commands in the following subsections
   assume that you start out in a shell inside the docker container in
   the `dolev-yao-star` directory).


### Verify the DY* framework and protocol implementations

These instructions assume that you followed the steps in the
preparation subsection and have an open shell inside the docker
container.

 - To verify the core model, just run `make`. This will invoke F\* for
   all modules in the core model, F\* verifies (i.e., typechecks)
   these files.
 - To verify one of the protocol implementations, `cd` into the
   respective directory (e.g., `cd signal`).  Inside the protocol
   directory, run `make`, which will verify (typecheck) all modules of
   the protocol implementation.


### Compiling and executing test cases

These instructions assume that you followed the steps in the
preparation subsection and have an open shell inside the docker
container.

1. Verify (typecheck) the core model and protocol as described above.

2. `cd` into the protocol directory and run `make -B test`. This extracts
   the F\* code to OCaml and then compiles the OCaml code into an executable
   file (namely `test.exe`).

3. `cd` into the subfolder `ocaml-symbolic` in the protocol directory

4. Run `./test.exe` to execute the test cases. This will print some
   intermediate information and at least one execution trace.


## Signal (and other case studies)

* The folder `signal` contains an F* implementation of the Signal
  protocol as well as the specifications for security properties of
  Signal and the required proof code.
* The security properties of Signal are defined in
  `Signal.SecurityProperties.fsti`.
* The actual execution starts in `Signal.Test.fst`

The other case studies follow a similar structure, except for the
protocol executions which are invoked in the respective `Debug`
modules.
