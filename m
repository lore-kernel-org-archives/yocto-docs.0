Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2C5C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 09:53:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10686.1676022808284798793
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 01:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MKht/AZw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EA72240010;
	Fri, 10 Feb 2023 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676022806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cuZELyjfuKxFUSAO/76cq4qvVQRYHogqXrjfkO1ZPSo=;
	b=MKht/AZw0nL423J7m5QtoYvVIlonCJZoMR8r5FwwsNkcFlYlemnn7rbYoLqxJiNrsSK8r/
	gXYCk4He58QtpO3qk1UUm8xNrV+42JDX9OQLomRERA8OBf1ne7YyKgmk0LNkvy51KFPqzU
	WfZHVRN5Bi1PCjk0mkpj5l6dfbyDEVz+OSgqKXxgeZscHwdi29nUE8vAnwToqJ1sXY5kDo
	51uXUWTJx6wLIilOe1+BRlkb2AMJMEaNLZJmD+PXzWBCzxO72Nau1RNM0mfbC8PekAdUfg
	jp9kinl3+tinAVg3hRUbdnZgUVMlSpgKYwl2xJH9AaktFr9zJcN7Vw4HtbAHgA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] bsp-guide: fix broken git URLs and missing word
Date: Fri, 10 Feb 2023 10:53:21 +0100
Message-Id: <20230210095321.219439-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 09:53:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3663

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 8ec7f2957e..8201c93862 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1179,14 +1179,14 @@ Use these steps to create a BSP layer:
    :yocto_git:`Source Repositories <>`. To get examples of what you need
    in your configuration file, locate a layer (e.g. "meta-ti") and
    examine the
-   :yocto_git:`local.conf </meta-ti/tree/conf/layer.conf>`
+   :yocto_git:`local.conf </meta-ti/tree/meta-ti-bsp/conf/layer.conf>`
    file.
 
 -  *Create a Machine Configuration File:* Create a
    ``conf/machine/bsp_root_name.conf`` file. See
    :yocto_git:`meta-yocto-bsp/conf/machine </poky/tree/meta-yocto-bsp/conf/machine>`
    for sample ``bsp_root_name.conf`` files. There are other samples such as
-   :yocto_git:`meta-ti </meta-ti/tree/conf/machine>`
+   :yocto_git:`meta-ti </meta-ti/tree/meta-ti-bsp/conf/machine>`
    and
    :yocto_git:`meta-freescale </meta-freescale/tree/conf/machine>`
    from other vendors that have more specific machine and tuning
@@ -1209,7 +1209,7 @@ BSP Layer Configuration Example
 -------------------------------
 
 The layer's ``conf`` directory contains the ``layer.conf`` configuration
-file. In this example, the ``conf/layer.conf`` is the following::
+file. In this example, the ``conf/layer.conf`` file is the following::
 
    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
-- 
2.37.2


