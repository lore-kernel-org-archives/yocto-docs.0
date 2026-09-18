Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE159C88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 07:21:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5951.1789716084345737936
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 00:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mPxt16zP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36FB61A0934;
	Fri, 18 Sep 2026 07:21:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2C5860649;
	Fri, 18 Sep 2026 07:21:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78F6011C7B021;
	Fri, 18 Sep 2026 09:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789716081; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i/oJGGVbMVkn1I5fZoeOMebHVRwyawIYsEsiIGc1WPI=;
	b=mPxt16zPOKRs+gTHx4QeGPR3moaokGkGmUmbwl2Y4QPONLt2zBxGkrfWq5V4jzjguQ1MV1
	mcMPYvZlRi3fW3dpijeUYqi3O1fRo3kvx+R+IYwWni7y58Sx5hejF1qjvHOHSL47mJcFtK
	q6OFUhRO85jHC0X+u3lr2mdhKnxA7kOYG1GGp9pKnWj0Ww6LF1s4O+FVTKMf0jPg+/YA/n
	xRxOFPkNie+YRwTx6XxhhYH5rtRClGtPMH2W9hqUVkpPf1olVAzJ/E7XdGzOdO0hgzSWxc
	Hu6Y6IJAyQ2kpq9d01LKU+zonaPs89a55ZhtZkZSpgAodG5vPXHEZT41ZMOBMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 09:21:19 +0200
Message-Id: <DLI9EGQ6G3YP.1WQSA9VK3RGIE@bootlin.com>
Subject: Re: [docs] where in the docs does it explain wic directives "part
 SPL"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <16fc349e-53a1-715f-0876-75acc3a41988@crashcourse.ca>
In-Reply-To: <16fc349e-53a1-715f-0876-75acc3a41988@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 07:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10531

Hi,

On Thu Sep 17, 2026 at 10:18 PM CEST, Robert P. J. Day wrote:
>
>   i'm trying to cross-reference all the wic explanations, and i read
> in the reference:
>
> https://docs.yoctoproject.org/ref-manual/kickstart.html#openembedded-kick=
start-wks-reference
>
> this in section 10.2:
>
>   part [mntpoint]
>   partition [mntpoint]
>
>   If you do not provide mntpoint, Wic creates a partition but does not
>   mount it.
>
>   The mntpoint is where the partition is mounted and must be in one of
>   the following forms:
>
>     /path: For example, =E2=80=9C/=E2=80=9D, =E2=80=9C/usr=E2=80=9D, or =
=E2=80=9C/home=E2=80=9D
>
>     swap: The created partition is used as swap space
>
> fair enough, but nothing there covers lines like this that you find
> for i.MX targets:
>
> part SPL --source rawcopy --sourceparams=3D"file=3DSPL" --ondisk mmcblk
> --no-table --align 1
> part u-boot --source rawcopy
> --sourceparams=3D"file=3D${UBOOT_BINARY}.tagged" --ondisk mmcblk
> --no-table --align 69
>
>
>   where is the explanation of examples like "part SPL" and "part
> u-boot"?

We are missing documentation on the various plugins supported by Wic. I wou=
ld
like to get around to them at some point, but patches welcome of course.

Note: "SPL" and "u-boot" are just names here, the part that is missing doc =
is
"rawcopy".

Antonin

