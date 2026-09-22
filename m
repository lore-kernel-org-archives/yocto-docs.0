Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079A2C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:40:20 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12053.1790088013103842006
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 07:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KrHkEPhl;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5306abbdccbso9288741cf.1
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790088012; x=1790692812; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH5t7PjgR6ynw9Hc41tq1Jtnfbr/bpmgclfgjkJpgOU=;
        b=KrHkEPhlqkDpilfl/nqb50Z42X8cyJ/G8y3Tboooj6Jf7B04HsPJwDV5u+kITVLTat
         TBXpPWaoJQGBn+WMHbmZ3eiKlOCz2Vuet9ERxuM+C9dsAb6Lf2+o0Oz5L9VFl0niqjFK
         XPrIEes4zn8jj32N3MZNxM4CN+3+6iNt/iztJWXVdFun30sBuzGx80B8Xh0DPWK7qk5M
         c04ee8s6z/48K8W1RTtr2Je7aUkDCiiuBkAywAi83lEjpxPH7RVOPhqBuy/oT/Q3Dg3I
         6UW/sNQbq9CRaYFb4JHCW9L6thSYLl4qQcx6dF+0I4dIRu9fV1SxpAbLRcqKhBCm40IQ
         9bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088012; x=1790692812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH5t7PjgR6ynw9Hc41tq1Jtnfbr/bpmgclfgjkJpgOU=;
        b=eh5UeR08eXMVlUYbIIK8qgu3cgBfDiCVtiXBDs8+tJAJtpyW+kdCeXw2DpCkAER+J6
         cd7yPBpMwuWKoDMwS2RkLKNZsZL1TjuBIT6J9oFr2ElXlQE4LJa78MJCk08zZo9I8DSa
         DqUR2J5rIMJQT2byAbPwGE18+1Q9wLk5OWbJiC1v5KpUXdUb6+ylMJ2ISGtFLrXo7k/T
         v5rbyKzxN+2c1q7lCxM2T189+vkhZgT/O8Bm25hPeUMHaIJbALv8mS4fwReKutXl8eao
         0RMCAoXfnsRz6B2yCXArTzfgsycr1bsYeUWySNRWJBpb9YIsc3gUFhQOKHOLjOafuDH0
         vLNg==
X-Gm-Message-State: AFuF++nkdAxns0YMWnVToNJsvRslLdxuKk4Or14R0yrpcgLlNRMmnupj
	RCawxOjZ/0s7MRTnyMdzj5DqTiuaaNnvXohyTRR6C2JdwqEOSN0cD3ZI
X-Gm-Gg: AYBFou0mHuMYnEBTp8al7sxHMhzJo5pN3VMV14JTXU/t8+M6UaxdCc3xwXSZTLX9Vue
	SYj41f9F7oNP1LIksYt60ujoB3jC/ZsjFiTYjrzgsJJ19xCQ3knZ3d77rZ1YdgrougScOuw0ZPh
	8e20JYmL2qdxMr+l7Ev+ZAUITG8Hp7Vhm1FX8vvOepo2Wr87vtbyVL0LOS+SmGBp/qOnvg9/Tu4
	REykpy6c5llrf+jLONBsT2WnWmDmVlGUBI3eCKf3xtxj+4pyiTJ9nIJdWEXwR/3jpSvwxpXe1ih
	XbbKsWmTZOiekB8Z5fgUXnXxNTYVMEb6p5JBAO8DIi1C0EDaGCMoQkiunCc5FjnidY2ixpPjt9N
	7dJRzC75RjnnB37E/g2zVnOMHplYFAE5qZXVsu6qIKpxiuDEEpOh0sAYDbZ57ioI/TIVs/wmnSw
	YG+f4VStbbQwgrA8iOIaJiXT9S3Pe1926R0cihgvmFxsXVkXAct94UYyJstSpEUUjgJlgiy9pDK
	dUkgt/r6pBHN80TyugpvNJFN8xvDHl/TowQTzsa
X-Received: by 2002:a05:622a:14cc:b0:52d:6f91:86e with SMTP id d75a77b69052e-532db7c9107mr50283821cf.15.1790088011662;
        Tue, 22 Sep 2026 07:40:11 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e192badasm14363171cf.20.2026.09.22.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:40:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:40:08 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 02/10] docs: copy only the command from a console
 block
