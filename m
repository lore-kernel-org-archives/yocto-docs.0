Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1052DC61DBE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 13:09:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12187.1787749772182622851
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 06:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GAPXANvZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07C881A1818;
	Wed, 26 Aug 2026 13:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE8AE604EC;
	Wed, 26 Aug 2026 13:09:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B07011C78174;
	Wed, 26 Aug 2026 15:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787749765; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n2CUM7CPRoo7oSuDxZm9K35Ck7GCIzcZLkDp7iI7xFY=;
	b=GAPXANvZDInZLCieh0blqsbCHMHFzWHCbCpMJE5b+SeRqnUN2NEAzQiRSdaO4uTL8Nrdgl
	7TH+0EVfbryEtZu7YUKDegEdpqioWRP3a1BM7n/8DT9ihBZKxMAhjnwWsskbChkw9mTMCt
	it5W+g1uiFMBFv4MuYGXuL6gkLi+uVVd8/jMJluIC5xML0kdPf+DKMUgSirwzcetbITKVy
	YrsMQ5eRLFoCByIwk7CkLjMXlP+vh+TDHTW7b8sWCpLxfiJ/JO2YJwzRKuGuUVhG6Vs/bh
	ELPC7nVWjRHLRn6zAKgH7txXN4gBKzWixMaLqyers1voiVkpMqgSZ/VMu38IKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 15:09:23 +0200
Message-Id: <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <twoerner@gmail.com>,
 <docs@lists.yoctoproject.org>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
In-Reply-To: <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 13:09:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10363

Hi,

On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Trevor,
>
> On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:
>> Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
>> what they are instead of rendering as plain literal blocks. This tags
>> the ones in yocto-docs.
>>=20
>> One patch per manual, which is also roughly one reviewable unit per
>> patch. No prose changes, no reflowing, no reindenting - every hunk turns
>> a literal-block introducer into a code-block directive and nothing else.
>>=20
>> Which blocks were converted was decided by reading, not by pattern
>
> "by reading" following a paragraph definitely not written by you and=20
> with all commits being AI-Generated is quite the stretch ;)
>
> [...]
>
>> Depends on
>> ----------
>>=20
>> "docs: state the language of nine literal blocks explicitly", sent
>
> Link to the ML please to make maintainers and reviewers job easier.
>
> [...]
>
> I think this is going the wrong direction. We should actually make=20
> explicit the language of every :: that is NOT to be understood as=20
> BitBake code and then make the default highlight language be BitBake.=20

But then this might get forgotten? How about having the default highlighted=
 as
"none", and make _everything_ use explicit code-blocks?

Sure, this is more efforts and review time, but also this is how other mark=
up
languages work - like markdown, where by default (when using ```...```) no
syntax highlighting is done.

This is maybe a more conservative approach but at least it doesn't leave ro=
om
for code blocks mistakenly highlighted with the bitbake lexer.

Antonin

