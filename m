Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB43D44164
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:23:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9812.1765534977422344626
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f89gBb2t;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB7E31A2129
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C27C1606DF
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AB55103C8E13;
	Fri, 12 Dec 2025 11:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z6I2LZnn9C8p4CFB8upLaRkvZ7OzJu3/F+i45sn3VZA=;
	b=f89gBb2tpk/c97bexmJZbPlfYSR8FuaB7Sh1+UVL1GNkQIj00WXh3gtZ/D1cvxiIGNl+zN
	HXpbEb1qag0I/Fkt4RG/dRrBTsS9jDTuVrNQcUHsQaNOG6Va2BMTyC9eBFhREGA4XBGXmv
	S+PEBqvetRVglzE6KgtfGOv4ZdLmNE89u0uIbpbcZtjB4J24AKk/W2Y+qkG8sVq25yZgDV
	9QuIF1JGAhw29ataPQe4Cvx41ypO6tDrYuUiKGePC77SsbuQzasJEqNk965v0Mzq3Pq/Kt
	dGjM5RdzvDjzQEJqz75kO2YoUdjp7pCgPU7l8a1h9O7eK/DoB7dS6FS/PK9A1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Document the image-container class
Date: Fri, 12 Dec 2025 11:22:47 +0100
Message-Id: <20251212-image-container-v1-0-fb6586d06813@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfsO2kC/yXMQQqAIBCF4avErBPSqKirRAvTsSZIQy2C6O5ZL
 b8H778goCcM0GUXeDwokLMJPM9AzdJOyEgngyhExQtRMlplGpWzUZJFz4xWtW5aUzeihfTaPBo
 6v2I//A77uKCKbwbu+wEk3aoIcwAAAA==
X-Change-ID: 20251023-image-container-fdc6d79f6729
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=513;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=baFS0QeLsEILSJ/l8Mou8Q6DLkS5Bx8R6FhOLs+dTB0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+z+Vcb2zuF6KY1u9ZNFY95udxanW5BkNRoWR
 KeLjIw3h3SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs/gAKCRDRgEFAKaOo
 NtyuD/wP20bkFzzqJ9c+fvE7jyAko2YYGiPtCtCrjv4od+gYyw50Twx3VpEUg0HEg4NuL7hBvJv
 2HrmHMy4frnitUv9kE/muN6GFtTY+miO72wi7TNYL1b4tGswp3YCUMpLOVP66briCjqLibmQ9Zm
 0ZWJEJnJls68k5XZTRchs8hueFfcBSI0jJ0HMOf68WRnhNboVFGqyvst1vw4rDYas7J6f8Bjvh7
 1+IrS3DfBTDE5pA3WJSO7A0NUKCN+QMBUCGy2HuMRVYO78STRyJcx1GZyblNBsK+NRukZUZaMnI
 ARdIKcXUHfy04CCaXtZIelaCXWPrEOqrKSLzQNOsQK5NlFXghdoHWE3M4R3w3ilUjriUVHgw+7x
 Qil99g7ahVFdIW0dIBBxSDu+nqfQR4+hZ/xQd6C0fT8MbgJqIB68brb1Jy83l31ZygfDlCde/Nk
 oBZbb3YG6A7QY0gIeBUxAdMeidKc23cenh1oC9TXxyDoDJHJ+9tBNesU8QhG3y7iQuCoadOMsyY
 PqHZNDS2sjUO9dnhYkEorwdS0zwTBgybSNf4OsiiDtA8baRKbHJonyqu3bPoKRj/egEsl0lMFjP
 j4WaGM9V0Ef3hJXhwAAJs5jkslgy6dLQpIZX3qicCf8yGZm61ug+bzftffQpMiXF7R8ON3OModD
 ItGZzD9/QGI6h/g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8264

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/variables.rst: document the IMAGE_CONTAINER_NO_DUMMY variable
      ref-manual/classes.rst: document the image-container class

 documentation/ref-manual/classes.rst   | 51 ++++++++++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst |  7 +++++
 2 files changed, 58 insertions(+)
---
base-commit: b7f5b8ee510eeec286f2b0daece2717245b5b177
change-id: 20251023-image-container-fdc6d79f6729


