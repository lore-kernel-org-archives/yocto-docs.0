Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22274C47074
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:34:23 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2940.1702935258725532735
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jpexM9TB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80D4B60004;
	Mon, 18 Dec 2023 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSlVIYDMdc2Dx2hNIGH9Lstw7kTup+Xw+2wT2MvjWLA=;
	b=jpexM9TBo70duwvef0Ut1MvUeQpCmwGjdmTyrFPH2lBoeJKdo77TZn1LbsNsYG7lJ0I8DB
	VaxWfiC3T190t6fnUgTjR8MfLpTN5X71JREVkBMlnHuTcq8xn1RdjVZmFbVZ9aHdahtWdi
	ekBL0no0T8O09Rbdn+CBm7o6fd7N86lmcreu4sMjMZD9hqAhJTgpVsHAo+KtbpeojE5L76
	leBSk03sbikT5qazw6oBi8xvbetV1h15/YZPDbCHBFhYQrOAn++PMFSrh+TlPNKH8Ji27M
	4Bke694WOJCIOiD7ZSYLnaposyfd/2cshXL88n58Nl7WXMgtYtRscr6ANU77WA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 14/20] test-manual: explicit or fix file paths
Date: Mon, 18 Dec 2023 22:33:28 +0100
Message-Id: <20231218213334.146370-15-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4701

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index a76ae25609..c79dfb6ab0 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -276,7 +276,7 @@ Tests map into the codebase as follows:
    -  These tests build an extended SDK (eSDK), install that eSDK, and
       run tests against the eSDK.
 
-   -  The code for these tests resides in ``meta/lib/oeqa/esdk``.
+   -  The code for these tests resides in ``meta/lib/oeqa/sdkext/cases/``.
 
    -  To run the tests, use the following command form::
 
@@ -309,7 +309,7 @@ Tests map into the codebase as follows:
       :yocto_dl:`txt </releases/yocto/yocto-4.3/testresults/buildperf-debian11/perf-debian11_nanbield_20231019191258_15b576c410.txt>`
       examples.
 
-   -  The tests are contained in ``lib/oeqa/buildperf/test_basic.py``.
+   -  The tests are contained in ``meta/lib/oeqa/buildperf/test_basic.py``.
 
 Test Examples
 =============
@@ -317,16 +317,14 @@ Test Examples
 This section provides example tests for each of the tests listed in the
 :ref:`test-manual/intro:How Tests Map to Areas of Code` section.
 
-For oeqa tests, testcases for each area reside in the main test
-directory at ``meta/lib/oeqa/selftest/cases`` directory.
+-  ``oe-selftest`` testcases reside in the ``meta/lib/oeqa/selftest/cases`` directory.
 
-For oe-selftest. bitbake testcases reside in the ``lib/bb/tests/``
-directory.
+-  ``bitbake-selftest`` testcases reside in the ``bitbake/lib/bb/tests/`` directory.
 
 ``bitbake-selftest``
 --------------------
 
-A simple test example from ``lib/bb/tests/data.py`` is::
+A simple test example from ``bitbake/lib/bb/tests/data.py`` is::
 
    class DataExpansions(unittest.TestCase):
       def setUp(self):
-- 
2.34.1


