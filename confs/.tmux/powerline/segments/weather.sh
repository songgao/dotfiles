#!/bin/bash

weather | /bin/grep Temperature: | sed 's/ *Temperature: *//' | sed 's/F.*/F/'
