Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF996C53215
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19153.1784899516709871927
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lcbJAZyw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15E761A11E8
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEE9660395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1604B11C124EF;
	Fri, 24 Jul 2026 15:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899514; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shMYKzJeX5ReNOi9lk4Y0EYP8FCfB/zEYih0oJqsZJ4=;
	b=lcbJAZyw3xjUUNBF1cYpiDSNFtANzFQ741VHrjwGCig4tLOwdUqTj6579l+UMdexDdSjPC
	0/C25GITk+ztIQUlSA0gS5lGqEMuN/ZITglfh+Dx78Bhfy7dZk/Agblkh0FNdsBbWKYgl+
	1S+rdiJ+F+GVjWnnz8QEmn3+GoFWgw3n/IUWj4An8yxhWIBxIl4edrXze5KqQrhIDuzrLK
	iJVEHNCVoLByltGhWFjKwoIO9JVqnVhOZuBfyifM+361tnzW95UPX1GS4lUsUStDSMDqqz
	MPhlrsRvkiAgiM185L/RDDtWG0LeJoeGnf2LmiUIwmiJECJTNR1eBoEVpujMqg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:04 +0200
Subject: [PATCH 7/9] contributor-guide/identify-component.rst: use the same
 tense as other section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-7-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=o+mG9RM/6QEio4BY133dj2nSfM/5Isce10IBiGKvjQI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2eyQiovt3pb8xHybL/mec2qfZAcc7XEP1Zb4
 V1gAqmBHH2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsgAKCRDRgEFAKaOo
 NhzbD/4iaa5sec28Un5D7VNdOzHM95I8d0oNqQWO/UAqqmnDFyRf013gj/zILNTvbkyCMo/KkG0
 HFCkD2yzIJZi8gU1R9FxK4Md8MgYK0+NpqJIAMIPV33+bh8cc1u8qu4/3MEaya0D1aIRFs3TwY4
 YncOPIkq/B78HwNtUoJsPOJbrbmN9vrzYMHotzNHniMP2kgZ/L+cP+bDdW92wirsqX7cvBBNeo1
 EL4qSWfpisikGc+HG4ex2c+st9wkh71yTA2mCCNMtQbVWfLuImDSE6qY9hsgzTynIgGK54cCU9e
 nACKNdNibc8ElS+4vWLBzGXSOOrvuwMH6FiGSmuL0j4v7yBa28w0kP2EBv49e0JQjEhoAEoDXeD
 JD6E7VrgDCCsYMqs/OOb8KzdGoWnWPiK53TjtUDuLU1u2M9B7c0jTWB0ns2GetRK3bpbWNbEf3p
 pGw5kjogmFRsLae0X9zJLziGQk6ZXoEndNA8wLcqQ+fCI+v1nPtZKlD52peiWS/0Il+N5FhKOqs
 ZXrZsXjgl62cZzbB5BWJ5aF4uj7wbTZZUWOU2jDtvALsjHYow6FS150QbNHbbJyJcKcJIMK+mU1
 ZIiNV7iUzG2np1OL8UR+lxQwnQ5E7pv+w9ukovw8YzJykwZ+UFjY7jnXylTVXmnd+WIXk1ADSya
 kUT4N3etUrb0n+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10135

All the other subsections of the Contributor Guide use a participle in
their titles, let's do the same here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/identify-component.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/identify-component.rst b/documentation/contributor-guide/identify-component.rst
index 6cf8ed985..1b8e27f36 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-Identify the component
-**********************
+Identifying the component
+*************************
 
 The Yocto Project and OpenEmbedded ecosystem is built of :term:`layers <Layer>`
 so the first step is to identify the component where the issue likely lies.

-- 
2.55.0


