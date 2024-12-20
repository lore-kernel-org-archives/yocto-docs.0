Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F79DE77197
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.150874.1734697025808215619
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JtNRrHfq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3855D4000A;
	Fri, 20 Dec 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gweNnI+2kRQYs4jur2vxmjEe3JEcd4EF+pnPjvSxFxc=;
	b=JtNRrHfqol1yYTyjft8lqkdHlX4a4uU8OFa+w3zOrw+yb2ze9sYRNXfHoQaKJTRbChEkAk
	xyGxKCnKmiKeOpIdlISRNBirqWdhqagd8WWSnzOuXI0gB+W7Pcaf4KFU3XZb94nyA+vw+q
	EGpgbEOuLMkrs1L3+KxUcQoNiTpBuvs/DwkIE7rpYed+W5TriXUoNmemkkUwHchI1UqrWM
	iy/r8jSEfAcqXdxLZKPQspPzvbYY/TPACxbLPyIsvAm/NmU7rC/aiM6OpAZ9Tfj8N+0JoN
	IjEGvSpXYcJYqSTIAUTnhksPTnjSAowipKn5XwKmMtJ8MGsusyT8HYkOEfmCGA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:28 +0100
Subject: [yocto-docs PATCH v2 01/14] ref-manual/variables: document the
 KERNEL_CONSOLE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-1-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mYHtA2F50h/CfZKxGIiC4Xek46L/8pWUbM/dwQDqT08=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA+gKsT8t3htHE8kaU8thJNJb46st+WO5hgA
 dO2NTBWfrmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPgAKCRDRgEFAKaOo
 Nt5FEACDQ1A1pmfRAPu6B6aKFS48OZAwwTn7mNVjgN9ik7F64TBVOu5M8EPqqssxZNF2RhoGeH9
 NnMDQB8f7fzUEdJaptfIKtM5VSW/8Xh/ZWWLdHRYQuWW/yVjX7/YhZnxaBXor6l7JboTLvQE0c/
 IvtGzdrZ6kL4nTTzouG5V9y866X1NPlthhAlmCZb9RJ+FvFFj5waGiMgP2l0USV4Yblbyt9ILPL
 WYCbZCg2H8v4JA7efYQpHdK7UZExFJ31hyV5ppgSwytke7o7tGIFUeemUT1uoYkabqShXvIkBue
 MLctXksXedd9VKlKJcYnWar0JDWvV79rTd/aP9P9X1QFOsADCRMsQNyeaovQSiLnk/UJOfN/8OM
 lcw3lW1jE2xTuR1SdXsJThD70lI3qIV4VygIvRZ6/GwuCPOgIhVAGRwT4wdjlN0mQ/ZaiYJHjKx
 3d9KLAemD1zcoPG6ObpmwZRGzp5X62I/eFXCSOxGJ2sOHCSDreHT1bctiTfUCewrlEwT8jHFngr
 PxvF5qjFWbs20Lvjzjlz1MoOZzYhbftIJbNvnYYKzbYm8u/iz30hJX3nNyaEogZY8PDKVNkU2wn
 7iad4+YFqcMrTXAfDGqM83v3YxiZBpSx2Fe9kR13BfHfzL9FOuHYXVHA7Kjg1NlrNrOLrxdwteG
 YHBBxLH1GWIGHdw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5999

This variables holds the value of the `console` kernel command line
parameter.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e8db89f8c9642b1e36c574e1369093a7a2ce30a4..b31abeced4cc9b692f8bed814891a267c73f29b7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4578,6 +4578,19 @@ system and gives an overview of their function and contents.
       You can register custom kernel image types with the
       :ref:`ref-classes-kernel` class using this variable.
 
+   :term:`KERNEL_CONSOLE`
+     The :term:`KERNEL_CONSOLE` variable holds the value of the ``console``
+     parameter of the kernel command line and can be used in places such as a
+     ``wks`` description file for :ref:`Wic images <dev-manual/wic:creating
+     partitioned images using wic>`.
+
+     The default value of this variable is extracted from the first console
+     device and setting in :term:`SERIAL_CONSOLES`. If nothing is found in
+     :term:`SERIAL_CONSOLES`, the default value is set to ``ttyS0,115200``).
+
+     For more information, see the `Kernel command-line documentation
+     <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>`__.
+
    :term:`KERNEL_DANGLING_FEATURES_WARN_ONLY`
       When kernel configuration fragments are missing for some
       :term:`KERNEL_FEATURES` specified by layers or BSPs,

-- 
2.47.1


