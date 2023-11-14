## Changelog

- 2023-11-14
    - init
    ```bash
        touch Dockerfile
        # edit
        #
        # make a Makefile in order to run into container with `make dev`
        touch Makefile
        #
        # mod inits
    ```
    - mod inits
    ```bash
        make dev
        # in container:
        go mod init api-go-demo
        # add deps
        go get github.com/gin-gonic/gin
        exit
    ```
    - update `Dockerfile`` & make dev with use of `go.mod`, `go.sum`
    ```bash
        # edit Dockerfile
        make dev
        # in container
        go mod download
        exit
        # put it in Dockerfile & restart dev
        make dev
    ```
    - added static build, non-root user