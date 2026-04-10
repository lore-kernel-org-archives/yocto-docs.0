Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AC6F459F5
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158227.1775832231273724070
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jg5y59pN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47731C5C1B3
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18A3D603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86F8F10450073;
	Fri, 10 Apr 2026 16:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C7bhyd8k2vhKLIIZgvDKuXkzNFGG9SqZ7K2+1USzW8g=;
	b=jg5y59pN+IpyALMi9hOZ0e6y+mutWPYAVSlWsclJGuUVJmGCxXiqa/bx5SSeRXiUmDB5Xn
	pOq8v/iYx9T5Qyza0v1lok4djmcRDmQDWpNaz5h1vjcVDIpSxWuEAA8kMP7zsKF0hL+52B
	cfE//C5Xx2xwBAZNg1ErKj9JbyVK8ziDsi1UtysKKii2kscXwHCWmmlHcLuNytdOpAgYng
	c8eXUWi/N7w+geQ4Ozhr9J7tIKHcJXH0wkjG8vE6jO2YyFNJ9PYquhfNYtMnahsE4lUR1Q
	JyD5rvn+rI5gWQiFRzZzPBCgk+znvrhMb2v/80khus1aS16rRTc/JkdIXlEoGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:39 +0200
Subject: [PATCH 15/18] ref-manual/features.rst: drop usbhost/usbgadget from
 DISTRO_FEATURES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-15-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Qs994izA0I0FMHpIIeBxh7827tb+jvApb0aQhH9ax/4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyYHEk11i5ii77Uk/nl2U7Fgtpo8olR1FKVF
 RyjgUMsErWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMmAAKCRDRgEFAKaOo
 NsNwD/0e+E7W4T8IeCurlttbQ2WidU7ppQQYkb0ZuCWQsTQqZEoQO9rkSsc2OhH5SlLLMbeVSeJ
 pct3ROHMRpFo/UGVDCVQs4cR72VG/LjzFsFoZeUhNrr7MMi0f2iRVkmWf/zipkrBHqvlSo7Bw5Z
 5lWrxRUx7ocx0JBHmCY0s2zifGULV1GTOpSXpyCBqdbbKxMtiTMxpmWlkudcnciZYS+x78oef3x
 SJS7UYBL4QB15PCZnD8R4R/7LULRKKFFtbLjfDcw0Syr8Ec1EnU4RZGJti1FWnC3F65yekmeTEw
 LamJNRe7+bn/rOPj7l+mCwFqg0vrY+VrBJO8sIvmWVonXlHGSNW48uwMTsUl29VSx6iVP4b7RYP
 Wxq9P/OJKSuh+jGpDmLbHgHkuXF8gkVyE7TwFNTYBSlVijA527GqjLc+0HZCyROYtrrtiRiN/P4
 fv3PwdS9ki+10XqfYtaHRVjhJtoYROz6mot3wJxD6JlahhZ5ozNwgicJDqSj8vvIKSwqhUenKZz
 zUbOyNP+yKiOoHcRQUGOwtk1eAYJvoi19s7Hi/6q9kBnMNhxlBFKensLjstJPiLAuMO7R5ZmONI
 pxJS+eAMHZ1NagFNvq1I7q8h2LFzcn9NZJ3QZCdU4sHnNeSAyVi/AoVqseItU5K7jyGQ72xd2RE
 xZrRWoHzUbMQMMA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9245

After commit a791ca692d08 ("conf/packagegroups: Drop usbhost/usbgadget
from DISTRO_FEATURES to MACHINE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 9173b9553..77d034f0c 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -237,12 +237,6 @@ metadata, as extra layers can define their own:
    main DNS name resolver in ``glibc`` Name Service Switch. This is a DNS
    resolver daemon from ``systemd``.
 
--  *usbgadget:* Include USB Gadget Device support (for USB
-   networking/serial/storage).
-
--  *usbhost:* Include USB Host support (allows to connect external
-   keyboard, mouse, storage, network etc).
-
 -  *usrmerge:* Merges the ``/bin``, ``/sbin``, ``/lib``, and ``/lib64``
    directories into their respective counterparts in the ``/usr``
    directory to provide better package and application compatibility.

-- 
2.53.0


