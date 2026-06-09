Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41FACD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:01:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74306.1780992070438781877
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 01:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WqPtsBhP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A19BBC4FEDB
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 08:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47E915FFC1;
	Tue,  9 Jun 2026 08:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39204106A2ADD;
	Tue,  9 Jun 2026 10:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780992064; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+CU1UaDQxXEggl7to6/87h1iCWm45HAwJtQMsfck+oU=;
	b=WqPtsBhPTXnVC9qQbRQQHsPY4fnAHDsbfl+CCORjVG16SmgUH04bZ6rfJYIw/JC6ozhiBd
	YeMd+JXQPIehDVSfcbuCCcWRj2ToK5mxQUHWVc846W7+vo1gzuakNxsC1fpBmqY6WJrzEX
	BRbMK9SjqdGPNxqUsQLJ/YQuLcLzkUftGtdYsN2amGwEnYYHBi9YkLb0LTEQ1T4eOBa5/2
	lM26+ra9Wm78vH/yLs/pt1RvXL8o5kUh/n7stTRNQc+DpIcU9Gg3UOKTfm32qIsAvx0muv
	4J20y+B7LWDoz5dgDdKMErHUhFX/cz4ZclCZWZe/WJ9Ka3+sE3QLUecml2kFLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:01:02 +0200
Message-Id: <DJ4CZUCCQC2Q.1WQGZGWT25D5C@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] dev-manual: explain how to properly call
 "bitbake-layers"
References: <73ed5f17-6d21-1a7c-9c32-e1badd3a4007@crashcourse.ca>
In-Reply-To: <73ed5f17-6d21-1a7c-9c32-e1badd3a4007@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 08:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9660

Hi,

On Mon Jun 8, 2026 at 9:01 PM CEST, Robert P. J. Day wrote:
>
> Emphasize right away that calling "bitbake-layers" needs an
> initialized build environment to work properly -- that does not seem
> to be explained in that section.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   fix stupid typo in subject line ... sorry.
>
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manu=
al/layers.rst
> index b7624cf0e..6d0e207fc 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -11,6 +11,12 @@ see the
>  ":ref:`overview-manual/yp-intro:the yocto project layer model`"
>  section in the Yocto Project Overview and Concepts Manual.
>
> +Note well that to properly call the ``bitbake-layers`` command explained
> +below, you must first initialize a build environment using your project'=
s
> +environment setup script. Without an initialized environment, your shell
> +would not know where to find the command or your build configuration.

Can you link to "documentation/dev-manual/start.rst:Initializing the Build
Environment" here?

Antonin

