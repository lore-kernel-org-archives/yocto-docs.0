Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB766CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:54:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.28894.1761562468224139490
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 03:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FMhJCcwm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3292E1A16BD;
	Mon, 27 Oct 2025 10:54:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 025956062C;
	Mon, 27 Oct 2025 10:54:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ADE0102F24D8;
	Mon, 27 Oct 2025 11:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761562465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iJrK7GaO2UtkiFD6KSD2VBRnIwzhNvX0YLYkfIB94LQ=;
	b=FMhJCcwmLqvKlOiX3LcCu4VXNsYpsNTDN/KZtuJFw+OD9TQ7UUa9mi8lwYs6f8M2yytQIY
	p9hVHDMFqXoU1f3b11UMSJAruaoBC97x71vc3AUfsnsIl2WQuIb09bdVEZMybcGeXIj3Kz
	aGs0C5aS87wB6hqKAApIE5k8MxB/FGawEEtHzLPTqdtPB8NYZEpHGjBKSDy2rjhqnoQEt+
	shE/0mizMqJesUvqLMATHOIHb1sSNuffiy1qHClgfWdgohtB9wuUI5OKz4U1ynSFKcKOdp
	/sBNmrKlLfexF94PGMpATmvui+J08252f6Y9FpyUoThDX7LXyMRE+/9oTnAtuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 11:54:21 +0100
Message-Id: <DDT1RYTXU693.YS3XUM10ZA81@bootlin.com>
Subject: Re: [docs] observations on YP overview manual, ch 3
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Paul Barker"
 <paul@pbarker.dev>
References: <e59c985c-1b0d-3702-fb17-363ad6ed161c@crashcourse.ca>
 <89dc93e796c8a8ab920324f64168e4a5f04cd51b.camel@pbarker.dev>
 <93d6ba04-0274-74d9-0fc3-b951f089dada@crashcourse.ca>
In-Reply-To: <93d6ba04-0274-74d9-0fc3-b951f089dada@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 10:54:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7847

On Fri Oct 24, 2025 at 11:52 AM CEST, Robert P. J. Day wrote:
> On Fri, 24 Oct 2025, Paul Barker wrote:
>
>> On Thu, 2025-10-23 at 08:40 -0400, Robert P. J. Day wrote:
>> >   from here:
>> >
>> > https://docs.yoctoproject.org/overview-manual/development-environment.=
html#
>> >
>> > * section 3.3, "For any supported release of Yocto Project, you can
>> > also go to the Yocto Project Website and select the =E2=80=9CDOWNLOADS=
=E2=80=9D item
>> > from the =E2=80=9CSOFTWARE=E2=80=9D menu ...".  i do not see any link =
or menu entry
>> > named "SOFTWARE". same claim is made a but further down.
>> >
>> >   ah, the graphic on that page shows where it used to be, so that
>> > graphic is clearly out of date.
>> >
>> >   i think that's it for that section.
>> >
>> > rday
>>
>> I don't think the website screenshot is adding value to the docs here.
>> We can drop the screenshot and update the text to match the current
>> website.
>>
>> Are you able to send a patch for this?
>
>   if people are good with dropping the screenshot, sure, i can provide
> a patch.

I second Paul's suggestion. A patch would be appreciated!

Thanks for the report,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


