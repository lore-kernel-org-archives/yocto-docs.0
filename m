Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE3CCD5BB4
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 07:53:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32270.1779781978387456696
 for <docs@lists.yoctoproject.org>;
 Tue, 26 May 2026 00:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F/+AHsSf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5FF251A36D1;
	Tue, 26 May 2026 07:52:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34E1160732;
	Tue, 26 May 2026 07:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A1D6108883E6;
	Tue, 26 May 2026 09:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779781975; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pSxLDc8NTkFmiA9AXJ9A3PTlf4xmaXvX6+g7etuOHWs=;
	b=F/+AHsSfxOQxfbit8KtEJnzgRX40y9rjOf579pFZIAUsCcIzPOsn3z309IZQG2oFJ9LS0p
	5u26ayINUFOq+OPFFjXQ9/kqhNMwPJZ4JL2MxHF2yLgonyaVspEtOEuAKXwDybMSMvygpG
	6HWgPXwpVPRSuf4h7VkBHaxI21k7ZZgory8nXoWs37ZmuJA2wIEpfC2vHYbjaZQBu6Zl79
	KbXhkH5CK4xAs/QfV5rocoCQjOGGtPi1OYhebOqPEkO48JbmiTY7SU6aEDClY6PhlpIVdj
	gz3q9utDt6fK8vvD+1j8hxTxfs88ldLkXn39e2X/D3Csx3Kj018mcZIw870fHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 09:52:54 +0200
Message-Id: <DISG1ZV3PGFC.1FK9GGQXRM8RM@bootlin.com>
Subject: Re: [docs] [PATCH v2] overview-manual: inform the reader early of
 "bitbake-getvar"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <f4adc33f-5b48-bd89-e872-fa387921aa2d@crashcourse.ca>
In-Reply-To: <f4adc33f-5b48-bd89-e872-fa387921aa2d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 May 2026 07:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9536

On Fri May 22, 2026 at 6:35 PM CEST, Robert P. J. Day wrote:
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
> index 0dac5cfbc..5c6df883a 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -14,9 +14,9 @@ explained.
>  .. note::
>
>     Throughout this section, many variables and their meanings are
> -   introduced. If, in the context of a build directory, you want to
> -   examine the value of any of these variables, you can use the
> -   ``bitbake-getvar`` command, explained in the
> +   introduced. If, in the context of a :term:`Build Directory`,
> +   you want to examine the value of any of these variables, you can
> +   use the ``bitbake-getvar`` command, explained in the
>     ":ref:`dev-manual/debugging:viewing variable values`" section.
>
>  Yocto Project Components

You sent this but it is based on your v1. I squashed this one and v1 locall=
y,
just wanted to let you know.

Antonin

