Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB88C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:37:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.182561.1698745049649425187
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c6lldC2B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2475FF816;
	Tue, 31 Oct 2023 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8oCyUTYpLqZhEummUcvBUZy/fv6gD9I8wUjE9LS2Ls=;
	b=c6lldC2B4U4aUcwTgRRRaRQMWCEw49sK0hZtimBdiDzxscoR+wkpyXUeFiK7lwpql+z+C5
	7ezbW8zao1CwMmMbyiaBaeU0IuHgH9UG9WSzCc95d/lmMWD8rYVdEZNGNE2+FaTNxHFy1V
	Iepp4GF+Z9ELHN0jzxQfn5AbbgLSV1rNR3yFupGftlXwRFxxP8wPrxhOsjmfmylMjHAbv4
	h6Tpew47DjSsJDvpdZfmIatsw/TgyNmbUViCRZ6cyYqFZal6wxFonLldXr3m1GXQ8s2zqK
	85jTb4SaTCrxo5GMFkj6gfbK6hijGsJ2PgOR1l7eMfnJlDYNERrQzTU2ZeCIuw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 1/3] manuals: correct "yocto-linux" by "linux-yocto"
Date: Tue, 31 Oct 2023 10:37:14 +0100
Message-Id: <20231031093716.1792379-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031093716.1792379-1-michael.opdenacker@bootlin.com>
References: <20231031093716.1792379-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4531

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst     | 2 +-
 documentation/kernel-dev/common.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 94ed1641b5..6cb35ba6cc 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1180,7 +1180,7 @@ Use these steps to create a BSP layer:
 
 -  *Create a Kernel Recipe:* Create a kernel recipe in
    ``recipes-kernel/linux`` by either using a kernel append file or a
-   new custom kernel recipe file (e.g. ``yocto-linux_4.12.bb``). The BSP
+   new custom kernel recipe file (e.g. ``linux-yocto_4.12.bb``). The BSP
    layers mentioned in the previous step also contain different kernel
    examples. See the ":ref:`kernel-dev/common:modifying an existing recipe`"
    section in the Yocto Project Linux Kernel Development Manual for
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 3406fcfe75..3e1ef389b8 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1081,7 +1081,7 @@ Section.
       the following sequence of commands::
 
               $ cd poky/build
-              $ bitbake -c cleanall yocto-linux
+              $ bitbake -c cleanall linux-yocto
               $ bitbake core-image-minimal -c cleanall
               $ bitbake core-image-minimal
               $ runqemu qemux86
-- 
2.34.1


