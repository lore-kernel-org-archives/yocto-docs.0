Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE8E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 11:06:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8330.1733396801993628340
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 03:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oUAICCLJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09ED8240002;
	Thu,  5 Dec 2024 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733396800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Qbepetzf6m9GeuRVZNRMJ5iJYdpGxCwIBtv6mMK3lU=;
	b=oUAICCLJB1HPHgfFhB5HNbRDQuSQr15oQqt6pdjObjcbNn5K/k/Ud/ILD8dkq6r2JhSqOd
	lG7d8oG7t0UeKyvQnyS4JBjDNKWlD2jkzRRG51QHq3HGFCsjiuf+jTbEFX2LcUxwI92PFy
	DXPcCnHmdYIzak0TtF5NtUSQeOxkKexnFHL6/ytpDNB4wZuS7QoXXg8tQlY4ruawf7qwv8
	c53ifbaQ6TGn2RGnp9Pbe7lQ150JHqy92kJnhVBApiM4l2zk0ax6Go1lMIUzsv9hvQYEod
	zE4PXBKPBSNkQrFHR4WSbBzw9pl0KKouhjP/QyfuRPZ4yJxvfu/bVOpjgh0jYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 05 Dec 2024 12:06:23 +0100
Subject: [yocto-docs PATCH v2] Add scripts to build the docs in containers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAC6JUWcC/3WPzW6DMBCEXwX5XFfeBYLNqe9R5eCfdWOVYGoDa
 hTx7jGkVU+97aw038zcWaYUKLO+urNEa8ghjkXgS8XsRY8fxIMrmqHABgAFd9FmbpYwuP38pOT
 DQJmLzlvlO7TaSFbMUyIfvg/w+/mpE30thT8/n3/4kvYLXyanZ9rB3NGUObhWaeMMAqh+xR1sd
 CZu4/Ua5r6qhRAoQIGSGk6SGtnWXSM6YxRKr63Bk/YSNdsrXEKeY7odU1c4OvwEw3+rVuDAa9M
 2BFh3xrdvJsZ5CONracDO27Y9AIET+ANBAQAA
X-Change-ID: 20241120-docs-build-dockerfiles-07fc9f72cab8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8402;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=x4zQ6zHJmwISH62N6i1R3ZS6NrAQ+NPIIitdd9hek4A=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUYk/pQiP0G5Kz7853wUPk74LW0SzxqQgckO73
 sVMufWyOROJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1GJPwAKCRDRgEFAKaOo
 NjAAD/94gybkQQhdSKZjDskI7H6Iq0SkoLdzac8FxKacDoaUgwfFnRMv49/M69Jgbh2O2E77+Mh
 FGHux/HRrv3OXVxvr2lEUhACzM0RNzeHW8kXJrjkItLrfK29EFvRkPQ6aAwpKiex0ORyQvD65J8
 ic9iCIr2sllcY2JkzWB3ZogMpqNM3FK/OpQpnjRlUrKAqAmk9A9eFriBszUHx3scv1A4DaYKDKj
 KQJJde8X1Q4fPlBoEpHWZZZZtFLhdd8YKTSxDYvvVWyx/NQFnknmbdO7o1pnMLcTTiOqy89sEqs
 GfVKYLWBk6XrsWUj8SU4eydoU5Za0oH8Rc31iQpZWmvAOEyVFC9BPOLgqDaL1wT4kxTUunXH0Wd
 gEEVqWRwHrVZkjw0cM1T/HvoWdz1wzveuVwZNrckH4UWiH6KDE/8QlFW3zXbMWVcmJ2tFgw5rUL
 L3NMMFnrFdKVNa4iQnbgXArISsSKlyitW5TdBn4MdFC8X8vG1Zmbe72rErxg1UMZj87XzMGGpA5
 GnaUX8h828nFRKVAfoXKP/X3LTxys7ye3vBKfO7YsZ9b2v3rnaigAIKvRsu5R7lw+PAT+ze2LeH
 qL7yMYcSe0YmHn27Lfuw46Uwigpcm7yLprF6liPaX95aMN1S9UAN54ER/Nc/x1LA1d/iKp/sNJa
 KLzZZ9TX/qoz+5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Dec 2024 11:06:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5889

