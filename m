Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E22EC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:09:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5186.1790064585699903667
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YBc1YRDR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29102C23DB6;
	Tue, 22 Sep 2026 08:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1CAE60580;
	Tue, 22 Sep 2026 08:09:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F145103291BC;
	Tue, 22 Sep 2026 10:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790064583; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7R23xrzWq1+gfyuDmYqLh5uWyVAe1uF3eE8VZjl2zM4=;
	b=YBc1YRDRvsC1NnqO9WatKiefl7acHDh8GeKTGJmXSy7yy9BjNVthXwA8os00Ji9bahcSmj
	AWJ3Ye+OG2cFHDnvI9srjyMShw4xtnxjrLKFDYIs6eQmqpAMOZAk2iMO/tS9S9w8hFfao7
	XUA6PzD+AEunJxzYJWcA7G6HFkSVYwZwpk+0itiGyc+xLljxqeV9r94xYWcC8dv2+hZOhW
	0dCCt2D17TED0pSaewwPtILSDbSB1C8YoqthmEFOgHYqMv4u3eQeQHFATJFaA7pJCxJzrE
	UDntivf79igCTLXrpm0z9z8APqkkz/unWF5VbkYxhFwD7FDCajDB8fHBi4NiiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 10:09:41 +0200
Message-Id: <DLLOXO6XJ31D.350CUI499U1BC@bootlin.com>
Subject: Re: [docs] [PATCH v2] docs: document the conventions used in the
 manuals
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260922013912.55583-1-twoerner@gmail.com>
In-Reply-To: <20260922013912.55583-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 08:09:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10571

On Tue Sep 22, 2026 at 3:39 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The manuals use angle brackets for placeholders and a prompt to mark a
> command, and say so nowhere. A reader can only infer both, and one
> example reads as advice to paste a line that will not parse.
>
> Add a page stating them, in the sidebar beside the other top-level
> entries, so it is reachable from every manual.
>
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> Changes in v2:
> - The page is a document in its own right, reached from a toctree in
>   documentation/index.rst, rather than included into each manual's index.
>   This is Antonin's suggestion and it is the better shape: the page
>   appears in the sidebar of every manual, so a reader meets it wherever
>   they are, and the diff touches two files rather than fifteen.
> - Retitled "Documentation Conventions", which is short enough for the
>   sidebar and matches "Documentation Downloads" beside it. The old title
>   said "this document", which no longer describes a standalone page.
> - The example showing that a leading "#" is a comment is tagged text
>   rather than console. Pygments' console lexer reads a leading "#" as a
>   root prompt and lexes the rest of the line as bash, so v1 rendered that
>   line as a prompt running a command, with the word "command" coloured as
>   a shell builtin - the opposite of what the sentence above it says.
> - Added an opening sentence saying the conventions apply throughout the
>   documentation, since the page is now landed on directly rather than
>   read at the end of a manual.
>
> The wording of both sections is unchanged.
>
>  documentation/conventions.rst | 55 +++++++++++++++++++++++++++++++++++
>  documentation/index.rst       |  7 +++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 documentation/conventions.rst
>
> diff --git a/documentation/conventions.rst b/documentation/conventions.rs=
t
> new file mode 100644
> index 000000000000..469ad5879b51
> --- /dev/null
> +++ b/documentation/conventions.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Documentation Conventions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +These conventions apply throughout the Yocto Project documentation.
> +
> +Placeholders
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Text enclosed in angle brackets is a placeholder. Replace it, including =
the
> +brackets, with a value of your own:
> +
> +.. code-block:: none
> +
> +   SRCREV:pn-<recipe> =3D "${AUTOREV}"
> +
> +Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
> +never text to be copied as it stands, and an example containing one will
> +not work until every placeholder in it has been replaced.
> +
> +Commands and prompts
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Commands are shown with the prompt that runs them, and the prompt is not
> +part of the command. Do not type it.
> +
> +A ``$`` introduces a command you run as your normal user:
> +
> +.. code-block:: console
> +
> +   $ bitbake core-image-minimal
> +
> +Where a command needs administrative privileges on your build host, it i=
s

s/build host/:term:`build host`/

> +shown with ``sudo`` rather than with a root prompt:
> +
> +.. code-block:: console
> +
> +   $ sudo apt install gawk
> +
> +A full prompt ending in ``#`` introduces a command run as ``root``, usua=
lly
> +on a target machine rather than on your build host:

s/build host/:term:`build host`/

> +.. code-block:: console
> +
> +   root@qemux86-64:~# gdb /bin/cat

How about "root@machine:~# " instead? I would rather have a generic machine=
 to
use throughout the documentation than a real example. Unless the context in
which the documentation is written makes sense for a specific machine, of
course. But we should at least have a default name for generic target comma=
nd
examples.

> +
> +Within an example, a line beginning with ``#`` is a comment rather than =
a
> +command:
> +
> +.. code-block:: text

Sadly the "console" lexer does not interpret lines starting with "# " as
comments. Would it make sense to use the "shell" lexer instead, in these ca=
ses
where commands and comments are mixed?

Antonin

