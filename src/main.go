package main

import (
	"io/ioutil"
	"log"
	"os"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	//var status_msg

	r.GET("/", func(c *gin.Context) {
		status_msg := "OK"
		c.JSON(200, gin.H{
			"status_code": 200,
			"status_msg": status_msg,
		})
	})

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, "pong")
	})

	r.Run() // listen and serve on 0.0.0.0:8080 (or "PORT" env var)
}
