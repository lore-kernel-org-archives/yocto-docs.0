Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23508C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 17:10:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.202731.1673975428881853557
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 09:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EOajonSu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 4222C240005;
	Tue, 17 Jan 2023 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673975426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VGaLY20a+0Isyr51XZ6Y9KH/lH8+Yf3z+pkhVkRcSEA=;
	b=EOajonSuIKaF/xiB3XWQhdPDpOWEb7H+Urdpx1H5ujZL42m22UNoi4JIH764XlsOm9FHId
	yk7dSdHjRehu2580pD4Gn7sWiGBTvAsJZXf18hnGoTaVTn4Fn4Kpqv8rHdFLrZ4vM3ujqN
	ZKQcJ/taSn35rj/G7QfNzbirK8HAJTIhEYUQ1SVM4wbJ/basJ46jZaCc+TlF5RGudgvQRt
	iMGzs8k8SOGkArUSp5tNLaw/CF51YV7AbWXdOzPCRjSCXiGBqWGcca9tn0jOMW2QtuHWQt
	0SMUPjXTfgRAlvyhLZmT7H2QDxclQwjF2R8BL9AoAlx+Jgmda7/9Dqme2y17kw==
From: luca.ceresoli@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] manuals: fix typo in the MLPREFIX description
Date: Tue, 17 Jan 2023 18:10:16 +0100
Message-Id: <20230117171016.733760-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jan 2023 17:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3615

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f2decd713ba1..652f08c71202 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5101,7 +5101,7 @@ system and gives an overview of their function and contents.
       Specifies a prefix has been added to :term:`PN` to create a
       special version of a recipe or package (i.e. a Multilib version). The
       variable is used in places where the prefix needs to be added to or
-      removed from a the name (e.g. the :term:`BPN` variable).
+      removed from a name (e.g. the :term:`BPN` variable).
       :term:`MLPREFIX` gets set when a prefix has been added to :term:`PN`.
 
       .. note::
-- 
2.34.1


