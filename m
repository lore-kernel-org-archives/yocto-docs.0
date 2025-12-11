Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6374AD41C12
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5428.1765443985031379874
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u2BL3UCo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85F6B4E41B7A
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EDF16068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7B09103C8E11;
	Thu, 11 Dec 2025 10:06:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pcRbUfFhzPhBhWFBoqMXqOB27sQS16BNrFgFe4rwoBQ=;
	b=u2BL3UCoD2hYCojRran7nUHx+d6Mlr52TlLYleCdnBk8AX9bSEq1/pfrT/bYHhIw86D92B
	LpaAsCpLIuLvUY7AMjyR1Ifz4SEUgqQLBjWRLruhtjAEygeZy8eSIDk6EC9bMFtA1pXCrw
	JTwRe/7/lbOIi4YaTl1n7gVOYVP5zyMg1CoRnUcLiiUP5wa5nsaTlyj7wVbnqhO8ZHsq5K
	5g3K+CeEV5aidIna0/SlV2Ljo0PAfuPxfECWVbTVpKlaAf887olcm0z7jZj6sXw5zClcZ4
	5/V7+YLnoLni2GO0elfKHG34Ok9SgsyfK8iRHM4kTFbr2uDU1XM6hs7iGGiJjg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 10:06:16 +0100
Subject: [PATCH v2 3/5] tools/build-docs-container: add CentOS Stream 9
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-build-docs-container-tlmgr-v2-3-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7493;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=M+J1l1x937ojuZgH7JAy/imsUZdZSKOm2hjn6ObqU28=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomM01SQtO8+wm+h5qC+BkK3rF303QyFUYRV5
 1uChlZZV5GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJjAAKCRDRgEFAKaOo
 NuoYD/0aBBS06t7w8G146kdMHwzFfhEJdEXR0dgF1QlpHmRfIeUmat+LaIEDGxzT5mhaktmsw6e
 MzzMvPV9U+9/pukQz2m5tQiK2M6J95k1OQZmoKbD8FUPklVjBK/dK9pSUpFilKNEQOqDoMrB1Zr
 bRFweaCEIx2JNb2vcYWHrfAOttzOxXgRm9XrwhFSBvL0RCfsmSCUNhpG0iavurj2xGr4Ph3U94S
 RcAoSRYtkxRNiwG7hJM7Lalk61uHtB62Yexb4lo0l+fRTa+AAgwfKGI4KLwz6xSMHjcWNoyimZi
 aNzS5Tc/GLNewgOanOM0eQpzcge+NFk3ySItTxrbkopZeT0GyrpzwG7scys6tlRV39bS+cew6ry
 bwwHFO/JmTIOxgAYzFwpZ9Ruz9JJSPghjsXitcTAvbQmLKDbJsENwLCG3new4Jv1EJfupsv2kvN
 xDiDQVTfi4y+unrcnfLOEFqysDxXfmifN357C8upBFMvzBy8ab3M0M5NAGzYZiMm/BLZT+H/ypL
 dgsqN0x+JCGhfLi0sKdJDwra6LnnMtot4RC7iUSA2AblScpMDuOU8AhN/HJuxBukuBjaZAApbjX
 yXzjl7FcBnGNkM2YDNuAfKOy+U4Y2Nn59zQXdDmVy6NDsPo0R88NqcaS1weqJYqq+qWaeVHfqaj
 dAqmMwm28ubyYmw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8243

Add support for building the docs in CentOS Stream 9. As there are no
official images for CentOS Stream, use tgagor/centos from dockerhub
which is actively updated.

The centosstream_essential.sh centosstream_docs.sh files are based on
the almalinux files.

Introduce a new installation script: tlmgr_docs_pdf.sh. As I wasn't able
to locate all the necessary tex packages to build the documentation in a
PDF format, I resorted to using what is used on the Autobuilder: a local
installation of texlive packages through tlmgr.

This will allow us to provide a way of building the docs as PDF for the
distros that lack this support at the moment.

Use a new Containerfile.stream file as it needs TEXTOOLDIR exported for
installing the texlive tools in a known directory (we assume the base
dnf Containerfile does not need it, as it is currently the case for
Fedora).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 35 ++++++++++++++++++++++
 documentation/tools/build-docs-container           | 14 ++++++++-
 .../tools/containerfiles/Containerfile.dnf         |  3 ++
 .../tools/containerfiles/Containerfile.stream      |  1 +
 .../host_packages_scripts/centosstream_docs.sh     |  1 +
 .../centosstream_essential.sh                      |  5 ++++
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |  7 +++++
 7 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9ed29a1df..e9d5012e3 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -266,6 +266,41 @@ documentation in PDF format:
 .. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
    :language: shell
 
