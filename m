Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70CEC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 17:31:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.25839.1679074316326837246
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 10:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ni1YM8vx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CC6C5240008;
	Fri, 17 Mar 2023 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679074315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6A2Oo5bL297Hz6Dce7gQfQC+fQS8zl/hdB8MgjkM9Y=;
	b=Ni1YM8vxEH1gpygIIu14YeWeP5teHr/v+EXXhOaBWKSS0BOKVDTg06xCbcO3m+MFJkk1fg
	IoHGfgQ2GUbvdtZ2rd+WdEjhirY9FWmZjjsGw91HZYDR3Sa6kUoE/OkCp1Qd2LCR8RR9te
	QGP9fCwqOOBgWNozOhdJeItDRkiLNAScywt42pM5kb3KzxuAshyXL8x6ATGI1N2d+KOFqc
	zB4KpCgr1U2+TA0batmW+uvd/vHRi5u/nNFB4MldbZuBKsoIdFjHZnHCPQTk965hHJwhFf
	uHSr06qGGyz1PzaaXhk523ujIqhcPVlZDJx5UsZUpHfn2+hpqPCJFDxxVrFK/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 3/3] manuals: add minimum RAM requirements
Date: Fri, 17 Mar 2023 18:31:30 +0100
Message-Id: <20230317173130.36268-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317173130.36268-1-michael.opdenacker@bootlin.com>
References: <174D0151E4C65905.10271@lists.yoctoproject.org>
 <20230317173130.36268-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Mar 2023 17:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3807

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Measured by generating a "core-image-sato" image for a "qemux86-64"
machine from an Ubuntu 22.04 VM with 4 cores.

Less memory was not enough and caused Out of Memory failures.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     | 4 ++++
 documentation/poky.yaml.in                       | 2 ++
 documentation/ref-manual/system-requirements.rst | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 07e95ee85c..0ccffccc60 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -44,6 +44,10 @@ following requirements:
    much more will help to run multiple builds and increase
    performance by reusing build artifacts.
 
+-  At least &MIN_RAM; Gbytes of RAM, though a modern modern build host with as
+   much RAM and as many CPU cores as possible is strongly recommended to
+   maximize build performance.
+
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
    distributions that support the Yocto Project, see the
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index eefdd3f30d..dc0c257e50 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -45,3 +45,5 @@ MIN_MAKE_VERSION : "4.0"
 MIN_DISK_SPACE : "90"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
 MIN_DISK_SPACE_RM_WORK : "40"
+# RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
+MIN_RAM : "8"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index bf50fc510a..4fe0cb841b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -42,6 +42,14 @@ to run multiple builds and to cache build artifacts, improving build efficiency.
 If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
 section of the Development Tasks Manual.
 
+Minimum System RAM
+==================
+
+You will manage to build an image such as ``core-image-sato`` for the
+``qemux86-64`` machine with as little as &MIN_RAM; Gbytes of RAM on an old
+system with 4 CPU cores, but your builds will be much faster on a system with
+as much RAM and as many CPU cores as possible.
+
 Supported Linux Distributions
 =============================
 
-- 
2.34.1


