Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78653C02191
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 18:37:32 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web11.849.1738003044576999054
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 10:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YhcbQ54nzztXc;
	Mon, 27 Jan 2025 19:37:22 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YhcbQ2Tvbz6yy;
	Mon, 27 Jan 2025 19:37:22 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 27 Jan 2025 19:37:05 +0100
Subject: [PATCH v3 2/2] tools: add script for building documentation inside
 containers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250127-instructions-shell-container-v3-2-9373d3f156f5@cherry.de>
References: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
In-Reply-To: <20250127-instructions-shell-container-v3-0-9373d3f156f5@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6201

From: Quentin Schulz <quentin.schulz@cherry.de>

This adds a script for building a container and building the
documentation within that new container image.

The openSUSE instructions now require a --non-interactive flag otherwise
they fail to run. Sadly there doesn't seem to be a way to have this in
an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive, so we
simply do a sed on the scripts to add --non-interactive to the zypper
commands to avoid having those in the instructions provided to our
users.

Somehow tzdata package in Ubuntu doesn't respect
DEBIAN_FRONTEND=3Dnoninteractive hence why the timezone needs to be set b=
y
hand.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/Containerfile.almalinux |   1 +
 documentation/tools/Containerfile.apt       |  26 +++++
 documentation/tools/Containerfile.debian    |   1 +
 documentation/tools/Containerfile.dnf       |  25 ++++
 documentation/tools/Containerfile.fedora    |   1 +
 documentation/tools/Containerfile.ubuntu    |   1 +
 documentation/tools/Containerfile.zypper    |  32 +++++
 documentation/tools/build-docs-container    | 175 ++++++++++++++++++++++=
++++++
 8 files changed, 262 insertions(+)

