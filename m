Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8541.1795481184859865566
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 16:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BDVfkijQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53639b8903bso48727611cf.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 16:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795481184; x=1796085984; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sukTcWirTxa86fWPADwH6de6K7ZuIwuwvngg7VV+25U=;
        b=BDVfkijQ4d+x8txUojay6fYTLIMSVCXqMehotZMEcmrq8rlJ1gI5j7ub/5PPb6kWRA
         WCRHMzM/Elv/qtoVqXu5LaXpH1doXEmMOkuJj0cY5URTOSJjrXK8jnOoOqxzSTl2WEoe
         MO1cLltSALnly+Lc45rf6lOcOqt4aHzIVOBABePgqGUadfz3lhG2rfDOLT25JN1P6B0s
         cLP0gpHq0llPSewiw2BY85T7+ktA6NA1hh2GLP1biCftWYcKBndVnQJ9xsUGz0aawxJ1
         Ls/uFlYLuLRif2ik4WZYHD/d6D5LKiM8f6fYpS12/EiLWN2jgl3ASmuU7NWtJe7Iwnvk
         CvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481184; x=1796085984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sukTcWirTxa86fWPADwH6de6K7ZuIwuwvngg7VV+25U=;
        b=XYjbzpYeQRARNQAvBRP6rHPuBHjmdMOaXx5tXnTG+qMEAK32diQWGaMo0yUsGASNHi
         X3ivJdAKKceH7Rlm4/pYE6l/JMJpIuzoU9a6dSG85P4W2Wr/frmmgN625mf11dIkVvP2
         uhfNC9UYJ1mpfht6LUWZutzh/ZoUX7bQH1MbKH8Y7V5FZsSKle0KCh7/mbl+YNwF9Ngg
         iMI+HU9WZAzRpwrHsKkUXLazy4B/4Vd0frX+msITMEKe1tATxNSxidOapSTRlKdM0l+M
         0PeejFx7wQGay3i/UNlT454kDqNESVrn7+LgYcwBRLogu676xJi9zZuJPyPX6DYQYcsJ
         XnbA==
X-Forwarded-Encrypted: i=1; AL+hErGa5rvCZQuCcQemGlLimjEBjstzG4jDYIfAFERYbsLkpQz88houxz2K+54tL/zUCvQ2WmCA@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z/9QR3C8JugfJZA8XfxVKNuRR/N+m5c4aU534SOkQYGlrZRi7e8
	hb/OEsI0HMVgx8hwltZSv+gBxJMuyG+R5ISimObpk/DNCxZg94SjvlVd4a2xpQ==
X-Gm-Gg: AZFdTZdDEseFKXwFtLOwKIUXDroLHW67rZpxrPX8vkLYSnfdW4YMYmlrIUeB9XQc8vf
	8PDVFXkCx+Q9IIjrBi/7OUUWlqyfnIm7aCk6GLaCmam8C7WH+XAP1BoJmtsBlun94LdSGv9/EB8
	cIzRdeJxutMXSaPXxYrQEnLjyz3Nsh9nzGcSJuBIWFKaUZ3cJr0y5xOE3FrwmfSv/EDdSQyMO40
	qbw4Xejh3EyEyeGUA5dRIey+3Uxx7BhHr6ZKYfU83wFlC3gjQjsZbBC2vS3R0GU+fZytQ/Swpwy
	557p6/FYI1cGduMbeALKkrIMv0f5YSS6ItsGzE+ZN9ftYPQ8xhr1+c5PCWLY8OznW+1nfFrC+lD
	NyA5V8uQx/xauwMYmwUUHzzCBAbuvo/NQ5mJRoVGPXLLKNIimy8f4a3aE6dTvTv9zFbn65VBmAi
	s3K063zo0l8g0KaQ/wtwl0NTJ0osQBUiXIOTG7m8CmYNRaklfBIdjDc8hWX+XoiGLpBEilGCty0
	WwaoAtvAOzaCAn5DHKB6lr+HygnVE7nGkca2Ucitj+/qP0GcfydFQHkG2VTo28YWnxu2/klmEA0
	xH1tefBFRNG1OjmTbELeSiwMlwPUm03swrOXLvRQ22g6Y6f6TaWlOuABXmpciJa3FcTPPTlbKSj
	P70HRtyUAoALspN2rmCQISK0JLWn9PSc=
