Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3597CC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8776.1790079602951634031
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FJkqY98D;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 121014E41029;
	Tue, 22 Sep 2026 12:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC05760580;
	Tue, 22 Sep 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC68C10329114;
	Tue, 22 Sep 2026 14:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079596; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CyB13yWYdxpIFDGHSM/31/Jxe0ISUO2nh0SizBmMcbY=;
	b=FJkqY98D+jr5c8WdFuFA4qR5pRkXBqHmcUEvNbUAQPRcmSe+aSXz10c+BjiAe+UlVVxnlz
	QsU2t9zeshTRf+iicE7cuVZ8bTkEHFN+eQcKA1YaoXkUDSftKwc4Ow49Dta7mQWDBdmZsM
	UoexYCeu7WOaxU/JsAc65qC8fnB36vBizGNIVB1TlgBuK6B2sXXcNEclCIsgoFXvoLFF+O
	8Tyao9ozXgYWrm1s4/w4YGJyghgXdDw++7u9dOZZOhb4hey6druF74EBjd/v1K9imIFrHd
	uyLhUMdHtseCEDgIyzqeU/0ITTDP/wwb2lv9pv5v+G5zmX4vmfq3j4dJ3IBDaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:19:55 +0200
Message-Id: <DLLU99E9SX71.3FQ2DNEOWK3VG@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 07/10] kernel-dev: give each example block one
 thing to hold
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-8-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-8-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10582

Hi,

On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
[...]
> diff --git a/documentation/sphinx-static/theme_overrides.css b/documentat=
ion/sphinx-static/theme_overrides.css
> index 1a439e9faf69..d7d1c6da79b5 100644
> --- a/documentation/sphinx-static/theme_overrides.css
> +++ b/documentation/sphinx-static/theme_overrides.css
> @@ -116,6 +116,33 @@ section#welcome-to-the-yocto-project-documentation p=
.caption {
>      -ms-user-select: none;
>  }
> =20
> +/* A code-block caption names the file the block came from, so it
> +   should read as a filename rather than as prose, and sit on the block
> +   it titles rather than floating above it. */
> +.rst-content .literal-block-wrapper .code-block-caption {
> +    font-style: normal;
> +    font-family: SFMono-Regular, Menlo, Monaco, Consolas, monospace;

I think this shows with a different font compared to the code-block, on my
build. On my system the font-family definition for code-blocks is
"SFMono-Regular, Menlo, Monaco, Consolas, Liberation Mono, Courier New, Cou=
rier,
monospace;". Could we inherit from that, or at least have the same definiti=
on
for both?

Antonin

