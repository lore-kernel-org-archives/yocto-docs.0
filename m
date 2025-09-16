Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E8DCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 11:01:24 +0000 (UTC)
Received: from o1678988x14.outbound-mail.sendgrid.net (o1678988x14.outbound-mail.sendgrid.net [167.89.88.14])
 by mx.groups.io with SMTP id smtpd.web10.16553.1758020483594438256
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 04:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=s1 header.b=MaTpXYyI;
 spf=pass (domain: delivery.danfoss.com, ip: 167.89.88.14, mailfrom: bounces+41880229-e279-docs=lists.yoctoproject.org@delivery.danfoss.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=euj8tu/F1UWxQ7M1iruzOcjQ2kcywhu8oBnCRQURFXA=;
	b=MaTpXYyIW3hU6oQLLKnnPc4gVbp3f8oy2coigS/5m+0R5u3jRoAvS0p5KrqhSnw6HDv4
	IlO4PUKmUJSESr6DEeTPrbNw0jaFHRchVzqEB1kSXf3if14JKCbixJlE1MkcoSJO6hyFQ5
	tF0033Aw+69QKLmIe+8IJMOlfCArWPx0QtkTZChkrLhtG0m8hzVUfHylXkn1Kc16Z46y3n
	43FYAl8iESET8HoqZfSSrQZBV3jkTY+pYfrmI6TjGK+NHG+CRfDIZJPkEozgpqcs9BiKmG
	Em0TtHzK+htMGBhfrofko+8lC3PorduF04bekiZIZXk9CdKH4OLk0ahlcY8DiuGQ==
Received: by recvd-769f975875-k9t5x with SMTP id recvd-769f975875-k9t5x-1-68C94382-2C
	2025-09-16 11:01:22.291504004 +0000 UTC m=+1166259.183576647
Received: from PC-5CG2490WFQ.danfoss.net (unknown)
	by geopod-ismtpd-11 (SG)
	with ESMTP
	id 8Ov_HKumRf2FodNYpVnelw
	Tue, 16 Sep 2025 11:01:22.190 +0000 (UTC)
From: Barne Carstensen <barne.carstensen@danfoss.com>
Subject: [PATCH] test-manual: update runtime-testing Exporting Tests section
Date: Tue, 16 Sep 2025 11:01:22 +0000 (UTC)
Message-Id: <20250916110116.1227-1-barne.carstensen@danfoss.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2E=2FTauPrjZw6tdXz2Pck6EKIfeV+Osq25MJTGhiRon1Zqf4kmVhwvm=2FrBjK?=
 =?us-ascii?Q?vlQ6LK6xhEtbMkLCUGXnBMfC+Pf+Xuf2moEc19x?=
 =?us-ascii?Q?L9icZmQNekcztrxAmcDJ2G6Ok5fTn4SPstxl52d?=
 =?us-ascii?Q?9z4PgzTZrsi=2FMQLitm=2FpIF5c06ceYRTDdyrenNE?=
 =?us-ascii?Q?SFUvpZPm71u9YsRcAVgm=2F4xdTezWKD62MrBKGes?=
 =?us-ascii?Q?lNLAS4VSJUK05fWLJDxcVXnqnpK0+tuGtcdocaN?=
 =?us-ascii?Q?yw6kzX0AFGGqyZh8s17=2FkfsiBg=3D=3D?=
To: docs@lists.yoctoproject.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>
X-Entity-ID: u001.f20y1lF57MqL8KX+pChZqA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Sep 2025 11:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7523

Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
---
 documentation/test-manual/runtime-testing.rst | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index 557e0530b..909448ab2 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -403,7 +403,7 @@ defined in :term:`TEST_SUITES`.
 If your image is already built, make sure the following are set in your
 ``local.conf`` file::
 
-   INHERIT += "testexport"
+   IMAGE_CLASSES += "testexport"
    TEST_TARGET_IP = "IP-address-for-the-test-target"
    TEST_SERVER_IP = "IP-address-for-the-test-server"
 
@@ -413,18 +413,23 @@ following BitBake command form::
    $ bitbake image -c testexport
 
 Exporting the tests places them in the :term:`Build Directory` in
-``tmp/testexport/``\ image, which is controlled by the :term:`TEST_EXPORT_DIR`
+``tmp/testimage/``\ image, which is controlled by the :term:`TEST_EXPORT_DIR`
 variable.
 
 You can now run the tests outside of the build environment::
 
-   $ cd tmp/testexport/image
-   $ ./runexported.py testdata.json
+   $ cd tmp/testimage/image
+   $ ./oe-test runtime
+
+.. note::
+
+   You might need to run the image under QEMU or deploy it to your
+   hardware before you can run the tests.
 
 Here is a complete example that shows IP addresses and uses the
 ``core-image-sato`` image::
 
-   INHERIT += "testexport"
+   IMAGE_CLASSES += "testexport"
    TEST_TARGET_IP = "192.168.7.2"
    TEST_SERVER_IP = "192.168.7.1"
 
@@ -435,8 +440,8 @@ Use BitBake to export the tests::
 Run the tests outside of
 the build environment using the following::
 
-   $ cd tmp/testexport/core-image-sato
-   $ ./runexported.py testdata.json
+   $ cd tmp/testimage/core-image-sato
+   $ ./oe-test runtime
 
 Writing New Tests
 =================