+CentOS Stream Packages
+----------------------
+
+Here are the packages needed to build an image on a headless system
+with a supported CentOS Stream distribution:
+
+.. literalinclude:: ../tools/host_packages_scripts/centosstream_essential.sh
+   :language: shell
+
+Here are the packages needed to build Project documentation manuals:
+
+.. literalinclude:: ../tools/host_packages_scripts/centosstream_docs.sh
+   :language: shell
+
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
+
+In addition to the previous packages, the following TeX Live packages
+are needed to build the documentation in PDF format and can be installed with
+the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
+
+.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
+   :language: shell
+
+.. warning::
+
+   The Tex Live installation above is only valid for `x86_64` hosts.
+
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages:
+
+.. code-block:: console
+
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 7d25b15b9..0800c4333 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -33,6 +33,7 @@ $0 OCI_IMAGE [make arguments...]
 
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
+     - centos:stream9
      - debian:12
      - debian:13
      - fedora:39
@@ -91,6 +92,14 @@ main ()
     #   docs_pdf=almalinux_docs_pdf.sh
     #   pip3=pip3_docs.sh
     #   ;;
+    "centos:stream9"*)
+      containerfile=Containerfile.stream
+      essential=centosstream_essential.sh
+      docs=centosstream_docs.sh
+      docs_pdf=tlmgr_docs_pdf.sh
+      pip3=pip3_docs.sh
+      repo=quay.io/centos
+      ;;
     # Missing python3-saneyaml
     # "debian:11"*|\
     "debian:12"*|\
@@ -135,9 +144,12 @@ main ()
       ;;
   esac
 
+  # Default to docker.io unless specified above
+  [ -z "$repo" ] && repo=docker.io
+
   $OCI build \
     --tag "yocto-docs-$sanitized_dockername:latest" \
-    --build-arg ARG_FROM="docker.io/$image" \
+    --build-arg ARG_FROM="$repo/$image" \
     --build-arg INCLUDE_ESSENTIAL_PACKAGES="${INCLUDE_ESSENTIAL_PACKAGES}" \
     --build-arg ESSENTIAL="host_packages_scripts/$essential" \
     --build-arg DOCS="host_packages_scripts/$docs" \
diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
index 65c526705..fd47fde34 100644
--- a/documentation/tools/containerfiles/Containerfile.dnf
+++ b/documentation/tools/containerfiles/Containerfile.dnf
@@ -7,6 +7,9 @@ ARG DOCS=fedora_docs.sh
 ARG DOCS_PDF=fedora_docs_pdf.sh
 ARG PIP3=pip3_docs.sh
 
+ENV TEXTOOLDIR=/opt/docs-build-tex-tools
+ENV PATH="$PATH:$TEXTOOLDIR/tl/bin/x86_64-linux"
+
 # relative to the location of the dockerfile
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
diff --git a/documentation/tools/containerfiles/Containerfile.stream b/documentation/tools/containerfiles/Containerfile.stream
new file mode 120000
index 000000000..7237e9b99
--- /dev/null
+++ b/documentation/tools/containerfiles/Containerfile.stream
@@ -0,0 +1 @@
+Containerfile.dnf
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/centosstream_docs.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
new file mode 100644
index 000000000..351f75893
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
@@ -0,0 +1 @@
+sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which wget
diff --git a/documentation/tools/host_packages_scripts/centosstream_essential.sh b/documentation/tools/host_packages_scripts/centosstream_essential.sh
new file mode 100644
index 000000000..e38fa93c2
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/centosstream_essential.sh
@@ -0,0 +1,5 @@
+sudo dnf install -y epel-release
+sudo yum install -y dnf-plugins-core
+sudo dnf config-manager --set-enabled crb
+sudo dnf makecache
+sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
new file mode 100644
index 000000000..727bf9e35
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
@@ -0,0 +1,7 @@
+textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
+mkdir -p "$textooldir"/tl
+wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz
+tar xzf "$textooldir"/install-tl-unx.tar.gz -C "$textooldir"
+"$textooldir"/install-tl-*/install-tl --scheme=small --texdir="${textooldir}"/tl --no-interaction
+PATH="$PATH:${textooldir}/tl/bin/x86_64-linux" tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex latexmk nimbus15
+rm -r "$textooldir"/install-tl*

-- 
2.51.0


