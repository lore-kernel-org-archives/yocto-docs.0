Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD88C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:25:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24138.1707233117758066907
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oqspnoQJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 586CA60009;
	Tue,  6 Feb 2024 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh7UoIP0YO3wEyAdzRcK1Niz3gTnVb+1OHAkaERDRF0=;
	b=oqspnoQJbp4vVnFOQz3Tt40DAEEznK3MTXVs9fHYeIK5AGu7aeMWYOt+Ex2dU8MfM150aD
	RwisQddVlLRQ8SAiIBR/HRufH7w9O0nGP7gPfr+Adydz03NvMUp+BV2NwBhPAQFvDJEKlW
	bZiTfMqLH1vedHA4m9JSyXpJUQxx9jcg63VCl6cuwVTJd8JqLlq+kn2agRxVzBzUDxtW4Y
	Drde62ch13fBWci43/duD/ob5OgKKLTHZIyrmImz9kxGLcyd//9gcAItGvrjTloJbYjuKE
	LaUhQvlnqTzffpa+SmXp5FsXJd7C9adq0v4uX3Wa/wIUyuyZ9hU4G8b1GrSCOQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 3/3] release-notes-4.3: fix spacing
Date: Tue,  6 Feb 2024 16:24:51 +0100
Message-Id: <20240206152451.76368-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
References: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4818

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an ugly formatting issue in the HTML output

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.3.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 85180dfc3c..0e175067da 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -94,7 +94,7 @@ New Features / Enhancements in 4.3
       API to access the kernel tracefs directory (from meta-openembedded)
 
    -  `libxmlb <https://github.com/hughsie/libxmlb>`__: A library to help create
-       and query binary XML blobs (from meta-oe)
+      and query binary XML blobs (from meta-oe)
 
    -  ``musl-legacy-error``: glibc ``error()`` API implementation still needed
       by a few packages.
-- 
2.34.1


