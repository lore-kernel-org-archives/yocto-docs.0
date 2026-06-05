Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BEACD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:40:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8475.1780666801687163998
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KqQ5AI1x;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 321651A092B
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:40:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F36B95FF0B;
	Fri,  5 Jun 2026 13:39:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E867B106A2451;
	Fri,  5 Jun 2026 15:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780666799; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZY4yDm6CXa+9xWCsjXrUhUcGcA3wyvgh2hyLzgZ++bs=;
	b=KqQ5AI1xRoosZWfxuxNB+MH0vUYjn/P9iRj3x78uD7fSYF9yBiaBqfNOj6704fHpLfS9zG
	mnyTbzR6CUQanogGUC1que2NRDslXOI6LflfiQD+f20cIpeHDxNB/ioOmjR8tXXZDOl9+v
	Vz5QUOZ8fxAdvizUgkwfaIdbrSWkcVc0AQOSKRuI/rs4q/bZ9B+2tlRHGXfdMWkIt0Bup1
	OANe67n+qik/nIpnKO5YONRGVo4ZLQaAGIOltuHNh/KFFu9/99khUy3bqvHJBC8vHQz2tl
	RenzgDODRyQ893e9fryxCnxk7MDgKn65loFNi1/X3dc8LVSsXXzArdkRZOIQlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 15:39:58 +0200
Message-Id: <DJ15P69LMOKY.3RPJL80QFHAE3@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual: update deploy.bbclass snippet
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca>
In-Reply-To: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9602

Hi,

On Thu Jun 4, 2026 at 7:11 PM CEST, Robert P. J. Day wrote:
>
> The current contents of deploy.bbclass is slightly different so update
> the code snippet.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index 76ace6fcf..fb9a56607 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1776,7 +1776,8 @@ adding shared state wrapping to a task is as simple=
 as this
>         sstate_setscene(d)
>     }
>     addtask do_deploy_setscene
> -   do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
> +   do_deploy[dirs] =3D "${B}"
> +   do_deploy[cleandirs] =3D "${DEPLOYDIR}"
>     do_deploy[stamp-extra-info] =3D "${MACHINE_ARCH}"
>
>  The following list explains the previous example:

But you also need to update the bullet point covering this line below this =
snippet.

Antonin

