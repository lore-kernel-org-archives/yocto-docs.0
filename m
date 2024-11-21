Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40666D6ED2B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:23:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10478.1732195388060550513
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TTnE42IX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 201E31BF20A;
	Thu, 21 Nov 2024 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732195386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RimIQ8jDOq2Fu71/7TN4B9R6ebJREOUctPqRSqP5uEc=;
	b=TTnE42IXXqEsOkBhZoDYYgv6NI9L4yK+RjA82Xt/tL8PdBI2pwnQapelYzTOllapCFMIYI
	7MgkUYFKfWOeBq959yKVA7D3VsMHL2KmpqTZPO7VgavQcvO29xeJOoDOL3YywqlvbpIFU+
	PPprZEA28Wh7vjgZd3vvjJZm8iP1wsVeEZbY6pLK3M5lGVoJEGdqgNz0n8Mv4uKnxyMSY8
	PwaRTLiAXRPYJQ3pAKhRqIWV+6qZyB3WdDuePXM6oegJa1AuaRP2u1apm1lD+JmShN9ifJ
	Fsid1VurHB8M8TqHyZcrb1iCqqoZhm67A/iZwCtKLG2bzFm8516b170OYomcuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 21 Nov 2024 14:22:40 +0100
Subject: [yocto-docs PATCH] Add scripts to build the docs in containers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAB80P2cC/0XMQQ6DIBCF4asY1iVhQEW9SuMCmKEl1WpBTRPj3
 as1aXfzT/K+lSWKgRJrspVFWkIKw3MPuGTM3c3zRjzg3kwKmQNIwXFwids5dHicD4o+dJS40N7
 VXktnbMX28RjJh/cXvrZnR3rNuz+dzz/fZD98HtFMdMAcaUwcsKiNRSsB6maBA7YmEXdD34epy
 XKslEJhCq+IdA7WaSqFcqWCUldlLRR6pQpi7bZ9AC6b0SbrAAAA
X-Change-ID: 20241120-docs-build-dockerfiles-07fc9f72cab8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6325;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/IUcOTaynNf7PGnXVEz2VAw+uWEJXlfypZ7m3DwWFsU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPzQ5s92x6XiNKtKL0yh3WYhKVlpO1jghzR3+x
 AEhKPCnOyiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz80OQAKCRDRgEFAKaOo
 Nq/iEACIZCaCfg7JYYK+9PpBKuSmhjAvpKos4agin1PYtYSmfh3kSWzMcjFKFXsah/nfGqN0AJO
 pRjSlOLIdODR7x2bh7Z8X6UgaEQYG6FD4UZp6hwkKj3T6TIwHR8X1dPe5iEyHxUCD4q/caJ9mX+
 hpwZinLPtbLmIj+dmCPZfjIYLlHC03JuIYE+m9bpC1BgzYmhwgjawSXXaTY2aN/8+voavAChVDE
 GIXHln2TRsm10WcTjhsZBnR2/aKXVC2nvormQNEU7edJj/8U5zaqOz+UMCe/TDFDTXYCFd5A+pc
 TGCQ4sGl3mrMpu3I3OhXQHcoK29veYAwvyl5Qh3kY305LmiXqiA7pB/7vGuCRUAwr7kBjLlEot9
 cvXv0hljbFoK/x9BzDHsR1kXiAgb2MlvWhi8dE6x9+D3GtrUWdXnwDF0vn2JZZyrT5JCrOrZU+a
 JDLVIKTIXQK5YpgWlR1G4PHB6UAICpl3aVZ2gYVoH2wndJUnc26JiTbG4+6lUCUVMp6TyvV/ccU
 qbvuv4zPrpQyamXdh2FB65f1h7ryNDrmqCBI4wzV49Au0iryvqLcwXE+ijUnngH/i7lZBAscn4j
 LJEEDgyTcTWNQ0nCM+eRzD0qq8ShRsBJowU9h571rVX4pIjmsusgvaF+ru+AwSe/iL1F0BTeiRt
 PaeIzKv267Y4mOg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5785

Add two scripts for building a container image and building the
documentation in that image: build-docs-container and
container-build-docs.

For now, the documentation/tools/dockerfiles directory contains two
Dockerfiles for building with Ubuntu 24.04 and Debian 12, but we could
extend this to the supported distros.

It should be possible to build the full documentation with two commands:

  ./documentation/tools/build-docs-container ubuntu-24-04
  ./documentation/tools/build-docs ubuntu-24-04

The first command builds the container image by pulling the dependencies
listed in poky.yaml.in. The second command uses this image to build the
docs.

CONTAINERCMD can be replaced by "podman" to build with podman.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs                     | 48 ++++++++++++++++++++
 documentation/tools/build-docs-container           | 51 ++++++++++++++++++++++
 .../tools/dockerfiles/Dockerfile.debian-12         | 17 ++++++++
 .../tools/dockerfiles/Dockerfile.ubuntu-24-04      | 17 ++++++++
 4 files changed, 133 insertions(+)

