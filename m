Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7CFD41C18
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5429.1765443985805426038
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UVevp1PP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 524684E41B7B
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B3216068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484D8103C8E13;
	Thu, 11 Dec 2025 10:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a/2OLZ/cLrva9OslQQUeoq6xwDVCpR7ixP0WsrBo5Oc=;
	b=UVevp1PP20zOy0c82I8Qzvuq4MHg5wybXOoo4InPQPqOwMXQlVQgnIwk9+HTJ7d16JZ19C
	PQEcf041XyGaUKI0WeiG/NJQbLKdMe5vhnayRUDX0fLNFzZ7uu5AEJoldSWxBkyH+qlnR5
	6JmMdt4xZqRtkcC9Dw9f5Uk0eI9JzrRgZr4Bdf+vF65+nuOoVE3hCq8T8Dh8C9+kPWdOtn
	0oFhTNgClPF+sNcPHQSMHsv7jr1Sx5QJn7GhlofrdfJnPX/F064D9NX5QK99L+h3d8mKS3
	AWkwlML4/53ZWl/ZUS4h35ikXQpjQucmKuixmw7iL9kh/LV9xodsOuBbAaEIpw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 11 Dec 2025 10:06:17 +0100
Subject: [PATCH v2 4/5] ref-manual/system-requirements.rst: fix AlmaLinux
 PDF build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-build-docs-container-tlmgr-v2-4-58719c103a50@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6394;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tpTlK0gHOunIzYoiR1OTnVjgH43mxh+CSa9XaACfSZE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomMOCQGGFixjyLHmtqIwulM6m7yy47sOFn/a
 ZAKT/AcI7GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJjAAKCRDRgEFAKaOo
 NtIXEAClkXiCQBSnaSBBa2bUgw+38tcR5pJBtDZytdsaEzepZPKs4zBP0AVoK2fNnYCDTm+7zHx
 uNoGeHr5/urySyBtPzlDL/cFThCksBegXCKhMwY53SEHCZIvKLPFqbWCPc8SeRV3av+D9kb+GZX
 io4MRxO85nWHObk1Lp1TDwOKFehW3ZINn/cX4Ie2qbYsng6DOD/oKQbBbX55YpYzfqRTK0u2ZtG
 h4tSgdvszWNMA9n71vjV3yNmxrbuKuz/+lHFDM53GLFyoJ/bwqEBabEwVXNpjr81E4G/VAyonQy
 +mSLqxhUPfogaI7OhBft8yoxjq0fHmxkAsGdsGCP4pqv9QU+tfopHu1NqVl0B3dt7YTwK4uRker
 oPt6nAH1MuFkCDRGQCfa4JNXIRhhuP8ZjhoODqPDYQY4HdQnbmcKqZnCZEWbuNjqAwQ1irqroRB
 W5aS3KeZAfZ/ZhcAnP/u/jL1aD4bnNl24ImZFm0BZo/V1SmEnBelrUs6zkrHianjFBtxeUWML/P
 JuniNgh/6KNZSIfxY6GDr/+5JYjF4W7qFMC2p0Xv6igjrp7JXRF1ycW8g5fVNJSvjrSESVrJXq4
 uRT5AMUw4eFXAilCRsJNhNUzE7VkWuBarXESlnS9xl55ObQT4f/8RJgdDhhwRi4to+ZgJSzvSRN
 tRc1/iuO5HNFy4A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8246

Use the new tlmgr_docs_pdf.sh script in build-docs-container to fix
the build of the documentation PDF for AlmaLinux 8 and 9.

Fix the almalinux_essential.sh script to either enable powertools or crb
depending on the AlmaLinux version (powertools for 8, crb for 9). Pass
-y to dnf install command (otherwise stops when building the container).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst    | 21 +++++++++++++--------
 documentation/tools/build-docs-container            | 18 ++++++++++--------
 .../tools/containerfiles/Containerfile.almalinux    |  2 +-
 .../tools/host_packages_scripts/almalinux_docs.sh   |  2 +-
 .../host_packages_scripts/almalinux_docs_pdf.sh     |  1 -
 .../host_packages_scripts/almalinux_essential.sh    |  6 +++---
 6 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index e9d5012e3..4063253f7 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -253,18 +253,23 @@ Here are the packages needed to build Project documentation manuals:
 .. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
    :language: shell
 
+In addition to the previous packages, the following TeX Live packages
+are needed to build the documentation in PDF format and can be installed with
+the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
+
+.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
+   :language: shell
+
 .. warning::
 
-   Unlike Fedora or OpenSUSE, AlmaLinux does not provide the packages
-   ``texlive-collection-fontsextra``, ``texlive-collection-lang*`` and
-   ``texlive-collection-latexextra``, so you may run into issues. These may be
-   installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
+   The Tex Live installation above is only valid for `x86_64` hosts.
+
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages:
 
-In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format:
+.. code-block:: console
 
-.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
-   :language: shell
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
 
 CentOS Stream Packages
 ----------------------
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 0800c4333..9d1bfdcdf 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -33,6 +33,8 @@ $0 OCI_IMAGE [make arguments...]
 
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
+     - almalinux:8
+     - almalinux:9
      - centos:stream9
      - debian:12
      - debian:13
@@ -84,14 +86,14 @@ main ()
   version=$(echo "$image" | awk -F: '{print $NF}')
 
   case $image in
-    # Missing latexmk texlive-gnu-freefont packages at the very least
-    # "almalinux:8"*|\
-    # "almalinux:9"*)
-    #   containerfile=Containerfile.almalinux
-    #   docs=almalinux_docs.sh
-    #   docs_pdf=almalinux_docs_pdf.sh
-    #   pip3=pip3_docs.sh
-    #   ;;
+    "almalinux:8"*|\
+    "almalinux:9"*)
+      containerfile=Containerfile.almalinux
+      essential=almalinux_essential.sh
+      docs=almalinux_docs.sh
+      docs_pdf=tlmgr_docs_pdf.sh
+      pip3=pip3_docs.sh
+      ;;
     "centos:stream9"*)
       containerfile=Containerfile.stream
       essential=centosstream_essential.sh
diff --git a/documentation/tools/containerfiles/Containerfile.almalinux b/documentation/tools/containerfiles/Containerfile.almalinux
index 7237e9b99..5430d17dc 120000
--- a/documentation/tools/containerfiles/Containerfile.almalinux
+++ b/documentation/tools/containerfiles/Containerfile.almalinux
@@ -1 +1 @@
-Containerfile.dnf
\ No newline at end of file
+Containerfile.stream
\ No newline at end of file
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs.sh b/documentation/tools/host_packages_scripts/almalinux_docs.sh
index 8188d529a..dfb201fe2 100644
--- a/documentation/tools/host_packages_scripts/almalinux_docs.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_docs.sh
@@ -1 +1 @@
-sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
+sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which wget
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh b/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
deleted file mode 100644
index 8341eb8c2..000000000
--- a/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
+++ /dev/null
@@ -1 +0,0 @@
-sudo dnf install latexmk texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-tex-gyre texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
index 76c5280ee..9564bb4fe 100644
--- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -1,5 +1,5 @@
 sudo dnf install -y epel-release
-sudo yum install dnf-plugins-core
-sudo dnf config-manager --set-enabled crb
+sudo yum install -y dnf-plugins-core
+sudo dnf config-manager --set-enabled crb || sudo dnf config-manager --set-enabled powertools
 sudo dnf makecache
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd

-- 
2.51.0


