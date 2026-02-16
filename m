Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F2BE7BD9F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:27:11 +0000 (UTC)
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17723.1771241225185653923
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=V3tP3Nl6;
 spf=pass (domain: 0leil.net, ip: 185.125.25.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fF0qC29qyzJmf;
	Mon, 16 Feb 2026 12:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771241223;
	bh=jNhGpIZwih6MFWK4Me4aEhcq6Hct3Kg2vKKsKlLxijg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V3tP3Nl63CpzRS3rP8jANCSo7O6twpnMqX0HnWIas8SlcKu37lb/nkAUt0/th8kVV
	 9BpaPzU5J+Y9U5DTpdKK8YuSP5H4MkP1lqtK77qx4GHtbuw4mxxAF18ZfrUmUVsx9u
	 1HHJr2RT92I0k9VL3Fv9SV2ka1LNhfhqWAbu9g0LnJYFx28c8qmmsoRXk42oqlM1K2
	 U08ZTA/S5yJT4aekjzBwsmPOydiIPauV/PIR1So4Urp64CYbMl9anYaIW4e2dA9dKq
	 456g0vTazj822ii2f3XKclUM1nyG112iz16UIRTSXnFkWfegbwSXsbcSwHHv8s738V
	 dCxhyTDMzCiVw==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fF0qB61WHzB3B;
	Mon, 16 Feb 2026 12:27:02 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 16 Feb 2026 12:26:54 +0100
Subject: [PATCH v4 2/3] consistently use pip packages for all distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-fix-make-multi-target-v4-2-749e588cb7f5@cherry.de>
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
In-Reply-To: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8926

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
 documentation/tools/containerfiles/Containerfile.apt     | 10 ++++++++++
 documentation/tools/host_packages_scripts/ubuntu_docs.sh |  2 +-
 4 files changed, 17 insertions(+), 2 deletions(-)

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
index a573786f0..13cbc791f 100644
--- a/documentation/tools/containerfiles/Containerfile.apt
+++ b/documentation/tools/containerfiles/Containerfile.apt
@@ -5,6 +5,7 @@ ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=ubuntu_essential.sh
 ARG DOCS=ubuntu_docs.sh
 ARG DOCS_PDF=ubuntu_docs_pdf.sh
+ARG PIP3=pip3_docs.sh
 
 ENV DEBIAN_FRONTEND=noninteractive
 ARG TZ=Europe/Vienna
@@ -13,6 +14,14 @@ ARG TZ=Europe/Vienna
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
 COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
+COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
+
+# RUN . /tmp/yocto-venv/bin/activate doesn't work because env variables set in
+# RUN don't persist, so set up the virtualenv manually.
+# Unsetting env variables in Containerfile is difficult, so we hope it works
+# fine without doing that for PYTHONHOME (see activate script content).
+ENV VIRTUAL_ENV=/tmp/yocto-venv
+ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
 RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
  && apt-get update \
@@ -20,6 +29,7 @@ RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
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


