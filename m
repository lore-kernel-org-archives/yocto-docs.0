Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F9CCF9F0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5036.1761294033288693055
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zwpesmei;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B281C0C41F
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB9E160703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 563E8102F247A;
	Fri, 24 Oct 2025 10:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3TI6FZXza3hZm31nrRu4T+4VBNjGRqohqb6gQiDX/cc=;
	b=Zwpesmei3jivJDKRcQAYrkvFqM7+MVl+rXjsCnOstNlDsTEjFXo+kaw9YaKuUSBH2LumPs
	6ujc1KRXTsiNgWNU5qB5ezxB+236dn9qLwMtk2ava+itPKt0/lzd7HhdqEX1AsAnDqjWv9
	pvsOshQwz1B+vFi5ozBFPpoJBAB4hljq5TJHO3m1+bu+q6R9f9y973UqkSTlJX9bjAdy3m
	aOADd/QUvJknISBotW+iG8VhT0+gorIjRNl/evOcFYKWNSKrZGQMGMsrwDJMVJSvht8G38
	5F3Fec6Ozi/gbfnI0ZYHorKD0a2MWlDbS+qJmxa/HyNxrsmCBKTVMW0nPRbu1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:53 +0200
Subject: [PATCH v2 04/16] ref-manual/classes.rst: ccache: mention that the
 host's ccache can be used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-4-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0nSHWzKsr0gwsemyUQnPcP8AsNTuNdKs6/qNoGDn9H0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbI4vWFi8TXgiA6wDZs7vlCBNml5WvfStJN4
 n71dk0EgISJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 NokHD/9T7EKy9tsIKk70Zz/omU/NCEdc7gsKAjZ49OjV2fUMSvlbNor3GxcIjTfR8BebyG35TEg
 h1ozvG/F29dUv/x2XQ6s3UK3QA5tnAFUda9TRTBT258eAHIfxdktkdoNm1K00/1XqUyGx1lAprI
 Pilvew/eK5K4+QJElbAbt7x5FhuxHG/AAZL6RG/rgxNish2VrMRt0W6pL5vDwFmdFzyLV1ct+9m
 mDfDl3scs/Do7fW4dAaizEC+0gelFSimqmbzIFLf4V6WQqZs3TcQO0Y+8dBLMxVAhKwoo4a/hw5
 VfXYKxglk0zLvKVY3MzXWVOadkr4USsTkUKovzOopndNO09wAqUYpQHKsXGSC1oHtM7725RS0Sv
 GYhf/7VjOigu1S8iYecjOFsRdEWMs0g0oO5TSR+GVcbXFJxQXSUAn24v0ksbbyXLjuBOvO37xjZ
 7Y28B3lIRHvZRvp1hhVGy9pbgGMLl83t/oMq3vuduXmMw6WclRLQzgHPXuq70iYU/A/JEkdCXUA
 EDxGAkxelH7kRpZOsmRppqOc2HpEuT9AYE8+VymcD3JNOtB10mSm4Mtnknpend3gryI+R4jE6Us
 128HfT/UWxu4CMZa8iOw44vdgv/TUtAjuY76YL421Mo/bSMgfgUvhNU1nTUr1dMj2UbXQ6FCf6U
 VYnptCeqwJyOHlw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7793

This feature was added by commit cc91a0f6500e ("ccache: enable ccache
for all recipes if it is in HOSTTOOLS") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f93897be1..4372bbf06 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -392,8 +392,17 @@ file for details about how to enable this mechanism in your configuration
 file, how to disable it for specific recipes, and how to share ``ccache``
 files between builds.
 
-However, using the class can lead to unexpected side-effects. Thus, using
-this class is not recommended.
+By default, :ref:`ref-classes-native` recipes are not supported by the
+:ref:`ref-classes-ccache` class. It is possible to add Ccache support for these
+recipes if the following configuration statements are provided from a
+:term:`configuration file`, which uses the host's ``ccache`` binary via
+:term:`HOSTTOOLS` instead of building ``ccache-native``::
+
+   ASSUME_PROVIDED += "ccache-native"
+   HOSTTOOLS += "ccache"
+
+Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
+Using this class is not recommended.
 
 .. _ref-classes-chrpath:
 

-- 
2.51.0


