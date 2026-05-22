Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1924CD5BB7
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:42:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18485.1779460958427153241
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 07:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FY77l+Jc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 384691A3654;
	Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C1256003C;
	Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC21310811559;
	Fri, 22 May 2026 16:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779460955; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ehiRavJs39+30WMYYcQClmyyD3ZWJKJlU3HhjpBJ/L4=;
	b=FY77l+JcgLS7spKXAOw4UFNmmYDcEbKqWhG3lKYiFWFf6+mYbBmAvuXFiutzZlpA/QWjJq
	G8HoKNhPhKzp6smh/ATCnZntTwCFUA2U1pVoTYROaPHrVsBRdXGOe6+y+WeqB2gDWVQuhq
	S1BhMU3Rtc/Yfogoue62zDkLDeYHNa17yJhMFjDhGUPcP1onlO+bbddQjDOLMzir+cUkq6
	LS1EZvL/Kqo96lvTHj3F43CXFuW3+CL8Jmwl1++gJWvfsQqev28cF+YhFdlAnwm9AiaRfW
	WiLBavSB1QyK6KJcaP7E97HE+sKKY9YMIXv3rwoM98hRie9Ye3CNG7AOZx9etQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 16:42:34 +0200
Message-Id: <DIPA9H5FK7SZ.IRGDWYH7PYHH@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual: inform the reader early of
 "bitbake-getvar"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <994b353e-5432-0b4e-4662-8f268483518a@crashcourse.ca>
In-Reply-To: <994b353e-5432-0b4e-4662-8f268483518a@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 14:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9524

Hi,

On Tue May 19, 2026 at 5:04 PM CEST, Robert P. J. Day wrote:
>
> Given how Chapter 4 of the Overview Manual introduces so many of the
> variables that define a build, briefly introduce the reader to the
> "bitbake-getvar" command so they can examine those variables.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index ec5babe4c..0dac5cfbc 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -11,6 +11,14 @@ workflow,
>  cross-development toolchains, shared state cache, and so forth are
>  explained.
>
> +.. note::
> +
> +   Throughout this section, many variables and their meanings are
> +   introduced. If, in the context of a build directory, you want to

We could s/build directory/:term:`Build Directory`/

> +   examine the value of any of these variables, you can use the
> +   ``bitbake-getvar`` command, explained in the
> +   ":ref:`dev-manual/debugging:viewing variable values`" section.
> +
>  Yocto Project Components
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks,
Antonin

