Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF3BCA6C87
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6050.1769501972511763707
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uktTYGNz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0390A4E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF2F3606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E4D8119A8687;
	Tue, 27 Jan 2026 09:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6shhbQbB1+358YB1pgfEFgbL+hjsQFGh+hut2dO4yDc=;
	b=uktTYGNzZ6ILeX9O6Qud3Wiv7efEGvRCMuJWQgV6TNpnAth+3IsqS7V0rLSaTfUzqViI39
	O9NgW2i/MVcKzYjST2+jVkBV78gVFo2HHTK+yjEvEzwA9SS/zGFX/ZKRwBlZueF72bFHdB
	M+cebf+tiNaQV6kjSkKk11KKNKI+hLOt04pkHn/9YNg3muSvODoGJX2xnnsdioGkTbJCc4
	8jwFCdhCS5GFFuH9QssHb+69FY17ylYGBUBWkhyK2mpW2ZFLuutDQM3Yyh9SIp9KwXlcss
	x+V/GyFlVT1XdPQmsS5GqEpDUJlZ2pH+wlJOemcFwQpa+n53l5Ehi8vOlPuEGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:09 +0100
Subject: [PATCH v2 14/56] dev-manual/new-recipe.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-14-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AOAMbnF92uOJnCejUugbDX63bCa7X2wVQ+k9LZ4I97U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUApgt+qDEKuhFqvG9Y9xBZRPrsblGlBCNMl
 q49Y6re516JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 Ni0ID/97qVO2UNiM9MDXFNf7stmtDWDkpsP9+7/ljYezsxcfcvpJxNHun2kjAUdQs6BXoLL2fUX
 8IN9zJs8ri57Eo2Cn1zOUNFaEhoVeJE4bbPcCikiH9Qapvrx6aZxaOt34ieIxm29n9cSYDVUitt
 Kh+g8s2pzFmajVwOYkriNRYTM+yBiaKFtIWawypjwTNr/q73W7mU5Qdo+A2lRSX1L+0wuRMZLsN
 5RLqZ2B3n++JWDhmjLn/kbqZZOj+UKSIAqN5yTzw7tbspUWFr6xHKdaZxipzQSgM7w1TqbVibJZ
 YnHg+VsKw/90hzzGtU8i2Kxw6hCPWtTOgfgCFA1s4V7yKgNezCug8dvdVZdowiVkfcGoATut6Dr
 RS0akCoj/+09wN6GrT+pjluD82q1N96GTf1KvX50tqfLJ5nFM/mXFGGSPQK1Mzs1mtapxbnknlM
 wuVSpfQNyWW07lDIqMjx1UTJzDVKS63CxFOFs3OhSrujREgmneRMgsw9PusMa3syDDy35yztI+8
 4JrnkoWstxaablqmRlU6BkHw/OCfHZnGwQMSVdGkvU0LUp3lWGVG+8dyOSUJfzQq+iUrwP1TN6U
 C5W8COSwb4o6hb31Q1KCs3nWL3wV0Az2IAA3zkbCwn5EBwB5n5FucM/xYfT31xmnucp4p9so6FP
 d2gfbzGXjF1H9XQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8675

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ee0f6aaf6..5e9498afc 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -224,14 +224,23 @@ is to use the ``bitbake-getvar`` utility::
 
    $ bitbake-getvar -r basename WORKDIR
 
-As an example, assume a Source Directory
-top-level folder named ``poky``, a default :term:`Build Directory` at
-``poky/build``, and a ``qemux86-poky-linux`` machine target system.
+As an example, assume a :term:`Source Directory`
+top-level folder named ``bitbake-builds``, a default :term:`Build Directory` at
+``bitbake-builds/build``, a ``cortexa57`` :term:`PACKAGE_ARCH`, ``poky``
+:term:`DISTRO` and ``linux`` as :term:`TARGET_OS`.
+
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
 would be as follows::
 
-   poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
+   bitbake-builds/build/tmp/work/cortexa57-poky-linux/foo/1.3.0
+
+.. note::
+
+   This covers the case when the :term:`PACKAGE_ARCH` variable is set to its
+   default value, :term:`TUNE_PKGARCH`. This variable is sometimes set to
+   :term:`MACHINE_ARCH`. See the documentation of the :term:`PACKAGE_ARCH`
+   variable for more information.
 
 Inside this directory you can find sub-directories such as ``image``,
 ``packages-split``, and ``temp``. After the build, you can examine these
@@ -240,7 +249,7 @@ to determine how well the build went.
 .. note::
 
    You can find log files for each task in the recipe's ``temp``
-   directory (e.g. ``poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0/temp``).
+   directory (e.g. ``bitbake-builds/build/tmp/work/cortexa57-poky-linux/foo/1.3.0/temp``).
    Log files are named ``log.taskname`` (e.g. ``log.do_configure``,
    ``log.do_fetch``, and ``log.do_compile``).
 
@@ -830,7 +839,7 @@ different ways:
 
    To enable a service using systemd, your recipe needs to inherit the
    :ref:`ref-classes-systemd` class. See the ``systemd.bbclass`` file
-   located in your :term:`Source Directory` section for more information.
+   located in :term:`OpenEmbedded-Core (OE-Core)` section for more information.
 
 Packaging
 =========
@@ -974,8 +983,8 @@ being able to provide the ``virtual/kernel`` item.
 Now comes the time to actually build an image and you need a kernel
 recipe, but which one? You can configure your build to call out the
 kernel recipe you want by using the :term:`PREFERRED_PROVIDER` variable. As
-an example, consider the :yocto_git:`x86-base.inc
-</poky/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
+an example, consider the :oe_git:`x86-base.inc
+</openembedded-core/tree/meta/conf/machine/include/x86/x86-base.inc>` include file, which is a
 machine (i.e. :term:`MACHINE`) configuration file. This include file is the
 reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
 relevant lines from the include file::

-- 
2.52.0


