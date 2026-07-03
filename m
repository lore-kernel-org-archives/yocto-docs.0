Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA314C44501
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91459.1783079106284472055
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=mDJTLmDG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6DE854E40C65
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42BED60300;
	Fri,  3 Jul 2026 11:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E6B4104C94A6;
	Fri,  3 Jul 2026 13:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zbZ7gO1AN3o4zeY9BRqgwYwDWQ5LtJ8kQnf/CKwFA6U=;
	b=mDJTLmDGjdRlgutAvxNh70WHWUdsy/zqzHiew9Z2u8bn5UpsTm5/W5HSv+/aKzh9kTF7CX
	KFQ8lG6fy9JALBUicAkfa4YjeWn3xziBQUqXmGcSIUN5ZU+3zgtC7769r/kQp49BOCLSOm
	UJMbJARTUjwLsZRXSe8cMFdRFiA+5GnWELyDjkLZnvz667fV8KdErsEgZVvxpEBuorIGn9
	nkvVsJ/qbh3qSFFv+9ankDDMTsHeh1ltRqbkRRU9hMcIWZqMthf0QX9XUELHshdOf4Q05q
	vW5Y6cTNXTn9rMZYNyvcS/8uok84yxJuXpnZUn+L0gIKVRpVVRxyiPpJbualww==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: mention EXTRA_IMAGE_FEATURES in task
Date: Fri,  3 Jul 2026 13:43:40 +0200
Message-ID: <178307887445.248663.16407075437326899008.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9f0461f4-af06-5c62-a01f-18235c953673@crashcourse.ca>
References: <9f0461f4-af06-5c62-a01f-18235c953673@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10027

Applied, thanks!

[1/1] ref-manual: mention EXTRA_IMAGE_FEATURES in task
      commit: 7468ea9bb2f524dc511fc4cc9c68f4a43370775f

