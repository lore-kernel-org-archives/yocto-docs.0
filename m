Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.592.1792680453527352524
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 07:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iXPqygdO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37F521A12CC
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 14:47:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F399360360;
	Thu, 22 Oct 2026 14:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57B0010328501;
	Thu, 22 Oct 2026 16:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792680450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ECGvLt0VVdH3c4BYVQAzbATnU0Cx0P7ki8sw98YgbSU=;
	b=iXPqygdOops/wRx7EHkw96t+uu4CNmRxDcLmfAt2KU8F09ic2KngpeA547Haund9Zo8gFR
	dCm/V0kDyMuxT5yN4kuYw0CgOBdw+l0/LmI3GD3jB7NA0eh+orpQNva/oV3oAeOaCwDKKM
	6xesa67So6bQndD0lorHhC0oZDNnBCoskkFJ5pQlaPhEbputbob1RPZcogttGZgfuz33AA
	L9iplB8nFgx1/fBU37sNigEWnduvq9o2oBw0ujA9LXQ4+oZIIp/CakBqAVD6FfDHRLfjYD
	sP1DmxtR06XVe1cjrTJFQFCVhl1uq4TrWJpKx5skbNL/SEylhwD4HGeguuaChg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 16:47:28 +0200
Message-Id: <DMBG6KYCYMYP.36RH7WLO2QKH3@bootlin.com>
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>
Subject: Re: [docs] carrying lexers in documentation/sphinx: the ones after
 the shim
References: <atjXdzebFGmKVjj8@localhost.localdomain>
In-Reply-To: <atjXdzebFGmKVjj8@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 14:47:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10717

Hi,

On Wed Oct 21, 2026 at 5:17 PM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> This work started as a desire to tag and highlight BitBake code-blocks
> in our own documentation. Along the way it evolved into a task to
> correctly label (and highlight) all code-blocks throughout the Yocto
> Project documentation. In order to perform this work, two prerequisites
> had to be met: every code-block had to be valid for whichever language
> was appropriate, and the necessary lexers had to be added. Thank you for=
=20
> taking the first; now let's move on to the next.
>
> A while back, you asked me to send the BitBake shim as its own patch. I
> will. I am proposing a set of additional lexer patches, and wanted to
> discuss them before sending.
>
> One definition first, since the following table uses it. A "placeholder"
> is a value the reader is expected to replace with one of their own,
> written in angle brackets. E.g.:
>
>    SRCREV_<nameX> =3D "<revision SHA for nameX>"
>
> That line is not valid BitBake - the charset rejects "<" in a name - so
> the block cannot honestly be tagged "bitbake". Rather than teach the=20
> BitBake lexer to accept "<" in names everywhere, including in the blocks
> that are real metadata, "-placeholder" names a dialect: never a language
> on its own, always a parent plus placeholders. It extends the parent
> rather than restating it, and a code-block opts in only if it needs it.=
=20
>
>   lexer                     lines  derived from
>   ------------------------  -----  ---------------------------
>   bitbake (the shim)          442  BitBake's compiled regexes

When you say "the shim" I'm not entirely clear whether it will use the upst=
ream
Pygments lexer or will completely override it? Can't we use the upstream le=
xer
for these one? Maybe I got the wrong idea, maybe seeing the code will clear
things up.

>   bitbake-placeholder         147  the above, one rule relaxed
>   console (corrected)          53  a rule the manuals already keep
>   console-placeholder,
>     text-placeholder          140  a filter over the parent's tokens
>   scc                         117  yocto-kernel-tools
>   wks                          67  wic's ksparser.py
>   pydevshell                   48  devshell.bbclass's prompt
>
> Upstream is not the home for these. Pygments' contributing guide expects
> a language "to have a reasonably sized community around it" and suggests
> a plugin otherwise; ".scc" and ".wks" are very small, Yocto-specific
> formats nobody outside this project writes, so that is not a bar they
> will ever clear.

For all but the regular bitbake lexer, I also share the opinion these shoul=
d not
be upstream.

> The corrected console lexer changes a rendering we already have, so
> it is worth flagging. Pygments lets the preamble before a prompt be
> empty, so a line opening with "#" is read as a root prompt and the rest
> lexed as a command. Checking the console blocks in the manuals, I find
> every such line is a comment or program output and not one is a prompt.
> Requiring the preamble is the whole diff; "$" and "%" are untouched.

Not sure I fully understand what you mean here, but seeing the code might c=
lear
that up too.

> Remaining items on my plate:
>
>   - the shim, on its own, as you asked
>   - the lexers (discussed above), one patch each
>   - the labelling and the conf.py flip last

Sounds like a plan!

> If it makes the discussion easier, I could build and send a sample of
> the generated HTML docs after these changes, so you can see how the=20
> result will look instead of having to judge based on a description
> alone.

It'll be fairly easy for me to build and see it for myself I guess, so I do=
n't
think you have to bother.

Thanks!
Antonin
