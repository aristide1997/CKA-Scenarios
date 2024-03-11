#!/bin/bash

if kubectl get role example-role && kubectl get rolebinding example-rolebinding; then exit 0; else exit 1; fi
