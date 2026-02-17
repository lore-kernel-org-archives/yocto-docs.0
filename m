Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC4E68146
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 08:28:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7893.1771316931338170964
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 00:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GspVEDvU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2351A1A0F8F
	for <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 08:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E60DE606D1;
	Tue, 17 Feb 2026 08:28:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A7F6103688B3;
	Tue, 17 Feb 2026 09:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771316928; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IWDoO1cpJlh92pjqYcF7G2q6DoVoiWpv9rarQHUBYKE=;
	b=GspVEDvUH+F29+96Eouun9LY06o+OBzatsPQDyAzgUX4SGpURegazV4SGM53wquOLLPzA8
	DcQ70tOJQdDxiWp44UzgdyZ4+NqgwrwKet4vP7kh9krB53YflZ392N4v/CSStBXPSCgyKs
	qzC9PKDqYeI2EM8gaucM1qclvRnZ9p6udViXV0gEniveKLH7ZRtAXKLElmEcveZ1tXqG+c
	DnDluL0UZbOWQ0BcEN4Y+BRbm6+2moGfSO6BXmYspSSY0/nGgVxrYkyZyW7jnYCjSPYtw0
	y3qm8OrjntH66eZug4oA9HH4EpyOdc/5Ur39GVBY5Ss4TBzteTn2dcaFccKgwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 09:28:46 +0100
Message-Id: <DGH3G2DS0WY7.47NZNDCH141C@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] Links within 'Mega' Manual?
References: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
In-Reply-To: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 08:28:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8931

Hi,

On Tue Feb 17, 2026 at 8:59 AM CET, Daniel Ammann wrote:
> Hello
>
> It looks like links within the 'Mega' Manual do not work.
> E.g.
> - Go to https://docs.yoctoproject.org/
> - Switch to the 'Mega' Manual.
> - Click on one of the links to within the document (e.g. "Build Host").
> - The link is now https://docs.yoctoproject.org/singleindex.html#document=
-ref-manual/terms#term-Build-Host
>    and doesn't work.

You're right, thanks for the report. I'll look into it.

Antonin

