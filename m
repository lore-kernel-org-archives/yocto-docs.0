Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2836EC982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 11:28:25 +0000 (UTC)
Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7879.1790076494796781926
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 04:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VKL3hF+v;
 spf=pass (domain: gmail.com, ip: 74.125.230.233, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so242502885a.1
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 04:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790076494; x=1790681294; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsMELg42Ynup/Pwr3yPFsdO9mcPaDBhlAu6SheBEoSk=;
        b=VKL3hF+vRxqdC67XpOz/cCvLVk6mrZ6MIG1zmAK8Z3SDgXI7GFNndPTVDOe4VkgQ48
         NjmdKdJtpmgS401heGyeCjcjvRBYJMnM3DDpZj5GEVtWoPHzEy4r/gdDMdHwAPkTasiX
         P+Q+r3tqfxLzdprOF7qKo7TPsTA9R+cHsXhjsStFSFkV073S7YB/1VLLcShs5dOpzjQE
         yiWA3RyUcKnHt5KObMZsINmMhEjgr9BIy68N9D1jfJfIN6Nc8gqjvlsOhosR2YsIlfXz
         at/oJTgC2rkhfEy6wYxbM0/93HwyMf9I03r9CMLV+BXbSQ6KjhdD9R5f/WMlZzx1zW21
         4OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076494; x=1790681294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsMELg42Ynup/Pwr3yPFsdO9mcPaDBhlAu6SheBEoSk=;
        b=jbPYFgjv4Zn+q3CKBLZz69Ux/5l5d1CcgmG4zoFHcBqf4xEVKfA/EIsnPdK9utl2lg
         GhosL9aUs8rCeSxAFZ0ZFH5iFiJYzWJ0AuPNLNoDNXu91QRGQeO/0azCgS6A3I//rbti
         qg6FswHkijErme9R6SlOmQtj0sY2M6KrzBL7xfVpYljA0uGS2sfGRdVd3IZn5W5oiria
         KBmMqHV2dvvPsmOGpTt8KZ05MILWFd3fnBbpjZVQ+pCbzAbqx0JpjpaMetWgDObbYpw4
         fjCtoTlcM6XbavnzpiEO8BFpOdWzW8MbDWZ+Y9hEj5rPwWhRuhsVBtDBp9IdblLkwJub
         g8yw==
X-Gm-Message-State: AFuF++m2USPD5r1Xc4MEeyAlPud5T8wY0gSH5LjwIJiJJbNifT7lm9xi
	eswDwf4k10S9qlNtZrQlsvgijqS7QUoquzudFq/AaSSDoth+uw9Gicna
X-Gm-Gg: AYBFou1Jj3bLA9G2UnV9YNMY4TDcjTg6qtUGt+czt8WXzHVMol4ivf7WzFwVHfIg5sP
	hM8WYvEZzRKSU2+t1wUcC6U10NoCBl9E1fR0u69scFeZWGsUfrAVcSF4fUBZO8m2J5+laapj2gT
	01Q/pQoKMsjsV7zO/5TvFdmHwfuSgnMKcem28BzcUawiy5Xw7usE+iXRuGkN/+x58LPOZx13DPK
	SfrtIS99OrLhA4d4BXugtDtnrrSRejBIafjLMXkzxAL4B713Qwl45BrSKbf/nHBku+nDRNQ7QNl
	ho+1XvlHF0Ji2Mhs1qrn1UqvI1/zJFVIx4w2GVoTdbaL72XG4vphYazexdZux63Qk5dYqRhYOhx
	vpeTEgoxwTxdfJ266bAz73WDTkqmFxkkkzyyTiFpoTrw9qnQkF8QNh+5IPJhgvWRVf+hKB8cU5k
	tX0Ze1EtEiiDSJKvf1O5M/gMZo5Hl7dSNCFwEe443Amwhv+6wiDVZuJH7Mt5HwuRjcXnyCdC0E7
	svBWLuY/t987U8bBZlK3Fb5ydcYcqYrsjmWoleH
X-Received: by 2002:a05:620a:2708:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93c15d763c8mr523340885a.13.1790076493372;
        Tue, 22 Sep 2026 04:28:13 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm119318085a.46.2026.09.22.04.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:12 -0700 (PDT)
Date: Tue, 22 Sep 2026 07:28:10 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] docs: document the conventions used in the
 manuals
Message-ID: <arJmSsrrVn7niopU@localhost.localdomain>
References: <20260922013912.55583-1-twoerner@gmail.com>
 <DLLOXO6XJ31D.350CUI499U1BC@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLLOXO6XJ31D.350CUI499U1BC@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10576

