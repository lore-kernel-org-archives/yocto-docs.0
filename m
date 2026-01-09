Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0D7D16808
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:45:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7548.1767955533376794971
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 02:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CM3oDhgf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 46F891A26EB
	for <docs@lists.yoctoproject.org>; Fri,  9 Jan 2026 10:45:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C46860734;
	Fri,  9 Jan 2026 10:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7730103C881E;
	Fri,  9 Jan 2026 11:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767955530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CpvZglDVOtAAykMxAyF2zeRMPb4r2KieoyJyFNncqcc=;
	b=CM3oDhgfp3cdmVqxlinQBbqxac/KEXJLrn85O6LcYJqQAYNYbqTPnUQClqcJmxvQhiFWLX
	9zbE3GqEulNpucxusrPm0bAraz+fB31k8uBi/tuixCPxg6wYr12tKmzb96RKEJSiSJbRBX
	AqbqdAz/wjprEILU8iwKX/vKvTKAkleVwy7HFPtvQUJtQHO0nzfNFuICs1n6V0v4lXkuk8
	ElvilzmMztb0Hfn3MTraluyxxG17wqAzuS4YAwAYYiRdGN4feZ1rSUdBGtgPCGdjTHJPqU
	aJfXl/pE/KVEdWFw/C5UjI2HDN3WWEp5dG+J4nwQKVdYvwT9JmRE4EuaqyfgVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 09 Jan 2026 11:45:22 +0100
Subject: [PATCH] test-manual/ptest.rst: detail the exit code and output
 requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-ptest-output-v1-1-29b1b2039c97@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEHcYGkC/yXMQQ7CIBBA0as0s5YEaCXBqxgXFUcdF0CYoTEh3
 L1ol2/xfwPGQshwmRoU3IgpxQFzmiC81/hCRY9hsNo6bbRXWZBFpSq5irJ+9cvszj5YhJHkgk/
 6/nfX22Gu9w8G+T2g9x13p/7GcAAAAA==
X-Change-ID: 20260109-ptest-output-29a943659c2e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=f6XvYHFrb9wQQmnNRzp19PRKLej5YE6bLVthS8bT5O0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpYNxJ7UjbE1fD1/GIzjvjw+ceZtAM5cbZwPmiy
 H6zddkUyMCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaWDcSQAKCRDRgEFAKaOo
 Ni1+EAC8liFrliyd8jfn1PscEl89xrvxugolJNQ4IfLqBpm2jTa/BA2bRZylC3vHnoMmvtWtCgl
 wvL7IwGx6OpuDW4s2ThKhVw0vMLfzdCX+Uoafut6yhP/TgjMiCW23jmuFj46DiM1kmdGoNEImmp
 3zV7wrc+89lTMR1AzcXjehwdamCpc8/kDvk+Fg1knMxsuxOKhuoGjmzfpBapJHqViJaxq7L6f2M
 FJWToX4o6DhcReIvEWm7dnnKhtW294n28jXLEYhHyaK/XmZKbQ/BW8RdL+nvBCnedz3tuTsXFjw
 yEHQjJ74tK2uEu67l7jhLIIO9DN28gtTZYCpOSTFsO8N2BhP4Eh3vjVD6NF4y6UmIr00nXD9VwZ
 YNek4RjSDzXH2zddLhDdY9dANoy+EfenRFkfyPw8w1UGQOVJaV3pkKaUMLgc3DvFUj+ClEMwiIM
 TS3m8IXzMMSFjh7UlSS7txPExY225Fs242LXVJl36sxiHkdcKDmubfB7u1oC885Tu1ucPDO2l3A
 cM6bEhXt9hPDGQuUZMOY2923AL/TGfFecdEciuRt3PXoJ76/IACNED1rF8HmQogbDhRBQeTr+Bh
 uCvfru59TKMiujbNHXUlZBk6n8dv6vIISm6mt0eDr7tcBdOiuIXd8MdBvSEQqLghCiJZ2Ud9uo/
 WeRsGNQQUcjQP5w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 10:45:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8447

A ptest must emit at least one test result on the console, as this is
required by the testimage class (which ignores the exit code).
ptest-runner on the other hand, ignore the output and only cares about
the exit code.

Add these two items as requirements for a ptest to be valid.

Fixes [YOCTO #15832]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/ptest.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 4e6be35df..1c946f81d 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -91,6 +91,25 @@ test. Here is what you have to do for each recipe:
       cd test
       make -k runtest-TESTS
 
+-  *Return an appropriate exit code*: The ``run-ptest`` script must return 0 on
+   success, 1 on failure. This is needed by ``ptest-runner`` to keep track of
+   the successful and failed tests.
+
+-  *Make sure the test prints at least one test result*: The execution of the
+   ``run-ptest`` script must result in at least one test result output on the
+   console, with the following format::
+
+      result: testname
+
+   Where ``result`` can be one of ``PASS``, ``SKIP``, or ``FAIL``. ``testname``
+   can be any name.
+
+   There can be as many test results as desired.
+
+   This information is read by the :ref:`ref-classes-testimage` class and
+   :oe_git:`logparser </openembedded-core/tree/meta/lib/oeqa/utils/logparser.py>`
+   module.
+
 -  *Ensure dependencies are met:* If the test adds build or runtime
    dependencies that normally do not exist for the package (such as
    requiring "make" to run the test suite), use the

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260109-ptest-output-29a943659c2e


