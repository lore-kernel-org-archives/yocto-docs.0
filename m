Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D499CD49227
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 14:24:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.42291.1731939849310490435
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 06:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X2F1fIEU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99AAE1BF20E;
	Mon, 18 Nov 2024 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731939847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BOsxtyWIzNxWJOcU6rjB2H8RZlaJhhQ58lpPGt863eE=;
	b=X2F1fIEU7Xkc8ZmbOXJOevhHPnv73AX2n9sL/58BtcqCpHGuateugPfvF7itVFEaOii4ov
	BkIKrp9wZZZVPKJuGBJG0d4hgTo3H8L2+2qnISQ1x6bMfnPjqq75YHia21uGj9cwe0ELWb
	kuYtladxuKr8j4XiROz3eAjruxP5+zHqwiaoG3pyJLj4xvg769eHVaT18NoMwuoE2McSg5
	CCGcCf4vRJlyKl9BfgqqaZ11ttd53+1jYMvytHjDuJa/xaHEtZdKclzzRLY64Fe83nSDSe
	k5QMuYnfuqMkmsqIP2BKzWc+QiofowoBlGRBzRVxaEvWbvPHcDsKDd5wTm9F+w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 18 Nov 2024 15:24:01 +0100
Subject: [yocto-docs PATCH] standards.md: add a section on admonitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-update-standard-warn-note-v1-1-0407c16b9315@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAABOO2cC/x2MzQrCQAwGX6XkbKC7VKy+inj4aKLmkpZs/6D03
 V08zsDMQUXDtNCjOSh0tWKjV0iXhoYv/KNsUplym7uUUs/LJJiVywwXhPCGcPaxqnu+YgBu0qK
 n2k+hb9v/7+frPH+8D3+lawAAAA==
X-Change-ID: 20241118-update-standard-warn-note-925acaa7d0a8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=acfWUJc1wlENrK0/IgM5dqOhfx+Z1UDFiqfAT4f4CuI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnO04GW5T8DVv/KEzPnEfqwh97i8v7Fw83mVFtd
 THvyXDN6jqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZztOBgAKCRDRgEFAKaOo
 NorfEAC72eZZpLBObMvYB1rYbndMknr7A8VrwhjMXwR0bkfv15F7C5f444+zYQ7rkcdGKcUC1FP
 BbtZsENgXEQbtxY2lN5pLu1U82FQKRPtPvBwQTcxlQxnegXcLY27ohrq6hzfdKd2HFETI9z4eVd
 zIoYG1OCzgSsf+fqarsGJ1Qco2KME17KBhmQ0zqcO+1GN/zfRcVDF6tlKSgee+MMyTXlZi/FhYk
 jRMa3+L2YpcaMQy/o6opW7M01U8HL+2HhQMHlk8Iibto+RQHnoe94YZ0MRnsspHmK+Y5Dj4b4CX
 5oIDypzwlAlO3hUWeByNCRz+kR74lhFye6E2hLmAEuJYd630+zncnVxkrQ3+QjfPILnnp9DrQtK
 h01iuGz5gpm6veXEjNebdH2OkA4/MXTYS3fFdgPvT7k8Z02NQ+v++rlylGT/iW4VDp8EfOXdIX5
 If84ucXBWJYo93p/SkzffmNXz0zliXOLOm21nNxgIvswbp79dlqE5F6y8aIkMSt3afuT29McLcX
 JwkwLpUpqgrVa9rsXzmFuhNJx1HpyaykHcdGz0lRk+XoQTJKbUyk2Mqyhy1nVJ9iOj1mTF/vahs
 ZeqmYAlfgUQfteL5W03bcx/9JRsdGtaPnKfFM4lW0PH0IjK7ddsyEgU+aDRnjKZekOiE/EIoXMT
 cMdezMaweA8axYw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 14:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5759

We try to limit our usage of these admonitions to `note` and `warning`,
as the Sphinx documentation warns that most themes only style these two
admonitions. So add a section on that.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/standards.md | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/standards.md b/documentation/standards.md
index bc403e393e9a014daf0403b42197f3b71c75187b..f3d88d446b850ea015bd41ecef122afec490f4d3 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -109,6 +109,21 @@ or in the BitBake User Manual
 If it is not described yet, the variable should be added to the
 glossary before or in the same patch it is used, so that `:term:` can be used.
 
+### Admonitions
+
+Sphinx has predefined admonitions that can be used to highlight a bit of text or
+add a side-note to the documentation. For example:
+
+```rst
+.. note::
+
+   This is a note admonition.
+```
+
+We try to limit our usage of these admonitions to `note` and `warning`, as the
+Sphinx documentation [warns](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives)
+that most themes only style these two admonitions.
+
 ## ReStructured Text Syntax standards
 
 This section has not been filled yet

---
base-commit: 4e6ff21b414943282a808b90a58edb584f5615e7
change-id: 20241118-update-standard-warn-note-925acaa7d0a8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


