Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDBF9EDDE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83814.1776867776783609188
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b2f138HR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0734C5C1A5
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC48F5FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 465AE10460BA8;
	Wed, 22 Apr 2026 16:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GrFnkmPiMXKT5Iqq6Sj7WlyM6GjVgub/R3zTTRUR6XY=;
	b=b2f138HR3NNl6p6YCHjL5vsmU14TSoS5BpOFIxf5HJCe3qjMq8y9J5HNTvPgR7EDnV0jKu
	THaTKRWGeuaxfxXo8JVbV6fUzGY/6CjMWMDSyreBCgSWAscFhwQXAT6+RvHFDTQxoe3F7O
	XyPGVroRsip/rCj1zCgfVQf0dkC9uSgNUBKiuYKlRuCfLDbPRRmRHc2r1Mo66aK6hBlerx
	E3CkoJoycK1b17CXBCgiURMnJVDwdGn1Bzeq1FPDqqa5jphvFdQUlEWzkm/Pm7D0O2eXGM
	8NoDo8nQUIrFPyyymyLW2D+A4qMFTMxf4f/Tc3tu2kKW1lcOAc6O5RdHHG1oBw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:37 +0200
Subject: [PATCH 04/16] tools/build-docs-container: add missing leap 16.0 in
 help message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-4-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=683;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kA/9oXiW7LYw5X/o8i6uFStxCPrTuoa2PdGsdRUl/3M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm4LrywUttg3v0ErB5hpZl72bjHjIZuIhIV+
 fIfR70aTQGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuAAKCRDRgEFAKaOo
 NoHoD/47IxOm7uzv6YpKGMtc6i6UdHiimBpqT0DlAA2XfcB5Qjbn9STQmjNIJ/SWr1u6R1zs8Ah
 w6XPP/8tUJwsS6GB3aCYinjad6UzNFJy0gwt7hTHgeCOU4RUww+VeyidRVo7EpzZoZN9l8Ucls8
 OrdzUUZPE/3f+Lq2cMB27qfN3zSTafJ4olhF9U7yPfUjN7X0B1dirFU42s1uAaDsbs73KaO5ZVS
 aAekIiSXI7KjZYk+ZuEHTta9wmD/OSh/mITymwMCkkgjThQs1OLUVzUKdsPNTvZnWf2NpmmqcQF
 cBRje973LYVRdJrdy7JzMpF0m4/BpFfWVz/z7AJyg0X3BUD01ty3I7O9JSmtY/vAdqz8ufN4SVV
 +Yujxjt8Dh2KCDnS2OqUQ7mmMujeVgOxgULzDT4HUmjmESfqI6uR+6PTSHmkdIa132z0Fd8qNzg
 ppR+HoYMN5qoXSDSZGtAETkIpB6gXBAM8IosGc3holIgoePRTT6xndZe+0j56UWrsQwSbLKfi2w
 ZxHYWcD83FHwdVRsStJjcvIaLhrGtpBeJ5PfF6hEVLy0yb8TqnN4KfkoPHDcf6VHsj2vumVZ9Ko
 OihMrnM7zCLkjgZ1ytyVN0HyWWOJtCg5Fox1AZGQx5gdHuu01iiVxwtw0jvW0R3BWMlnXinEfEj
 OYYVBAJWxk2+YRg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9313

Fixes: e5880b36dfc6 ("ref-manual/system-requirements.rst: add section for openSUSE Leap 16.0")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index a540e81ec..ab8314901 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -41,6 +41,7 @@ $0 OCI_IMAGE [make arguments...]
      - fedora:42
      - fedora:43
      - leap:15.6
+     - leap:16.0
      - rockylinux:8
      - rockylinux:9
      - ubuntu:22.04

-- 
2.53.0


