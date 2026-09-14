Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE75C88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:35:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18977.1789389327121549143
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 05:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R3/Spa9H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 257BDC6220A;
	Mon, 14 Sep 2026 12:36:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 141AE60323;
	Mon, 14 Sep 2026 12:35:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8355411C7AFA1;
	Mon, 14 Sep 2026 14:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789389320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WK6X4xyvy1kidVHh9IrZ7egWkk5cxT1wttMa6QicVW8=;
	b=R3/Spa9HH7ZcDsMAJ3hMbBk5PvLEUayJ2lR/Xg2SZGlObaP4v9nOMtFJJSFys3NNz4bj/b
	dya4rJASBIUtaNKRlw+ZeEcHtugfQrDzJ5HFi+WqHPZP6UjizctT5Fww6zecuz8YPfaIAP
	m6ALXXcwAwzRumusH+7hQZhg/3DkWv8nExLOyH/CDW2L/jebmqrfDURvAtFywKpXpmZ48I
	1q7TNqI1LmoBfUhTBiGipCn7PpiGkMF8P8LQehEOl1B/+5a5Ke9Dek4GXPuqAOZROlBXwK
	EosvdeAn5aKS/rqVOhpTje4vQT2FwlKgX0VeGf8sz+m8iCYMl9obxhKJE9kW9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 14:35:18 +0200
Message-Id: <DLF1KOQ6EK65.32CUFMXM5545U@bootlin.com>
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
 <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com>
 <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org>
 <ffbce176-bd78-f316-dd71-dda8ae2dd8f1@crashcourse.ca>
In-Reply-To: <ffbce176-bd78-f316-dd71-dda8ae2dd8f1@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 12:35:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10491

Hi,

On Mon Sep 14, 2026 at 11:46 AM CEST, Robert P. J. Day wrote:
> On Mon, 14 Sep 2026, Richard Purdie wrote:
>
>> On Mon, 2026-09-14 at 10:36 +0200, Antonin Godard via lists.yoctoproject=
.org wrote:
>> > On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
>> > >
>> > > here:
>> > >
>> > > https://docs.yoctoproject.org/dev/dev-manual/start.html
>> > >
>> > > it's amusing to read, "These systems, in general, should be high
>> > > performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
>> > > plenty of disk space)."
>> > >
>> > > would someone like to suggest a more modern configuration, and i'll
>> > > submit a patch.
>> >
>> > We could simply say: "&MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPAC=
E; disk
>> > space".
>> >
>> > Those are replaced by our poky.yaml.in replacements when building.
>> >
>> > Not sure we need to mention a processor model here, as it would become=
 obsolete
>> > in the future.
>>
>> I think the key is to mention multi cored system, "ideally with at least=
 16 cores"?
>
>   i can submit a v2 with that info, but would that be hard-coded since
> there is no variable in poky.yaml.in that relates to that.

Right, I think we could hold this value next to MIN_RAM and MIN_DISK_SPACE,=
 so
we keep all of them in sync.

I think we should add MIN_CPU_CORES in a patch, then use this value next to
where MIN_DISK_SPACE and MIN_RAM are used in the docs.

Thanks,
Antonin

