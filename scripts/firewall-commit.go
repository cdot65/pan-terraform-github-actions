package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"time"

	"github.com/PaloAltoNetworks/pango"
	"github.com/PaloAltoNetworks/pango/commit"
)

type AuthConfig struct {
	Hostname string `json:"hostname"`
	Username string `json:"username"`
	Password string `json:"password"`
}

func main() {
	authFile := flag.String("auth", "", "Path to the authentication JSON file")
	flag.Parse()

	if *authFile == "" {
		fmt.Println("Please provide a path to the authentication JSON file with the -auth flag.")
		os.Exit(1)
	}

	authConfig := AuthConfig{}
	data, err := ioutil.ReadFile(*authFile)
	if err != nil {
		fmt.Println("Error reading authentication JSON file:", err)
		os.Exit(1)
	}

	err = json.Unmarshal(data, &authConfig)
	if err != nil {
		fmt.Println("Error decoding authentication JSON file:", err)
		os.Exit(1)
	}

	// Connect to the firewall.
	fw := &pango.Firewall{Client: pango.Client{
		Hostname: authConfig.Hostname,
		Username: authConfig.Username,
		Password: authConfig.Password,
		Logging:  pango.LogOp | pango.LogAction,
	}}

	if err = fw.Initialize(); err != nil {
		log.Fatalf("Failed: %s", err)
	}

	// Build the commit to be performed.
	cmd := commit.FirewallCommit{
		Description: "Automated commit by Terraform",
	}

	sleep := int64(1)
	sd := time.Duration(sleep) * time.Second

	// Perform the commit
	jobId, _, err := fw.Commit(cmd, "", nil)
	if err != nil {
		log.Fatalf("Error in commit: %s", err)
	} else if jobId == 0 {
		log.Printf("No commit needed")
	} else if err = fw.WaitForJob(jobId, sd, nil, nil); err != nil {
		log.Printf("Error in commit: %s", err)
	} else {
		log.Printf("Committed config successfully")
	}
}
