Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03084C10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 15:54:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.35299.1701878081669464294
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 07:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hC26pXIk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3B9C20008;
	Wed,  6 Dec 2023 15:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701878079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/lXpgIFopJqtnxonxDzxk661INKWehrgYotNBogoMw=;
	b=hC26pXIk/WQkwMZsM9VP2Hnt21fmMmKt3vVxyn3O1vUdpIoy4fsNmsghC+gnsTapUpCIeR
	UV7IW12qhlNs8RvnOCb4MZCLayz0ZfRcjflkTlALfFe1BlE4qEkwXIW0GEro8tIkGkS3A2
	6Uz1yKwAepbeBbemNfr1DTyJnGJwf//0FCoLKOa8wcXHjNS2V52B1lDeYC4XgJjKwQPp4o
	VWXMP4FERwVTmobAL7Bk5caprbi5rBF3imcxbRsfuiRksShbZDcUIP9RMpJS5UwnfnM8e9
	16T5d5SCZdVTz67f9t2uQlOOSWCHypbnBclzCsP/rVBk7+FucJyj2+cOzwmpDQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/6] test-manual: explicit or fix file paths
Date: Wed,  6 Dec 2023 16:54:26 +0100
Message-Id: <20231206155427.279612-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
References: <20231206155427.279612-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Dec 2023 15:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4661

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/test-manual/intro.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index a2560f4f53..c31fd11c7a 100644
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