Add two scripts for building a container image and building the
documentation in that image: build-docs-container and
container-build-docs.

For now, the documentation/tools/dockerfiles directory contains a
Dockerfile for building with Ubuntu or Debian, but we could extend this
to the supported distros.

It should be possible to build the full documentation with two commands:

  ./documentation/tools/build-docs-container ubuntu:24.04

CONTAINERCMD can be replaced by "podman" to build with podman.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Merge the scripts to build a container and run the container into a
  single script.
- Parametrize the FROM dockerfile instruction from the script, allowing
  to use a single dockerfile for multiple distros.
- Add a paragraph on this in the README.
- Copy the dependency list in a file in the container, instead of
  passing them in a variable (to be future-proof on command line
  lengths).
- Fix the locale-gen command in the Ubuntu/Debian dockerfile.
- Link to v1: https://lore.kernel.org/r/20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com
---
 documentation/README                               |  27 +++++
 documentation/tools/build-docs-container           | 119 +++++++++++++++++++++
 .../tools/dockerfiles/Dockerfile.ubuntu-debian     |  18 ++++
 3 files changed, 164 insertions(+)

diff --git a/documentation/README b/documentation/README
index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..aebece13758005a8b913b4570fee6118256f6f9b 100644
--- a/documentation/README
+++ b/documentation/README
@@ -128,6 +128,33 @@ dependencies in a virtual environment:
  $ pipenv install
  $ pipenv run make html
 
