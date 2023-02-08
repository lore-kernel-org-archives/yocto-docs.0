Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB288C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:14:06 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9437.1675887239434449369
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LYRnFFvk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 417B240002;
	Wed,  8 Feb 2023 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675887237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ONdxsT8yGTU58RJ/rb7/kcLb4bPccMB+6Jg0eHKe7lU=;
	b=LYRnFFvkfUSq5EXFjotI+Sng3xlJaw0pLeQdxcTbbkyF7jVFCSytZMEsI6ooA0bXyGFzYv
	XwnfVk0aT8Uu75888Wf474aU+vM+vhJDpQKogL5S09uRk+By21A2A1OwmaZEz5otFs7VMa
	veXQK8qUeCJLNExgLZwTg5siNf+bCFUrgL1een7p39+DHwdNa0ruRoUnmC1Aq+AIYYLkmE
	TaF2GB5mw8Q3UdOPrJCRUvVB8Uydoy7r5IERBJcGa+ux+IKi8ny+qvbIQVf4V136MT7HNG
	rUV3CyaFb74s4tabzahoBM2mEhJdKmoUKARVMdN8Oot52Wl4lAQNg8oh+9qpFQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] bsp-guide: fix broken git URLs and missing word
Date: Wed,  8 Feb 2023 21:13:55 +0100
Message-Id: <20230208201355.107087-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3652

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index fccf059ccc..f2f5d4d954 100644
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


