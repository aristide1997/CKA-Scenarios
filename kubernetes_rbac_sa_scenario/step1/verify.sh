#!/bin/bash

if kubectl get serviceaccount example-sa; then exit 0; else exit 1; fi
