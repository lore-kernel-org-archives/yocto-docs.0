Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5187CEC01A6
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12772.1774255828622191266
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wkdGq7du;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 23A7D1A2F8C
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE7315FEF6;
	Mon, 23 Mar 2026 08:50:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 342421037134E;
	Mon, 23 Mar 2026 09:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u0LEas+ij7USQwSEf6Vjccqxf3oB/4MNJy9g3XmXjf4=;
	b=wkdGq7du+OcMB3fB1W4GWYdz//SuCz90AlxKGMeC1JmVKtholaNabQZwxPFJ70BnfbMGnH
	rFuo8mUw0gzLNh0z26VwqyQkKYiGu/gFelrvRzo53m+CvIKn3Y1owdFcPpvoQ7UiQDZFvj
	hLIJ42GeEe63dgMx+Pfwy0f8UgeyJfi1XXKnNDmmVRUBuZ/sghmiu9eAl/aKIrFOpvmuKm
	eHGLKIrEUAlN8PjiefoKu7wFoSV9yonrZeoprRkAp4WDqLGcWccyyVKVldhH4+alzQmd7a
	9EAundwnJkTFaCKYGx192deZiR+OJZYSbBxpEx2w97qZmT8t9M7rsL5DcIzETQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:59 +0100
Subject: [PATCH v3 8/8] ref-manual/faq.rst: remove the CVS proxy note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-8-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=851;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=n7HOfOsNKbJEYC48yAS+EkaX6I72FBmpG8zS6PZQZ/k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7LgMtIyEKWfU16mXcIaswSXT6eroPUt0mU2
 a6x9gFVj/WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ywAKCRDRgEFAKaOo
 NimHD/0WUj0z3THk7MCUKlAO6vpsILdrnISI80w9oElOHq5Vg7jt0HuRQkoqyPqWlwbk8ORcExb
 EqYdIklPoMX9fGU7/0nnuXZaxcFjBp0/Jkpu6Gr9fehzkTs3Hf9Nv1xrJCXVT2A5qUknOP2wdYQ
 x4TFnmTPpvw34Bswwx2fE4dhO9ac1JYpQ9yM5t3L2ncWCmqIaQ2zTrYW+pJL/9j8Pgcp/HtJEBc
 bFuEquP+oF+OANCRExWu0A05kEV04xMFthDvU5TwUWIcttxmdfRQwA0sYk7+P7Lnl+POeWQuTuH
 OOLbfOCrG6SZRuLX2hpdzuZsjTM6CYjbbleTGLlPnIBIlyq9jPTnNB8suGOJXwK5wfpwxozYtAC
 tSPywZn/YzGysKoy7kLmbBnsa7Sb2tUrJo/el35zxYUysxNK0flGSIecTssdHQH2fjxZmierkBP
 stQSB/lv76iGCjiD/fO21SEziiGEBF1n/E7+tLX2S9ssHZpKas7XM1wXtSAhALWCEofWln9JDbV
 Nll0XoWF5Zi6qzyL19hCNuQVa/JxpkjS5xI+URadXkLZCILX9b8cwcOSTqISPY/mldDRg8iy/gC
 NJdNzbT0xwQ5v3W6Y7zbeVIoVWi9KUgU8yiz+WfpnXdecxal+NgdrTsQxiLf7qXyFBCdrt6J/ln
 LDkBZ6S3yeqqH5Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9121

Support for the CVS fetcher was removed with 5427500e4f23 ("fetch: Drop
CVS fetcher module") in BitBake. Remove the CVS proxy mention.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 152fbf7b2..248cf3d2d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -197,7 +197,7 @@ requests through proxy servers.
 
 The Yocto Project also includes a
 ``meta-poky/conf/templates/default/site.conf.sample`` file that shows
-how to configure CVS and Git proxy servers if needed.
+how to configure a Git proxy server if needed.
 
 .. note::
 

-- 
2.53.0


