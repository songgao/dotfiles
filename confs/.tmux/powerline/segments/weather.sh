#!/bin/bash

weather -iKAUO | /bin/grep Temperature: | sed 's/ *Temperature: *//' | sed 's/F.*/F/'
