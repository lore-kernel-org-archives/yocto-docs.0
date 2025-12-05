Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F34DD32D95
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7373.1764946300151785006
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FL/jPGqw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 26E00C1964D
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A89C606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 015B8102F0A9D;
	Fri,  5 Dec 2025 15:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t0YOJurztN4qft2cQ9yrAhsPza3ZNDVGraIG13o/cIU=;
	b=FL/jPGqwCWPon7D5JnblFsFfXfbtKkfCWs+VWX2VqILH1Uo2D9W96qUbPUeCoZn227KwXx
	S4V0gpV5gi8a1AbM5KSJMjTOBwZFhrbv6eMeRK6Np150iveDSUrNceKMJK1pgcqrSZtBp2
	N/vbC2HodJJJ1zM7zM4PlNaU7ii60NK0lQsMcvqS/jN72bVKe9KUnuS7/B2KgcgH8FcHcx
	hOZbEu8UOJQTSgWdRMm4vre1teh2Ru3yXUu2D65yZ09LHrcFrWmXb+SIqld5ACg6O/LYlQ
	1Fx4OQ4Vb7iCfBuuO0uD5eF9gAv/p/+zniymwPRZlYOhzkRprmyd67Cp3CZ2Hg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Dec 2025 15:51:27 +0100
Subject: [PATCH 4/5] ref-manual/system-requirements.rst: fix AlmaLinux PDF
 build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-build-docs-container-tlmgr-v1-4-de30623e664d@bootlin.com>
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
In-Reply-To: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5738;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=n1VK1V2q6fFK9sGxRZ5rR/vumwzXpaGzmJOguuF43jg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF1kUD0RK0ccVZ9p/pbI20KGYT+ukp/NQ/IV
 fl3/skLh0+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdQAKCRDRgEFAKaOo
 NkhdD/9rk7+vQogsTDtWEDNweT8ewCx9UaNhoiLqPkJNGX7xpPhg5j+VFKqMHO5n/g8zmbFhy2a
 tfRrGS2p4jL7J796voz83T7g8/FqCtasxJSsT/kRG6FtR7e4Pn0LpgRozjLcprkHHJRp1bMRlyi
 AFWlID2u6LIpytyhpcDh1ya5pJVtHpnuoUigegjk0eYwfE3CgiBGbXeeQRV7dNdAZ7dhNTuZzXX
 nei4pgtdnFdgQ7crM3hE2SZ2Nt4/H0skLklB7yGNFUd4HV/XfeaKIwoRxi7xMYTkXFeRjeGEtIi
 FECFhy3xGsBdP1yd244y7llKsE7C6tx5rkMdd8xvtuLbjX7i70nKZAh1sszNX+zE47ALgKpd6bS
 RUair6+qTggb87mcC+DZ/bdMDRo0sb52rqnwo9a7kSza8iQVUIAB3mn4Uds+kZhTx9VD5Og4Yxa
 N1SWQtRPrQFn4u6pZXyYWqvQWQ/+Jp8FMJ10E6UyTLc+J2IRIDeIFlbU1+qDaMQD2eGNyLBM3ij
 KweJvs/jsUBK3+KjifMvaQd9nRd9bDzDXHUHNqLr28EADAJ0sE59JR0EPKcfNMQ9F8nEDe1FGUp
 10z37GbKSpKCNxw2+vzHNllU1FE9LY0tOc0+xw9a0ApEABu4h0zo/6aSM/4EBsvy7QFPP1psSKu
 OxvoMAYt7iBHwDA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8231

Use the new tlmgr_docs_pdf.sh script in build-docs-container to fix
the build of the documentation PDF for AlmaLinux 8 and 9.

Fix the almalinux_essential.sh script to either enable powertools or crb
depending on the AlmaLinux version (powertools for 8, crb for 9). Pass
-y to dnf install command (otherwise stops when building the container).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst      | 19 ++++++++++---------
 documentation/tools/build-docs-container              | 18 ++++++++++--------
 .../tools/containerfiles/Containerfile.almalinux      |  2 +-
 .../tools/host_packages_scripts/almalinux_docs_pdf.sh |  1 -
 .../host_packages_scripts/almalinux_essential.sh      |  6 +++---
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 02b6a0cb9..af102ce98 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -253,18 +253,19 @@ Here are the packages needed to build Project documentation manuals:
 .. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
    :language: shell
 
-.. warning::
+In addition to the previous packages, the following TeX Live packages
+are needed to build the documentation in PDF format and can be installed with
+the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
 
-   Unlike Fedora or OpenSUSE, AlmaLinux does not provide the packages
-   ``texlive-collection-fontsextra``, ``texlive-collection-lang*`` and
-   ``texlive-collection-latexextra``, so you may run into issues. These may be
-   installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
+.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
+   :language: shell
 
-In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format:
+Before building the documentation PDF, setup the ``PATH`` to use the installed
+packages:
 
-.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
-   :language: shell
+.. code-block:: console
+
+   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
 
 CentOS Stream Packages
 ----------------------
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index d753e2153..d61ba5d4c 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -33,6 +33,8 @@ $0 OCI_IMAGE [make arguments...]
 
    OCI_IMAGE is an image:tag of an OCI image hosted on hub.docker.com. It is one
    of:
+     - almalinux:8
+     - almalinux:9
      - debian:12
      - debian:13
      - fedora:39
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
     # Missing python3-saneyaml
     # "debian:11"*|\
     "debian:12"*|\
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


