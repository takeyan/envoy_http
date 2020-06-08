FROM envoyproxy/envoy:v1.9.1
# FROM envoyproxy/envoy:v1.14.1
# FROM envoyproxy/envoy-dev:latest
RUN apt-get update
COPY envoy.yaml /etc/envoy.yaml
EXPOSE 5010
CMD /usr/local/bin/envoy -c /etc/envoy.yaml
# CMD /usr/local/bin/envoy -c /etc/envoy.yaml --log-level debug
