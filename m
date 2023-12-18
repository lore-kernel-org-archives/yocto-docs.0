Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F7C4706C
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2941.1702935260546766633
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jZHtyYB3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C3E0FF805;
	Mon, 18 Dec 2023 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d94f7TH/LthGIT7JXrWqv99gPd/Mr/CuGOin7IKR+Mc=;
	b=jZHtyYB3p1a3AhwIkheNg38cAjzaA/UQtqV8pE9YfsD1g9KEVBAPTSu/xbwsWN4k7sZBAw
	UYvVKMr6uO9WUQoDtlD4eaFingO/iSniG/Bkk1MFNyQVLfD1rLUxv0ErG+Bqo7PoFX/4Yv
	3uSIe86BExWmJercVZHBD+49mjiEzdpEbp07GP4YWMuFfFhTrS5105G+uCXu7UJ/rFAGDx
	aTp7CUEytm4DJR54cAFPI0hlm9uVWVkuJ1kpGPUsYTv2i8wC44lIgCYHicbSoUBWIz0NhB
	1TamgpK0rHt1RYutIY9ysdMdt8IkhptYhH38xfQ8T2yKXVcR3xSUSxlY0o32lg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 18/20] dev-manual: runtime-testing: fix test module name
Date: Mon, 18 Dec 2023 22:33:32 +0100
Message-Id: <20231218213334.146370-19-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4704

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 205a96cc59..be1e8c02e5 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -453,7 +453,7 @@ layer's ``layer.conf`` file as normal). Just remember the following:
    directory.
 
 To create a new test, start by copying an existing module (e.g.
-``syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
+``oe_syslog.py`` or ``gcc.py`` are good ones to use). Test modules can use
 code from ``meta/lib/oeqa/utils``, which are helper classes.
 
 .. note::
-- 
2.34.1


