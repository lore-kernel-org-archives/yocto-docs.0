Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C992C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:25:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24135.1707233113320309382
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CICxTlSI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B02971C0008;
	Tue,  6 Feb 2024 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nH2zWwhl3Z/YTT/4OLEx7OiXKTCQU8hhAnvalo6cMmw=;
	b=CICxTlSIbqSsaRpqLYWaIo+Xo22+uq8kbZRizzYEYE6cw5Gz8SzSa9J9BHxg6/frS2Img9
	jGl06iF0Yk9Nbowiuyfq8w4jksF8VXwbBn4ejIXTCxlAd0nM5ehrchTKYA5XzOXQKfO86K
	LBgJQV4QvCH/zMFd4Qph2VoonnI6//t2y4mwMxAUlY0yFxZLz2fO5xYgWT5eWLdKqbaU87
	q5VT/nZ0+08RXS9kieork88Z6mGiliPT2qQrotrnCJUUZNdrpsMXBFEJbKPpqhcuFlvGQq
	4mv3vhtR5/MZksEDIJQSIATzmkB5p4rhRHQouszaERFDojh+hMNoD3YotXtzqw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [nanbield][PATCH 1/3] dev-manual: gen-tapdevs need iptables installed
Date: Tue,  6 Feb 2024 16:24:49 +0100
Message-Id: <20240206152451.76368-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
References: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4816

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Simone Weiß <simone.p.weiss@posteo.com>

Add the hint to the test setup that runqemu-gen-tapdevs will need the
iptables package installed.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index be1e8c02e5..1a2e9ec4fe 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -52,6 +52,8 @@ In order to run tests, you need to do the following:
          -  Be sure to use an absolute path when calling this script
             with sudo.
 
+         -  Ensure that your host has the package ``iptables`` installed.
+
          -  The package recipe ``qemu-helper-native`` is required to run
             this script. Build the package using the following command::
 
-- 
2.34.1