X-Received: by 2002:ac8:5a4d:0:b0:535:1cee:dc42 with SMTP id d75a77b69052e-55d769c8d4dmr220046741cf.7.1795481183631;
        Mon, 23 Nov 2026 16:46:23 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm113821261cf.4.2026.11.23.16.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:46:22 -0800 (PST)
Date: Mon, 23 Nov 2026 19:46:20 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] carrying lexers in documentation/sphinx: the ones after
 the shim
Message-ID: <awTeXBOuxoLIFdYw@localhost.localdomain>
References: <atjXdzebFGmKVjj8@localhost.localdomain>
 <DMBG6KYCYMYP.36RH7WLO2QKH3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DMBG6KYCYMYP.36RH7WLO2QKH3@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 00:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10827

Hi Antonin,

On Thu 2026-10-22 @ 04:47:28 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Oct 21, 2026 at 5:17 PM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> > Hi Antonin,
> >
> > This work started as a desire to tag and highlight BitBake code-blocks
> > in our own documentation. Along the way it evolved into a task to
> > correctly label (and highlight) all code-blocks throughout the Yocto
> > Project documentation. In order to perform this work, two prerequisites
> > had to be met: every code-block had to be valid for whichever language
> > was appropriate, and the necessary lexers had to be added. Thank you for 
> > taking the first; now let's move on to the next.
> >
> > A while back, you asked me to send the BitBake shim as its own patch. I
> > will. I am proposing a set of additional lexer patches, and wanted to
> > discuss them before sending.
> >
> > One definition first, since the following table uses it. A "placeholder"
> > is a value the reader is expected to replace with one of their own,
> > written in angle brackets. E.g.:
> >
> >    SRCREV_<nameX> = "<revision SHA for nameX>"
> >
> > That line is not valid BitBake - the charset rejects "<" in a name - so
> > the block cannot honestly be tagged "bitbake". Rather than teach the 
> > BitBake lexer to accept "<" in names everywhere, including in the blocks
> > that are real metadata, "-placeholder" names a dialect: never a language
> > on its own, always a parent plus placeholders. It extends the parent
> > rather than restating it, and a code-block opts in only if it needs it. 
> >
> >   lexer                     lines  derived from
> >   ------------------------  -----  ---------------------------
> >   bitbake (the shim)          442  BitBake's compiled regexes
> 
> When you say "the shim" I'm not entirely clear whether it will use the upstream
> Pygments lexer or will completely override it? Can't we use the upstream lexer
> for these one? Maybe I got the wrong idea, maybe seeing the code will clear
> things up.

To answer your questions: yes, yes, and yes!

At startup the extension asks Pygments for its "bitbake" lexer and runs
a handful of probes against it. If the installed lexer passes every
probe, the extension registers nothing at all and Sphinx uses upstream
Pygments exactly as it would without the shim. However, if a probe fails,
the shim will register the carried lexer in place of the installed
one. So the answer to "will it use the upstream Pygments lexer" is yes 
(sometimes). The answer to "will it completely override it" is also
yes (if necessary). "Can't we use the upstream lexer" yes we can, when
it works, otherwise we use our own. This behaviour is fully automatic:
nobody has to edit conf.py or delete the file in order to switch between
one and the other.

As of today, the BitBake lexer in the latest Pygments release, 2.21.0,
fails the probes, so the carried lexer is the one in use. It rejects
valid metadata. These four lines are in the documentation tree right
now, and each produces a Pygments error token under the released lexer
and none under the shim:

   ref-manual/classes.rst      COMPATIBLE_MACHINE = "^mymachine$"
   ref-manual/variables.rst    COMPATIBLE_MACHINE = "^$"
   ref-manual/variables.rst    COMPATIBLE_MACHINE = "^(aarch64|mips64)$"
   ref-manual/variables.rst    UPSTREAM_STABLE_RELEASE_REGEX = "^10\.2p\d+$"

Once highlight_language is "bitbake" every block meets this lexer, so
a line like the first one fails a -W build on a page that is perfectly
correct.

It also accepts metadata BitBake rejects, which matters because the 
manuals show mistakes on purpose:

   PV = 0.8.16~rc1                       unquoted value
   ARCHIVER_MODE[src] = "x"  # comment   trailing comment

BitBake's parser refuses both. The released lexer highlights them as
ordinary assignments, so a block demonstrating an error renders as
though it were right. That is also why the probes check that errors ARE 
reported. A release that merely stopped reporting them would otherwise
pass, and the manuals would show broken examples as correct without any 
warning.

