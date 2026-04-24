Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD60FB44DA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16367.1777019337135898945
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lPLzyJrW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 863D54E42AEB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CEFC604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9190F1072073A;
	Fri, 24 Apr 2026 10:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Rl/KgdaJgZRm/ClI+G56eymc+rjt0JczCym1uwq+Tg=;
	b=lPLzyJrWgP5gjR3gbsxMOaNNkpB+3+D1ce6vtA5kouAIND9uAFIyczhvkxGVut2eHMgcRW
	tG4ZHP1pYECgI9RFsq+Fzy6lY2e/dFjufLnywFUfIITcAeJ3ljwDmgjMNUGfxDmwHxGzp0
	dwlO/x0e305JAXAfjUUlyLg6gq/moxgPRJiwp+QVe7o9e7tJlDkuPrKSjUrCHtvJuDOc09
	wWb3QLNr2dAe1iNcQDUvbOQucUpnYYoTSAeDVdu9TACKn/M6M5Me3V9l8sl5O7tPbJiPwc
	auWG26Z+1RER+4vUTRmbW311+Xvb8AK4iCAr3+whyJQsNT6x3OZV4dyPGG4VdA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:36 +0200
Subject: [PATCH v2 08/18] ref-manual/variables.rst: document the
 SBOM_CVE_CHECK_SHOW_WARNINGS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-8-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=j61hSCre8KEAPnxh0Ktq+az+7Vic4dEMvq3r+3NT5DM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym+Gk7nZacsfGWDk8ZUxpVinQ+d3QqHXxVyO
 Ft3SqGTC6uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvgAKCRDRgEFAKaOo
 NgxJD/9S0MqYHfEbXHqrK3eTMOTRYY0y17FSDw6urxS8F3eRFLEiCpabNn591fh5kcwDlbxb9hl
 jIu1PPHtJmnHDtiCXBUZ8yKwqtAhgKLt6nYCLGWQsPqqtAvmHnlp6yeWJGJdc0QalyjeARypiyA
 hkxux6XqUiiJ8CST168f3iFHnSMtv+pvuxwD8pf2Sd4wJLS7uHbp8kTJ1y6BhC989F6TVPmnnMd
 kklxPKrX8M8YR0uDkwsS1ls41b9VNdrtLWHeKyAzv0hAm8WhfNb6e5fhuC9mQ/L5+eVqP0xXczX
 QKqxh2gJPDkjFaYge9BuCCc79zkO/Sf56UGlKiaU7LHmyrNbj51B9wLPoGHrFAslkIZatVQ9F+a
 H59Fkq7HG5KdRJjZiYwDynQPuvt6eOrFJyJSqhytKmy4amFw/CxOGZc8uzRei25i3XOKinCXtyM
 Eztto6VR2iXywewCetxAOW5pj93Iuud/ZDqQR1PoG2mKynCH7djlhRhUhz6PtI2DjK2NL70mA+a
 Ig90bTtnhQi87JGAaSTHLOdHtqSe9sTMmx6urgdkTpsysIZLl6lDjd6jQOwPKIvTVI2jH3Lpkka
 JdYFqiRK+LMA7JIhk+3S38bnql3nZU6ItumFZ438Fm53j+Rh1wTSbVSzFOJOs9rh1jHFlwQ3GyR
 ptkF/DUksQVLYlQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9346

Added by commit 5a5162406ffe ("sbom-cve-check-common: print warnings
on unpatched CVEs") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0fcf81299..4341e27fc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8710,6 +8710,19 @@ system and gives an overview of their function and contents.
       -  ``both``: recipes are scanned in both their target and
          :ref:`ref-classes-native` context
 
+   :term:`SBOM_CVE_CHECK_SHOW_WARNINGS`
+      When inheriting the :ref:`ref-classes-sbom-cve-check` class, this
+      variable controls whether to show warnings when CVEs with the
+      ``Unpatched`` status are found. Example output:
+
+      .. code-block:: text
+
+         WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: glibc-2.43+git: Found unpatched CVEs: CVE-2010-4756
+
+      Set to "1" to show the warnings, "0" otherwise.
+
+      See :doc:`/security-manual/vulnerabilities` for more information.
+
    :term:`SDK_ARCH`
       The target architecture for the SDK. Typically, you do not directly
       set this variable. Instead, use :term:`SDKMACHINE`.

-- 
2.53.0


