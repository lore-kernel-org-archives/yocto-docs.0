Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C60C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 15:16:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12738.1790090173207048072
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 08:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vTTssQDp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7D3C1A0FD0
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 15:16:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C21060580;
	Tue, 22 Sep 2026 15:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A686103291BA;
	Tue, 22 Sep 2026 17:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790090166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bgcdG12sIoNLy2sWhw8UtMpHMT25b+HkUWnc4NIeH8c=;
	b=vTTssQDpcir/Dr7gX61ibir5zCNCM1xZhY2fzKVo48E8nKfmQ8v47dkvvg5kLzH0MJcDVm
	cJGyZHOMl9FHeyYkbOQLq7EgIbQkaqxquGCqZDFINsXffXHhee7RBIVohwszRRV4NlMdOs
	tqPShvIv1E11RBHk+5pvsThCXF7LcyWMriz+EcPlNIuTYn7yk+XK6+K1WMq1m138Gto/av
	rdYJzYshLbygZ67JcuFvPiHKlFrzw466+unLXT+rTXmnm4gDsRmq8dA9YFAA06GvJlUt7o
	lSXnxEM5gYbpmwfYZW8eita3ssWLHh2K+hRIlUZROU1OBkWsq5pmZ+CPinuDGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 17:16:04 +0200
Message-Id: <DLLY04OEWY1F.21S0XIICXWBJ5@bootlin.com>
Subject: Re: [docs] [PATCH 02/10] docs: copy only the command from a console
 block
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-3-twoerner@gmail.com>
 <DLLU9BXA64J2.UY44K2234HES@bootlin.com>
 <arKTSMPTOXE2QkTU@localhost.localdomain>
In-Reply-To: <arKTSMPTOXE2QkTU@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 15:16:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10588

Hi,

On Tue Sep 22, 2026 at 4:40 PM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
[...]
>> > diff --git a/documentation/sphinx-static/theme_overrides.css b/documen=
tation/sphinx-static/theme_overrides.css
>> > index f9e067239b8e..1a439e9faf69 100644
>> > --- a/documentation/sphinx-static/theme_overrides.css
>> > +++ b/documentation/sphinx-static/theme_overrides.css
>> > @@ -107,6 +107,15 @@ section#welcome-to-the-yocto-project-documentatio=
n p.caption {
>> >     display: none;
>> >  }
>> > =20
>> > +/* Sphinx already excludes the prompt from a selection; do the same f=
or the
>> > +   output, so selecting a session block gives what the copy button gi=
ves */
>> > +.highlight span.go {
>> > +    user-select: none;
>> > +    -webkit-user-select: none;
>> > +    -moz-user-select: none;
>> > +    -ms-user-select: none;
>> > +}
>>=20
>> This only works if the code-block uses the "console" lexer, though. Mayb=
e say
>> that in the comment.
>>=20
>> But I think we don't want that. Copying outputs might be useful in some =
cases.
>> And I trust the reader to be conscious enough to only select the command=
, not
>> the output of the command (it's still nice not having the prompt selecta=
ble
>> though).
>>=20
>> I know this doesn't reflect 100% what the copy-button does but at least =
there's
>> still the option to copy the output.
>
> My preference would be that when the user copies, they only get the
> command; my guess is that's what they need, because they want to try the
> commands themselves. The output is something they might look at, but not
> necessarily copy.
>
> But I can see a case where they might want the output too. So I'm okay
> with changing the behaviour if that's what you'd prefer: it is one
> setting and one CSS rule, and both methods would then give the command
> plus its output, with the prompt stripped in each case.
>
> I have a much stronger opinion that the copybutton and mouse-selection
> should work the same, regardless of which way we decide they should work.
> First off, I don't think readers are going to really notice there are two
> ways to copy. But if they do notice, I think they would be surprised to
> find they worked differently.

I really think having two different ways of copying is a non-issue here... =
So
I'll stick with my first suggestion which is to let the user copy the outpu=
t if
they want to, but have the copy button copy the command only.

Antonin

