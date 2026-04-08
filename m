Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B4FFD5F82
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 07:06:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100589.1775631970494983700
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 00:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B0/KgEqP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 612EC1A31E2
	for <docs@lists.yoctoproject.org>; Wed,  8 Apr 2026 07:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37536603CB;
	Wed,  8 Apr 2026 07:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 021321045043E;
	Wed,  8 Apr 2026 09:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775631967; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gqE8QHR9p9dceJOHkmQFwax0N3Fi0Ab3RlS52otAoVk=;
	b=B0/KgEqPTakLsmh+6ctscfVxZWmAsEOEEnIa8NTuu4CClLtE0xAfVshVR0nGdsJs/3acO+
	VCnh+6yARm7EQoo+JnBB/xw7bdUzo6zGSqKlIe1LEbP5VBbrb1iEkT4rGpbzyesGpymv5E
	tqzX8EWsx0qHxKNXL2fpZFkbG8qNORO0sZigDiJB+Es838ZQ4/TRYZxolqqT6nyogIV8GH
	PzGtLtUwYZvKG4umTG/Cd26wbzImCaOP3KHj5sXE/Q6Lw7qNMjSdVuUa0aHoaagqclF0K9
	pWnUso9NVyr4Tg6A/vlvvY9V2JpOhs2kjhXUytpRVV7DdCEKoF566npTxnAQ3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 09:06:06 +0200
Message-Id: <DHNL006AUIAP.CS7GW0LE4QRX@bootlin.com>
Subject: Re: [docs] [PATCH RESEND] ref-manual/variables.rst: update staging
 and packaging variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adam.blank.g@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260408-staging_and_packaging_updates-v1-1-dddee2e38d7b@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_updates-v1-1-dddee2e38d7b@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 07:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9198

Hi,

Thanks for the patch.

The problem with it is that you change multiple definitions at once but pro=
vide
no justification for why you changed them. Could you be more specific about=
 why
these changes are needed, and possibly breakdown the changes into a
comprehensive list of patches? This would make reviewing your patch and
understanding your intentions easier.

On Wed Apr 8, 2026 at 8:35 AM CEST, Adam Blank via lists.yoctoproject.org w=
rote:
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
> Updates of staging and packaging variables' descriptions following
> design and implementation changes of the last few years.

Note: your commit message also does not contain a body as this is below the
"---", I'm not sure whether this was intentional or not.

Antonin

