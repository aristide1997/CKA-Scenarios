#!/bin/bash

if kubectl get pv example-pv; then exit 0; else exit 1; fi
