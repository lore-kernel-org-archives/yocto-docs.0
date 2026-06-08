Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF794CD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:15:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55656.1780928136117399535
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 07:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gTO22PiP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F29CB1A373C
	for <docs@lists.yoctoproject.org>; Mon,  8 Jun 2026 14:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C51515FFB7;
	Mon,  8 Jun 2026 14:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5137D106A296B;
	Mon,  8 Jun 2026 16:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780928133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZA5r4Vx9IZC7a1dnjL/pJw5aLptkhKaf/zr5ujLq4QI=;
	b=gTO22PiPUp3c/cSK1CgS2A1UaSirMY6PIzJwqBGFZae361kOzqS8M1++v9hJZMWi0WnNde
	5y0v61BKU5B3O8SEwwaarW9jqg+ZyziaKyfH4RXuFjCbfaOyjptNOBmGe6nNVRiaFQn7xE
	g9pUTmXEz/uysOotVSt4R8YC9LRdQBfL/qpHyWD6q1Fdkatj4nFlfZUbUU/3jt/8vMqa8B
	32ZDZLrLAxEuEVVKhd5oaKSt66FCg/aJ1UwjNynqT9Ib/Y203NsnbzaINDhKrVRGZ6uoMX
	sqIGC6Q2rGF1ZyYB7bbyZgIyaqksXlwd5uFRoLSw9IVGLm+AvJhaBevKjGkppg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:15:31 +0200
Message-Id: <DJ3QC0Y85OG4.DJDCTY6GPOX0@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: Re: [docs][PATCH] kernel-dev: document patch handling for
 discovered BSP descriptions
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
 <DJ16ICUL4B42.2ZEFA8MW8FNEA@bootlin.com>
 <CADkTA4Pzgw=qB3aJyxMn+pwxf2vLhfpJe=nRS0SLTUh3tqgCtA@mail.gmail.com>
In-Reply-To: <CADkTA4Pzgw=qB3aJyxMn+pwxf2vLhfpJe=nRS0SLTUh3tqgCtA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 14:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9626

On Fri Jun 5, 2026 at 6:52 PM CEST, Bruce Ashfield wrote:
[...]
>> > +applied), the BSP description can opt back in to patch application by
>> adding the
>> > +following directive to the description itself::
>> > +
>> > +   define KMETA_EXTERNAL_BSP t
>>
>> Just making sure, but you meant to add that "t", right? What does it sta=
nd
>> for?
>> Maybe you could quickly explain it below.
>>
>
>
> It's just a non zero value. We have to define it to something, what it is=
,
> doesn't matter.

Even if it doesn't matter, I think setting it to "1" in the docs or somethi=
ng
similar is less confusing than "t".

Antonin

