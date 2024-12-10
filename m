Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19926E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:27:30 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.web11.13054.1733844440498558127
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 07:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Y72fH0YZ3zjHx;
	Tue, 10 Dec 2024 16:27:19 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Y72fG5KNqzV7c;
	Tue, 10 Dec 2024 16:27:18 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 10 Dec 2024 16:26:45 +0100
Subject: [PATCH RFC 2/2] tools: add script for building documentation
 inside containers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20241210-instructions-shell-container-v1-2-6a7cdc404ff4@cherry.de>
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
In-Reply-To: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 15:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5926

From: Quentin Schulz <quentin.schulz@cherry.de>

This adds a script for building a container and building the
documentation within that new container image.

The openSUSE instructions now require a --non-interactive flag otherwise
they fail to run. Sadly there doesn't seem to be a way to have this in
an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive.

Note that the Ubuntu and openSUSE instructions currently do not work.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/Containerfile.almalinux        |   1 +
 documentation/tools/Containerfile.apt              |  21 +++++
 documentation/tools/Containerfile.debian           |   1 +
 documentation/tools/Containerfile.dnf              |  19 ++++
 documentation/tools/Containerfile.fedora           |   1 +
 documentation/tools/Containerfile.ubuntu           |   1 +
 documentation/tools/Containerfile.zypper           |  18 ++++
 documentation/tools/build-docs-container           | 101 +++++++++++++++=
++++++
 documentation/tools/opensuse_host_packages_docs.sh |   2 +-
 .../tools/opensuse_host_packages_essential.sh      |   2 +-
 10 files changed, 165 insertions(+), 2 deletions(-)

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
index 0000000000000000000000000000000000000000..a601699ce4005b3bc5288990d=
bf2e7fa235ea431
--- /dev/null
+++ b/documentation/tools/Containerfile.apt
@@ -0,0 +1,21 @@
+ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG HOST_DOCS_PACKAGES=3Dubuntu_host_packages_docs.sh
+
+ENV DEBIAN_FRONTEND=3Dnoninteractive
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${HOST_DOCS_PACKAGES} /temp/host_packages_docs.sh
+
+RUN apt-get update \
+ && apt-get install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
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
index 0000000000000000000000000000000000000000..29ea670905ac011966d7bf534=
0c10be0660149a6
--- /dev/null
+++ b/documentation/tools/Containerfile.dnf
@@ -0,0 +1,19 @@
+ARG ARG_FROM=3Dfedora:40 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG HOST_DOCS_PACKAGES=3Dfedora_host_packages_docs.sh
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${HOST_DOCS_PACKAGES} /temp/host_packages_docs.sh
+
+RUN dnf update -y \
+ && dnf install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
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
index 0000000000000000000000000000000000000000..567256d65b580aab45e27a7b7=
a386e7a8dbe107f
--- /dev/null
+++ b/documentation/tools/Containerfile.zypper
@@ -0,0 +1,18 @@
+ARG ARG_FROM=3Dopensuse/leap:15.4 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG HOST_DOCS_PACKAGES=3Dopensuse_host_packages_docs.sh
+
+# relative to the location of the dockerfile
+COPY --chmod=3D777 ${HOST_DOCS_PACKAGES} /temp/host_packages_docs.sh
+
+RUN zypper update -y \
+ && zypper install -y sudo \
+ && yes | /temp/host_packages_docs.sh \
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
index 0000000000000000000000000000000000000000..4a799bd8e795f1ab7d55eb991=
16fe859aff2692c
--- /dev/null
+++ b/documentation/tools/build-docs-container
@@ -0,0 +1,101 @@
+#!/usr/bin/env bash
+#
+# Build a container ready to build the documentation be reading the depe=
ndencies
+# listed in poky.yaml.in, and start a documentation build in this contai=
ner.
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
+
+main ()
+{
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
+    almalinux*)
+      containerfile=3DContainerfile.almalinux
+      host_packages_docs=3Dalmalinux_host_packages_docs.sh
+      ;;
+    debian*)
+      containerfile=3DContainerfile.debian
+      host_packages_docs=3Dubuntu_host_packages_docs.sh
+      ;;
+    fedora*)
+      containerfile=3DContainerfile.fedora
+      host_packages_docs=3Dfedora_host_packages_docs.sh
+      ;;
+    opensuse* | leap*)
+      image=3Dopensuse/leap:$version
+      containerfile=3DContainerfile.zypper
+      host_packages_docs=3Dopensuse_host_packages_docs.sh
+      ;;
+    ubuntu*)
+      containerfile=3DContainerfile.ubuntu
+      host_packages_docs=3Dubuntu_host_packages_docs.sh
+      ;;
+    *)
+      echo "$image not supported"
+      exit 1
+      ;;
+  esac
+
+  $OCI build \
+    --tag "yocto-docs-$sanitized_dockername:latest" \
+    --build-arg ARG_FROM=3D"docker.io/$image" \
+    --build-arg HOST_DOCS_PACKAGES=3D"$host_packages_docs" \
+    --file "$SCRIPT_DIR/$containerfile" \
+    "$SCRIPT_DIR/"
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
+    "$*"
+}
+
+main "$@"
diff --git a/documentation/tools/opensuse_host_packages_docs.sh b/documen=
tation/tools/opensuse_host_packages_docs.sh
index 90f52d576451ee0a7c481b31b7605e4a870496cd..18975bd8d2db93eaadc663fac=
738e9400fd11ffb 100644
--- a/documentation/tools/opensuse_host_packages_docs.sh
+++ b/documentation/tools/opensuse_host_packages_docs.sh
@@ -1,2 +1,2 @@
-sudo zypper install git make python3-pip which inkscape texlive-fncychap
+sudo zypper --non-interactive install git make python3-pip which inkscap=
e texlive-fncychap
 sudo pip3 install sphinx sphinx_rtd_theme pyyaml
diff --git a/documentation/tools/opensuse_host_packages_essential.sh b/do=
cumentation/tools/opensuse_host_packages_essential.sh
index ef24fcefd99c9ecc335c594965965bb36e43cd05..20d934c34b833f547463d2e63=
5ee16db935de3dc 100644
--- a/documentation/tools/opensuse_host_packages_essential.sh
+++ b/documentation/tools/opensuse_host_packages_essential.sh
@@ -1,2 +1,2 @@
-sudo zypper install python gcc gcc-c++ git chrpath make wget python-xml =
diffstat makeinfo python-curses patch socat python3 python3-curses tar py=
thon3-pip python3-pexpect xz which python3-Jinja2 rpcgen zstd lz4 bzip2 g=
zip hostname libacl1
+sudo zypper --non-interactive install python gcc gcc-c++ git chrpath mak=
e wget python-xml diffstat makeinfo python-curses patch socat python3 pyt=
hon3-curses tar python3-pip python3-pexpect xz which python3-Jinja2 rpcge=
n zstd lz4 bzip2 gzip hostname libacl1
 sudo pip3 install GitPython

--=20
2.47.1


