Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADC6F9934A
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:39:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14587.1776929973281075860
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 00:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oRhn2+QI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C616BC5EF07
	for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 07:40:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8246160495;
	Thu, 23 Apr 2026 07:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46FAD10460A48;
	Thu, 23 Apr 2026 09:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776929969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JoS2QXMyUC4b05+WfAbf9B86lld+NuNfAeazCGZ91xs=;
	b=oRhn2+QIyRpAqRDkMYjpFWFCn/o7uT4cQ+jgK0G9A9bqbZj3EJBelULf5kHn5ChJk3iNIR
	AivAof68/fCjShC3/67RW4XOc1LJbilYLAjj6MQGR6tLd7KX2P/ZJvB7sLO3oFSwFwgrap
	YF1XpxgVJscC/6X2fNwml6ncAkzl/z5nxjmaFKMtWrfQ31nLGHDZ3ptYe0PhhsAbY0gA/+
	eXT6cbooLP0X4tiyiHecVExKOItTtWNtAfa2dvmm6lsWbjHyUjgTQ2K60+0aru7u03RMJN
	22NtD2x6hgoQyKo99kN1z2n4MqjHCJQjMAXjw6vrodbPSgKMMSP6JOELeDw/4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 09:39:27 +0200
Message-Id: <DI0D3PSDIVBY.4QKPZ6G5EM67@bootlin.com>
Subject: Re: [docs] [RFC PATCH 1/2] add a "bitbake" pygments lexer
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Woerner" <twoerner@gmail.com>
References: <20260421172416.1801567-1-twoerner@gmail.com>
 <20260421172416.1801567-2-twoerner@gmail.com>
 <DHZHJMU79QRA.QGWLX7MEM1TL@bootlin.com>
 <aekCLM6QTkN_VPqC@localhost.localdomain>
 <aekifgKmUQFnOa5T@localhost.localdomain>
In-Reply-To: <aekifgKmUQFnOa5T@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 07:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9330

Hi,

On Wed Apr 22, 2026 at 9:33 PM CEST, Trevor Woerner wrote:
> On Wed 2026-04-22 @ 01:15:24 PM, Trevor Woerner wrote:
>> On Wed 2026-04-22 @ 08:55:39 AM, Antonin Godard wrote:
>> > Hi,
>> >=20
>> > On Tue Apr 21, 2026 at 7:24 PM CEST, Trevor Woerner via lists.yoctopro=
ject.org wrote:
>> > [...]
>> > > +# Pygments does not ship a BitBake lexer, so this Sphinx extension =
provides
>> > > +# one.
>> >=20
>> > Have you considered contributing this lexer to Pygments instead? I wou=
ld rather
>> > have it there than having to maintain it here.
>>=20
>> All development on Pygments occurs on github: https://github.com/pygment=
s/pygments
>> Currently there are 143 open pull requests: https://github.com/pygments/=
pygments/pulls
>> (some going back to 2019)
>> However, the latest release was 3 weeks ago: https://github.com/pygments=
/pygments/releases
>>=20
>> I will create a pull request for this feature and see where it goes. The
>> contributor information for the Pygments project is very clear that they
>> are not interested in adding/maintaining lexers for "pet" languages.
>>=20
>> https://pygments.org/docs/contributing/
>>=20
>> Of course *we* are all aware of how big the community is that uses
>> bitbake, but will we be able to convince them? bitbake's usage is large,
>> but compared to, say, something like c or python... All I can do is
>> submit and see. Realistically maintaining it ourselves is a likely
>> possibility if we're interested in this feature.
>
> We'll see what they think: https://github.com/pygments/pygments/pull/3103

BitBake does not change syntax often, I would say, so once it's settled in,=
 I
think it won't have to change that much.

Thanks for the PR! Let's see where this goes.

Antonin