On Tue 2026-09-22 @ 10:09:41 AM, Antonin Godard wrote:
> On Tue Sep 22, 2026 at 3:39 AM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > The manuals use angle brackets for placeholders and a prompt to mark a
> > command, and say so nowhere. A reader can only infer both, and one
> > example reads as advice to paste a line that will not parse.
> >
> > Add a page stating them, in the sidebar beside the other top-level
> > entries, so it is reachable from every manual.
> >
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > Changes in v2:
> > - The page is a document in its own right, reached from a toctree in
> >   documentation/index.rst, rather than included into each manual's index.
> >   This is Antonin's suggestion and it is the better shape: the page
> >   appears in the sidebar of every manual, so a reader meets it wherever
> >   they are, and the diff touches two files rather than fifteen.
> > - Retitled "Documentation Conventions", which is short enough for the
> >   sidebar and matches "Documentation Downloads" beside it. The old title
> >   said "this document", which no longer describes a standalone page.
> > - The example showing that a leading "#" is a comment is tagged text
> >   rather than console. Pygments' console lexer reads a leading "#" as a
> >   root prompt and lexes the rest of the line as bash, so v1 rendered that
> >   line as a prompt running a command, with the word "command" coloured as
> >   a shell builtin - the opposite of what the sentence above it says.
> > - Added an opening sentence saying the conventions apply throughout the
> >   documentation, since the page is now landed on directly rather than
> >   read at the end of a manual.
> >
> > The wording of both sections is unchanged.
> >
> >  documentation/conventions.rst | 55 +++++++++++++++++++++++++++++++++++
> >  documentation/index.rst       |  7 +++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 documentation/conventions.rst
> >
> > diff --git a/documentation/conventions.rst b/documentation/conventions.rst
> > new file mode 100644
> > index 000000000000..469ad5879b51
> > --- /dev/null
> > +++ b/documentation/conventions.rst
> > @@ -0,0 +1,55 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> > +
> > +=========================
> > +Documentation Conventions
> > +=========================
> > +
> > +These conventions apply throughout the Yocto Project documentation.
> > +
> > +Placeholders
> > +============
> > +
> > +Text enclosed in angle brackets is a placeholder. Replace it, including the
> > +brackets, with a value of your own:
> > +
> > +.. code-block:: none
> > +
> > +   SRCREV:pn-<recipe> = "${AUTOREV}"
> > +
> > +Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
> > +never text to be copied as it stands, and an example containing one will
> > +not work until every placeholder in it has been replaced.
> > +
> > +Commands and prompts
> > +====================
> > +
> > +Commands are shown with the prompt that runs them, and the prompt is not
> > +part of the command. Do not type it.
> > +
> > +A ``$`` introduces a command you run as your normal user:
> > +
> > +.. code-block:: console
> > +
> > +   $ bitbake core-image-minimal
> > +
> > +Where a command needs administrative privileges on your build host, it is
> 
> s/build host/:term:`build host`/
> 
> > +shown with ``sudo`` rather than with a root prompt:
> > +
> > +.. code-block:: console
> > +
> > +   $ sudo apt install gawk
> > +
> > +A full prompt ending in ``#`` introduces a command run as ``root``, usually
> > +on a target machine rather than on your build host:
> 
> s/build host/:term:`build host`/

Agreed on both above.

> > +.. code-block:: console
> > +
> > +   root@qemux86-64:~# gdb /bin/cat
> 
> How about "root@machine:~# " instead? I would rather have a generic machine to
> use throughout the documentation than a real example. Unless the context in
> which the documentation is written makes sense for a specific machine, of
> course. But we should at least have a default name for generic target command
> examples.

Agreed; this should be the default.

> > +Within an example, a line beginning with ``#`` is a comment rather than a
> > +command:
> > +
> > +.. code-block:: text
> 
> Sadly the "console" lexer does not interpret lines starting with "# " as
> comments. Would it make sense to use the "shell" lexer instead, in these cases
> where commands and comments are mixed?

*shell* loses the "$" prompt, *console* loses the comment; therefore
*text* is the least wrong... for now. I have a set of lexer patches and
a set of re-tagging patches (neither yet sent) that together fix this.
*text* is not the final answer: it is the right one until those land,
and the best one if they never do.

NOTE: this conventions (v2) page only becomes completely true once the
other patchset (docs-fixes)[1] lands. I was expecting [1] to be
considered first, then conventions-v2.

conventions-v3 is on its way with the above fixes.

> Antonin

[1]: https://lore.kernel.org/r/20260922020339.481929-1-twoerner@gmail.com


