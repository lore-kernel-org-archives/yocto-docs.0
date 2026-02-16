Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D0E7BD92
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:27:11 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17722.1771241224733803202
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=VQWOrdbe;
 spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fF0qB5SBgzKG3;
	Mon, 16 Feb 2026 12:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771241222;
	bh=Egag+FMP/X4HP3VNrup028qyKSJLQWGF76N5iekKr6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VQWOrdbeXnEos7KN3ShWSCyO8U5u1R6eX2VDQtjJ0ghz/MXdIO7Y0/7FyWLGk239+
	 mrAVAj4lFiGBbmARdbm2CD8JG6vfsNObchl4LjD9NZy7UwmmzRmpXgti6R4/0wYXFY
	 bPfTAZaZV1Ke1/b7TULQ+xLZhhYa83byqpy2Ssvr0VY+mJS+f7hQRwxRQFWga6mjrZ
	 Qlr6bZ2ZY0f7hujuDH9XpeJh5IP++9fpuXVrkOmqSuzTYIedL2EjoJM/xilMUQDWj9
	 I1njZuaQHWeTHHsrXgBWo0i74Xxb/TmG4D9liGez197JYwu4RHDkoqx72+g/7gG/3d
	 i8Ot3iWdodtHQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fF0qB2NVhz9qk;
	Mon, 16 Feb 2026 12:27:02 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 16 Feb 2026 12:26:53 +0100
Subject: [PATCH v4 1/3] use a venv for installing packages with pip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
In-Reply-To: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8924

From: Quentin Schulz <quentin.schulz@cherry.de>

In a few commits, we'll migrate Debian/Ubuntu to use pip packages.
However, Debian rejects pip commands outside of virtual environments.

It is generally best practice to use virtual environments with pip, so
let's migrate distros that currently use pip to use virtual environments
as well.

Because BitBake is a Python project and requires a few Python packages
that we currently install with distro package managers, if we were to
ignore system packages when creating the virtual environment the user
would either be able to build the docs or run BitBake. Let's include the
system packages in the virtual env so that isn't an issue.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/containerfiles/Containerfile.dnf    | 6 ++++++
 documentation/tools/containerfiles/Containerfile.zypper | 7 +++++++
 documentation/tools/host_packages_scripts/pip3_docs.sh  | 4 +++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
index fd47fde34..01e838ef9 100644
--- a/documentation/tools/containerfiles/Containerfile.dnf
+++ b/documentation/tools/containerfiles/Containerfile.dnf
@@ -9,6 +9,12 @@ ARG PIP3=pip3_docs.sh
 
 ENV TEXTOOLDIR=/opt/docs-build-tex-tools
 ENV PATH="$PATH:$TEXTOOLDIR/tl/bin/x86_64-linux"
+# RUN . /tmp/yocto-venv/bin/activate doesn't work because env variables set in
+# RUN don't persist, so set up the virtualenv manually.
+# Unsetting env variables in Containerfile is difficult, so we hope it works
+# fine without doing that for PYTHONHOME (see activate script content).
+ENV VIRTUAL_ENV=/tmp/yocto-venv
+ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
 # relative to the location of the dockerfile
 COPY --chmod=777 ${ESSENTIAL} /temp/host_packages_essential.sh
diff --git a/documentation/tools/containerfiles/Containerfile.zypper b/documentation/tools/containerfiles/Containerfile.zypper
index 3850b9ff9..204185efd 100644
--- a/documentation/tools/containerfiles/Containerfile.zypper
+++ b/documentation/tools/containerfiles/Containerfile.zypper
@@ -13,6 +13,13 @@ COPY --chmod=777 ${DOCS} /temp/host_packages_docs.sh
 COPY --chmod=777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
 COPY --chmod=777 ${PIP3} /temp/pip3_docs.sh
 
+# RUN . /tmp/yocto-venv/bin/activate doesn't work because env variables set in
+# RUN don't persist, so set up the virtualenv manually.
+# Unsetting env variables in Containerfile is difficult, so we hope it works
+# fine without doing that for PYTHONHOME (see activate script content).
+ENV VIRTUAL_ENV=/tmp/yocto-venv
+ENV PATH="$VIRTUAL_ENV/bin:$PATH"
+
 # Zypper doesn't have environment variables to specify whether to run in
 # non-interactive mode like Debian does with DEBIAN_FRONTEND and piping yes to
 # the scripts doesn't need to be enough as well, so let's force all zypper calls
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index 907ecec55..9aa7f16fb 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1 +1,3 @@
-sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
+python3 -m venv --clear --system-site-packages /tmp/yocto-venv
+. /tmp/yocto-venv/bin/activate
+python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton

-- 
2.53.0