diff --git a/documentation/tools/Containerfile.almalinux b/documentation/=
tools/Containerfile.almalinux
new file mode 120000
index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b11=
fa6cefe9daaec74
--- /dev/null
+++ b/documentation/tools/Containerfile.almalinux
@@ -0,0 +1 @@
+Containerfile.dnf
\ No newline at end of file
diff --git a/documentation/tools/Containerfile.apt b/documentation/tools/=
Containerfile.apt
new file mode 100644
index 0000000000000000000000000000000000000000..5e30b65eb8f81a7764c00eb10=
78dabaf59b64517
--- /dev/null
+++ b/documentation/tools/Containerfile.apt
@@ -0,0 +1,26 @@
+ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG DOCS=3Dubuntu_docs.sh
+ARG DOCS_PDF=3Dubuntu_docs_pdf.sh
+
+ENV DEBIAN_FRONTEND=3Dnoninteractive
+ARG TZ=3DEurope/Vienna
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
+COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+
+RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
+ && apt-get update \
+ && apt-get install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
+ && yes | /temp/host_packages_docs_pdf.sh \
+ && apt-get --yes autoremove \
+ && apt-get clean \
+ && rm -rf /temp
+
+RUN git config --global --add safe.directory /docs
+
+ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+CMD ["publish"]
diff --git a/documentation/tools/Containerfile.debian b/documentation/too=
ls/Containerfile.debian
new file mode 120000
index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad5=
f34699b1ad3348a
--- /dev/null
+++ b/documentation/tools/Containerfile.debian
@@ -0,0 +1 @@
+Containerfile.apt
\ No newline at end of file
diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools/=
Containerfile.dnf
new file mode 100644
index 0000000000000000000000000000000000000000..3dae74445585961a6f2d29b8a=
cde09f2456dd886
--- /dev/null
+++ b/documentation/tools/Containerfile.dnf
@@ -0,0 +1,25 @@
+ARG ARG_FROM=3Dfedora:40 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG DOCS=3Dfedora_docs.sh
+ARG DOCS_PDF=3Dfedora_docs_pdf.sh
+ARG PIP3=3Dpip3_docs.sh
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
+COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
+
+RUN dnf update -y \
+ && dnf install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
+ && yes | /temp/host_packages_docs_pdf.sh \
+ && yes | /temp/pip3_docs.sh \
+ && dnf autoremove -y \
+ && dnf clean all -y \
+ && rm -rf /temp
+
+RUN git config --global --add safe.directory /docs
+
+ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+CMD ["publish"]
diff --git a/documentation/tools/Containerfile.fedora b/documentation/too=
ls/Containerfile.fedora
new file mode 120000
index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b11=
fa6cefe9daaec74
--- /dev/null
+++ b/documentation/tools/Containerfile.fedora
@@ -0,0 +1 @@
+Containerfile.dnf
\ No newline at end of file
diff --git a/documentation/tools/Containerfile.ubuntu b/documentation/too=
ls/Containerfile.ubuntu
new file mode 120000
index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad5=
f34699b1ad3348a
--- /dev/null
+++ b/documentation/tools/Containerfile.ubuntu
@@ -0,0 +1 @@
+Containerfile.apt
\ No newline at end of file
diff --git a/documentation/tools/Containerfile.zypper b/documentation/too=
ls/Containerfile.zypper
new file mode 100644
index 0000000000000000000000000000000000000000..f27ad1b476999f4f2cebb47b8=
9025b1c9f89cec1
--- /dev/null
+++ b/documentation/tools/Containerfile.zypper
@@ -0,0 +1,32 @@
+ARG ARG_FROM=3Dopensuse/leap:15.4 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG DOCS=3Dopensuse_docs.sh
+ARG DOCS_PDF=3Dopensuse_docs_pdf.sh
+ARG PIP3=3Dpip3_docs.sh
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
+COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
+
+# Zypper doesn't have environment variables to specify whether to run in
+# non-interactive mode like Debian does with DEBIAN_FRONTEND and piping =
yes to
+# the scripts doesn't need to be enough as well, so let's force all zypp=
er calls
+# to be non-interactive by adding the appropriate flag in the scripts.
+RUN for script in /temp/*.sh; do \
+	sed -i 's/zypper/zypper --non-interactive/' $script; \
+    done
+
+RUN zypper update -y \
+ && zypper install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
+ && yes | /temp/host_packages_docs_pdf.sh \
+ && yes | /temp/pip3_docs.sh \
+ && zypper clean --all \
+ && rm -rf /temp
+
+RUN git config --global --add safe.directory /docs
+
+ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+CMD ["publish"]
diff --git a/documentation/tools/build-docs-container b/documentation/too=
ls/build-docs-container
new file mode 100755
index 0000000000000000000000000000000000000000..6b4d4254342bd00a1c1ba6758=
075bd1720334888
--- /dev/null
+++ b/documentation/tools/build-docs-container
@@ -0,0 +1,175 @@
+#!/usr/bin/env bash
+# -*- vim: set expandtab tabstop=3D2 shiftwidth=3D2:
+#
+# Build a container ready to build the documentation be reading the depe=
ndencies
+# listed in shell scripts in documentation/tools/host_packages_scripts, =
and
+# start a documentation build in this container.
+#
+# Usage:
+#
+#   ./documentation/tools/build-docs-container <image> [<make target>]
+#
+# e.g.:
+#
+#   ./documentation/tools/build-docs-container ubuntu:24.04 html
+#
+# Will build the docs in an Ubuntu 24.04 container in html.
+#
+# The container engine can be selected by exporting CONTAINERCMD in the
+# environment. The default is docker, but podman can also be used.
+
+set -eu -o pipefail
+
+SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && =
pwd)
+CONTAINERCMD=3D${CONTAINERCMD:-docker}
+DOCS_DIR=3D"$SCRIPT_DIR/../.."
+SH_DIR=3D"$SCRIPT_DIR/host_packages_scripts"
+
+function usage()
+{
+  echo "$0 -- script to build documentation from within a container
+
+$0 OCI_IMAGE [make arguments...]
+
+   OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. I=
t is one
+   of:
+     - debian:12
+     - fedora:38
+     - fedora:39
+     - fedora:40
+     - leap:15.4
+     - leap:15.5
+     - ubuntu:22.04
+     - ubuntu:24.04
+
+   [make arguments] is one or more argument to pass to the make command =
of
+   documentation/Makefile, see that file for what's supported. This is t=
ypically
+   intended to be used to provide specific make targets.
+   Default: publish
+"
+}
+
+main ()
+{
+  if [ "$#" -lt 1 ]; then
+    usage
+    exit 1
+  fi
+
+  local image=3D"$1"
+  shift
+
+  OCI=3D$(which "$CONTAINERCMD")
+
+  # docker build doesn't accept 2 colons, so "sanitize" the name
+  local sanitized_dockername
+  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
+
+  local version
+  version=3D$(echo "$image" | awk -F: '{print $NF}')
+
+  case $image in
+    # Missing latexmk texlive-gnu-freefont packages at the very least
+    # "almalinux:8"*|\
+    # "almalinux:9"*)
+    #   containerfile=3DContainerfile.almalinux
+    #   docs=3Dalmalinux_docs.sh
+    #   docs_pdf=3Dalmalinux_docs_pdf.sh
+    #   pip3=3Dpip3_docs.sh
+    #   ;;
+    # Missing python3-saneyaml
+    # "debian:11"*|\
+    "debian:12"*)
+      containerfile=3DContainerfile.debian
+      docs=3Dubuntu_docs.sh
+      docs_pdf=3Dubuntu_docs_pdf.sh
+      ;;
+    "fedora:38"*|\
+    "fedora:39"*|\
+    "fedora:40"*)
+      containerfile=3DContainerfile.fedora
+      docs=3Dfedora_docs.sh
+      docs_pdf=3Dfedora_docs_pdf.sh
+      pip3=3Dpip3_docs.sh
+      ;;
+    "leap:15.4"*|\
+    "leap:15.5"*)
+    # Seems like issue with permissions package, c.f.
+    #
+    # Updating /etc/sysconfig/security ...
+    # /dev/zero: chown: Permission denied
+    # /dev/null: chown: Permission denied
+    # /dev/full: chown: Permission denied
+    # ERROR: not all operations were successful.
+    # Checking permissions and ownerships - using the permissions files
+    # 	/etc/permissions
+    # 	/etc/permissions.easy
+    # 	/etc/permissions.local
+    # setting / to root:root 0755. (wrong permissions 0555)
+    # setting /dev/zero to root:root 0666. (wrong owner/group 65534:6553=
4)
+    # setting /dev/null to root:root 0666. (wrong owner/group 65534:6553=
4)
+    # setting /dev/full to root:root 0666. (wrong owner/group 65534:6553=
4)
+    # warning: %post(permissions-20240826-150600.10.12.1.x86_64) scriptl=
et failed, exit status 1
+    #
+    # "leap:15.6"*)
+      image=3Dopensuse/leap:$version
+      containerfile=3DContainerfile.zypper
+      docs=3Dopensuse_docs.sh
+      docs_pdf=3Dopensuse_docs_pdf.sh
+      pip3=3Dpip3_docs.sh
+      ;;
+    # Missing python3-saneyaml
+    # "ubuntu:18.04"*|\
+    # "ubuntu:20.04"*|\
+    # Cannot fetch packages anymore
+    # "ubuntu:23.04"*|\
+    "ubuntu:22.04"*|\
+    "ubuntu:24.04"*)
+      containerfile=3DContainerfile.ubuntu
+      docs=3Dubuntu_docs.sh
+      docs_pdf=3Dubuntu_docs_pdf.sh
+      ;;
+    *)
+      echo "$image not supported!"
+      usage
+      exit 1
+      ;;
+  esac
+
+  $OCI build \
+    --tag "yocto-docs-$sanitized_dockername:latest" \
+    --build-arg ARG_FROM=3D"docker.io/$image" \
+    --build-arg DOCS=3D"$docs" \
+    --build-arg DOCS_PDF=3D"$docs_pdf" \
+    --build-arg PIP3=3D"${pip3:-}" \
+    --file "$SCRIPT_DIR/$containerfile" \
+    "$SH_DIR/"
+
+  local -a args_run=3D(
+    --rm
+    --interactive
+    --tty
+    --volume=3D"$DOCS_DIR:/docs:rw"
+    --workdir=3D/docs
+    --security-opt label=3Ddisable
+  )
+
+  if [ "$OCI" =3D "docker" ]; then
+    args_run+=3D(
+      --user=3D"$(id -u)":"$(id -g)"
+    )
+  elif [ "$OCI" =3D "podman" ]; then
+    # we need net access to fetch bitbake terms
+    args_run+=3D(
+      --cap-add=3DNET_RAW
+      --userns=3Dkeep-id
+    )
+  fi
+
+  $OCI run \
+    "${args_run[@]}" \
+    "yocto-docs-$sanitized_dockername" \
+    "$@"
+}
+
+main "$@"

--=20
2.48.1


