Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952F9D32D9A
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7465.1764946299678272310
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q087tOmJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9657EC1964C
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11BAD606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05EAE102F06E6;
	Fri,  5 Dec 2025 15:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LhXaasvnSgCFQ5CtevmnFtKA0Gu7eDZHG6I1p9ehUfE=;
	b=Q087tOmJTHjgAZJmW1bKWGPbuQPt7l4mxC/p0mAbgACz1DZip6kduWHNhysvACj4Wr1KNc
	UsSPSKC5C6EpmVtyjtcRteL5SPee550MQc2vjoEV5iaoYP4xOfj/kgljwq9zYAciTf2uIE
	RW2y6bPRnMjokkx6bDVpHP1U0O7BKQieH9xQE4YYD7HM8n3AJhGtEkJMDBmMdChWKDBQkx
	pllq/3gUiKhuaouEnHjLS9O4uIAqI6qNUjly2XqIRob9mmYhY6HnSt5pngtFRBZXNgXNIQ
	pvt5yR2ksHWRQhWRTwk0n1XMANVewydQ49/nZrP0sFUYQbOFrrRzze4oGxYSfw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Dec 2025 15:51:26 +0100
Subject: [PATCH 3/5] tools/build-docs-container: add CentOS Stream 9
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-build-docs-container-tlmgr-v1-3-de30623e664d@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10588;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RPPS5y2iTzmULdsk47v3znHLzCehq0Oj9+FMs+Cnkxo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF14f4GQ1bfFAayvo57anp8+8ypHCEWEDzE1
 L0if1fqro6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdQAKCRDRgEFAKaOo
 Nkv4EADFSg69ecBf7Wz6Hcm9T1GxdISe0xQvqmhay1GibgcOswvxDjonN6S7y/CIOftwInrUUE9
 kmhch3ObH0ELXhcqxh9jISFpAyoeqOiGgb2wyAxQAserap8jm5XpeJ2Lxo2JiU4/8b8QWxlnH2o
 ymypxnP3hooX1JQxZcH6AS4adaOago3VU4uuTx5YHJqHynLiuBiWgeC934t7Qf46QbihHj72pwj
 Zclcv3We6tt6ausBnJ/cARmGpFGJjULDF1KIJJS2EKGbbVFtAWW+8QxWyHyNCX316dlZlZgdnfR
 NbTKK/Xyb3UHAtkbZdKoI1lSeIKeHJKL49+GEkBVEkYNS2E6ea/GWbn8ZrZSRfz4XtvneCE5Run
 jV6aGpJLeLaMMEQhA4384djMB8aZaEprOnOf6GrJMYS28qtigfVpKRL3MOmwmZn5ARWbvxqVtoC
 DO3fnpdujqFPxviCkxnhyjcSaz0Rmbz6bXXGXbF0BdzgnKfXWZ0y4Z6T3+RonhI0+WPcKammAxt
 dzlK8SnSf+Sc1tEhPQQruLjGZmFnVnE5ddGT/+X+caaD3wf/sCkeKBll2+AZDUsF2CZSB3AOqUl
 TH5MuGnYc4WZESYRuSZPQ7SRzz9WQ85Eocn+HKhGB2qPu3aaIpbZS1Urwf5fj4UyqHG4eLyH0NH
 +4vMptEEj/jlOFA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8230

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
 documentation/ref-manual/system-requirements.rst   | 31 ++++++++++++++++++++
 documentation/tools/build-docs-container           |  9 ++++++
 .../tools/containerfiles/Containerfile.apt         |  5 +++-
 .../tools/containerfiles/Containerfile.dnf         |  5 +++-
 .../tools/containerfiles/Containerfile.stream      | 34 ++++++++++++++++++++++
 .../tools/containerfiles/Containerfile.zypper      |  5 +++-
 documentation/tools/containerfiles/entrypoint      |  6 ++++
 .../host_packages_scripts/centosstream_docs.sh     |  1 +
 .../centosstream_essential.sh                      |  5 ++++
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |  7 +++++
 10 files changed, 105 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9ed29a1df..02b6a0cb9 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -266,6 +266,37 @@ documentation in PDF format:
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
index 7d25b15b9..d753e2153 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -41,6 +41,7 @@ $0 OCI_IMAGE [make arguments...]
      - fedora:42
      - leap:15.5
      - leap:15.6
+     - tgagor/centos:stream9
      - ubuntu:22.04
      - ubuntu:24.04
      - ubuntu:25.04
@@ -119,6 +120,13 @@ main ()
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
+    "tgagor/centos:stream9"*)
+      containerfile=Containerfile.stream
+      essential=centosstream_essential.sh
+      docs=centosstream_docs.sh
+      docs_pdf=tlmgr_docs_pdf.sh
+      pip3=pip3_docs.sh
+      ;;
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*|\
     "ubuntu:25.04"*|\
@@ -143,6 +151,7 @@ main ()
     --build-arg DOCS="host_packages_scripts/$docs" \
     --build-arg DOCS_PDF="host_packages_scripts/$docs_pdf" \
     --build-arg PIP3="host_packages_scripts/${pip3:-}" \
+    --build-arg ENTRY="containerfiles/entrypoint" \
     --file "$SCRIPT_DIR/containerfiles/$containerfile" \
     "$SCRIPT_DIR"
 
