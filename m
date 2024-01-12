Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA846C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.12594.1705078410365373873
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SU5e7+p1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 901D2240002;
	Fri, 12 Jan 2024 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NcvQfYuD8ymoMEEWWcw0l7YC9ul4BmTZySA+btenn/U=;
	b=SU5e7+p19yl3N5jjV8qqHorg+7TCozzABZl1Ywfted8KCZpxE0LrOkjzv/BccvmEW1vLgO
	CKoWsKeVc3MkYQRVt20p25PiJd3I460YSRu2uNMoXsiAopj/hRP5OPCyNsYnv76MZC42FR
	9khuvS7rEuWjFiREbVs0XUEHQ5ZpvRI6Rzkt+78k/VRrlxPzCH9L4LXSA871Odq9LDCXCy
	1e6o/xSzPjBUiswc0Km1yxK+entvpz8NO8FgjJqhVb+jeDady93HyJ+UQLneID7yegvk4l
	cdLqP2jbbVGRBoz89RMWN2KHmCiX16oyRoffqwGcmi77PuTZ3NHjnwrWK0SMcg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 1/6] contributor-guide: use "apt" instead of "aptitude"
Date: Fri, 12 Jan 2024 17:53:06 +0100
Message-Id: <20240112165311.3554201-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
References: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4774

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As used in the rest of the manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 289ec1383c..86f73c1dd0 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -57,7 +57,7 @@ Set up Git
 The first thing to do is to install Git packages. Here is an example
 on Debian and Ubuntu::
 
-   sudo aptitude install git-core git-email
+   sudo apt install git-core git-email
 
 Then, you need to set a name and e-mail address that Git will
 use to identify your commits::
-- 
2.34.1


