#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

headline(){
  echo -e "\e[1;34m#################################################################"
  echo -e "##### $1 \e[1;37m"
  echo -e "\e[1;34m#################################################################\e[0m"
}

set -e

for lang in /avro/lang/*/
do
  if [ -f "${lang}/build.sh" ]; then
    headline "Run tests: $lang"
    cd "$lang"
    ./build.sh lint test
  fi
done
