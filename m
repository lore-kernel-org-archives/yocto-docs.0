Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56025CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:05:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9034.1780668328003850171
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KDOYYCN7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A1BE4E40889;
	Fri,  5 Jun 2026 14:05:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F43D5FED1;
	Fri,  5 Jun 2026 14:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 246E3106A183B;
	Fri,  5 Jun 2026 16:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780668325; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kf+PsZb+YY4ebdq+Id044nWtQIg8YykV5gt/d5HbOH0=;
	b=KDOYYCN7Adb8we5PSSQoLCDGtns/VeUlFG0eJP9BC50E0Vkw5F1cSJ/W9FpcmV6G5a2RLO
	/89oZzQXkVHQd+BFq2vCabhef/JqJD58c7F9RmhGRLOe7HmI2CdJqmxmVFLbrGf1BUMPFc
	873H6JduzxB2SFGYvbguh+B9BDaMOP7UIEdfZ9ao5/PdJ/SFpPanuie6lnjzajbSYUlC8K
	krYHSben2JV5vOOGQ7G5r+1/dLIs7Qy4ZYAl5/b5auZ/lgAdRbswIle0bo1Fg7gpUjvrpM
	MTz2OhAjhfdHcjF9Vnj5ai8lLJEjQPtdF5NoevsLRwmeU6ZLV/rewPPUYk5Exg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:05:24 +0200
Message-Id: <DJ168NAEZ2ZU.ZCFOL92MHAE0@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] recipe-style-guide: Clarify when License-Update
 tag is needed
References: <20260604-license-update-v1-1-16dad5e9b0a2@pbarker.dev>
 <DJ06PF26JYAU.KBPZ0QZ4R8XC@bootlin.com>
 <a92e5b037d8da3ea466945b99c6190212c5110ba.camel@pbarker.dev>
In-Reply-To: <a92e5b037d8da3ea466945b99c6190212c5110ba.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:05:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9606

On Thu Jun 4, 2026 at 12:18 PM CEST, Paul Barker wrote:
[...]
>> > +The ``License-Update:`` tag is not needed for commits which fix incor=
rect
>> > +license data in our metadata.
>>=20
>> By reading this alone I fail to see a use-case, could you provide an exa=
mple?
>> Perhaps a link to such a commit? (you can use :oecore_rev:`<commit sha>`=
 to
>> create the link).
>
> Hi Antonin,
>
> This was while discussing a series from Joshua [1] and follow-up patches
> from Richard. I can send a v2 shortly once the commits are merged to
> master and mirrors have updated, etc.
>
> [1]: https://lore.kernel.org/openembedded-core/20260601181251.123019-1-JP=
EWhacker@gmail.com/

Sounds good! I think Joshua's patches have been merged.

Antonin

