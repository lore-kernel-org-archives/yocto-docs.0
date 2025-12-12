Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF44D44173
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9856.1765534960232795988
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=N/MqoJ+S;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B37001A212C
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84053606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8B0A103C8E14;
	Fri, 12 Dec 2025 11:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AUIas95Ri7YpHbtGxMfh/MZymqYe7a744yQXIGgMq7s=;
	b=N/MqoJ+StVsUK2wOseGe3J9eiORh7RabFFCGPyfpWrgxMe6KeAZ+gclKPuLi6HUkNWFEzi
	5AtmkNmdEFOFZAcG4h12seoaXKxEotQizzn/2+h8YjvCP6yhJdgfeLKDxvFkA05ZW7hCZH
	OHVlHWRp8Fv7wBoNafMaxINC2yXzpVgkL9Z0a6Q1HzaHyZEoiHDu9wnIksebVtVY8ZXwMS
	3WZUah0EjvHMGMK8/oKtuzKlg882fKVVBDfdxxga86PQLSP1C4VCYhadkoCUh8OP8kbMaB
	YClCsUNSSrKuT8vx/aIao6vFt1z2hyS2/bexTM0uFAznfBF9nlZNxAY2TdMmIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:25 +0100
Subject: [PATCH v3 3/5] tools/build-docs-container: add CentOS Stream 9
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-build-docs-container-tlmgr-v3-3-a45c1ce6d8f7@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9033;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3Axn5LIXACxiXttXFXfbZtii8uT+GFUbtYb+GqMWHfQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zqI4PWNR/ZnSVg7R7XA64khAoO2iTINWrtS
 W0Msn7Ixc6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6gAKCRDRgEFAKaOo
 NonaD/0SYZ1fMd3AH2cDUuJW+q3whqGpBuL5ERg0dquJ3atfCOZlHU0E5D63cx05mKzKz7MQNuT
 x12U34E5QPkg+ZpczsH2prG/6S7Rx/BlMaXj4qvH9XYeutjFMNL31Fq94ilZsqs42iSK14mY4s+
 65lSxmkoOlET/BO+RzDv/NKyrqpKHqOFmq4F3KLsEwSO1mxA3O9u53Rs2ESJr4fgJr6dyfHNdOF
 3p7JTi3q4psHwWN+ITChY40cTn0Rmygm94ytdn/MVz1WchMVPyQX6PS5qZuYw6NAh7F2vBaq+/f
 jK7haYs/REmi3SUwO8P+f/J0OLOSfk6HcT4WS4Pp6rJTVGSHAesbPolm8n1lxXt2x8us9MjcIls
 4v8FYF/t8yNUq0iob/dSRVaeIJDB2reomZXEFLfjhjwof/kchd93iHa2HjqkR6Ov1s/djHSiH52
 t460VVx03fmlBZQj9YkALWhgIDIYu6x+E41TNh/B4i4DMnLqh6USio9a8aSXvDCl4j02brM5YeM
 FrX3/SkNN+hQ5wx8KGz1W5vSp5AX+O4cUjvoMWjxc8A6YrxDcxq5OVXwqcq+C/QovrwBTyQCBnT
 bvHJC2dwevtwMYFFCwNM3d7pFpJqafj4BxA2PgUYWhE/iHflUoTctBobVFrxlLgOnqyymMbj32O
 UACCFgQ1PMfmEcw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8261

Add support for building the docs in CentOS Stream 9. Use RedHat's
container image from quay.io.

The centosstream_essential.sh centosstream_docs.sh are symlinks to the
almalinux scripts. Just pass -y to each dnf command as it was a problem
when building the CentOS container, and isn't a problem for AlmaLinux.

Introduce a new installation script: tlmgr_docs_pdf.sh. As I wasn't able
to locate all the necessary tex packages to build the documentation in a
PDF format, I resorted to using what is used on the Autobuilder: a local
installation of texlive packages through tlmgr.

This will allow us to provide a way of building the docs as PDF for the
distros that lack this support at the moment.

Export TEXTOOLDIR in Containerfile.dnf to pick up TexLive's installation
when available.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 36 ++++++++++++++++++++++
 documentation/tools/build-docs-container           | 14 ++++++++-
 .../tools/containerfiles/Containerfile.dnf         |  3 ++
 .../tools/containerfiles/Containerfile.stream      |  1 +
 .../tools/host_packages_scripts/almalinux_docs.sh  |  2 +-
 .../host_packages_scripts/almalinux_essential.sh   |  4 +--
 .../host_packages_scripts/centosstream_docs.sh     |  1 +
 .../centosstream_essential.sh                      |  1 +
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |  8 +++++
 9 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9ed29a1df..7d110b886 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -266,6 +266,42 @@ documentation in PDF format:
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
+packages (with ``${textooldir}`` pointing to the TeX Live installation from the
+previous step):
+
+.. code-block:: console
+
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 7d25b15b9..6a83faea6 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -33,6 +33,7 @@ $0 OCI_IMAGE [make arguments...]
 
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
+     - centos:stream9
      - debian:12
      - debian:13
      - fedora:39
@@ -82,6 +83,9 @@ main ()
   local version
   version=$(echo "$image" | awk -F: '{print $NF}')
 
+  # Default to docker.io unless overwritten below
+  local repo=docker.io
+
   case $image in
     # Missing latexmk texlive-gnu-freefont packages at the very least
     # "almalinux:8"*|\
@@ -91,6 +95,14 @@ main ()
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
@@ -137,7 +149,7 @@ main ()
 
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
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs.sh b/documentation/tools/host_packages_scripts/almalinux_docs.sh
index 8188d529a..9202afc5b 100644
--- a/documentation/tools/host_packages_scripts/almalinux_docs.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_docs.sh
@@ -1 +1 @@
-sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
+sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
index 76c5280ee..18fdb674e 100644
--- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -1,5 +1,5 @@
 sudo dnf install -y epel-release
-sudo yum install dnf-plugins-core
+sudo dnf install -y dnf-plugins-core
 sudo dnf config-manager --set-enabled crb
 sudo dnf makecache
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/centosstream_docs.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
new file mode 120000
index 000000000..be13734c0
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
@@ -0,0 +1 @@
+almalinux_docs.sh
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/centosstream_essential.sh b/documentation/tools/host_packages_scripts/centosstream_essential.sh
new file mode 120000
index 000000000..ed172e51d
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/centosstream_essential.sh
@@ -0,0 +1 @@
+almalinux_essential.sh
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
new file mode 100644
index 000000000..b33ff6b25
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
@@ -0,0 +1,8 @@
+sudo dnf install -y wget
+textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
+mkdir -p "$textooldir"/tl
+wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz
+tar xzf "$textooldir"/install-tl-unx.tar.gz -C "$textooldir"
+"$textooldir"/install-tl-*/install-tl --scheme=small --texdir="${textooldir}"/tl --no-interaction
+PATH="$PATH:${textooldir}/tl/bin/x86_64-linux" tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex latexmk nimbus15
+rm -r "$textooldir"/install-tl*

-- 
2.51.0


