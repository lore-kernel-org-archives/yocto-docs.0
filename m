Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A49D74EE4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 14:58:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69573.1769180306350404486
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 06:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HDVPx5Rr;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93C31C21ABF
	for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42CEF6070A;
	Fri, 23 Jan 2026 14:58:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43752119A8720;
	Fri, 23 Jan 2026 15:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769180303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HBwrqhUydk3Kh9YxEImM7fTYvHtucodHFjO6qPOrwLc=;
	b=HDVPx5Rr3btHgiK7KTtHuhswIN7P4Ix7z8rQcwty3ryyiFYTt9Vt5WH58h+Q2cS7yZpxh2
	XDMse+AyeaAizr/UnlE7z1cupp0N5YyEfHqBvmUYXepZw/+uFUCK5+pygWQ8Qy8jaP+agg
	vcRRI7L2W4b/BnhGn4AZK62tz2L1I8SRKPe0zcV0M+36ScRASevFMKX9bfVTz381DZp+pC
	6WRg80gkvXkbycAfd3w45aHcRDYITz5UbpZmsrMiuzohloIFktYrx+DsZvDFeE8mvDC4PL
	S0uC+SQR++iFL8htH+Se6JB/x3CzR9gHQG2zIuYDsZRuEhfoTW/DdKjr1tPzAg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 23 Jan 2026 15:58:12 +0100
Subject: [PATCH v3 2/5] ref-manual/terms.rst: refresh the OpenEmbedded-Core
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-terms-refresh-v3-2-41c35f0a6a13@bootlin.com>
References: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
In-Reply-To: <20260123-terms-refresh-v3-0-41c35f0a6a13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=O0FQHC18RgTMkLH2zn4KhaOc+fQPzShxuOAWjyUzkfE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpc4yMTLnsOU3bhXcOanCLCYJu19D9yjXwFK2wY
 ixfe22VNsmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXOMjAAKCRDRgEFAKaOo
 NqM/EADOcTLaGz2Qpt0QvOLcta/lNfG369oo5GVQHF6h2VGq3tWYbZRCHp8X1qko/vCTBmsFzVx
 nEFZgukmBZUYhscbwf8R146L1aZHF1QWqi15TWNaSSw0iY3JhxPXnyCDA4w7F4oVM3XLMAe/l/6
 eKa6nXBU54Q3qE4yKuTpHc9V3kxcpXTHPOPUuWncwpXki9wELI7pMu55WnT6r7LcwarKNkx/Nu2
 beoLbUlJLynH9Z272q1drz2lGAT9wHXOvn8noG+sFQkcqHWuovUzk1i4mItl2JLB5w+dtjeDAf6
 x6DmZNtHYh2UqjVZrTNp4AOlI+ybxKphTRKM5JVB3/7EOxoy42D9DQ/vzgCIBzL/CDfrxG1RW29
 rWa4FjQNBxa6WS+717HHPF1E+YVeR32DogQwlZIOXa1TN32nCwglp1lBpuAPmUSg7wZAwx5UCIF
 QNZaPNq08ZOfdzStBjz8/47Ef+nsNrniNmim+/zJf5GCcaFeFiZ0zmrn+ZKBkjsO/1UidyivZNt
 f8C0LVXspbxR1tlwl9IwlxdAl4vJjFZf6T+tKbZ0yImkjyKLJtTGj4abmLJHWu0lZLhzbj54vTn
 t87VblQ1Vebj3bcNZyq6iHxSDqWcAs+SXrbz7BtkoD9rcwtQ4N0ax8TfD7TAphPNye+9vZVCJxe
 tirvOVCJg4HG2jw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8642

After the Poky repository obsolescence, refresh the OpenEmbedded-Core
definition.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index fe68b41af..8e07b71ba 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -424,8 +424,8 @@ universal, the list includes them just in case:
       recipes. The result is a tightly controlled and an quality-assured
       core set of recipes.
 
-      You can see the Metadata in the ``meta`` directory of the Yocto
-      Project :yocto_git:`Source Repositories </poky>`.
+      You can browse the source of :term:`OpenEmbedded-Core (OE-Core)` at
+      :oe_git:`openembedded-core </openembedded-core>`.
 
    :term:`Package`
       In the context of the Yocto Project, this term refers to a

-- 
2.52.0


