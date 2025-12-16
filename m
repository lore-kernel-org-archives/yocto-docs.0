Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D49D609BB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:14:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26515.1765901638685694661
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UjcX+dtx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A30C4E41C3C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0223A6071C
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7970C119A8FBA;
	Tue, 16 Dec 2025 17:13:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765901636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=egLXekijfFPNtB00mjP9bBZbl/vW8Q3Mzu1Xjb5Pxr8=;
	b=UjcX+dtxT2yVK6MzauH1g8d+cC2F55xPCWa+3eYN4crdfYjgTRamu4hhbZFSLFqGUbIjFS
	KBOo6JGqUh9WQxBkPKrq4x3YuMQFrX97AatV9amGlT9FDFONEA9yZEF/Fp2hdJ08vnQi9e
	UJUDljGVfz1XqEhp7tPx7mGJYW6Z81TaftNXmpdw94GH7AwheXelpSS+A4F6J9LKactqyW
	h+btxKYpAJhojE7d4N7RONPx4k+nY046e16FRwu9PIMqkCn8cOkcPooukARII/ASFdsHBo
	ZzNc2MzEvwJjpJvIDMEVAdDg99GPcccGzwcKul3gAGa5cIvfiB1cRE/Pk4B7lA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/yocto-project-supported-features.rst: fix TSC wiki links
Date: Tue, 16 Dec 2025 17:12:41 +0100
Message-ID: <176590152201.120473.1824573026697098619.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204-fix-tsc-links-v1-1-5e1a2c4e410b@bootlin.com>
References: <20251204-fix-tsc-links-v1-1-5e1a2c4e410b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8292


On Thu, 04 Dec 2025 15:58:24 +0100, Antonin Godard wrote:
> Fix the TSC links to refer to the Yocto Project TSC instead of the OE
> TSC.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/yocto-project-supported-features.rst: fix TSC wiki links
      commit: efa93ba6a9340cf3b3c52525de83aa74ca09c5c9

Best regards,
--=20


