Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCBAC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 09:50:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10810.1676022611566512607
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 01:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fnSlKNJq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9479D1BF211;
	Fri, 10 Feb 2023 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676022609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NRPgP+M8ziuiO6pK3hJB4s+psbsTSmuq/VUqJ2pxVVw=;
	b=fnSlKNJqc/0pcLLzPhxjYYxZXTX/eVEzlU//zEbjaCOQkM1piyiwcK9GF5tpTWNE2/yVG4
	mpm+Y3JKbmCf1KQdcNw3aK4VRkGpK0f+ntcsu1h6BcROmtgp6RCQLQXG/UCqG9uoViLSwV
	/mvEyO+Pb7IrH4JLWCZOeJTbtIxzwY+RT+z9523OsPfM1mmpDLRK02R4TOQGTvhweUmvAT
	uX6Atq9/8cfVejnehA3HqwIWZlh17lQIjJe6ljqf0U2fFOiBtyXqGR/4kf+0cJh1hxs+4C
	fCz7NQKjyGoBl1XulGlpwJ2GvPQy0OuA18Hpzj7uKVI3EKxmh8/wKiV6SCtKrA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale] bsp-guide: fix broken git URLs and missing word
Date: Fri, 10 Feb 2023 10:50:07 +0100
Message-Id: <20230210095007.219150-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Feb 2023 09:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3662

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 7e17b42886..dbbcf47620 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1180,14 +1180,14 @@ Use these steps to create a BSP layer:
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
@@ -1210,7 +1210,7 @@ BSP Layer Configuration Example
 -------------------------------
 
 The layer's ``conf`` directory contains the ``layer.conf`` configuration
-file. In this example, the ``conf/layer.conf`` is the following::
+file. In this example, the ``conf/layer.conf`` file is the following::
 
    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
-- 
2.37.2


