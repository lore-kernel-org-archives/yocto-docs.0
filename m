Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA4CE9B278
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:33:04 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24391.1771950778313975515
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 08:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=epid6TIO;
 spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fL3DS5596zg1w;
	Tue, 24 Feb 2026 17:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771950776;
	bh=LkSlzmQaWmm8qm6rb2Ly1Z+YDE+5KB/5Z+FFl0qY030=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=epid6TIOPy1ZgxwyNQcSP0tutreg4oPvgWJZ3SGvJ2cgqopoAOAc1+gj7JV4M3l4A
	 I6siVFOODy8SPGIw2VxNSOvd+ncugeTi0b6QWKkMPNCLu0pfB0N8Mhd0aWGSe8Bo/M
	 +QRsCfx6Gc1LI/2vjLuBHSlAnMF/g5nPwmtws9bDtGkX9iDSQFsqsHsKttWnq9Ymn5
	 W01i9iYM7tfZCTIY13ON4Gucu1BzYAjb3Ob4TDBQOaQEHfzTGBPCRNWWamdfKHOa7M
	 JXw3tyUZ3Y8Jl/QR+BYKajEYW1ElgQ/xUEJDWtOXC62F2AjdhdrDUB1Sj+pnmdKLdp
	 ibVpiltBmDrMw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fL3DS29wWzXwV;
	Tue, 24 Feb 2026 17:32:56 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Feb 2026 17:32:37 +0100
Subject: [PATCH v5 2/4] use a venv for installing packages with pip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-fix-make-multi-target-v5-2-7ebf281618b4@cherry.de>
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
In-Reply-To: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 16:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8979

From: Quentin Schulz <quentin.schulz@cherry.de>

In a few commits, we'll migrate Debian/Ubuntu to use pip packages.
However, Debian rejects pip commands outside of virtual environments.

It is generally best practice to use virtual environments with pip, so
let's migrate distros that currently use pip to use virtual environments
as well.

Because BitBake is a Python project and requires a few Python packages
that we currently install with distro package managers, it would be best
to also include system packages via --system-site-packages when creating
the virtual environment such that the user would either be able to build
the docs or run BitBake, from the same venv.

Unfortunately, one of the packages[1] we'll include in an upcoming
commit breaks sphinxcontrib namespace package and thus we cannot have a
mix of sphinxcontrib-namespaced packages in and outside the venv. Let's
create a completely empty venv for now until the offending package is
fixed (see pending merge request[2]).

Let's instruct the user to install the docs venv in a relative directory
(likely the root of the yocto-docs git repo) instead of guessing a safe
location (/tmp may or may not be an actual volatile directory depending
on the distro).

[1] https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/
[2] https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/34
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/tools/containerfiles/Containerfile.dnf    | 11 +++++++++++
 documentation/tools/containerfiles/Containerfile.zypper | 11 +++++++++++
 documentation/tools/host_packages_scripts/pip3_docs.sh  |  4 +++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
index fd47fde34..12d97ef6c 100644
--- a/documentation/tools/containerfiles/Containerfile.dnf
+++ b/documentation/tools/containerfiles/Containerfile.dnf
@@ -1,6 +1,17 @@
 ARG ARG_FROM=fedora:40 # default value to avoid warning
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
 ARG ESSENTIAL=fedora_essential.sh
 ARG DOCS=fedora_docs.sh
diff --git a/documentation/tools/containerfiles/Containerfile.zypper b/documentation/tools/containerfiles/Containerfile.zypper
index 3850b9ff9..6e667967c 100644
--- a/documentation/tools/containerfiles/Containerfile.zypper
+++ b/documentation/tools/containerfiles/Containerfile.zypper
@@ -1,6 +1,17 @@
 ARG ARG_FROM=opensuse/leap:15.4 # default value to avoid warning
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
 ARG ESSENTIAL=opensuse_essential.sh
 ARG DOCS=opensuse_docs.sh
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index 907ecec55..b7f19b7ad 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1 +1,3 @@
-sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
+python3 -m venv --clear ./yocto-docs-venv
+. ./yocto-docs-venv/bin/activate
+python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton

-- 
2.53.0


