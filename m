Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2F8C54E59
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12827.1709042498346201326
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bJkFcIBo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83BCCFF80C;
	Tue, 27 Feb 2024 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfN0rrmB0RbOaaOSBBZBk/t1uuPec1pdArgLQGvOvbU=;
	b=bJkFcIBo++Jdsykh61bppG7H540Rl+je2WcRfhlYg5gSlrNEcvI16bBV6Jcyz3jJ3Ir997
	4X52UJliGODIhMW8aYKA5ip6kTVkVSgyMA7OTH+u6Ps7+TbjQ0l0ysCm+ESDorJyDavjNU
	2XMJPjVEkDOnfQ87Z0ul+ED8fyOVSe9V93/LCBjqdlXvOa0LhYq1+kTBjSmlJg8CmFXI4C
	AnVLAAF6CDpj7ETEBVRGThcv4PHpCZ5EvIQfF+W6Hi8WJvwUcGSi0FR8aV/Wgncf78HXCQ
	C2CbYaJlLKF4LbN/9OF8aPLkJhJJSdAPfhlw6uX2MaQRJzo6s/q0z+3x/DPzTw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 02/16] ref-manual: release-process: grammar fix
Date: Tue, 27 Feb 2024 15:01:14 +0100
Message-Id: <20240227140128.481522-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4893

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index daa28308ce..2393ac8d81 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -175,7 +175,7 @@ consists of the following pieces:
    piece of software. The test allows the packages to be run within a
    target image.
 
--  ``oe-selftest``: Tests combination BitBake invocations. These tests
+-  ``oe-selftest``: Tests combinations of BitBake invocations. These tests
    operate outside the OpenEmbedded build system itself. The
    ``oe-selftest`` can run all tests by default or can run selected
    tests or test suites.
-- 
2.34.1


