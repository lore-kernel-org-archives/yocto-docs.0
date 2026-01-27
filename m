Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D70CA6C81
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5819.1769501989861796070
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ksDqZcdZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 59E2F1A2A6C;
	Tue, 27 Jan 2026 08:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3007E606F5;
	Tue, 27 Jan 2026 08:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D1B3119A867A;
	Tue, 27 Jan 2026 09:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/y1DwQWWC+bG3sAfBh0BmLJxIsOeierLVS+gu8nlvzk=;
	b=ksDqZcdZXFIV146EGnsSU4WYosl8IocyyZo39Sk5he4jTbHSX7KuLHMSx2j73sipwc/CZp
	HrnVGABsY3pO82x/yvQ0sQcCJkOPkigdUt65h5xJ/gNY+0llQgzzbCywiycs5QFLciFVTz
	sH2jRYkcjEmbY1esYiiwRo7kUrc468tk2DRfN/J64h3BPoul6c6yD9mzztAWBnGeSURtwh
	rAu/pn8r17711BMVNwVq8ZyIiNIKb0k1wBgFH1y/FgSoTcBZ3qPDef7RITHB1ohRKDdF7S
	KEiQxzA2NGC0JKZYQtkxs6w54wRuYBQdkj2yOtFRchip2mopp6Dn/HedeV5asA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:33 +0100
Subject: [PATCH v2 38/56] dev-manual/init-manager.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-38-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c6AoTqHAhHK8Oj5u1F4Y5nmJSHQIBaYhOphObOes/Ik=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUEZAW68QsH7hjq55TCi2ER4Zq/w8ibrbl0v
 aSD27hMuyKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 NobzEAC0rHXaEAq/wh8BdCFu1uYWFGzwaPTZOsdozMsIANv3Y3yogD+GRctWJ58Cf6j43YdYvfK
 sGSTFsL9zp7TJ2BK2M+xAoS2hdb3b09TqbkoubBmc5D6LkKjdiIjDW4JIg180j3nLFTBUsPbWfX
 52h0ajtZry+IYzvdamlYN03gSHkKO/oYidVcd3soLfKvC++6OBE0sPK3Ngi66qDeN694DRtM21C
 HzyCv5mMmDaypAL6qaX0kLHCBRyXQEWHWS+X7MqbxahGwsYOJcGJXibm7K8YRGE2g+soFXlDusS
 nFeOK0FbGakj7aIz6mz1frzRmnkPbd9oIW0LOoDQtlp/3Nb3RLGK+QyqSworqclEk7DBdOmsWnk
 cN2VH1pm35mTj6c9aFCZdXvHCJfUr8BNa+srpB7xgEVdbnSuKK2yjJ2JdEnApNSC8Npqi3DWrXa
 LLVuK3Xz03oOhZXAS9FMjbaJrdNjrRwyUcUNcwa/U07O/vzNQc5tqE2773rxrxqnBG8m0erd0uA
 HrMF+I65OgugqLhMRFOXHGPTsIyhZ3bawd+3c1fr31cRh3/O6Yag/YA+eP7p2FKh6ezNMlUDBHU
 /z+cRE6F9vkYe6Q9M7bzvm5F9FWJsK3Us6DQH5a+zO8C5seKktxEvNMdMkRGMHGzwDqnMGVLJNL
 6cMR7CB9FlFipuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8699

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/init-manager.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/init-manager.rst b/documentation/dev-manual/init-manager.rst
index d0fdfdf77..670810310 100644
--- a/documentation/dev-manual/init-manager.rst
+++ b/documentation/dev-manual/init-manager.rst
@@ -54,7 +54,7 @@ Using SysVinit with udev
 =========================
 
 SysVinit with the udev device manager corresponds to the
-default setting in Poky. This corresponds to setting::
+default setting in :term:`Poky`. This corresponds to setting::
 
    INIT_MANAGER = "sysvinit"
 
@@ -77,8 +77,8 @@ for more complex systems::
    INIT_MANAGER = "systemd"
 
 This will enable systemd and remove sysvinit components from the image.
-See :yocto_git:`meta/conf/distro/include/init-manager-systemd.inc
-</poky/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
+See :oe_git:`meta/conf/distro/include/init-manager-systemd.inc
+</openembedded-core/tree/meta/conf/distro/include/init-manager-systemd.inc>` for exact
 details on what this does.
 
 Controling systemd from the target command line

-- 
2.52.0


