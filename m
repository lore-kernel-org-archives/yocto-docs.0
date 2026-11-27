Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12398.1795767037654382380
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 00:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aByPYfZn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E7AF4E417C1
	for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 08:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A9C760603;
	Fri, 27 Nov 2026 08:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D7DB11E69140;
	Fri, 27 Nov 2026 09:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795767034; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=16Gkk4CiJYEqde8MDZ+JJIB1YOVLEKekyfeGAx5UPYQ=;
	b=aByPYfZnjtVK+jQyDvtJOXg/IqfeykVTb7hh5QAnmJ9IyLnq1/FJm0RrTQ1TZ3da0C97ea
	ZKfKGLHwhPU0NUCkyS1WvkhAKc+omLDAzLEyR3urmRtPph5aWPwyf+FeFnSDkcwFrm5lwu
	bmq8dSgs9oiTeYzlF/anRVi+LSVpVBt7osG1usxvDXOj4hjfzv0gOazonuEYoPy3MUrUsq
	fb5ExxwLwyr7aOEC99mn4sgYFdSygAZMDcFotwYtk576vgyDLq6qo9nLdosJlGIsQfLb64
	AumXKRpgud4jGMH7S0sPcYUSoPhL+NkmNzZS3SsQ8KVr2JNRPkPsQDZwM+CvGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:10:33 +0100
Message-Id: <DN5UAAGPMBRN.1JXZ9W6JD6NPH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 2/2] sphinx: add a lexer for pydevshell
 sessions
References: <20261126223650.3701672-1-twoerner@gmail.com>
 <20261126223650.3701672-3-twoerner@gmail.com>
In-Reply-To: <20261126223650.3701672-3-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 08:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10849

On Thu Nov 26, 2026 at 11:36 PM CET, Trevor Woerner via docs wrote:
> The development manual shows a session in BitBake's Python development
> shell, and no lexer reads it: console wants a prompt ending in $, #, or
> %, pycon wants >>>, and both mark the whole block as program output,
> which the theme greys. The prompt cannot be changed to suit them either,
> since devshell.bbclass is what sets it.
>
> Teach a session lexer the prompt instead, with Python inside it, so the
> expressions the reader types are highlighted as Python and the results
> are not.
>
> AI-Generated: codex/claude-opus 5.5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - rebase on master, where conf.py no longer lists the dropped lexers
> ---
>  documentation/conf.py                    |  3 +-
>  documentation/sphinx/pydevshell-lexer.py | 48 ++++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 documentation/sphinx/pydevshell-lexer.py
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 8992496f7569..7d0e103042fd 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -52,7 +52,8 @@ extensions =3D [
>      'sphinx_copybutton',
>      'sphinxcontrib.rsvgconverter',
>      'yocto-vars',
> -    'wks-lexer'
> +    'wks-lexer',
> +    'pydevshell-lexer'
>  ]
> =20
>  # current_version =3D "dev"
> diff --git a/documentation/sphinx/pydevshell-lexer.py b/documentation/sph=
inx/pydevshell-lexer.py
> new file mode 100644
> index 000000000000..a0dd7c9fa684
> --- /dev/null
> +++ b/documentation/sphinx/pydevshell-lexer.py
> @@ -0,0 +1,48 @@
> +"""Lexer for ``bitbake -c pydevshell`` sessions.
> +
> +The development manual shows a session in BitBake's Python development
> +shell: expressions typed at a ``pydevshell> `` prompt with their results
> +beneath. No existing lexer reads it. ``console`` is a shell session and
> +wants a prompt ending in ``$``, ``#``, or ``%``; ``pycon`` wants ``>>>``=
.
> +Both mark the whole block as program output, which the theme renders in
> +grey, so the block ends up dimmer than the prose around it and no better
> +told apart.
> +
> +The prompt is not ours to change: ``devshell.bbclass`` sets
> +``ps1 =3D "pydevshell> "``, so what the manual shows is what the reader
> +sees. That leaves teaching a lexer the prompt as the only way to render
> +one of these correctly.
> +
> +``ShellSessionBaseLexer`` does the work once ``_ps1rgx`` matches: it
> +splits the typed line from its output and hands the typed part to an inn=
er
> +lexer, which here is Python.
> +"""
> +import re
> +
> +from pygments.lexers.python import PythonLexer
> +from pygments.lexers.shell import ShellSessionBaseLexer
> +
> +__version__ =3D '1.0'
> +
> +
> +class PyDevShellSessionLexer(ShellSessionBaseLexer):
> +    """A session in BitBake's Python development shell."""
> +
> +    name =3D 'BitBake pydevshell session'
> +    aliases =3D ['pydevshell']
> +    filenames =3D []
> +    mimetypes =3D []
> +    url =3D 'https://docs.yoctoproject.org/dev-manual/python-development=
-shell.html'
> +
> +    _innerLexerCls =3D PythonLexer
> +    _ps1rgx =3D re.compile(r'^(pydevshell> )(.*\n?)')
> +    _ps2 =3D '... '

What's _ps2 here and what's its purpose?

Antonin
