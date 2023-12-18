Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F894C47073
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2937.1702935257484449649
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hocrXHgr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08ED21BF204;
	Mon, 18 Dec 2023 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpHpVrn0jQg5a6pimDXUvZ9h1P8ylYcC2WmyQVmgNKY=;
	b=hocrXHgr94jZtj/WPbrPy5QP/NUh/dsVLMt/P0RsDb9Pgx5Rr1iw9B+oxgDo9VY7+BKDc4
	bJp8Knv8BffJ9/4UG/e6eFIWHWVoUwao0DA5qNRrGlLm8Pm8ahPIJkOPHVMbDOFwMGQvsK
	SaEhDJfveq+pRXCCeqXPTbC9CGwG5h+2dstENGQwlRyvkLYiKw9KIn0+RhEaq0VSQuR3Tv
	YU3lrZhUT0kcl8yBPBe7Ce2hH8pDSIQN9hpVSVEYu+/0jqZWkDR8kr7IoJU3Ffjm8Nke41
	sxk6AI6bEZ2BVwHh7cP0tP7/apAK6eTFHYRnYPGzVoLaBJ0lZncRtrz7RIU69g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 13/20] test-manual: add links to python unittest
Date: Mon, 18 Dec 2023 22:33:27 +0100
Message-Id: <20231218213334.146370-14-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
References: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:34:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4699

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Better than using "python unittest" without any
special formatting.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index d14aa20f76..a76ae25609 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -205,8 +205,8 @@ Tests map into the codebase as follows:
 
       $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
 
-   The tests are based on `Python
-   unittest <https://docs.python.org/3/library/unittest.html>`__.
+   The tests are based on
+   `Python unittest <https://docs.python.org/3/library/unittest.html>`__.
 
 -  *oe-selftest:*
 
@@ -219,7 +219,8 @@ Tests map into the codebase as follows:
       in the same thread. To parallelize large numbers of tests you can
       split the class into multiple units.
 
-   -  The tests are based on Python unittest.
+   -  The tests are based on
+      `Python unittest <https://docs.python.org/3/library/unittest.html>`__.
 
    -  The code for the tests resides in
       ``meta/lib/oeqa/selftest/cases/``.
@@ -338,21 +339,24 @@ A simple test example from ``lib/bb/tests/data.py`` is::
             val = self.d.expand("${foo}")
             self.assertEqual(str(val), "value_of_foo")
 
-In this example, a ``DataExpansions`` class of tests is created,
-derived from standard Python unittest. The class has a common ``setUp``
-function which is shared by all the tests in the class. A simple test is
-then added to test that when a variable is expanded, the correct value
-is found.
+In this example, a ``DataExpansions`` class of tests is created, derived from
+standard `Python unittest <https://docs.python.org/3/library/unittest.html>`__.
+The class has a common ``setUp`` function which is shared by all the tests in
+the class. A simple test is then added to test that when a variable is
+expanded, the correct value is found.
 
-BitBake selftests are straightforward Python unittest. Refer to the
-Python unittest documentation for additional information on writing
-these tests at: https://docs.python.org/3/library/unittest.html.
+BitBake selftests are straightforward
+`Python unittest <https://docs.python.org/3/library/unittest.html>`__.
+Refer to the `Python unittest documentation
+<https://docs.python.org/3/library/unittest.html>`__ for additional information
+on writing such tests.
 
 ``oe-selftest``
 ---------------
 
 These tests are more complex due to the setup required behind the scenes
-for full builds. Rather than directly using Python's unittest, the code
+for full builds. Rather than directly using `Python unittest
+<https://docs.python.org/3/library/unittest.html>`__, the code
 wraps most of the standard objects. The tests can be simple, such as
 testing a command from within the OE build environment using the
 following example::
-- 
2.34.1


