Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073B7C10F07
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:54:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.34970.1701878078376320681
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q9lj2nB9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8F5AC000E;
	Wed,  6 Dec 2023 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701878077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9lLOcUSh5ewAmgOh7JEWRzCBKPMGEV6AI4TeYj7aGAQ=;
	b=Q9lj2nB9kzmnfqwg+g0aZUNHfNwEi2vxTnDIGQ8lpMczZuMPjV+XFlFkMlwE/0c97F6PN0
	fQdrCkmv7IG6pG8GKrpVB8gezxZ/wBRmPWwaUUN/lpOEYI7KfLETy7WBgzJQ1Wjw1WF1ko
	ByJJw1dIrb1Bg7va7wOyaTTY2hj+RHF5VUY5EKCEE7G6gYNuD51Jc95aBIhpJu24adXp2G
	xWE+t9HwkjY30T75smMpLXfvrzwjw51s1ZrfjYlNhfWwadzQnrMBPuq9F4S2S+riiBPWKE
	8r4GO9VS20K9XRxn9+4zTQgHMYPzIvYCkGd/radw2j97UxADewRfCl9cbMNnBw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/6] test-manual: use working example
Date: Wed,  6 Dec 2023 16:54:24 +0100
Message-Id: <20231206155427.279612-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
References: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4659

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index d14aa20f76..e72a51172c 100644
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
 
    The tests are based on `Python
    unittest <https://docs.python.org/3/library/unittest.html>`__.
-- 
2.34.1


