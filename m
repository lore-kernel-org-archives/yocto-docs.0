Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549B8C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8729.1790079607809366341
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rkSsHGii;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 312A11A0FCC
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0615060580;
	Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 474D910329111;
	Tue, 22 Sep 2026 14:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079601; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hpmznELpqESGCnsJjh5LTGxWCWozdcUwL2qqBqyzemI=;
	b=rkSsHGii7IZmMUOVMP+A6H1szNCGUhU8J158Y6IsLjcS/bex9447abWY586YaeV6DdelYQ
	AlTtXLXHduq1eYA0eT0ZuzeoR4/xOctQcOTo3Gj/p2z5AidJmTWQEoOQSZZWZsHNLeSa+V
	14DhW4GZdfS81vS6NA3hGc3foDi4lTdBRKwB/w5f+POe6iXgHEwjCnxJ9zdFetc9zhKiNx
	y9rQF0rLgfY2DrlLYFsP4+Ovdp1Vv62BI0AVyI+0WMeuFWXhUs6aRcCE4BBms//Cn4J2xc
	HseYUii2AlU83Tl6zlQhf8jh3dzdba/4plYGVD7vJk6VciDIM+3ZWbJuaz8KSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:20:00 +0200
Message-Id: <DLLU9BXA64J2.UY44K2234HES@bootlin.com>
Subject: Re: [docs] [PATCH 02/10] docs: copy only the command from a console
 block
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-3-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-3-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10584

Hi,

On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The copy button matches the literal "$ " prompt, so on a block prompted
> any other way it matches nothing and falls back to copying every line,
> output included. Match a pattern covering each prompt shape the manuals
> use instead, and stop the mouse selecting the output, so both ways of
> copying give the commands alone.
>
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  documentation/conf.py                         | 21 ++++++++++++++++++-
>  .../sphinx-static/theme_overrides.css         |  9 ++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 48d28a686807..ccec27e60165 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -242,4 +242,23 @@ intersphinx_mapping =3D {
>  # -- sphinx_copybutton configuration -----------------------------------=
------
> =20
>  # sphinx-copybutton configuration
> -copybutton_prompt_text =3D "$ "
> +# Strip the prompt from a copied line wherever the prompt cannot be
> +# confused with content. The pattern is not scoped to console blocks, so
> +# every alternative has to stay safe inside a BitBake or configuration
> +# example as well; measured over the built manuals, each one matches onl=
y
> +# lines the lexer itself marks as a prompt.
> +#
> +# A bare "#" is deliberately absent. It opens a root prompt, a comment a=
nd
> +# a line of program output alike, and nothing distinguishes them - which=
 is
> +# why the root prompts are given a preamble before this is switched on.
> +copybutton_prompt_text =3D "|".join((
> +    r"^(?:\S+[@:]\S*)?\$\s+",   # "$ ", and "user@host:~$ "
> +    r"^\S+[@:]\S*#\s+",         # "root@qemux86-64:~# ", a root prompt
> +    r"^[A-Za-z]:\\[^>]*>\s*",   # "C:\WINDOWS\system32>", cmd.exe
> +    r"^DISKPART>\s*",           # diskpart prints a prompt of its own
> +    r"^pydevshell>\s+",         # bitbake -c pydevshell
> +))
> +copybutton_prompt_is_regexp =3D True
> +copybutton_only_copy_prompt_lines =3D True
> +copybutton_remove_prompts =3D True
> +copybutton_line_continuation_character =3D "\\"
> diff --git a/documentation/sphinx-static/theme_overrides.css b/documentat=
ion/sphinx-static/theme_overrides.css
> index f9e067239b8e..1a439e9faf69 100644
> --- a/documentation/sphinx-static/theme_overrides.css
> +++ b/documentation/sphinx-static/theme_overrides.css
> @@ -107,6 +107,15 @@ section#welcome-to-the-yocto-project-documentation p=
.caption {
>     display: none;
>  }
> =20
> +/* Sphinx already excludes the prompt from a selection; do the same for =
the
> +   output, so selecting a session block gives what the copy button gives=
 */
> +.highlight span.go {
> +    user-select: none;
> +    -webkit-user-select: none;
> +    -moz-user-select: none;
> +    -ms-user-select: none;
> +}

This only works if the code-block uses the "console" lexer, though. Maybe s=
ay
that in the comment.

But I think we don't want that. Copying outputs might be useful in some cas=
es.
And I trust the reader to be conscious enough to only select the command, n=
ot
the output of the command (it's still nice not having the prompt selectable
though).

I know this doesn't reflect 100% what the copy-button does but at least the=
re's
still the option to copy the output.

Thanks,
Antonin