The patterns in the carried lexer are BitBake's own, lifted from its 
parser, which is why it agrees with BitBake on all six of these. The 
same work is upstream as pygments/pygments#3284, open and awaiting
review since August, so the shim covers the gap until the fix is merged,
released, and installed by whoever is building the docs.

There is a second reason, and I think it is more important than the
first: BitBake's language keeps evolving, therefore "...until upstream
has caught up" is a statement that is true now and will be true in the
future, not just once:

   deltask           2013
   unset             2016
   ":" override separator replaces "_"   2021
   addpylib          2022
   addfragments      2024

The released Pygments, 2.21.0, does not mark three of those as
statements at all - "unset", "addpylib", and "addfragments" lex as
ordinary text. It is not erroring on them, which is worse in a way: the
block renders, quietly unhighlighted, and nothing tells you. So the
first Pygments to carry a BitBake lexer arrived already a decade behind
on "unset".

The cadence sets what the next catch-up costs. Across the 2.x series
the median gap between feature releases is about 4.6 months and the 
mean about six; the gap before 2.20.0 was 448 days. That is the wait
for the release alone, before installations pick it up. So the next
time BitBake gains a directive, the manuals either describe syntax they
cannot highlight for roughly half a year, or we carry the lexer and fix 
it the day the language changes.

The shim is not a decision to diverge from Pygments; it is what lets the
manuals track BitBake between Pygments releases.

The other thing it buys is one build workflow instead of two. Pygments
is not pinned to a single version across the places these manuals get 
built: the documented pipenv path, a distro-packaged Sphinx, and the 
autobuilder do not agree, and a given release branch's toolchain is
different again. The practical effect is the report that something
"works at home but not on the server", or the reverse, where the real
difference is a Pygments version nobody thought to check. For a
concrete one: the virtualenv I build these manuals in has Pygments
2.19.2, which has no BitBake lexer whatsoever, so without the extension
this tree publishes the metadata unhighlighted and exits 0 while doing
it.

With the lexer carried in the repository, the rendering no longer
depends on which Pygments the builder happens to have installed.

> >   bitbake-placeholder         147  the above, one rule relaxed
> >   console (corrected)          53  a rule the manuals already keep
> >   console-placeholder,
> >     text-placeholder          140  a filter over the parent's tokens
> >   scc                         117  yocto-kernel-tools
> >   wks                          67  wic's ksparser.py
> >   pydevshell                   48  devshell.bbclass's prompt
> >
> > Upstream is not the home for these. Pygments' contributing guide expects
> > a language "to have a reasonably sized community around it" and suggests
> > a plugin otherwise; ".scc" and ".wks" are very small, Yocto-specific
> > formats nobody outside this project writes, so that is not a bar they
> > will ever clear.
> 
> For all but the regular bitbake lexer, I also share the opinion these should not
> be upstream.
> 
> > The corrected console lexer changes a rendering we already have, so
> > it is worth flagging. Pygments lets the preamble before a prompt be
> > empty, so a line opening with "#" is read as a root prompt and the rest
> > lexed as a command. Checking the console blocks in the manuals, I find
> > every such line is a comment or program output and not one is a prompt.
> > Requiring the preamble is the whole diff; "$" and "%" are untouched.
> 
> Not sure I fully understand what you mean here, but seeing the code might clear
> that up too.

Pygments treats "$", "#", and "%" alike as prompts and allows the text
before the prompt to be empty, so any line starting with "#" is read as
a root prompt and the rest of the line is lexed as a command. In these
manuals such a line is a comment or program output every time - a real
root prompt carries the host preamble that says whose root it is, as in

	root@machine:~#"

The change I'm proposing requires that preamble before the "#". Without
it the line otherwise falls through to Generic.Output, which is what it
is, and perf headers and generated-file comments stop being rendered as
commands somebody typed.

"$" and "%" are untouched.

> > Remaining items on my plate:
> >
> >   - the shim, on its own, as you asked
> >   - the lexers (discussed above), one patch each
> >   - the labelling and the conf.py flip last
> 
> Sounds like a plan!
> 
> > If it makes the discussion easier, I could build and send a sample of
> > the generated HTML docs after these changes, so you can see how the 
> > result will look instead of having to judge based on a description
> > alone.
> 
> It'll be fairly easy for me to build and see it for myself I guess, so I don't
> think you have to bother.
> 
> Thanks!
> Antonin
