Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA418D44175
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9857.1765534960665635058
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1ORxr2Bb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2B2F41A212D
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F15A8606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69506103C8E16;
	Fri, 12 Dec 2025 11:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HL1SmOBa3KHbAcumIqoWq8ntd42ta5T/jZ1I6N6ftRQ=;
	b=1ORxr2Bb4sKkpsVPEejCtvcq0sz3IR05dgBQWNakftPGFsh8Cc+UMvRLRYuOBrGv08K6mR
	fvsi3wF9I2CK33B6FoKhL0nCIWhHJVbhvnhMRHqyK7MyMveXereW9yh2+0NkAj41wSDh/r
	a0/jzgn8fO7fl4GEIpKLFn/xXYG2dE7AaGo4RvNzHZATBGmXFJW3DvT4QK9u6hGXM6qKLJ
	qJjJBCkn1FfEDMrguwIafsYps0c7J2sdgKDjfwz19pP2lsy+9vhOLVt26LebmnYjthyBkv
	9QXxGIUmOvNwSDky/iSoBlggDRDPZ7OwKYxjz33A0JzkE4AvuuM7Uce5xSzFUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 12 Dec 2025 11:22:26 +0100
Subject: [PATCH v3 4/5] ref-manual/system-requirements.rst: fix AlmaLinux
 PDF build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-build-docs-container-tlmgr-v3-4-a45c1ce6d8f7@bootlin.com>
References: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
In-Reply-To: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5462;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/njpRan4D1Mw8PsyMMk4bEjl9TXfxRYCY6PhN5bDds4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zqyfDeN3RdqWpVPbUgglh2GalV2nX4xMDhe
 IXxXsprh7eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6gAKCRDRgEFAKaOo
 NnxWEACJpQyPxfrGlR792NnZhc/LGjLfFaJNvOahaWHFTkwCn74oh5/k+IeecEbazQUSAS+iVGA
 5SqT/r5XqS7jEYO+7J5ErYDnQT4vVhpj0GVEw7TgtyMHx5PeKjCJEbadQTDr3+SbhRJ7nFxVA5M
 E7W4jwvrH7x5PbPRR3FlJEFbH6dU9fiQhkULz4NTbpinswGf1TfJ8Pyb0xJ0A3+k4u6iD3yRaA1
 wge0ybtYNt4VFu6wdDewXgmRK68ihmMsp8NkHMVsosNO9WMFfLsLjPfD6JS6VWTrGGaoUUtlvKY
 E2pReY8fww9TpSCWGNAhLMrQUxK96flHnkhzpZCa0US44clvS4+Wk04khInJ/El1T8VVstJKJ9E
 hiGoBAW3CcaYI/rVhoA1kz45FL67WDWA/N6LScNUzFXZ9dtBAUbz4uaHFe6WLSKk5sIqvgOS+OK
 UFY37En70wJobOtLx+YZio1jqsgJvgoutIv99BdNRLaE/HGPS6SLJ2G6FeEvGTYKIEKPyt1GjuZ
 Bk+EuugYJ/YXFs25mbF7O+uKSF8qbgcBUbd+2VSxh47RVMmuvBtxl1Hn3F8RF0xYOvFlV5x5q0Z
 c3oSmm6/bzPUeOsDQQcghD/F7iXD4kvpDiCgrmfDUiFjmuwShlNCd2Tclt2JCS7cdgsfx9jqhrQ
 NJlP/SIm9OLptOg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8262

Use the new tlmgr_docs_pdf.sh script in build-docs-container to fix
the build of the documentation PDF for AlmaLinux 8 and 9.

Fix the almalinux_essential.sh script to either enable powertools or crb
depending on the AlmaLinux version (powertools for 8, crb for 9).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst   | 22 ++++++++++++++--------
 documentation/tools/build-docs-container           | 18 ++++++++++--------
 .../tools/containerfiles/Containerfile.almalinux   |  2 +-
 .../host_packages_scripts/almalinux_docs_pdf.sh    |  1 -
 .../host_packages_scripts/almalinux_essential.sh   |  2 +-
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 7d110b886..b41295c4b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -253,18 +253,24 @@ Here are the packages needed to build Project documentation manuals:
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
 
-In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format:
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages (with ``${textooldir}`` pointing to the TeX Live installation from the
+previous step):
 
-.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
-   :language: shell
+.. code-block:: console
+
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
 
 CentOS Stream Packages
 ----------------------
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 6a83faea6..6a33b9068 100755
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
@@ -87,14 +89,14 @@ main ()
   local repo=docker.io
 
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
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh b/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
deleted file mode 100644
index 8341eb8c2..000000000
--- a/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
+++ /dev/null
@@ -1 +0,0 @@
-sudo dnf install latexmk texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-tex-gyre texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
index 18fdb674e..14d18e758 100644
--- a/documentation/tools/host_packages_scripts/almalinux_essential.sh
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -1,5 +1,5 @@
 sudo dnf install -y epel-release
 sudo dnf install -y dnf-plugins-core
-sudo dnf config-manager --set-enabled crb
+sudo dnf config-manager --set-enabled crb || sudo dnf config-manager --set-enabled powertools
 sudo dnf makecache
 sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd

-- 
2.51.0


