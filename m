Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA82FEEC2B5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:33:04 +0000 (UTC)
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24392.1771950778916101292
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 08:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=WTl4gjY9;
 spf=pass (domain: 0leil.net, ip: 45.157.188.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fL3DT29Z0zfsJ;
	Tue, 24 Feb 2026 17:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771950777;
	bh=6dNsCMOiJRiigo0ZKnmpc3wIHjKRuCY7d/l8YwVSxnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WTl4gjY9a/Va32t1mB9P3kE2cku9Cj2uIbZmWH/Cpl1GZ1kAP/bolq4dshR35wL2I
	 DH7sY2aAaCIig5T28Gn0C2u7TOC7w/FLudxYYcnZr+EQ2+mqXuX827iKMQNlNo++Y0
	 womgJ0i0UijgxRe+qSau5c1v3Tyk1W20vgitaXY+NLkPHMQEsHLk3JPc9MsCrP/a9R
	 g3ymTuUzz365Hpo+bxV3kNo0tiZByfgy422geqiUEEPFF9toMNfjDHdq53bHBZkxAH
	 mrEQNaycjsH0aWbDapUMLv0LVnvpv/leSHxIqwXi/K0poA1D1NV65jeJ8cId4zsT0g
	 3AvatAF/6iazQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fL3DS5q7MzYMl;
	Tue, 24 Feb 2026 17:32:56 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Feb 2026 17:32:38 +0100
Subject: [PATCH v5 3/4] consistently use pip packages for all distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-fix-make-multi-target-v5-3-7ebf281618b4@cherry.de>
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
In-Reply-To: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 16:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8980

From: Quentin Schulz <quentin.schulz@cherry.de>

Until now, Debian and Ubuntu had special instructions for installing
Python packages to build the docs. Specifically, the packages that all
other distros are installing via pip were installed from the package
feed (apt).

In the next commit, a new Python module will be required, which isn't
available in the package feed. We thus have two options, have a pip3
Debian/Ubuntu-specific set of instructions to install this one package,
or migrate packages currently installed through the package manager to
use pip like other distros. To lower maintenance burden and the
possibility of missing to update both "generic" and "Debian/Ubuntu"
variants of pip instructions, the latter was chosen.

Suggested-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/system-requirements.rst         |  3 +++
 documentation/tools/build-docs-container                 |  4 +++-
 documentation/tools/containerfiles/Containerfile.apt     | 14 ++++++++++++++
 documentation/tools/host_packages_scripts/ubuntu_docs.sh |  2 +-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index f9f32f2a8..e7c1c3916 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -171,6 +171,9 @@ Here are the packages needed to build Project documentation manuals:
 .. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs.sh
    :language: shell
 
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
+
 In addition to the previous packages, here are the packages needed to build the
 documentation in PDF format:
 
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 23c3dfe33..f2f54044c 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -115,6 +115,7 @@ main ()
       essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
+      pip3=pip3_docs.sh
       ;;
     "fedora:39"*|\
     "fedora:40"*|\
@@ -151,6 +152,7 @@ main ()
       essential=ubuntu_essential.sh
       docs=ubuntu_docs.sh
       docs_pdf=ubuntu_docs_pdf.sh
+      pip3=pip3_docs.sh
       ;;
     *)
       echo "$image not supported!"
@@ -166,7 +168,7 @@ main ()
     --build-arg ESSENTIAL="host_packages_scripts/$essential" \
     --build-arg DOCS="host_packages_scripts/$docs" \
     --build-arg DOCS_PDF="host_packages_scripts/$docs_pdf" \
-    --build-arg PIP3="host_packages_scripts/${pip3:-}" \
+    --build-arg PIP3="host_packages_scripts/$pip3" \
     --file "$SCRIPT_DIR/containerfiles/$containerfile" \
     "$SCRIPT_DIR"
 
diff --git a/documentation/tools/containerfiles/Containerfile.apt b/documentation/tools/containerfiles/Containerfile.apt
index a573786f0..7ee168be1 100644
--- a/documentation/tools/containerfiles/Containerfile.apt
+++ b/documentation/tools/containerfiles/Containerfile.apt
@@ -1,10 +1,22 @@
 ARG ARG_FROM=debian:12 # default value to avoid warning
 FROM $ARG_FROM
 
+# RUN . ./yocto-docs-venv/bin/activate doesn't work because env variables set
+# in RUN don't persist, so set up the virtualenv manually ahead of time.
+# Unsetting env variables in Containerfile is difficult, so we hope it works
+# fine without doing that for PYTHONHOME (see activate script content).
+# Note that the actual location depends on WORKDIR at this layer in the
+# container, and it must match the pwd when pip3_docs.sh is run in a later
+# layer. This *must* be outside of any mount point otherwise it won't be
+# available within the container.
+ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
+ENV PATH="$VIRTUAL_ENV/bin:$PATH"
+
 ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=ubuntu_essential.sh
 ARG DOCS=ubuntu_docs.sh
 ARG DOCS_PDF=ubuntu_docs_pdf.sh
+ARG PIP3=pip3_docs.sh
 
 ENV DEBIAN_FRONTEND=noninteractive
 ARG TZ=Europe/Vienna
@@ -13,6 +25,7 @@ ARG TZ=Europe/Vienna
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
 
 RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
  && apt-get update \
@@ -20,6 +33,7 @@ RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
  && if [ "$INCLUDE_ESSENTIAL_PACKAGES" = "1" ]; then yes | /temp/host_packages_essential.sh; fi \
  && yes | /temp/host_packages_docs.sh \
  && yes | /temp/host_packages_docs_pdf.sh \
+ && yes | /temp/pip3_docs.sh \
  && apt-get --yes autoremove \
  && apt-get clean \
  && rm -rf /temp
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index c322b61e4..db0743021 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-sphinx-rtd-theme python3-sphinx-copybutton sphinx
+sudo apt install git librsvg2-bin locales make python3-saneyaml python3-pip python3-venv

-- 
2.53.0


