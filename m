Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC68C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 12:06:29 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.8947.1675425982859309178
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 04:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZYCUAVQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id j4so1889449iog.8
        for <docs@lists.yoctoproject.org>; Fri, 03 Feb 2023 04:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NbdAcd1VhuwK0Ipz0A73KKudO0V3SjxqXsXRiv3pYpY=;
        b=GZYCUAVQKWwiku2XxJZ5lfcU7oKHb9U3jcvWI8A+IFWbUCrUVBq55zh05KnBgUz/0o
         A3j3Ph3mEcls+k5MpG7Ay7Tq3l7NG90unzsavwA9GdqHu9XcXh69qZdtMkt33UpXhsFS
         E1Dl/rGhY2DqVZz3vbLdMpSB6Z7DlumYoLQ5Uwhrzh6cpJu8AMXw9tlwaqPwa0PZlbyD
         F6ijfiN3/bTkmAJ85kcnCOvbJdG5D7u4sKcAIxmubAyyche7cKSmzqDbgbtzKe0xIzug
         69ekFeBDXSTesJ7dcFpCtzGT9vB1SYo7eIl4smB8sjkoMc9jsNCypEBmKCU1tteeuaQH
         8gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbdAcd1VhuwK0Ipz0A73KKudO0V3SjxqXsXRiv3pYpY=;
        b=SPBzQPNjDcZjs86gZH0lv6VAOPhCk5iJFaeFDCAU+Swx12ZhM1OUCn0UovD5sGUXoR
         0KWVoeqQ2Mmiee6V5AEmSYUNLWD3JAQJyn8OIi/28qbH4Ldclivm7hX6l9lttqyrtGcj
         JIhuB+n/pkvLWH4G7lVG+WqAiSFMiLlxnjHx7S49dsUeW1lrq3BRP32eLt6JLMQo2isy
         uqkwhN+jtGSudf20A4RRmwhIdYkexamCtoHiSRuhpxcCefN27lVt5spJPpO/0VpLPpQt
         8p0lAs9H0qxlfDEg4WmRhiAX0KkZAbFWlQD5lZ8DFGBIOOaK/QDCc52jCJ4RWAffE5Uv
         obUQ==
X-Gm-Message-State: AO0yUKX8nWw3k2D5CyWXlVG2ekQy4cFXLbSaRSeXqbi8/5huRKdjd2Mk
	p7+TsMgqZgl4NtNJ8mPqZ8WCNGtuqtjp2kEEz84=
X-Google-Smtp-Source: AK7set8BS6kYCyxM1QjioYjLKgOHZpaPSG9edP9c/xFXSoRwtOWwDkdRGNtF5QD7yNPVvWoSlxnuyfMX8VLpmoli7nI=
X-Received: by 2002:a05:6638:1181:b0:3aa:f66:8fa3 with SMTP id
 f1-20020a056638118100b003aa0f668fa3mr2647016jas.15.1675425982004; Fri, 03 Feb
 2023 04:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
 <c7172449-e2c5-012f-e8fd-05b4edaf7eb9@bootlin.com> <3ce2f565-05ca-2410-5368-d1990a66b6bb@bootlin.com>
In-Reply-To: <3ce2f565-05ca-2410-5368-d1990a66b6bb@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 3 Feb 2023 12:06:10 +0000
Message-ID: <CAO5Uq5SWDfaRFXimX4QfbA31KYbbHjgXwDoh3nd-apkTxuGhYw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Feb 2023 12:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3634

