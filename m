Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5519CCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 15:43:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22428.1781797423805817104
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 08:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U2474nlI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5EA174E42FA4
	for <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 15:43:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28BBD601AC;
	Thu, 18 Jun 2026 15:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 105DE106C8218;
	Thu, 18 Jun 2026 17:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781797420; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v21gnI72Fdi0IU4bSg9oPh86XsCQWUkCMLASGYIUBjg=;
	b=U2474nlIZhLybXuo2p9u3XR5apon0ZhKSkKTaZROg+lg7va/yWp7k89oFLUrasrY3s4LMQ
	zv9GgvFU3tJSl/wcQpy75olVpll+9qKK5OakhkGNiinnBKBBy0gKYr4pR3HTtCN8InrI6G
	FbjcgcAapAlt7VYhvy55qR1URDItQJLrEFFtQRfCxJfSI4cq/lQpyM2rvCB8bxSrXal+fU
	JyokRpunpNYhdMvnLjzKmt4uqALixYxjBgsTlRDccFF740MTEyFTFvRcb/RfdQBhXY0IeB
	HvGjIp6rmiJodCzidZa9LIJ3OLFj/q1H0N9crZr2tl/A19xb+p23REs398Lg6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 17:43:39 +0200
Message-Id: <DJCAGY65HVKN.1IHCE1K9T6NJ@bootlin.com>
Subject: Re: [docs] [PATCH] security-manual: warn about
 "root-login-with-empty-password" fragment
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <c6714d6e-8855-6c07-3c7e-2841d7f314f8@crashcourse.ca>
In-Reply-To: <c6714d6e-8855-6c07-3c7e-2841d7f314f8@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 15:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9783

Hi,

On Thu Jun 18, 2026 at 3:09 PM CEST, Robert P. J. Day wrote:
>
> Mention that the development-related features that make an image less
> secure might have also been added via a configuration fragment.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/security-manual/securing-images.rst b/document=
ation/security-manual/securing-images.rst
> index 952808f3b..5493b32aa 100644
> --- a/documentation/security-manual/securing-images.rst
> +++ b/documentation/security-manual/securing-images.rst
> @@ -108,6 +108,13 @@ system to make your images more secure:
>     logging in for debugging or inspection easy during development but
>     also means anyone can easily log in during production.
>
> +   .. note::
> +
> +      It is also possible to set those same image features by including =
the
> +      :term:`OpenEmbedded-Core (OE-Core)` configuration fragment
> +      ``root-login-with-empty-password.conf``, so make sure that that
> +      fragment has not been activated for your build configuration.
> +
>  -  It is possible to set a root password for the image and also to set
>     passwords for any extra users you might add (e.g. administrative or
>     service type users). When you set up passwords for multiple images or

I'd rather replace the paragraph with an instruction on how to enable this
fragment, instead of an additional note. What do you think?

Antonin

