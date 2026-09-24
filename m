Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF09EC9831A
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:49:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5960.1790250535282372361
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 04:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EkfsadV8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0A09DC211ED
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 999DA60341
	for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:48:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDAA210328D3A;
	Thu, 24 Sep 2026 13:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790250533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y15mxPEdlpPAmyAya8pwZcy7Eazuz4ny7BZHJwG4YI4=;
	b=EkfsadV8bRRvKzfu+BQZgQ+flTZtkrZJVk2g6gT5Pa3wPjb8X9eQ0YMldQfWoylvebwwnq
	S4VM57msBFt0QrRot1tXIA4RyjGhtB+GmzsRkVklhxuysIP/ZFC6AH3H5XUrdVwwpxpIOh
	O1r9a35J/si//MLJ5ZIBWsGi4IXvM3AzWwwtQcAoVtlFnnQrRRySW+ARKyBCkJkyGdlrl0
	9YsuUARRnv9664ouXaCIBm9xk5LqXZ2MjE8Vfk4LfUQamX3KOQv1im4RV0Mnd+Q1uuFERY
	aRBynIsP6hKbZiG9H1QJjqkqh4y0+jqBxdFZqA3Rb9Q8kgu6nSJUkzP4Lr6tYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 24 Sep 2026 13:48:41 +0200
Subject: [PATCH 2/2] docs-wide: recommend a minimum of 16 CPU cores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
In-Reply-To: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3681;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nF2nUfAjewVTqb5IZibBdKnZAWtvdCmhD+jj0UApbGw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqtQ4eO+0ixFBrq2I/cyYEn9OAP3NvlY9346Fnq
 0w8+Gpa8RuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCarUOHgAKCRDRgEFAKaOo
 NnvdEADHg5daJyX9hb3sqksNXatbEUUYusUiO1yKrolIa36LaT2Sn5LqVFPgLmYoeyT7rXHNC7e
 jh/dn1cIcvqVQbcsG577IzV6FlPWnjlMfuO5bm3PzGiibvnE+OTty/Z6MXVgiQo9pMt0f1j8gdn
 6lPRQZ8NWvImsJyaVF2jg4TMljetJihVaJI/cdd/aKvlDBPgkCkm2ce94vlcuuAN+F3bWBXYd7/
 G3nL63TK9+HA2Ob+IY1rx5PFiQ6t9iK/FcvA02S3MYc/cRvAPnm253TREAwYugUGmM3rtLG2x90
 brMCIZYBiN22LziGcLSYLkq40wN/iqwebSBBcCUsblE+q5DnV+DAImVvSm4l6nN7nLe6Peg6ulN
 L64NQman5rQCkGabQgcmJ5lA3KuCzPOFY9fMl5B+fdjcSrVBZvOfvohzQqDJMSIzyzjofCDWo07
 +kzvK+PpaphBKNiw3tE3UPBucL2Pg/KpojxfnR/ZqVOAPjJrgIs0p74P9LyT0xZcU6Cb7b6+C9V
 bCAP+cXKPPOwefhXA4z7jUMUKC8Ke6sWXN99FSVVYUm56bzQcbzUzBB6SO/wk0tbnBCINPnC9Jp
 qC1P/acyYPfwjYzDkd4vm0r0WK/iKq4r4V7/jxSnQnPiH6TYVwSbhLGMmeLcuAGVPWSX7QhIPzr
 DmG+s8gJRTNNNow==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 11:49:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10614

Add the MIN_CPU_CORES macro to poky.yaml.in and use it in places where
we list minimum host requirements.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     | 6 +++---
 documentation/dev-manual/start.rst               | 3 ++-
 documentation/poky.yaml.in                       | 2 ++
 documentation/ref-manual/system-requirements.rst | 8 ++++----
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index f7e4606f1..dcdf7803a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -43,9 +43,9 @@ following requirements:
    much more will help to run multiple builds and increase
    performance by reusing build artifacts.
 
--  At least &MIN_RAM; Gbytes of RAM, though a modern build host with as
-   much RAM and as many CPU cores as possible is strongly recommended to
-   maximize build performance.
+-  At least &MIN_RAM; Gbytes of RAM and &MIN_CPU_CORES; CPU cores, though a
+   modern build host with as much RAM and as many CPU cores as possible is
+   strongly recommended to maximize build performance.
 
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 5f0bb37b7..8fa32d473 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -56,7 +56,8 @@ particular working environment and set of practices.
     get the hardware together. Ideally, any development, build, or test
     engineer uses a system that runs a supported Linux distribution.
     These systems, in general, should be high performance (e.g. a minimum
-    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk space).
+    of &MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; Gbytes of disk space
+    and a minimum of &MIN_CPU_CORES; CPU cores).
     You can help ensure efficiency by having any machines used for testing
     or that run Autobuilders be as high performance as possible.
 
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 3e74dd7e7..b7dac4ff3 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -46,3 +46,5 @@ MIN_DISK_SPACE : "140"
 MIN_DISK_SPACE_RM_WORK : "40"
 # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
 MIN_RAM : "32"
+# Recommended minimum number of CPU cores
+MIN_CPU_CORES : "16"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d602fa2ca..a0b902aec 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -42,12 +42,12 @@ section of the Development Tasks Manual.
 
 .. _system-requirements-minimum-ram:
 
-Minimum System RAM
-==================
+Minimum System RAM and CPU Cores
+================================
 
 You will manage to build an image such as ``core-image-sato`` for the
-``qemux86-64`` machine with as little as &MIN_RAM; Gbytes of RAM on an old
-system with 4 CPU cores, but your builds will be much faster on a system with
+``qemux86-64`` machine with as little as &MIN_RAM; Gbytes of RAM and
+&MIN_CPU_CORES; CPU cores, but your builds will be much faster on a system with
 as much RAM and as many CPU cores as possible.
 
 .. _system-requirements-supported-distros:

-- 
2.55.0


