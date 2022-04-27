Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77172C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 09:11:07 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.5969.1651050659337235470
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 02:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kVJH2SZB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4F1C4200003;
	Wed, 27 Apr 2022 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651050656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NNpHK5LT9bkQZ+H/r9LvJTdUDZo+QeBjABvfF6hbrHw=;
	b=kVJH2SZBYhrHskCOM2IPoSH9OFT4CDrSyLoEkMyBh7SSNyquDpuee0MeUXX/1sSApruZHJ
	zADcd/xk+Ek4rlgxeTTOoRQrBqk/295KMXtiYswUTMPj/XDcdlkANL49XpZ0L/Us5bEisk
	jDM+kZGy+IQJtCgActralP5KxmTsh/NJLTIIgrVCTNUbuQh4UAcmQ3uHdSAwvSkowSMp1F
	y6KOZA23UKdLwhMza7fT73iaCucQ2rsNXFn4TypHt0bo7vDIxcj8Cvmu9UDGjN8swwb1FR
	7kBwyC44en94PpNv2haQHC48PSTsex9hN6VZRkCXoAq6XN/QKIjwbJHJW4yibQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] migration-guides: release-notes-4.0: mention LTS release
Date: Wed, 27 Apr 2022 11:10:51 +0200
Message-Id: <20220427091051.212104-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 09:11:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2877

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 799a819147..eaa40f9317 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -1,6 +1,8 @@
 Release notes for 4.0 (kirkstone)
 ---------------------------------
 
+This is a Long Term Support release, published in April 2022, and supported at least for two years (April 2024).
+
 New Features / Enhancements in 4.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.25.1