diff --git a/documentation/tools/containerfiles/Containerfile.apt b/documentation/tools/containerfiles/Containerfile.apt
index a573786f0..c3e1660a6 100644
--- a/documentation/tools/containerfiles/Containerfile.apt
+++ b/documentation/tools/containerfiles/Containerfile.apt
@@ -5,6 +5,7 @@ ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=ubuntu_essential.sh
 ARG DOCS=ubuntu_docs.sh
 ARG DOCS_PDF=ubuntu_docs_pdf.sh
+ARG ENTRY=entrypoint
 
 ENV DEBIAN_FRONTEND=noninteractive
 ARG TZ=Europe/Vienna
@@ -26,5 +27,7 @@ RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
 
 RUN git config --global --add safe.directory /docs
 
-ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+COPY --chmod=777 $ENTRY /entrypoint
+
+ENTRYPOINT ["/entrypoint"]
 CMD ["publish"]
diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
index 65c526705..d00bb5adc 100644
--- a/documentation/tools/containerfiles/Containerfile.dnf
+++ b/documentation/tools/containerfiles/Containerfile.dnf
@@ -6,6 +6,7 @@ ARG ESSENTIAL=fedora_essential.sh
 ARG DOCS=fedora_docs.sh
 ARG DOCS_PDF=fedora_docs_pdf.sh
 ARG PIP3=pip3_docs.sh
+ARG ENTRY=entrypoint
 
 # relative to the location of the dockerfile
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
@@ -25,5 +26,7 @@ RUN dnf update -y \
 
 RUN git config --global --add safe.directory /docs
 
-ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+COPY --chmod=777 $ENTRY /entrypoint
+
+ENTRYPOINT ["/entrypoint"]
 CMD ["publish"]
diff --git a/documentation/tools/containerfiles/Containerfile.stream b/documentation/tools/containerfiles/Containerfile.stream
new file mode 100644
index 000000000..5968f94ba
--- /dev/null
+++ b/documentation/tools/containerfiles/Containerfile.stream
@@ -0,0 +1,34 @@
+ARG ARG_FROM=fedora:40 # default value to avoid warning
+FROM $ARG_FROM
+
+ARG INCLUDE_ESSENTIAL_PACKAGES=0
+ARG ESSENTIAL=fedora_essential.sh
+ARG DOCS=fedora_docs.sh
+ARG DOCS_PDF=fedora_docs_pdf.sh
+ARG PIP3=pip3_docs.sh
+ARG ENTRY=entrypoint
+
+ENV TEXTOOLDIR=/opt/docs-build-tex-tools
+
+# relative to the location of the dockerfile
+COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
+COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
+COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
+
+RUN dnf update -y \
+ && dnf install -y sudo \
+ && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
+ && yes | /temp/host_packages_docs.sh \
+ && yes | /temp/host_packages_docs_pdf.sh \
+ && yes | /temp/pip3_docs.sh \
+ && dnf autoremove -y \
+ && dnf clean all -y \
+ && rm -rf /temp
+
+RUN git config --global --add safe.directory /docs
+
+COPY --chmod=777 $ENTRY /entrypoint
+
+ENTRYPOINT ["/entrypoint"]
+CMD ["publish"]
diff --git a/documentation/tools/containerfiles/Containerfile.zypper b/documentation/tools/containerfiles/Containerfile.zypper
index 3850b9ff9..d7302ef6f 100644
--- a/documentation/tools/containerfiles/Containerfile.zypper
+++ b/documentation/tools/containerfiles/Containerfile.zypper
@@ -6,6 +6,7 @@ ARG ESSENTIAL=opensuse_essential.sh
 ARG DOCS=opensuse_docs.sh
 ARG DOCS_PDF=opensuse_docs_pdf.sh
 ARG PIP3=pip3_docs.sh
+ARG ENTRY=entrypoint
 
 # relative to the location of the dockerfile
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
@@ -32,5 +33,7 @@ RUN zypper update -y \
 
 RUN git config --global --add safe.directory /docs
 
-ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
+COPY --chmod=777 $ENTRY /entrypoint
+
+ENTRYPOINT ["/entrypoint"]
 CMD ["publish"]
diff --git a/documentation/tools/containerfiles/entrypoint b/documentation/tools/containerfiles/entrypoint
new file mode 100644
index 000000000..97ee93c29
--- /dev/null
+++ b/documentation/tools/containerfiles/entrypoint
@@ -0,0 +1,6 @@
+#!/usr/bin/env sh
+
+tldir=/opt/docs-build-tex-tools/tl/bin/x86_64-linux
+[ -d $tldir ] && export PATH="$PATH:$tldir"
+
+make -C documentation/ "$@"
diff --git a/documentation/tools/host_packages_scripts/centosstream_docs.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
new file mode 100644
index 000000000..9202afc5b
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
@@ -0,0 +1 @@
+sudo dnf install -y git glibc-locale-source librsvg2-tools make python3-pip which
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
index 000000000..f3b81da3e
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
@@ -0,0 +1,7 @@
+textooldir=${TEXTOOLDIR:-"./docs-build-tex-tools"}
+mkdir -p "$textooldir"/tl
+wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O "$textooldir"/install-tl-unx.tar.gz
+zcat < "$textooldir"/install-tl-unx.tar.gz | tar xf - -C "$textooldir"
+"$textooldir"/install-tl-*/install-tl --scheme=small --texdir="${textooldir}"/tl --no-interaction
+PATH="$PATH:${textooldir}/tl/bin/x86_64-linux" tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex latexmk nimbus15
+rm -r "$textooldir"/install-tl*

-- 
2.51.0


