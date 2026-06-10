Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72749CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:54:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19781.1781096045366174850
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 05:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WTzpVZW8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 348651A37E2;
	Wed, 10 Jun 2026 12:54:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0C1B5FFC9;
	Wed, 10 Jun 2026 12:54:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EBC6106B90C5;
	Wed, 10 Jun 2026 14:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781096042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5wgSX6I2gG+BXxRerQvWO5tF5FAA9T+DvJcn7w0aUGE=;
	b=WTzpVZW86onnYSCBQS9pmL6Qsrch1qn/5Ci9v1rVMfFgaGUC+KsYuKDyd+wzFu5aT847Ab
	aPo7qJ579qK1jOL/RpHIGq4sjQoVOoo6bVHtCHpHnmFvTYvZ8TXjW2WjFqObABwfuVUGHH
	MlhyjnTA1GzcAxj9UGqeMoORRM2jHEce4bEJOsIsd7/g2zkkXL/eEXfai1l1bkjmOL7EnV
	xu3aOV6LDWtOtcvtD88Aw60AzHasbELUhU2Pxfq6mQHdcAXPPjH3wYKGdafoJSCSN2QT4l
	03ERDEbIrUGvXlpmjKSAkyABUU1VJoRte/7xRcS1GfSdTfPwg89T/OwhLApOkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 14:54:00 +0200
Message-Id: <DJ5DUP7UGJ15.3M0OBFLFC7SGI@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
 <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
 <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca>
 <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
 <CANNYZj9EaHwoGNyGeiNV=LYWaDwR31A5THogT-7m9X4g1jjNWg@mail.gmail.com>
 <792c5b1a-00a8-00d3-a0c4-8cfd23be31b1@crashcourse.ca>
In-Reply-To: <792c5b1a-00a8-00d3-a0c4-8cfd23be31b1@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 12:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9679

On Wed Jun 10, 2026 at 11:51 AM CEST, Robert P. J. Day wrote:
> On Wed, 10 Jun 2026, Alexander Kanavin wrote:
>
>> On Wed, 10 Jun 2026 at 11:24, Quentin Schulz <quentin.schulz@cherry.de> =
wrote:
>> > Do not modify a recipe's unpacked source code, it's the best way to ha=
ve
>> > your changes lost. There are non-negligible chances that it'll end up
>> > being deleted and unpacked again (e.g. because the cache is outdated v=
ia
>> > its dependencies or the recipe parsing resulted in a rebuild of the re=
cipe).
>> >
>> > Using -f also taints the build and you need to clean the sstate-cache
>> > for this recipe to recover from it last time I checked, which is
>> > something we don't like recommending to people (if you need to clean t=
he
>> > sstate-cache, either something's wrong with your recipe or there's a b=
ug
>> > we need to fix), so I don't think documenting this enormous footgun is=
 a
>> > good thing.
>>
>> I agree, I'd rather not mention it at all, and point people directly to =
devtool.
>
>   ok, i'll add that but, as i just mentioned, it's there in the quilt
> section as well.

I think keeping the Quilt document is fine and in this case the command mak=
es
sense, however, it would be nice to inform users in this document that devt=
ool
is available and friendlier. Could you add this note?

Antonin

