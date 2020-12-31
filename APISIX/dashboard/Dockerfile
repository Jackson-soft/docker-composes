#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM alpine:latest as pre-build

ARG APISIX_DASHBOARD_VERSION=master

RUN set -x \
    && wget https://github.com/apache/apisix-dashboard/archive/${APISIX_DASHBOARD_VERSION}.tar.gz -O /tmp/apisix-dashboard.tar.gz \
    && mkdir /usr/local/apisix-dashboard \
    && tar -xvf /tmp/apisix-dashboard.tar.gz -C /usr/local/apisix-dashboard --strip 1

FROM golang:latest as api-builder

WORKDIR /usr/local/apisix-dashboard

COPY --from=pre-build /usr/local/apisix-dashboard .

WORKDIR /usr/local/apisix-dashboard/api
RUN mkdir -p ../output/conf && cp ./conf/*.json ../output/conf

RUN wget https://github.com/api7/dag-to-lua/archive/v1.1.tar.gz -O /tmp/v1.1.tar.gz \
    && mkdir /tmp/dag-to-lua \
    && tar -xvf /tmp/v1.1.tar.gz -C /tmp/dag-to-lua --strip 1 \
    && mkdir -p ../output/dag-to-lua \
    && mv /tmp/dag-to-lua/lib/* ../output/dag-to-lua/ \
    && go env -w GO111MODULE=on \
    && go env -w GOPROXY=https://goproxy.io,direct \
    && CGO_ENABLED=0 go build -o ../output/manager-api ./cmd/manager

FROM node:14-alpine as fe-builder

WORKDIR /usr/local/apisix-dashboard

COPY --from=pre-build /usr/local/apisix-dashboard .

WORKDIR /usr/local/apisix-dashboard/web

RUN apk update && apk add --no-cache python3 python3-dev make g++ \
    && yarn install \
    && yarn build

FROM alpine:latest as prod

WORKDIR /usr/local/apisix-dashboard

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && mkdir -p logs

COPY --from=fe-builder /usr/local/apisix-dashboard/output/ ./
COPY --from=api-builder /usr/local/apisix-dashboard/output/ ./

EXPOSE 9000

CMD [ "/usr/local/apisix-dashboard/manager-api" ]
