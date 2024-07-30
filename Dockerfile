# Use a base Alpine image
FROM alpine:3.20.0

# Install necessary dependencies
RUN apk --no-cache add ca-certificates curl

# Download and install Trivy
RUN curl -sSL https://github.com/aquasecurity/trivy/releases/download/v0.20.0/trivy_0.20.0_Linux-64bit.tar.gz \
    | tar xz -C /usr/local/bin --strip-components=1 trivy

# Copy any additional files needed (e.g., configuration templates)
COPY contrib/*.tpl contrib/

# Set Trivy as the entrypoint
ENTRYPOINT ["trivy"]
