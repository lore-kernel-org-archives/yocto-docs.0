Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A6D1AD5D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:06:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.24139.1729087570026765827
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mON5Jp3v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFAD860003;
	Wed, 16 Oct 2024 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729087568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjZlMx7bv+UwBDIONmJsRpk4x4JsQBMTPJr0dOyw+SE=;
	b=mON5Jp3vz8nMMFk9d0BI0pB8dGLrBXaUPv+uZu/WbEeVWB7bcwpOzEyoRFWBubRCZyC7qa
	oegyCARw5yTVXKsYPnpuifsgar/w/4AKspBhFVQ6ibaccMbxbnNWvxQwUchW2y67sSAyCA
	vJvqQaG4Ep4Ra/sXG37sZdrnjTjU8Qzsd1n8Vt7+jWrPk+jet1mZQoLbI5eggEm5xNarO4
	BuxuZfVuJ2K3KZOwFQkIgzu+wWmSqlQRi/RG3oB6rQz7jVGS6bXk3C997wXDnl20eLHcwr
	Wmlo0eEQ3Zh9UgkIPKSYGnXrxSOeLemBsKnaJrFL0xJDCNDB9SpEy6zeF18ydQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 16:06:07 +0200
Message-Id: <D4XADYP00OIU.3T5S987IKVXEX@bootlin.com>
To: <quentin.schulz@cherry.de>, <liezhi.yang@windriver.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] release-notes-5.0.rst: NO_OUTPUT -> NO_COLOR
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016081106.1917900-1-liezhi.yang@windriver.com>
 <22d09d87-0868-4774-a262-1d25dda157ec@cherry.de>
In-Reply-To: <22d09d87-0868-4774-a262-1d25dda157ec@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5512

Hi Quentin,

On Wed Oct 16, 2024 at 3:32 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Robert,
>
> On 10/16/24 10:11 AM, Robert Yang via lists.yoctoproject.org wrote:
> > [You don't often get email from liezhi.yang=3Dwindriver.com@lists.yocto=
project.org. Learn why this is important at https://aka.ms/LearnAboutSender=
Identification ]
> >
> > From: Robert Yang <liezhi.yang@windriver.com>
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   documentation/migration-guides/release-notes-5.0.rst | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/migration-guides/release-notes-5.0.rst b/doc=
umentation/migration-guides/release-notes-5.0.rst
> > index 800ba20a2..2bf78c633 100644
> > --- a/documentation/migration-guides/release-notes-5.0.rst
> > +++ b/documentation/migration-guides/release-notes-5.0.rst
> > @@ -217,7 +217,7 @@ New Features / Enhancements in 5.0
> >         state directory (i.e., ``/run``).
> >
> >      -  Allow to disable colored text output through the
> > -      `NO_OUTPUT <https://no-color.org/>`__ environment variable.
> > +      `NO_COLOR <https://no-color.org/>`__ environment variable.
> >
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> @Antonin, this is a candidate for backporting to scarthgap and styhead I
> believe.

Yes totally, thanks :)

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

