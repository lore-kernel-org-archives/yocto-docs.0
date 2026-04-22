Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1C4F9EDF1
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83720.1776867786578103130
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R0udIeom;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 786F3C5C3CC
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2FC05FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F6D510460BE5;
	Wed, 22 Apr 2026 16:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VYUUB6c2k1L/mjgh5BN86MWilCINQ/ESAJQ0tW4HIAg=;
	b=R0udIeomNPNzYhK0k3k+jgGGVMf9QFn+urcDG+HJDy5qDaCbsCF0sqc993wx/amDMhj27W
	a1MnyHNdA5e1V6oycSXSJEosolfGNl/bp09qp9GHUVGbUq3XBtQ+ajy1rINzOTrh0bhI3i
	HYa6MTSW2JACQxpGA8EDNB4lxOYoQdfkcpwfXSGDcjWOOfiQ26O638ntg6BcgoqaYRyYWe
	3KmqpCsqhptgbROKU7FzfuWWHi8D5sfYuw20diuKGmTs8+Yr34ek856c+iCnN3wBE+SfW1
	6kW8OZW8GDwZfXbiTfVMGyV6XRdyGzqU07l13p3jHD/Cv5z5M+ffpJdur+WRfA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:48 +0200
Subject: [PATCH 15/16] migration-guides/migration-6.0.rst: mention
 python3-roman-numerals-py rename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-15-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=969;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ruDc+pkx/FkCp9S0WBPdb2Ti+d61U7lB9Z/18mjCaY0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm6vBPvOjsiARjGljxvgUF8B3xifMQH79kDK
 /rY7+YxXSWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZugAKCRDRgEFAKaOo
 NijsEAC2xp+6zSubLzVPvvEz3/5/j3kZYCRdQ/m93xW4O6yCO4PO8g9z9ty6VYDaeu/xpS5pyfU
 76xTeyRjNjQZ07O19ckGvjYTTKJ8nWqejZtI0h7sOCk/5lxlPUXHPUo9Moja77HKPiSurkiERm2
 55XNrd17sFMpuS0QBLxGUTiRlq7M14cQAn6za7ehoKJ62WpLDFQTYByzSHtNssMwEpXVzh+TtBU
 /eDrSFQD7qyr4cfvC7dVENsyRr3x7uitramSjYBZFR/I967V6pdQowHPB2W7pivTk7LxSdT9/Vk
 2TXSTtx4Ir1SekhNjZX+v36e9cMFsdgEvjAnVkqsRCQm1WqduBjvTvCloe0oStqkJD7AT3Y+C5Y
 9bl/E94Jl+/iZZPr3y2UuUl3Q8cpCZ+8NBWIsHsvOHBgZ7wVWYN9HuKwFkJ9ZTbxMABb995onBl
 JeOquvCiJvzMf7sqISp0MPgp0dQKKX7XxjKBLPQb1rsOInFILtNul5IeEqzATaoOxCJprKCQp8j
 yDQqytPtZ35qzHd2rwDH8JInyz8m1rV2H806F1XhBG7L7z6u4U1V11a9HimlKTYp+6H3LC6c3Yh
 LSAwifsjkk0U5Y8kAtCaoMca9WmI1qt2B2JQlj1nC/9ifKQxMhkdwx1VCtpqLmU6voC1BJuAD3F
 +A0HL/pXX0nNFzw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9324

Following faff756e829b ("python3-roman-numerals-py: upgrade 3.1.0 ->
4.1.0") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 731f2b990..33cf905b5 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -484,6 +484,9 @@ The following recipes have been removed in this release:
    ``cve-check`` class removal as it was the only user of these recipes.
    (:oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`)
 
+-  ``python3-roman-numerals-py``: renamed to ``python3-roman-numerals``
+   (:oecore_rev:`faff756e829b852724ad706051d6a771071440cb`)
+
 Removed :term:`PACKAGECONFIG` options
 -------------------------------------
 

-- 
2.53.0


