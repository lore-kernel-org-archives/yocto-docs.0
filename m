Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73C6C54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12669.1709042503461766719
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ApG5W1Fd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06218FF804;
	Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goi+Q68SK2vCBmOtPsKzKdDQ6AJXObdkaZKdcNqnl4A=;
	b=ApG5W1FdMia/31eBB7o8Qw/Ne9kbaftzQ6tkk3HJzcTH7qIKwech+rrqD7/tnRXZ5S3/9x
	gjfIg0+phZbUOf+L8Sid7X41SLAGAU0XX3ShkpuF7C8sDnyG8KpfVeF2N1eB3zsgx9rkmU
	2ELUhMeGsjurgvAW5iehBdJ+F4llyZ6mvOjE0CBVqM/hC7ZUR5ceSk+Uii+qDnis51TKZK
	gQi97ik0DyxhO2NLmE2RuUnEdZ74gWqz2QPyAttlZDy1Wju2CQORMhATPknMouxVAtEfGS
	mLiPrirZ7aUSBAbc0JGFdKamqiSeJEj2jTH1dd+NmmZdxENBgn8QFe9IZUO3IQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 15/16] ref-manual: system-requirements.rst: fix AlmaLinux variable name
Date: Tue, 27 Feb 2024 15:01:27 +0100
Message-Id: <20240227140128.481522-16-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4906

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 391ba95c42..41f8077d60 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -214,7 +214,7 @@ AlmaLinux Packages
 Here are the packages needed to build an image on a headless system
 with a supported AlmaLinux distribution::
 
-   $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
+   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
-- 
2.34.1


