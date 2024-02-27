Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65308C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12660.1709042500021911556
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XJnNUKKd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 908DCFF811;
	Tue, 27 Feb 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HW5Dc0Hdj8keod+g8MYvKUjww6yexFGvnwhMHorkOXQ=;
	b=XJnNUKKdaVwCzx0nmCSUiYgw2qbI6PIodj8gYiVPK3TwuolTAp4QUYYmaitn80OCT2Goyw
	2j4+zvmkHI2LFZPPIGVZ7ASTivJAMwPHVkraUCX2W/QEOmlVV9pTQQzNSSYnCF1xaf5ZvG
	5JkhMTx6SnBBfMmt29gkx8KtAJjDG1AbqcEfAA1Y9gFbwvtoOuWgIpfiMKb2/NNKmcoTin
	QAlQpFQUkJzgDvkiAR4eRjMW3Y9dL567iE4TDE9n9E9kbSg5IYXdDqxGmQnHJl+JtscRgv
	G1H4NLkZyj9HHBWlKYTYrecsTL/9LEH03vM38OQhV8iLSc8yWXNykyWtcW3pcA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 07/16] manuals: add minimum RAM requirements
Date: Tue, 27 Feb 2024 15:01:19 +0100
Message-Id: <20240227140128.481522-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4898

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Measured by generating a "core-image-sato" image for a "qemux86-64"
machine from an Ubuntu 22.04 VM with 4 cores.

Less memory was not enough and caused Out of Memory failures.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |  4 ++++
 documentation/poky.yaml.in                       |  4 ++++
 documentation/ref-manual/system-requirements.rst | 10 ++++++++++
 3 files changed, 18 insertions(+)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 565e00be2e..462c942961 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -51,6 +51,10 @@ following requirements:
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
index 1d4e176604..8c6549d571 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -48,3 +48,7 @@ MIN_GCC_VERSION : "7.5"
 MIN_MAKE_VERSION : "4.0"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
 MIN_DISK_SPACE : "90"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) with "rm_work", rounded up from 38
+MIN_DISK_SPACE_RM_WORK : "40"
+# RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
+MIN_RAM : "8"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 72579a5e23..92e2211629 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -40,6 +40,16 @@ to run multiple builds and to cache build artifacts, improving build efficiency.
 If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
 section of the Development Tasks Manual.
 
+.. _system-requirements-minimum-ram:
+
+Minimum System RAM
+==================
+
+You will manage to build an image such as ``core-image-sato`` for the
+``qemux86-64`` machine with as little as &MIN_RAM; Gbytes of RAM on an old
+system with 4 CPU cores, but your builds will be much faster on a system with
+as much RAM and as many CPU cores as possible.
+
 .. _detailed-supported-distros:
 
 Supported Linux Distributions
-- 
2.34.1