Message-ID: <arKTSMPTOXE2QkTU@localhost.localdomain>
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-3-twoerner@gmail.com>
 <DLLU9BXA64J2.UY44K2234HES@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLLU9BXA64J2.UY44K2234HES@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 14:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10587

On Tue 2026-09-22 @ 02:20:00 PM, Antonin Godard wrote:
> Hi,
> 
> On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > The copy button matches the literal "$ " prompt, so on a block prompted
> > any other way it matches nothing and falls back to copying every line,
> > output included. Match a pattern covering each prompt shape the manuals
> > use instead, and stop the mouse selecting the output, so both ways of
> > copying give the commands alone.
> >
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  documentation/conf.py                         | 21 ++++++++++++++++++-
> >  .../sphinx-static/theme_overrides.css         |  9 ++++++++
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 48d28a686807..ccec27e60165 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -242,4 +242,23 @@ intersphinx_mapping = {
> >  # -- sphinx_copybutton configuration -----------------------------------------
> >  
> >  # sphinx-copybutton configuration
> > -copybutton_prompt_text = "$ "
> > +# Strip the prompt from a copied line wherever the prompt cannot be
> > +# confused with content. The pattern is not scoped to console blocks, so
> > +# every alternative has to stay safe inside a BitBake or configuration
> > +# example as well; measured over the built manuals, each one matches only
> > +# lines the lexer itself marks as a prompt.
> > +#
> > +# A bare "#" is deliberately absent. It opens a root prompt, a comment and
> > +# a line of program output alike, and nothing distinguishes them - which is
> > +# why the root prompts are given a preamble before this is switched on.
> > +copybutton_prompt_text = "|".join((
> > +    r"^(?:\S+[@:]\S*)?\$\s+",   # "$ ", and "user@host:~$ "
> > +    r"^\S+[@:]\S*#\s+",         # "root@qemux86-64:~# ", a root prompt
> > +    r"^[A-Za-z]:\\[^>]*>\s*",   # "C:\WINDOWS\system32>", cmd.exe
> > +    r"^DISKPART>\s*",           # diskpart prints a prompt of its own
> > +    r"^pydevshell>\s+",         # bitbake -c pydevshell
> > +))
> > +copybutton_prompt_is_regexp = True
> > +copybutton_only_copy_prompt_lines = True
> > +copybutton_remove_prompts = True
> > +copybutton_line_continuation_character = "\\"
> > diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
> > index f9e067239b8e..1a439e9faf69 100644
> > --- a/documentation/sphinx-static/theme_overrides.css
> > +++ b/documentation/sphinx-static/theme_overrides.css
> > @@ -107,6 +107,15 @@ section#welcome-to-the-yocto-project-documentation p.caption {
> >     display: none;
> >  }
> >  
> > +/* Sphinx already excludes the prompt from a selection; do the same for the
> > +   output, so selecting a session block gives what the copy button gives */
> > +.highlight span.go {
> > +    user-select: none;
> > +    -webkit-user-select: none;
> > +    -moz-user-select: none;
> > +    -ms-user-select: none;
> > +}
> 
> This only works if the code-block uses the "console" lexer, though. Maybe say
> that in the comment.
> 
> But I think we don't want that. Copying outputs might be useful in some cases.
> And I trust the reader to be conscious enough to only select the command, not
> the output of the command (it's still nice not having the prompt selectable
> though).
> 
> I know this doesn't reflect 100% what the copy-button does but at least there's
> still the option to copy the output.

My preference would be that when the user copies, they only get the
command; my guess is that's what they need, because they want to try the
commands themselves. The output is something they might look at, but not
necessarily copy.

But I can see a case where they might want the output too. So I'm okay
with changing the behaviour if that's what you'd prefer: it is one
setting and one CSS rule, and both methods would then give the command
plus its output, with the prompt stripped in each case.

I have a much stronger opinion that the copybutton and mouse-selection
should work the same, regardless of which way we decide they should work.
First off, I don't think readers are going to really notice there are two
ways to copy. But if they do notice, I think they would be surprised to
find they worked differently.

Either way, I think the conventions page ought to say so. It does not
mention copying at all today, and "Commands and prompts" is the natural
home for it: a sentence that the prompt is not part of the command, and
that neither way of copying includes it. I would rather send that once
we have settled which behaviour we want, so the page does not describe
something that is not true yet - which is the mistake I made by sending
that page ahead of the series in the first place.

> Thanks,
> Antonin

