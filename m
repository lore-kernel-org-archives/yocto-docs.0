Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85471CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 13:13:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20146.1781097198393542177
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 06:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rkUXHAT8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21941C58471;
	Wed, 10 Jun 2026 13:13:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23BAF5FFC9;
	Wed, 10 Jun 2026 13:13:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28A52106B994A;
	Wed, 10 Jun 2026 15:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781097195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6zfIZg0m6STvFG758yxj66wBP3INXUJjIz46fyUvS0=;
	b=rkUXHAT8Fh7nA9ureuzDV+sYeIALiiTGc1bJzAvoMfhB7h4r6sZL87+lWuGvezFeKWRbTq
	T6Xn+NnwaogCyvqFG+j9OqVjad9wA2WB/HbX6ZkPvkwixAG+ZFaYhMdoPuR/+Yov3BXcwu
	DUoXW8ZiQsSWA+4ejCYSYckel+MZzBERSIhszbQ0UKi1BuCZH7BdZbs0GNYFifloIFPZwZ
	UCbUvUzF0S9KYsEhgDhxMRwnv11HTq2IJC0vorfiCd0be/vNKHIa6ZKwxXrTPNSMgqmzTr
	KfeU50PFifMZLS29B7fzMOG0LK9riWtvWJ5Mf0maKCGtNoTVu7Wn1d+IKIa2Sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:13:13 +0200
Message-Id: <DJ5E9EXAKEDO.K4UR4XPB3FS@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
 <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
 <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca>
 <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
 <CANNYZj9EaHwoGNyGeiNV=LYWaDwR31A5THogT-7m9X4g1jjNWg@mail.gmail.com>
 <792c5b1a-00a8-00d3-a0c4-8cfd23be31b1@crashcourse.ca>
 <DJ5DUP7UGJ15.3M0OBFLFC7SGI@bootlin.com>
 <c6a477d5-10a4-5775-7031-33b2b10a3a71@crashcourse.ca>
In-Reply-To: <c6a477d5-10a4-5775-7031-33b2b10a3a71@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 13:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9682

On Wed Jun 10, 2026 at 2:59 PM CEST, Robert P. J. Day wrote:
> On Wed, 10 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:
>
>> On Wed Jun 10, 2026 at 11:51 AM CEST, Robert P. J. Day wrote:
>> > On Wed, 10 Jun 2026, Alexander Kanavin wrote:
>> >
>> >> On Wed, 10 Jun 2026 at 11:24, Quentin Schulz <quentin.schulz@cherry.d=
e> wrote:
>> >> > Do not modify a recipe's unpacked source code, it's the best way to=
 have
>> >> > your changes lost. There are non-negligible chances that it'll end =
up
>> >> > being deleted and unpacked again (e.g. because the cache is outdate=
d via
>> >> > its dependencies or the recipe parsing resulted in a rebuild of the=
 recipe).
>> >> >
>> >> > Using -f also taints the build and you need to clean the sstate-cac=
he
>> >> > for this recipe to recover from it last time I checked, which is
>> >> > something we don't like recommending to people (if you need to clea=
n the
>> >> > sstate-cache, either something's wrong with your recipe or there's =
a bug
>> >> > we need to fix), so I don't think documenting this enormous footgun=
 is a
>> >> > good thing.
>> >>
>> >> I agree, I'd rather not mention it at all, and point people directly =
to devtool.
>> >
>> >   ok, i'll add that but, as i just mentioned, it's there in the quilt
>> > section as well.
>>
>> I think keeping the Quilt document is fine and in this case the
>> command makes sense, however, it would be nice to inform users in
>> this document that devtool is available and friendlier. Could you
>> add this note?
>
>   there is alreaady a note at the top of the quilt section
> recommending devtool.

Ah perfect then.

Antonin

