Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF9C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:01:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56408.1786460472112919889
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 08:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JM3MDSlm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 383814E411BB;
	Tue, 11 Aug 2026 15:01:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02A9E6033C;
	Tue, 11 Aug 2026 15:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEBC411C48E14;
	Tue, 11 Aug 2026 17:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786460465; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nrQzBHgUonrkF/L5uja+yvwLqxXtGk2XVau55nHdf1w=;
	b=JM3MDSlm4Vw+edxWPIKO6Nd9RYrxDxVM/hDbRiHf1fX+ruHms7pV9GjK6eygoYWrubWoKR
	1s1fUVE21FTx4xxxMm6xWN3ZIorK2qFPER61g83+jZc8xFMjvQ9BV1Qx2E4bMqPBhTu41B
	UtpL6ccFgZUISw6SfuRBeYFRPfT2iMxgJqpWLkTijYRhOaGA5k3qNWAA/yH8gpQ/yfHn+8
	b3j9EHlpHn+sA9QtGcYKNSiTuHDGxTpR3P1/CYhKS+g36hU4YCh/Gv0rvS6TnByrwZ9nVU
	NkbIy7wVd1lvZ5pw1gcUBor9casvAODvfdd+xbajs8fRoy0b0lYMkG2+GHavGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 17:01:04 +0200
Message-Id: <DKM7DRJFMI6Y.2MK3KAZ2YPVD8@bootlin.com>
Subject: Re: [docs] [PATCH] governance: Add start of project history and
 leadership sections
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
References: <20260715144404.753400-1-richard.purdie@linuxfoundation.org>
 <DK6U5WRXC6D8.1K2H139ELD32@bootlin.com>
In-Reply-To: <DK6U5WRXC6D8.1K2H139ELD32@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 15:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10270

On Fri Jul 24, 2026 at 3:29 PM CEST, Antonin Godard via lists.yoctoproject.=
org wrote:
> Hi Richard,
>
> Thanks for contributing this, there's valuable information in there. Here=
 are my
> general remarks:
>
> - I don't think this should be part of the "Manuals" section of the
>   documentation. I propose that we make it a separate section instead, as=
 I
>   don't see where it could fit anywhere in the sections we have.
>
>   On that topic, I've just sent a series that re-organizes the section a =
bit
>   [1]. But I think the "Governance and History" should be on the same lev=
el as
>   the "Security Reference" one (i.e. separate from the rest).
>
> [1]: https://lore.kernel.org/r/20260724-rework-welcome-page-v1-0-491772cc=
4b65@bootlin.com

This has now merged. Looking at the overall docs, I think a good place for =
this
document might be the "Introduction and Overview" section, after the "Overv=
iew
and Concepts" subsection.

Antonin

