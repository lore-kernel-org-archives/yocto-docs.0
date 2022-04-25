Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1D0C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.32819.1650906668403721270
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 10:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fNGpPN/p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 954B91BF205;
	Mon, 25 Apr 2022 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650906666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WZ+TFjt4wRw3isqYAUdyIj9HA0RyfQx8u3TesYbyZkg=;
	b=fNGpPN/pLbARpo2DkbywfW6QeEzkLN9KevYGg/0+wLQH91WJWkbNhMYxSNcWIkLreEMtIG
	swYbqJC66Dyt/QNG7v9pfbJgRkQWRl//rO0eUySQk5GS0uypbaAj0OO/XVd41NaFR933cH
	XfQr8hynLzBlW1eDiJNc2h6iguDeKswCmXgxAkdHptG5Ahoz/j7j/D0OcFTeAQdcBIuCiO
	uGNUS4JxFwmIpnaQAuJuoYrMSGPYFEhfHAjW5tSqrjgKHxIe0kaPraMYdNXJThnUjkAQ4y
	EBf+dKsRvRWcIy+KCe3QUn1td6R2FOvwc71nTanWFLr2fTK3B7vUjxkwz0zjvA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: fix and improve links to MIT and GPL
 licenses
Date: Mon, 25 Apr 2022 19:10:55 +0200
Message-Id: <20220425171055.111005-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2860

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- The GPL license link was wrong (pointing to the LGPL)
- Using Wikipedia pages instead of the ones on opensource.org
  as they are much more informative and give the normal SPDX
  license identifiers that we use, instead of the short ones.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/development-environment.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 19095fc116..e1572afc75 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -620,9 +620,9 @@ license is distributed with that software. MIT is also compatible with
 the GNU General Public License (GPL). Patches to the Yocto Project
 follow the upstream licensing scheme. You can find information on the
 MIT license
-`here <https://www.opensource.org/licenses/mit-license.php>`__. You can
-find information on the GNU GPL
-`here <https://www.opensource.org/licenses/LGPL-3.0>`__.
+`here <https://en.wikipedia.org/wiki/MIT_License>`__.
+You can find information on the GNU GPL
+`here <https://en.wikipedia.org/wiki/GNU_General_Public_License>`__.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
-- 
2.25.1


