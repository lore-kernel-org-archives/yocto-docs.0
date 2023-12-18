Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AE1C46CD7
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3171.1702935916135912639
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nvY7Z4AE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A693C60002;
	Mon, 18 Dec 2023 21:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pcuTeNVH0EpOZfDAxu5fEWUpljXdJPAwp4Lj6HiLKs=;
	b=nvY7Z4AEnhd/TSFM+YVZQbxTwo3o6FlfgD61/JhDxfl806fJV8PWh43A+H3QWsGMibIXLY
	YbbsYu6bZTV6d1Dbfp013sQd18fqeSS4taia1pQqDeCB83p1Pbme4HZ4rgMZ+lbqsjt+WS
	vmdfPvSqhlbvXRGMdSSSoT28DBhoTLeUq8ry+sr13CJJTLJGuxp1EKZoTf0uFplsuDfkkb
	pjlJd0rZryLj/U1nX6jwu0GlTJf+TzyjNX5jmGrH59SUftLuBdMS2KJlLj5C9C+EY7eeBS
	KxINgku4GB8qWyf9Aq4RMNdVINuUC9gCj9MtPkjiD2bWckj1R6L0Q2QpTqxHnw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 18/18] test-manual: use working example
Date: Mon, 18 Dec 2023 22:44:42 +0100
Message-Id: <20231218214442.147385-19-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
References: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4724

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index d58171fb80..16f73ca468 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -190,15 +190,15 @@ Tests map into the codebase as follows:
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


