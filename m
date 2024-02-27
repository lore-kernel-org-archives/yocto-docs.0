Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F29EC54E58
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:58:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.12759.1709042328365773678
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V80Nip48;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E30360008;
	Tue, 27 Feb 2024 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6T7YjxbF4UuLrqm5XevvNS4lsOCUF7uSBIN6FnOtPY=;
	b=V80Nip48plGN6SgtE5MXwbZFP37JnpE47RDlD4RZO4I9XK5JqfnsmDi0MHpJypQlGDbo4w
	dqujd8UUALeBecphWM/NPuC0FVhJUBSkfb9aTQGq5O/gQ3UogrZAL1Dgyy7ysC5JtfOIik
	rlpFKN9iDtXFLtGo5copXSqohpeQYtM9DUoeo8b+Lzy006rP2u2eDjAFf4I6uPhe8iAayz
	s5Q7zAjAYGa+Ew60iqK/vf7BFvSBYq0sHcjYeE3tWXsMvBndWMIe+i1zV1J+cNN+c0Ekoz
	YMu6y40uTnWBb80gswFEnSkrvh5G3JAJvZTKeoA+M6x509aMfJ45cgKcFJG/6A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 3/6] ref-manual: release-process: grammar fix
Date: Tue, 27 Feb 2024 14:58:27 +0100
Message-Id: <20240227135830.481147-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
References: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4887

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index c861feaa9d..9c4144fd2c 100644
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


