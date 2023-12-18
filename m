Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987C7C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2911.1702935261218790230
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EvrWrNau;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0B9C1BF206;
	Mon, 18 Dec 2023 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arWyUJL1PDReL7vljPZX3AEJO7ivM4F9HWJC+HE4JH4=;
	b=EvrWrNauogRBba/vEKLSVTTXpaa1++gjRZpvGsB110Q2hinmh3mpD8to1ts/vC9pdZ/vMo
	nsIvTfK2QvUPgKYVkpzNHp8i/DVFLYsNGMnZXND+jFm3m58ZzN6OAWFfukWuaiab7FCNVv
	hdWZPn6DLQGAiQyXSG0lPZ7VpRb+xYgWqgPworrztV9JIqf2a9fvCaZwNbA7zjCo5skIoO
	UIch8HqZEopkB+kmvjMVKv4yc6DukEmlFD9ObGOiaYcpvlMDrgYGEPXwPdm4mhbmCvezBg
	p3skAY3Mtgjj2Z6KhS/Dq6eVqJeOmuYKV5MjdX+xCHo0COVM47qwv0CE9GO1UA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 20/20] test-manual: use working example
Date: Mon, 18 Dec 2023 22:33:34 +0100
Message-Id: <20231218213334.146370-21-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4706

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index c79dfb6ab0..c31fd11c7a 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -195,15 +195,15 @@ Tests map into the codebase as follows:
    Use this option when you wish to skip tests that access the network,
    which are mostly necessary to test the fetcher modules. To specify
    individual test modules to run, append the test module name to the
-   "bitbake-selftest" command. For example, to specify the tests for the
-   bb.data.module, run::
+   ``bitbake-selftest`` command. For example, to specify the tests for
+   ``bb.tests.data.DataExpansions``, run::
 
-      $ bitbake-selftest bb.test.data.module
+      $ bitbake-selftest bb.tests.data.DataExpansions
 
    You can also specify individual tests by defining the full name and module
    plus the class path of the test, for example::
 
-      $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
+      $ bitbake-selftest bb.tests.data.DataExpansions.test_one_var
 
    The tests are based on
    `Python unittest <https://docs.python.org/3/library/unittest.html>`__.
-- 
2.34.1