diff --git a/documentation/tools/build-docs b/documentation/tools/build-docs
new file mode 100755
index 0000000000000000000000000000000000000000..2fe8aff3a9834e4f5015e04d64b7462190278004
--- /dev/null
+++ b/documentation/tools/build-docs
@@ -0,0 +1,48 @@
+#!/usr/bin/env bash
+#
+# Build the documentation in a container built by build-docs-container.
+#
+# Usage:
+#
+#   ./documentation/tools/build-docs <image> [<command>]
+#
+# Where <image> is one of the keys in
+# documentation/tools/build-docs-container's DEPS_KEYS_YQ.
+# And <command> an optional command to run, default being to run "make publish".
+#
+# E.g.:
+#
+#   ./documentation/tools/build-docs ubuntu-24-04
+
+SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
+CONTAINERCMD=${CONTAINERCMD:-docker}
+
+DOCS_DIR="$SCRIPT_DIR/../.."
+
+main ()
+{
+  local image="$1"
+  shift
+  local command="${*:-make -C documentation publish}"
+
+  if [ "$CONTAINERCMD" = "docker" ]; then
+    EXTRA_ARGS_RUN="--user $(id -u):$(id -g)"
+  elif [ "$CONTAINERCMD" = "podman" ]; then
+    # we need net access to fetch bitbake terms
+    EXTRA_ARGS_RUN="\
+      --cap-add=NET_RAW \
+      --userns=keep-id"
+  fi
+
+  $CONTAINERCMD run \
+    --rm --interactive --tty \
+    --volume "$DOCS_DIR:/docs:rw" \
+    --workdir "/docs" \
+    $EXTRA_ARGS_RUN \
+    "yocto-docs-$image" \
+    $command
+}
+
+set -eu -o pipefail
+
+main "$@"
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
new file mode 100755
index 0000000000000000000000000000000000000000..8cfe0f7aa75bf5fcfbbc0e838d66e0ef10f20696
--- /dev/null
+++ b/documentation/tools/build-docs-container
@@ -0,0 +1,51 @@
+#!/usr/bin/env bash
+#
+# Build a container ready to build the documentation be reading the dependencies
+# listed in poky.yaml.in.
+#
+# Usage:
+#
+#   ./documentation/tools/build-docs-container <image>
+#
+# Where <image> is one of the keys in DEPS_KEYS_YQ. E.g.:
+#
+#   ./documentation/tools/build-docs-container ubuntu-24-04
+
+SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
+CONTAINERCMD=${CONTAINERCMD:-docker}
+
+# Keys used by yq to get the dependencies from poky.yaml.in
+declare -A DEPS_KEYS_YQ=(
+  [ubuntu-24-04]=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
+  [debian-12]=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
+)
+
+main ()
+{
+  local image="$1"
+
+  for cmd in $CONTAINERCMD yq; do
+    if ! which "$cmd" >/dev/null 2>&1; then
+      echo "The $cmd command was not found. Make sure you have $cmd installed."
+      exit 1
+    fi
+  done
+
+  local dockername="Dockerfile.$image"
+
+  # Put all the dependencies in the deps variable
+  for dep_key in ${DEPS_KEYS_YQ[$image]}; do
+    deps="$deps $(yq --raw-output "$dep_key" "$SCRIPT_DIR/../poky.yaml.in")"
+  done
+
+  ( cd "$SCRIPT_DIR/dockerfiles" \
+    && $CONTAINERCMD build \
+    --tag "yocto-docs-$image:latest" \
+    --file "$dockername" \
+    --build-arg DEPS="$deps" \
+    . )
+}
+
+set -e -o pipefail
+
+main "$@"
diff --git a/documentation/tools/dockerfiles/Dockerfile.debian-12 b/documentation/tools/dockerfiles/Dockerfile.debian-12
new file mode 100644
index 0000000000000000000000000000000000000000..18c9c45c3ccfc5d90a09057d874512c6b9826611
--- /dev/null
+++ b/documentation/tools/dockerfiles/Dockerfile.debian-12
@@ -0,0 +1,17 @@
+FROM debian:12
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+ARG DEPS
+ENV DEPS=${DEPS}
+
+RUN apt-get update \
+ && apt-get --yes --fix-broken upgrade \
+ && apt-get --yes --no-install-recommends install \
+    ${DEPS} \
+ && apt-get --yes autoremove \
+ && apt-get clean
+
+RUN LANG="en_US.UTF-8" locale-gen
+
+RUN git config --global --add safe.directory /docs
diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04 b/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
new file mode 100644
index 0000000000000000000000000000000000000000..6ac384c4f242b508027a92d2acad490da41dc374
--- /dev/null
+++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
@@ -0,0 +1,17 @@
+FROM ubuntu:24.04
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+ARG DEPS
+ENV DEPS=${DEPS}
+
+RUN apt-get update \
+ && apt-get --yes --fix-broken upgrade \
+ && apt-get --yes --no-install-recommends install \
+    ${DEPS} \
+ && apt-get --yes autoremove \
+ && apt-get clean
+
+RUN LANG="en_US.UTF-8" locale-gen
+
+RUN git config --global --add safe.directory /docs

---
base-commit: 4d833d0a5f3ee741bc7e603c6316786903df335e
change-id: 20241120-docs-build-dockerfiles-07fc9f72cab8
prerequisite-change-id: 20241120-update-doc-deps-1d59abdb2119:v1
prerequisite-patch-id: 5377acf74f0873f407d74e05bb0865cc23a542da
prerequisite-patch-id: a0858899556e86046ffad661eeb0fe9a89990e4d
prerequisite-patch-id: ff7cb872932bdde94b7e1f23bbcaa2d5e9072762
prerequisite-patch-id: f5ae26c37c785e16bd052e6b4260da35b661d25e
prerequisite-patch-id: 99cc275f70735f5c6ccbdc74998fe170b3cbf167

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


