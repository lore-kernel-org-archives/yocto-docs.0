Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C39EC54E55
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12830.1709042499632892225
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n3zqzzEJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3862C20007;
	Tue, 27 Feb 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=916V1MNbg+hpB1kx1vdDBRucA789AemVe4AsknXM+vw=;
	b=n3zqzzEJPMB5KB3X11j7fJ+vcRp/KbqdNGV8Sb2RrDmagJ02PuNU2aHF8PwEzzxYBcVHBs
	1L7gGc82NQIfkSiMkNQ73xgBlHuWbVGLVXOj46da3vd1qy5E7xkLlGpng9lqUGK9d89JLo
	5CYcQYuNNW5B2VfYNk4HThV5iWgTegCteiJ6A73C4XECudTs5unteb4LobrONnkEg3O8Yj
	+N50HuKXG32dn++f7U8JfmjgpAGkyqWuUHr8zNiPv2vSu4UzgGm21tW2/7ZkDrl0YBeDNs
	vCKV/3SCJRmwBdNFW7ci6W3mkLees0qR2SZW3xBi+oZPH2M/k82r9qHcduPxTQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 06/16] manuals: update disk space requirements
Date: Tue, 27 Feb 2024 15:01:18 +0100
Message-Id: <20240227140128.481522-7-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4897

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Tests made on Poky master on March 16, 2023.

Add a "Free Disk Space" section to the "System Requirements" document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |  4 +++-
 documentation/poky.yaml.in                       |  2 ++
 documentation/ref-manual/system-requirements.rst | 11 +++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index ec4cc8b051..565e00be2e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -47,7 +47,9 @@ Compatible Linux Distribution
 Make sure your :term:`Build Host` meets the
 following requirements:
 
--  50 Gbytes of free disk space
+-  At least &MIN_DISK_SPACE; Gbytes of free disk space, though
+   much more will help to run multiple builds and increase
+   performance by reusing build artifacts.
 
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 6b942f0959..1d4e176604 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -46,3 +46,5 @@ MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "7.5"
 MIN_MAKE_VERSION : "4.0"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
+MIN_DISK_SPACE : "90"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 274781a903..72579a5e23 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -29,6 +29,17 @@ and conceptual information in the :doc:`/overview-manual/index`.
    For more information about the Yocto Project Documentation set, see
    the :ref:`ref-manual/resources:links and related documentation` section.
 
+Minimum Free Disk Space
+=======================
+
+To build an image such as ``core-image-sato`` for the ``qemux86-64`` machine,
+you need a system with at least &MIN_DISK_SPACE; Gbytes of free disk space.
+However, much more disk space will be necessary to build more complex images,
+to run multiple builds and to cache build artifacts, improving build efficiency.
+
+If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
+section of the Development Tasks Manual.
+
 .. _detailed-supported-distros:
 
 Supported Linux Distributions
-- 
2.34.1


