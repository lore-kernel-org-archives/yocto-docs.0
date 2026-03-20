Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9824C108B8F5
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9795.1774003594381776377
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eXT7fxxO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEB8E1A2F11
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6C3D600E0;
	Fri, 20 Mar 2026 10:46:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05CCA10450BA0;
	Fri, 20 Mar 2026 11:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u0LEas+ij7USQwSEf6Vjccqxf3oB/4MNJy9g3XmXjf4=;
	b=eXT7fxxOcuc8iG0zDBxPM/4N/KRTWoLjvmKlp1+O3JIeTdyfWc09uDDYYaVzzcBw2NQPXX
	qO1yywp7ch0TrOTSM+Et9FWOjHfUzuIdG5VKMwqgy3QGfAiMOcojbch7rT5q4MwFE55yrk
	cRhOOwVAEwvVOW25N172O/mD/O9RjV+29h6rlIweeP9+y7mHUMdK1ZBipLosb0pajBQ5Ls
	7KT33V5iSdJlrcU9mdKLYCVhQDfst9DnvAr29q5URUwY4xRku4mpaGYAYs2I8l1HxOt8zp
	FilISwibPBr6enU0d9Ihx/0bE9kdu6KWhR2A1ifpBWNtU8YVkmV4bp9+QjSUmw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:26 +0100
Subject: [PATCH v2 8/8] ref-manual/faq.rst: remove the CVS proxy note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-8-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=851;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=n7HOfOsNKbJEYC48yAS+EkaX6I72FBmpG8zS6PZQZ/k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWC6yYRFrUOj46/CwqZR+AZVGii371QfjzK1
 15LefllkH6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lggAKCRDRgEFAKaOo
 Nq1oD/9JKwXVyYj7SEkwKmfsx0Fmcu7Bka0/7UIY2nroLU41DBuLYtaj5AFr+38rNed62X2Jyim
 aKK0Xjb1DBtQwWPkqqAmH7igcjgliR92LE+KcUvbwBXFchCbl+B73qMxBJV7Jj1Fgj67Tq6GLcT
 iKdniMj2JmUzLBEl9YZYzH8BvXuBYHYVjOY6w+bT1qIXoELsb15hzq6XHwJkVQ24vKjg3Xy2n5L
 0Qo4pyZW2OaJW3xBTvCTUB8ODitBu1OvmKQudDSO+/tMAJayYZaPKKDTSBvs32RIyYGbIfk7MrB
 ggSGJWP0Tr4I6weIMmyU0jLfLLsWgkuUbkeETMDDgadvbkQJbAyL2LXdaaVHPNNYRt8QBudAD1u
 XTNpcSUhKuqMFr9NaemowGiDptS1744o2a0JkIshc9bBu4C+aqFtYwVPIA4W2N+HB/yxMpTuOYK
 452X1oQkwdTUgE990OSQ33J3Fdl+xj75MH6rONioXlzMAEvSD0b7Yqa6FPiEjjMWD4XwKEOtZev
 X7MS9DXzNIgSHoxv0J8N3zWphSIryCsVR+JMUzXBMYoAV0VllqsBsYUw1sBM/O7ql2+hYexMPLu
 o8NT8OQwwAz7PHmaZ93JwFxNKmbGFvrajwVnlh5MFRgvesrWI2wMDbRMXWXJe0w6LqvF4zVtUYS
 QU8VfaMl+DBzQuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9109

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