+Building the documentation in a container
+=========================================
+
+The documentation can be built in a container with the build-docs-container
+scripts in the tools/ directory. The default container command used by the
+script is docker, but the script also supports podman by setting the
+CONTAINERCMD variable in your environment:
+
+  $ export CONTAINERCMD=podman
+
+A basic usage of the script would be:
+
+  $ ./tools/build-docs-container debian:12
+
+This will the entire documentation in an Debian 12 container.
+
+The documentation can be built in other distributions. This list can be obtained
+by running:
+
+  $ ./tools/build-docs-container list
+
+The make target can optionally be provided to build a single documentation type
+(these targets are listed in the documentation Makefile). For example, to build
+the documentation in HTML and EPub formats, the following command can be used:
+
+  $ ./tools/build-docs-container ubuntu:24.04 epub html
+
 Style checking the Yocto Project documentation
 ==============================================
 
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
new file mode 100755
index 0000000000000000000000000000000000000000..b9578d6da49b707c4de215866b6396cfeff3d08b
--- /dev/null
+++ b/documentation/tools/build-docs-container
@@ -0,0 +1,119 @@
+#!/usr/bin/env bash
+#
+# Build a container ready to build the documentation be reading the dependencies
+# listed in poky.yaml.in, and start a documentation build in this container.
+#
+# Usage:
+#
+#   ./documentation/tools/build-docs-container <image> [<make target>]
+#
+# Where <image> is one of the keys in YQ_KEYS. E.g.:
+#
+#   ./documentation/tools/build-docs-container ubuntu:24.04 html
+#
+# Will build the docs in an Ubuntu 24.04 container in html.
+#
+# The container commands can be used by exporting CONTAINERCMD in the
+# environment. The default is docker, but podman can also be used.
+
+SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
+CONTAINERCMD=${CONTAINERCMD:-docker}
+DOCS_DIR="$SCRIPT_DIR/../.."
+POKY_YAML_IN="$SCRIPT_DIR/../poky.yaml.in"
+
+# This lists the different images we can build and the keys we pass to yq to
+# find packages in poky.yaml.in.
+# The keys should be in the form of "<image>:<version>", as this will be passed
+# to FROM in the selected Dockerfile below.
+# These are common yq keys used for multiple distros.
+_UBUNTU_DEBIAN_YQ_KEYS=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
+declare -A YQ_KEYS=(
+  [ubuntu:22.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
+  [ubuntu:24.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
+  [debian:12]="$_UBUNTU_DEBIAN_YQ_KEYS"
+)
+
+# This lists the dockerfile to use for each of the distro listed in YQ_KEYS
+# above. There should be a 1 to 1 match between the keys listed in YQ_KEYS above
+# and the keys listed in DOCKERFILES below.
+declare -A DOCKERFILES=(
+  [ubuntu:22.04]="Dockerfile.ubuntu-debian"
+  [ubuntu:24.04]="Dockerfile.ubuntu-debian"
+  [debian:12]="Dockerfile.ubuntu-debian"
+)
+
+main ()
+{
+  if [ "$#" -lt 1 ]; then
+    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
+    exit 1
+  elif [ "$1" = "list" ]; then
+    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
+    exit 0
+  fi
+
+  local image="$1"
+  shift
+  local make_targets="${*:-publish}"
+
+  for cmd in $CONTAINERCMD yq; do
+    if ! which "$cmd" >/dev/null 2>&1; then
+      echo "The $cmd command was not found. Make sure you have $cmd installed."
+      exit 1
+    fi
+  done
+
+  # Get the appropriate dockerfile from DOCKERFILES
+  dockerfile="${DOCKERFILES[$image]}"
+
+  local temporary_dep_file="$SCRIPT_DIR/dockerfiles/deps"
+  echo -n > "$temporary_dep_file" # empty the file
+  for dep_key in ${YQ_KEYS[$image]}; do
+    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$temporary_dep_file"
+    # add a white space after last element of yq command
+    echo -n " " >> "$temporary_dep_file"
+  done
+
+  # docker build doesn't accept 2 colons, so "sanitize" the name
+  local sanitized_dockername
+  sanitized_dockername=$(echo "$image" | tr ':.' '-')
+
+  $CONTAINERCMD build \
+    --tag yocto-docs-$sanitized_dockername:latest \
+    --build-arg ARG_FROM="$image" \
+    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
+    "$SCRIPT_DIR/dockerfiles"
+
+  # We can remove the deps file, we no longer need it
+  rm -f "$temporary_dep_file"
+
+  local -a args_run=(
+    --rm
+    --interactive
+    --tty
+    --volume="$DOCS_DIR:/docs:rw"
+    --workdir=/docs
+    --security-opt label=disable
+  )
+
+  if [ "$CONTAINERCMD" = "docker" ]; then
+    args_run+=(
+      --user="$(id -u)":"$(id -g)"
+    )
+  elif [ "$CONTAINERCMD" = "podman" ]; then
+    # we need net access to fetch bitbake terms
+    args_run+=(
+      --cap-add=NET_RAW
+      --userns=keep-id
+    )
+  fi
+
+  $CONTAINERCMD run \
+    "${args_run[@]}" \
+    yocto-docs-$sanitized_dockername \
+    make -C documentation $make_targets
+}
+
+set -eu -o pipefail
+
+main "$@"
diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
new file mode 100644
index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b201558e2ed00847339fa
--- /dev/null
+++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
@@ -0,0 +1,18 @@
+ARG ARG_FROM=debian:12 # default value to avoid warning
+FROM $ARG_FROM
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# relative to the location of the dockerfile
+COPY deps /deps
+
+RUN apt-get update \
+ && apt-get --yes --no-install-recommends install $(cat /deps) \
+ && apt-get --yes autoremove \
+ && apt-get clean \
+ && rm /deps
+
+RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
+
+RUN git config --global --add safe.directory /docs
+

---
base-commit: 30002019198a168e48537407bb928facb26af82a
change-id: 20241120-docs-build-dockerfiles-07fc9f72cab8
prerequisite-change-id: 20241120-update-doc-deps-1d59abdb2119:v2
prerequisite-patch-id: d6ea594d309248553799e130bf46c297557c9009
prerequisite-patch-id: 84cdb06cfb747a834b6520b09991e5f787862991
prerequisite-patch-id: 5ad97d55512df0eaa9928eb852e0cb8c9dd586ae
prerequisite-patch-id: 39b330354e63d826e14af8168dfc4e3513685052
prerequisite-patch-id: b8811c7a7cc5b6886a037fb535216135064db84e
prerequisite-patch-id: 861769a88e59749479b7e4c34428805ba20651a2

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


