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
    ```