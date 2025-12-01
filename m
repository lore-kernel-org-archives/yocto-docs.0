Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24911D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18454.1764582934382772428
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 01:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NYorqOgn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E9E0C17B44
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4573606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37B5B11912570;
	Mon,  1 Dec 2025 10:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CBQr84YHHhMa7JX2F3lhB2qVDRyPwg+0Xn0TLJKEV40=;
	b=NYorqOgnody6jxEjSCsKaprVnLX/GFMqbndtZ8uivTSan1Ss+8AMwoCOEVRrucUBJsyunp
	3HCY9Bv8mz+4Aw3uTPSB85aojDZXkH+USZCbSaveUv7IpBCCA4xDnVrc1IebRL2Uq9rbsx
	4tqZGFn7U46T40TkYaccLfbBCvb6LYItzPUUy6jjfPeGSS0DpxR2Gt2mv3dg3BPO+/4CXc
	J95FXrZlLT3yr5S0tXLKZlP+wqD0LmGMO2avsnPTy1Sh+lGWn/xV6J3KHgu5IRUyyK2Vov
	y6YJYqcJnflgVL3xIBT4ATzVJAYpPqiW9HC5527GCaIloWE/B+uuDgHds647Bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Dec 2025 10:55:19 +0100
Subject: [PATCH 1/4] ref-manual/variables.rst: NVD_DB_VERSION: fix default
 value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-fixes-v1-1-1cf15a5a4cbe@bootlin.com>
References: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
In-Reply-To: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5oYcZwucKOouI4KF+YdeVg/HXy//HMj5CI7uJjk1tXQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLWYSVccLKYnGteKjMjKbj0MYUM6bJxXZ4Z/mB
 CMTgatLEDqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS1mEgAKCRDRgEFAKaOo
 NpyaD/0QvRJHIIFl4giHYlvePJWplCBcaocGijjmf7RbPdELKcSpyRZnJkszw0Q8+K2Mr0/ujaT
 OOuz6MS3+6Qw6D1fDIFrhXLU9p8FfLWvob0XamnD9TKvDSWigcDb8Qd+zvxCFCS/U+pFF9sW7lM
 bnZYZ9DH/zw8uePbjw0fitEfBW/x1et1yEtsXTVV6tPKwuDfnruuk9mCuF0OERp51IAgDuOPMx/
 5M6TjW+zbDS/YGt4dSnyoYFqQWfxpcswND5c1i+HHN5uXB8Sr274ftaqxC3kqD079qHwo7ytNzy
 bTJS38bSvHiL2aQTSAiwZ4KwGLuH9DDoJxcGFAEdGYbY0IJyx7vQCWRmQ0LTs8bmK9M9vUOHbV9
 wze3gl51RT1GDFL/Vv+pq/vaGkAMhtRDuXmoprALKyFEKqugE2Zc07Q45uRkR6RxH/pNVrrnIIV
 sOCFQ2f3EKXUGUnvU/n3zlR7NCbD6oJq6qBkXCJeAm7sMrqNTNi4O8fRAlh2G0ob8qzzm8aMsRe
 0Enrb+OK+N40acydDprsGGJwNjVDB2qySH30iLZS2h9kdB0D22oaVUlRhQ71kKtZ6rmLCViJf0m
 iUVAshycm8R6AOA062SOo0xt3LPsqv6hQF4RFTooTN5ST1HqjReW6O/ywMq27L4ZI4BbXSuhnr3
 +jPZxrvrHVTJggg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 09:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8181

Value is FKIE since 10580a6d36aa ("cve-check: change the default feed")
in OE-Core.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 576995355..71fe11b83 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6307,9 +6307,9 @@ system and gives an overview of their function and contents.
       The :term:`NVD_DB_VERSION` variable allows choosing the CVE feed when
       using the :ref:`ref-classes-cve-check` class. It can be one of:
 
-      -  ``NVD2`` (default): the NVD feed with API version 2
-      -  ``FKIE``: the `FKIE-CAD <https://github.com/fkie-cad/nvd-json-data-feeds>`__
+      -  ``FKIE`` (default): the `FKIE-CAD <https://github.com/fkie-cad/nvd-json-data-feeds>`__
          feed reconstruction
+      -  ``NVD2``: the NVD feed with API version 2
       -  ``NVD1``: the NVD JSON feed (deprecated)
 
       In case of a malformed feed name, the ``NVD2`` feed is selected and an

-- 
2.51.0


