#!/bin/bash

wall=$(swww query | awk '{print $8}' | tail -n1)

echo "$wall" 
