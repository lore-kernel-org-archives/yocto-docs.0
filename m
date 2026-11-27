Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14665.1795780681223522680
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 03:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kzXAPgBJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9211efaca89so25047676d6.3
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 03:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780680; x=1796385480; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F67/RcUO4sUXR27xlS1KhC5yxM066sEm8zZdSeyb19Q=;
        b=kzXAPgBJ1U1DkAYvzW2/sUxMPw4gfPqA13ErIOrN/NWE0gL0vTyQx4X3ZtsDHqNvgA
         TtNiW/u1I1fupozbV82i+NNWLecocWUK2EEMdt5T1iUb4NKjqSEM92W5/GZqpT/DluoK
         cIUtVocvPMOzDaj+Kj53GJUfbxJzkusNZDJu9hBovtCXroz448wCFHg5ud3Z+YY0RtHC
         iPEac9c0m0HnLYbB5DWdqWvNoMRfjszH4bDxUyUDiaw+ZwgX5/scwh9OW5+crcC2FO/6
         Hoxb7eWoza5MkueemSpjinkteTmo6YTSkSayJo168gcYBd6RbfuwXrw1Zm1DhtQ9sLqg
         HZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780680; x=1796385480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F67/RcUO4sUXR27xlS1KhC5yxM066sEm8zZdSeyb19Q=;
        b=j2FwIi/N3fFGceYch4TU7CoS1/bAwMofIF0xdh8Sze+3+8LFxx3Gbd4LCOR2SSg/ph
         jSgva9IcEBq9DI03/0FKCKC1P29bH/QBImSIdrje0KfHsw9D5wK3uRN/eGJLb4xC+a3T
         Pk7+6PNQTU5QhCoh78b7hXhY1L1RnMUt8rB3MUBcFYVNMSufhixtRoRgBhqXQjJa5SEO
         R3N/bka1H/L0XGzsap4u/rODnCWEzWj6vufjA+8FEOb10QVArdzG3mrctY7ehgixvj83
         /5fqpoyYp7OoDipgbwH/uYYfY6o62Tu98Aqzjlw3AKmXM/tU9TGC7e/+iYr2+ISS5S8f
         uv1w==
X-Gm-Message-State: APuU4Z+HgkzGBRjshEROa3ANKaA68SsC7jC1CZ4nMIA70dZcLG1bj6rb
	OJNsUbZ30KK/ppilbkxULIh8BERmGuY74dRsuubjdvNGSy+sFr36ZUpl
X-Gm-Gg: AZFdTZdMiXPDZxOk5IHddoIYrFCACWBEXfc9oeae4h9dtUsW+7I6LgvkaIHK/N/XNgk
	OijLwtar3x7nwAa5sLWRRqvEU4Nq1LR0upQmY2/dEvwERRrbfYDyV/J9n9YKl2mTHkBOxajR75a
	Oq66acO7vaO9Ke/CN+gyJ18ahFY2g1em1puMUNRBqjLbRyzzK4Lc9VoUTzPNM3kuJnU+TtyjN72
	CUHv1wueqvsGEvnIjQJofSnobGXYHMz5tTCRRYd1IuQUFCiGBlHsK0ALmEfcW7WsWE0+TZAWZA9
	X0fj7Bbt5S6QRiRTVTmkthcRtU6Bqs6zLlVEnJ/ybVTfSIsFqmpJzSgoLOrVgwazcrJJ3qt035b
	mS/aBFHAbtyark7f/FRn2b3KTvVF2dPeJKAf42SLVow3Ncx2pxe1w3sLPAIHEz6A2XbzOlU+WZo
	I8CgT49veYH1mhai4lAyCbQcI6a09A3pUr6wwBsaRSo9aHxwCM/4oJRdIwAwdlqlRfKDaqL4zD8
	BPuwCD1qC+W3EPZxOhOkM1viuJedMUY9JkGtsnQO5O7BV/dn3le+176KC7WEIZi7n35sQfmrCfd
	XVHQodFBxLWTMXu67TuRERagNtg7bDv+x7z2Qa3iYet8xyhJDQMlbkVN18mYt+G7NSWlJwoaQHX
	aYF8/ePqHkGGkQ2LsWCN41gHowxDBxPBC
X-Received: by 2002:a05:6214:478b:b0:921:1313:f2da with SMTP id 6a1803df08f44-92134ade3fcmr391179066d6.32.1795780680093;
        Fri, 27 Nov 2026 03:58:00 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm216126746d6.28.2026.11.27.03.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:57:59 -0800 (PST)
