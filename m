Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7361C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 09:44:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.19399.1706867069452381722
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Feb 2024 01:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TFxy+ASA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A67C660007;
	Fri,  2 Feb 2024 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706867067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KC3EEXkFuDG/PjdH3MrmtB//6HjhPtyQu1dO3C1PciE=;
	b=TFxy+ASAxuDe3dxJ/gkLuOc94tpJakDhUBUKbv51dKPgG31BKJdg6Nn/BHoFxEM9ZPNoxA
	BjVZluGvBMpoXqGlFhlVbfiZRWBGj9tmzuYjoFY5cVLgnPCS+rn08lKEloSkS7a96Qsqd1
	un5z4Re2Z2Ar9LXSSWZLwhk/wMXDCnhVcfE1OkVowPnemyPfGVo75y1BEcbbsbXIjyMPRU
	JjtQ0fKs2bYUh4lAxdzL8vqZZhOZTY9/ETyJtU8xt8EIYYJLgUTNFydCgIYXxgf/Ogmbv+
	UhC9Xz4FrLocVGobxozRQp7zS77iH67ScaMvJA69Ug/eiqpzn7Ko84T7y8nRUg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: remove support for mickledore (4.2) release
Date: Fri,  2 Feb 2024 10:44:20 +0100
Message-Id: <20240202094420.3271944-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Feb 2024 09:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4806

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index a7c4d5af0b..90e08fc5e0 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,7 +26,7 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["nanbield", "mickledore", "kirkstone", "dunfell"]
+activereleases = ["nanbield", "kirkstone", "dunfell"]
 devbranch = "scarthgap"
 ltsseries = ["kirkstone", "dunfell"]
 
-- 
2.34.1


