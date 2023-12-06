Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14D4C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:54:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.35298.1701878080280281610
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SAS5ewoV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 517E160008;
	Wed,  6 Dec 2023 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701878078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fWBzfsGfZ/lKPZo0QozcDhJ2Cra4P7AfIKCH09Lgwuw=;
	b=SAS5ewoVXv2U62BAJ0YP7VqOkVR4VsCn7iBKARE8I39Sul3YppPE6mURiPLFD8q932nnHe
	ek+fCDJA5QEdSEI/vyG9nvoBfFkTgZ1EIzzUxU39Ui7Z39SAlrH3Iwu8/7yD/G0OQESwvx
	vzSY7aemeaoMl+fefEwOTpCpGsoaQUR6f98sGxttO3SF8UP9GYrWfKM3S2WN4Qg8hoHDXJ
	OMJkH437pD2DiVKzSQzyHdkXKkkPTCtH71RgNI/tKeLqxeUK8qahU5X5oLfSDaMxba8Jey
	2gwJ8bSlPZyOsqdVauAS0kKxmHa9gh9LRtd29HIX/PppZaIV2MKW2mL4vx2bbg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/6] test-manual: add links to python unittest
Date: Wed,  6 Dec 2023 16:54:25 +0100
Message-Id: <20231206155427.279612-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
References: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:54:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4660

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Better than using "python unittest" without any
special formatting.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index e72a51172c..a2560f4f53 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -205,8 +205,8 @@ Tests map into the codebase as follows:
 
       $ bitbake-selftest bb.tests.data.DataExpansions.test_one_var
 
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


