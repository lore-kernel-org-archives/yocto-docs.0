Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E67CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3669.1760604892645249319
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RK2LFgbc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E0AF1A140D
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 350CF6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C317102F22FB;
	Thu, 16 Oct 2025 10:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WljbeEJBGI1CTxpWn5m7smmLKtBeD3CRo46oThFOm50=;
	b=RK2LFgbcAGYYdP/NjfZynv31CavSO6E+eh38V058tbF9dhJ2xRziMNzTGXK8ucVsPKW2vh
	KQ1WIgF9enHRNb4lIHz8ORGYG//ari4a5Z+X9uzIqEJhOHicCzqRTZAu4tslno24a0PGxV
	sx/jSLvf0w5C9RtHp0TWeaNwrjOFsGfJfdQVir7169vX3FXMZ6FmoRIbbewCw0zljAsRqs
	kmj4ZiGLC5lEW7au//bhXtCeAPeI3uyTQmQFNu+Ns1dsBNf40nhBhUnfv/3w6YHAJqDpsU
	Lo9qD8iKmohczgrm0aRE31jepgQAOVP4rOsfw7rjEspvjGpnINm9Tv0TJeS4rw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:03 +0200
Subject: [PATCH 13/17] ref-manual/features.rst: add entry for the coresight
 machine feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-13-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JQg/MtLK/jJdi0QmKhxjkHVkgDwN+aSg+FrFLW2YBC4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLRTfGW7Qjg3MhrTWHYlKjudlogkzur2/LIE
 rzrpC7lMGGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0QAKCRDRgEFAKaOo
 NiwbD/4hYl6pm9e0Svq+JZerXGIc4buOuOMwFg2AXs4Hy3JW5ikdolH1DVkatXBFEzopYJEw0c4
 eDFWZCIdGfBy+gtuzH0bBKWlaKQ3j3BjNamCRdAlGRl4GcaREeE/wKJ5hr7ibRFW9/AaRoli0bk
 nFiXozAO1+skezj0FVZRDjbjuG/u0TNgwXC7lOlyzZgEoX3Ymw4UiGaHkNvXOe1moPzynVt6Dmm
 SYxwnkfdHZ44LL5/QZCvAOrq/g4V8KgT5yY/sc7ejA0Y5jXHbONBpdwOyWxDuZQw7wsUx1foQOx
 x7fQXP5igvja6PbEQa4y1I4QFyn1gVbRRVNJaLt3+II1y3xLZnsaVbIKlf+QYg64YWW3Lxs5Fn8
 tSFr0fO79caFX/o2/bASpDGVT+KFpkp6q+D2ashvPSksXrGqWJEIE1bdA02Rkt7sjZmnsJvrv7w
 xkcd1QpLnBZT4XnEA0TeoigC+s9FWord1+JgBMUwmuJfrs1GsJGsPPfLvlOZ5fDTrhZhY6jhUyo
 mJK4U+LW28M21Id5TV3HsaEi+SuEG5dNQhy87YRuYkx974euGipop7kisaFvO02YhdSD14r6dqo
 jhAUNPImhZ1nI4eVFr+Ik9oZ8yYu9H5Cg6BBXvsmOjtIYuy/Rj1ifMxLEHByy15K4LqwmHjoC+P
 O68ECMLII2B7xgQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7723

Added by commit c455bd039104 ("perf: enable coresight if enabled in
MACHINE_FEATURES") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 0d2f2ab0d..ac5b2abe9 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -54,6 +54,11 @@ Project metadata:
 
 -  *bluetooth:* Hardware has integrated BT
 
+-  *coresight*: Support for the `Coresight
+   <https://docs.kernel.org/trace/coresight/coresight.html>`__ Linux Kernel
+   feature on Arm processors. This feature depends on the ``opencsd`` recipe
+   which is present in the :yocto_git:`meta-arm </meta-arm>` :term:`layer`.
+
 -  *efi:* Support for booting through EFI
 
 -  *ext2:* Hardware HDD or Microdrive

-- 
2.51.0


