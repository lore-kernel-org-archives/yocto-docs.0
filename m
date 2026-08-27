Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E721BC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:16:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35076.1787833006531832985
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 05:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gNNZB5fK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 759991A1868
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 12:16:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39513602B8;
	Thu, 27 Aug 2026 12:16:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3533811C7801A;
	Thu, 27 Aug 2026 14:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787832999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kQT1D3TSkp0/O65ehq2fb7le7KgGkZDtGxaelDgYx0M=;
	b=gNNZB5fKUeXYP1tTh60yskc9Sl8I5auS6T++h5itK78yiqPtseURb5wqdBy3NSoyQlvFyK
	nmtbIF/Xj7Hdh00Gy58nXIZujXylBPocoNmaeJuoFYkWUnZ0TFBs5gdyWXU3wKWh8Y/zlN
	U55qRPjCiXqBMCnVky7OooHtd1iDNOz6IzxJkinM6BXyGT++gwd9YF0AApRFiq+hR7nxGd
	jqpsBoMJrLGqx3Pa1CQo0+eOcQrmbkKtXmcyU8pkfKTn97erIF/3ZyB2hFzI114RA88Cre
	FI9O62vjfqU40GnEyf6vjWduAeW5myWB8DUUhPWe+q/yZssYDiS1NdVJS7ZQAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 14:16:38 +0200
Message-Id: <DKZPWL5N9LAS.EB6LNEC08FQE@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Cc: <docs@lists.yoctoproject.org>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <DKZL9X7BV6TH.1WARGZV04JK2V@bootlin.com>
 <apAgqQXALqu6eX7W@localhost.localdomain>
In-Reply-To: <apAgqQXALqu6eX7W@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 12:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10382

Hi,

On Thu Aug 27, 2026 at 1:34 PM CEST, Trevor Woerner wrote:
> On Thu 2026-08-27 @ 10:38:58 AM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Wed Aug 26, 2026 at 3:34 AM CEST, Trevor Woerner via lists.yoctoproje=
ct.org wrote:
>> [...]
>> > Not included
>> > ------------
>> >
>> > Six blocks in ref-manual/ trip a defect in the released BitBake lexer,
>> > fixed upstream but not yet in a release. They are a separate patch, he=
ld
>> > until that release, so the rest is not blocked behind them.
>>=20
>> Would it make sense to apply a patch to Pygments in OE-Core to fix these=
 issues
>> until a new version of Pygments is released?
>
> It would be very easy for me to provide a patch that would fix these
> things locally until (if) upstream pygments picks up my updates:
>
> https://github.com/pygments/pygments/pull/3284
>
> I had wanted to add such a patch when I first developed the bitbake
> lexer for pygments but the last time I proposed adding a temporary,
> local pygments update it was decided we should wait for upstream.
> Therefore I stopped short of doing that here.

I think you misunderstood me :) What I meant is that we could patch
python3-pygments in *OE-Core* (*not* provide the lexer from yocto-docs)
temporarily, until your above pull request is merged, and we drop the
patches in OE-Core after an update.

> I would also like to add a lexer for some other smaller stuff such as
> SCC files. This lexer is very unlikely to be picked up by the upstream
> pygments project; their own documentation says so explicitly:
>
> https://pygments.org/docs/contributing/#language-support
>
> But I think it would be nice if we had a highlighting scheme for it.
> I'm more than happy to write it, but it is a plugin we would have to
> carry ourselves.

Sure, I am open to small additional lexers in the documentation (as long as
they're small and simple enough to be maintainable), especially if upstream
refuses additional small lexer like this one.

Thanks,
Antonin

