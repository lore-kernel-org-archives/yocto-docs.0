Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF4BC5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:33:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2203.1786516423364252427
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 23:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tSEqWrN8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06B794E411C8
	for <docs@lists.yoctoproject.org>; Wed, 12 Aug 2026 06:33:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8D6B6045E
	for <docs@lists.yoctoproject.org>; Wed, 12 Aug 2026 06:33:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2340111C4C816;
	Wed, 12 Aug 2026 08:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786516416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4mQXTdTWOIZ0FmZ5ZcSuEcQFY2dyCXqVAlmGAZ6+9yA=;
	b=tSEqWrN8iFoBVYTTnUGy3j790f72esw3ROuYJ2g+pWwB15lrzllP9+np+gdax/HM00RqNB
	hVMS3UhV3MpsHu7WlNDYPM5NbUiqhmaGRtRn5XYzbWEUbKYw/cOTYHDzhR+U9Q1NHnWzz6
	3RZZP8D6wI7fRRoNO5UTCXvuZ/w/3IggWXUujC4NttBCPmkfbZMY5pL+vx44bhFsbKuQPj
	CQTDMBO489G5/vIxkzolASeyAsLsPYyHVgYsEXtSPCkp/joSjQ30GYIHoNLCb2YEC9K4tv
	AcV6xoJimsmJB+CfJAk2wpucRzna3U53PwZxqFm2yS1ZGAdaPW7YQB2nmAvSeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 12 Aug 2026 08:33:21 +0200
Subject: [PATCH v3] ref-manual/variables.rst: document the QB_DEFAULT_BIOS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-qb-default-bios-v3-1-5e0706b72d9c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSw7CIBSF4a00jMXwqC115D6MA54WU4sCJZqme
 xfqRGMc/sm5351B0N7qAPbVDLxONlg35qCbCsiej2cNrcoNCCINYqiGdwGVNnwaIhTWBdhKTDR
 jBilBQL66eW3sYxWPp3eHSVy0jIUpi96G6PxzfZlw2f3XE4YYCsl2uKO4a6k6COfiYMetdFdQ/
 EQ+BIx/BZIFRHhDWC05leZbWJblBS404TQEAQAA
X-Change-ID: 20260804-qb-default-bios-7c12e88f0db2
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2117;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eNhZxMAR80BGUHzUGjiv2onIr5QF9XYmd7QLr6u9LMM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqfBO9t5qbRHLIgZo+/wOR7tKRp32v3z64pQWay
 9rFkcPbW/SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanwTvQAKCRDRgEFAKaOo
 NnTLD/9r5tt/btNO6E3T7dQ4K4YUJm9r+ugFI6IesAe1btOdlutJ45gJtVOddhZRpxWbpWIxiqO
 qMr+CE/kglM8PkNeKD9dJmvbvQCtCbIOwhCpW/YtH6dwKpVEz8K70VQ3xZf377T9/Bu3dmJhixd
 xE1qKrbHCDDhR4eia2UOfS5JDoxh3V2nuk5oUSs7sufYmb3wZL7Rq3H0WMBiASUsWC89rjvyErS
 A1Xq2zzTHx/+9rVU3PutP7YgxXRiOUcwixSto6WcwvjItz7AbAJcvGITOaZ4WnLrowlu4BaUQ4j
 QohUgYlJni5HzfVhDNzof0djKL7F6VEIgSFiXgB15c6CeNDNkIrBPk+zgFYu5JEayH464TKknNT
 YArN2HhywTXzXM0dA4i5b+NTUyLjbZz+djRvY5zheAEls0KHlTjbKPenngJFAW4LsDHOHextEIP
 HKsHMK9uWxCAu8sHzKN5zNdr/UvyXLN6Mmjo07CgMqmzsOeM2JwiU6AqeSL6ccBxi0g847it/DL
 98LVQDfNjsKeCVjKhc4KUg3c5dNLQq5HcALKKWjSp+bGwNqXQ7JbwceKPWpq7QvOs+WyWZV5gTV
 mfpNLLMhnocYrHoupsK8d9wUn4H+O6DtlFpi/7ZTN34n3Dvjj8F08+5HRfU/ugIdXJS/2kPX6DD
 NOiDiYzqh2VbNLQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Aug 2026 06:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10271

The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
can be used to emulate U-Boot, for example.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Address comments from Quentin (thanks!)
- Link to v2: https://patch.msgid.link/20260811-qb-default-bios-v2-1-02a6284ca3cf@bootlin.com

Changes in v2:
- Address comments from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com
---
 documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e75f42afe..fa0dfdfb8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8084,6 +8084,25 @@ system and gives an overview of their function and contents.
       replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
       the gateway address of the QEMU guest.
 
+   :term:`QB_DEFAULT_BIOS`
+      The :term:`QB_DEFAULT_BIOS` variable can be used to provide a default
+      value for the path of a file located in :term:`DEPLOY_DIR_IMAGE` and
+      used by ``runqemu`` to specify the `-bios <https://www.qemu.org/docs/master/system/invocation.html#hxtool-8>`__
+      option of QEMU. For example, this variable can be set as follows to
+      emulate U-Boot for the :oecore_path:`qemuarm64 <meta/conf/machine/qemuarm64.conf>`
+      machine::
+
+         QB_DEFAULT_BIOS = "u-boot.bin"
+
+      The above example makes the assumption the U-Boot recipe was built
+      and that the ``u-boot.bin`` is deployed in the :term:`DEPLOY_DIR_IMAGE`
+      directory.
+
+      .. note::
+
+         When using ``runqemu``, the ``BIOS`` environment variable takes
+         precedence over this variable.
+
    :term:`QB_DEFAULT_FSTYPE`
 
       The :term:`QB_DEFAULT_FSTYPE` variable controls the default filesystem

---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260804-qb-default-bios-7c12e88f0db2