Date: Fri, 27 Nov 2026 06:57:57 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/2] sphinx: add a lexer for pydevshell sessions
Message-ID: <awlwRW2Ot-G0ZqS-@localhost.localdomain>
References: <20261126223650.3701672-1-twoerner@gmail.com>
 <20261126223650.3701672-3-twoerner@gmail.com>
 <DN5UAAGPMBRN.1JXZ9W6JD6NPH@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DN5UAAGPMBRN.1JXZ9W6JD6NPH@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 11:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10851

On Fri 2026-11-27 @ 09:10:33 AM, Antonin Godard wrote:
> On Thu Nov 26, 2026 at 11:36 PM CET, Trevor Woerner via docs wrote:
> > The development manual shows a session in BitBake's Python development
> > shell, and no lexer reads it: console wants a prompt ending in $, #, or
> > %, pycon wants >>>, and both mark the whole block as program output,
> > which the theme greys. The prompt cannot be changed to suit them either,
> > since devshell.bbclass is what sets it.
> >
> > Teach a session lexer the prompt instead, with Python inside it, so the
> > expressions the reader types are highlighted as Python and the results
> > are not.
> >
> > AI-Generated: codex/claude-opus 5.5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - rebase on master, where conf.py no longer lists the dropped lexers
> > ---
> >  documentation/conf.py                    |  3 +-
> >  documentation/sphinx/pydevshell-lexer.py | 48 ++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+), 1 deletion(-)
> >  create mode 100644 documentation/sphinx/pydevshell-lexer.py
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 8992496f7569..7d0e103042fd 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -52,7 +52,8 @@ extensions = [
> >      'sphinx_copybutton',
> >      'sphinxcontrib.rsvgconverter',
> >      'yocto-vars',
> > -    'wks-lexer'
> > +    'wks-lexer',
> > +    'pydevshell-lexer'
> >  ]
> >  
> >  # current_version = "dev"
> > diff --git a/documentation/sphinx/pydevshell-lexer.py b/documentation/sphinx/pydevshell-lexer.py
> > new file mode 100644
> > index 000000000000..a0dd7c9fa684
> > --- /dev/null
> > +++ b/documentation/sphinx/pydevshell-lexer.py
> > @@ -0,0 +1,48 @@
> > +"""Lexer for ``bitbake -c pydevshell`` sessions.
> > +
> > +The development manual shows a session in BitBake's Python development
> > +shell: expressions typed at a ``pydevshell> `` prompt with their results
> > +beneath. No existing lexer reads it. ``console`` is a shell session and
> > +wants a prompt ending in ``$``, ``#``, or ``%``; ``pycon`` wants ``>>>``.
> > +Both mark the whole block as program output, which the theme renders in
> > +grey, so the block ends up dimmer than the prose around it and no better
> > +told apart.
> > +
> > +The prompt is not ours to change: ``devshell.bbclass`` sets
> > +``ps1 = "pydevshell> "``, so what the manual shows is what the reader
> > +sees. That leaves teaching a lexer the prompt as the only way to render
> > +one of these correctly.
> > +
> > +``ShellSessionBaseLexer`` does the work once ``_ps1rgx`` matches: it
> > +splits the typed line from its output and hands the typed part to an inner
> > +lexer, which here is Python.
> > +"""
> > +import re
> > +
> > +from pygments.lexers.python import PythonLexer
> > +from pygments.lexers.shell import ShellSessionBaseLexer
> > +
> > +__version__ = '1.0'
> > +
> > +
> > +class PyDevShellSessionLexer(ShellSessionBaseLexer):
> > +    """A session in BitBake's Python development shell."""
> > +
> > +    name = 'BitBake pydevshell session'
> > +    aliases = ['pydevshell']
> > +    filenames = []
> > +    mimetypes = []
> > +    url = 'https://docs.yoctoproject.org/dev-manual/python-development-shell.html'
> > +
> > +    _innerLexerCls = PythonLexer
> > +    _ps1rgx = re.compile(r'^(pydevshell> )(.*\n?)')
> > +    _ps2 = '... '
> 
> What's _ps2 here and what's its purpose?

It is the continuation prompt (same as in BASH). devshell.bbclass
sets ps1 = "pydevshell> " and ps2 = "... ", and prints the second
while a statement is incomplete, such as the body of a for loop.
ShellSessionBaseLexer uses _ps2 to recognise those lines as typed input
rather than output.

As v2 had it, though, it did nothing useful: the base class only looks
for _ps2 on the line after one ending in a backslash, unless
_bare_continuation is set. v3 sets it, so a continuation line is
highlighted as a prompt followed by Python instead of being shown as
output. The example in the manual has no continuation lines, so its 
rendering does not change.

> Antonin
