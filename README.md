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
them from a docker image.

### Preparation

1. Download and install docker for your platform from the [docker
   website](https://www.docker.com/)

2. Make sure that the docker service is started

3. Pull the docker image for the case studies: in a terminal, run
   `docker pull foa3ucuvi85/custom-fstar-ocaml-emacs-docker:2.4-db812866`

4. Start the image: `docker run -it -v </path/to/this/repository>:/home/build/dystar --name=fstar foa3ucuvi85/custom-fstar-ocaml-emacs-docker:2.4-db812866 /bin/bash`
   (of course, you have to replace `</path/to/this/repository>` with the
   path of this repository, e.g., `/home/johndoe/dolev-yao-star`).

   Note: If you chose a different path inside the container (i.e., not
   `/home/build/dystar`), make sure to set the environment variable
   `DY_HOME` to that path (without a trailing `/`).

5. Now you should see a shell prompt inside the docker
   container. Switch to the core model directory with `cd dystar/`.
   See the next subsections for further instructions (note that all
   verification/compilation commands in the following subsections
   assume that you start out in a shell inside the docker container in
   the `dystar` directory).


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

2. `cd` into the protocol directory and run `make
   ocaml/test.exe`. This compiles the F\* code to OCaml and then
   compiles the OCaml code into an executable file (namely `test.exe`).

3. `cd` into the subfolder `ocaml` in the protocol directory

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
