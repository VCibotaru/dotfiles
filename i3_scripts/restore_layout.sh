#!/bin/bash

i3-msg "workspace $1; append_layout ~/.i3/workspaces/$2.json"
