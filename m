Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAE6C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:51:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.12341.1705078293502214232
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OPIEyTfF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E68560005;
	Fri, 12 Jan 2024 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXecpkpvE015KAx7LiCzBihJYRRbp1uduzGl3ayNut4=;
	b=OPIEyTfFhgIUXV7Q11FEVjAQqhI7YuWkXlbN405ftkx8Idon5ESitQrVZ5MGs6lOZDjvlx
	nH0bnG5ix/dRHZy+6rqrPH77UbcmgOtsctldwnxMg3ZKeMUw7FcZ047OQVq9VoytgrqAwG
	KlPmqyNJkovjFI93HsSizb2/B6fVQnP3bZGeEZjULWDFkmnS4ZITABUlNR9XQf8PdQj+nW
	i99UoF9zMBaBQrWX4EYhHWbks8h/axKzHVO1lIRiZVds8LBT8P3hGGN4WqW08tyG2lPfaD
	AO11qL680j3NtHzqu/DHX1rcXlUlBWsIxKg3dwXjcpKdXAUfay/QV2EwCbf85w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 2/7] contributor-guide: use "apt" instead of "aptitude"
Date: Fri, 12 Jan 2024 17:50:54 +0100
Message-Id: <20240112165059.3553847-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
References: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:51:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4767

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

As used in the rest of the manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 5a6136c8c8..95728c25c6 100644
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