On Fri, Feb 3, 2023 at 9:42 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi again Alex (Kiernan),
>
> On 02.02.23 at 19:06, Michael Opdenacker wrote:
> > Hi Alex,
> >
> > I tried the example you gave to use the "cargo-update-recipe-crates"
> > class.
> >
> > On 15.01.23 at 21:03, Alex Kiernan wrote:
> >> We should reference `cargo-update-recipe-crates` here rather than
> >> `cargo bitbake`. The flow for creating a recipe then goes something
> >> like (using hippotat as an example
> >> https://www.chiark.greenend.org.uk/~ianmdlvl/hippotat/current/docs/):
> >>
> >> devtool add -S a6ac94b4922602af64f22b86ba5347ad95fcda44 -V 1.1.7
> >> hippotat https://salsa.debian.org/iwj/hippotat.git
> >> # edit resulting recipe delete boiler plate tasks and add `inherit
> >> cargo cargo-update-recipe-crates`
> >> bitbake -c update_crates hippotat
> >> # edit recipe to add `require ${BPN}-crates.inc`
> >> devtool build hippotat
> >> # fix resulting errors (add `DEPENDS += "openssl"`, `inherit
> >> pkgconfig` in this case)
> >> devtool build hippotat
> >
> >
> > I did just that, but "devtool build hippotat" failed:
> >
> > <<<
> >
> > NOTE: hippotat: compiling from external source tree
> > /home/mike/work/yocto/poky/build/workspace/sources/hippotat
> > ERROR: hippotat-1.1.7+git999-r0 do_compile: oe_runmake failed
> > ERROR: hippotat-1.1.7+git999-r0 do_compile:
> > ExecutionError('/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux/hippotat/1.1.7+git999-r0/temp/run.do_compile.14532',
> > 1, None, None)
> > ERROR: Logfile of failure stored in:
> > /home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux/hippotat/1.1.7+git999-r0/temp/log.do_compile.14532
> > Log data follows:
> > | DEBUG: Executing python function externalsrc_compile_prefunc
> > | NOTE: hippotat: compiling from external source tree
> > /home/mike/work/yocto/poky/build/workspace/sources/hippotat
> > | DEBUG: Python function externalsrc_compile_prefunc finished
> > | DEBUG: Executing shell function do_compile
> > | NOTE: make -j 20
> > | cargo build --release  --workspace
> > | rm -rf docs/html
> > | sphinx-build -M html docs docs
> > | /bin/bash: line 1: sphinx-build: command not found
> > | make: *** [Makefile:68: docs/html/index.html] Error 127
> > | make: *** Waiting for unfinished jobs....
> > |     Updating crates.io index
> > | warning: spurious network error (2 tries remaining): failed to
> > resolve address for github.com: Name or service not known; class=Net (12)
> > | warning: spurious network error (1 tries remaining): failed to
> > resolve address for github.com: Name or service not known; class=Net (12)
> > | error: Unable to update registry `crates-io`
> > |
> > | Caused by:
> > |   failed to fetch `https://github.com/rust-lang/crates.io-index`
> > |
> > | Caused by:
> > |   network failure seems to have happened
> > |   if a proxy or similar is necessary `net.git-fetch-with-cli` may
> > help here
> > |
> > https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
> > |
> > | Caused by:
> > |   failed to resolve address for github.com: Name or service not
> > known; class=Net (12)
> > | make: *** [Makefile:52: stamp/cargo-build] Error 101
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > ERROR: Task
> > (/home/mike/work/yocto/poky/build/workspace/recipes/hippotat/hippotat_git.bb:do_compile)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 739 tasks of which 731 didn't need to
> > be rerun and 1 failed.
> >
> > Summary: 1 task failed:
> > /home/mike/work/yocto/poky/build/workspace/recipes/hippotat/hippotat_git.bb:do_compile
> >
> > Summary: There was 1 WARNING message.
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >
> > >>>
> >
> > I did try to add BB_NO_NETWORK = "0" to conf/local.conf but it didn't
> > help.
> > Any clues?
> >
> > Maybe we could use an example that's simpler to build and with fewer
> > dependencies...
> > Cheers
> > Michael.
>
>
> I tried with uutils too (we have it in meta-oe), and I also get
> networking errors. It seems that Cargo is trying to connect to the
> network at build time.
>
> Trying "cargo bitbake" on uutils was so much easier (just checkout the
> tag / commit you want in the git repository, run "cargo bitbake" and you
> get a recipe that builds just fine).
>
>  From the example instructions you gave, devtool didn't even realize
> that the recipe was meant to be built with Cargo. How could it?
>

I suspect you missed this part:

# edit resulting recipe delete boiler plate tasks and add `inherit
cargo cargo-update-recipe-crates`

I've just pushed up this repo which I did step by step:

https://github.com/akiernan/hippotat-recipe

Though I can't argue its less straightforward than the `cargo bitbake`
approach - holding up my hands, so far we've only migrated one of our
rust recipes to update_crates.

> So, I'd rather document a workflow that's by far the easiest, even if
> that's not something officially supported by the Yocto Project.
>

Sorry, I did say I'd write something and I've not - the last couple of
weeks have disappeared into a load of other things.

Getting something in there, would clearly be an improvement!

-- 
Alex Kiernan

