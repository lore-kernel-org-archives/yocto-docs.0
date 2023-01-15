Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F19C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 20:09:23 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.149194.1673813361190287388
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Jan 2023 12:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G3Fo6RT4;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id br9so4838652lfb.4
        for <docs@lists.yoctoproject.org>; Sun, 15 Jan 2023 12:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMR1Puc+lmqvsxzyPquZzv3Wau0u9YSeuZzv+l30JRw=;
        b=G3Fo6RT43Wr2UGeyKuHA71lVkXXxQOHykmSphvCUBsn6AehdciWf57t6AZeXCGYlam
         FgquhNAp9SrpDUrR4+gSb57CV4Hr1M7jvtzX+i/FcHQweDudXKB5By3ICindHab9cdrY
         X0J+633ZPx8xBklb3pRtBTTubaC927GqXfRUVyx3B35dbfKbfJ+NlwWfG+055TyqPuwg
         u16b24lgM5btR0ebGgLSoxhbdXkat5ccG/NQyRd48pOmCnzenUDgJUotzwci5ULeew+O
         npdTw29mR6ozxEXlj8y004F89DriK8d7mP8kXjPiMnQXVHXOEIhhTPBAnrwGKhSwTeNq
         pkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMR1Puc+lmqvsxzyPquZzv3Wau0u9YSeuZzv+l30JRw=;
        b=6xkeSvLvMi7ggCgotJZyT4rFI4PDPSL3CJOPE6r3N4+Pm4gLkpwc1CMGGm+1NJuD88
         iOJO1Swd04u/45plIHKekmCnAdmg9cSKmwnD7KxDaplXngIGcggtJ8aYQqQd3lqOT5EP
         t4WCwukvUYffKeszE0Gym7zc8bcna7+eeumNnrn8XKPI50C2nio8asqBFb4ffnMpRGEn
         i9qs6laLTyAXij9Yt6sclrmwx8ym5mHbya6OWCp5k4IDhpl5mzTnJkZvENvFqjxUtyJc
         81IB0R/9ryvv50TC3vNOXeyLNQ1tMxF9IQ+3tWcxphEdNTmyxOrU2a/NuQQDwvSy+r2J
         MkfA==
X-Gm-Message-State: AFqh2ko0H1O1CKosOXYqvmMmhbPukeHHrfX/Dq3vLJW8ouT4kCO7pbZ4
	018kvSMol234uhZR34LGvx/qjq5LDm8J2TEAl0g=
X-Google-Smtp-Source: AMrXdXuPv2KMxlnSl+bx/ONYxdIibpck9oJsZlImZahnH86IJdiIBS+oMerkNJw9eKLjmtGLkPsi7tBcHqWk6Q+QafY=
X-Received: by 2002:a05:6512:3a86:b0:4cc:7ecb:32af with SMTP id
 q6-20020a0565123a8600b004cc7ecb32afmr2240000lfu.393.1673813359504; Sun, 15
 Jan 2023 12:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com> <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
In-Reply-To: <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Jan 2023 21:09:08 +0100
Message-ID: <CANNYZj_vS3RaFL3JipjqE6+Qxv1ocGKVYnWMmNe2LqhyQeTomA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 15 Jan 2023 20:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3607

Perhaps you could write a patch to the docs that sets them right?

Alex

On Sun, 15 Jan 2023 at 21:03, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Fri, Jan 13, 2023 at 6:09 PM Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> >
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  documentation/ref-manual/classes.rst | 54 ++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index 0cb507b500..cc6ba04bff 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -254,6 +254,42 @@ When inherited globally, prints statistics at the end of the build on
> >  sstate re-use. In order to function, this class requires the
> >  :ref:`ref-classes-buildstats` class be enabled.
> >
> > +.. _ref-classes-cargo:
> > +
> > +``cargo``
> > +=========
> > +
> > +The :ref:`ref-classes-cargo` class allows to compile Rust language programs
> > +using `Cargo <https://doc.rust-lang.org/cargo/>`__. Cargo is Rust's package
> > +manager, allowing to fetch package dependencies and build your program.
> > +
> > +Using this class makes it very easy to build Rust programs. All you need
> > +is to use the :term:`SRC_URI` variable to point to a source repository
> > +which can be built by Cargo, typically one that was created by the
> > +``cargo new`` command, containing a ``Cargo.toml`` file and an ``src``
> > +subdirectory.
> > +
> > +You will find a simple example in the
> > +:oe_git:`rust-hello-world_git.bb </openembedded-core/tree/meta/recipes-extended/rust-example/rust-hello-world_git.bb>`
> > +recipe. A more complex example, with package dependencies, is the
> > +:oe_git:`uutils-coreutils </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
> > +recipe, which was generated by the `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__
> > +tool.
> > +
>
> We should reference `cargo-update-recipe-crates` here rather than
> `cargo bitbake`. The flow for creating a recipe then goes something
> like (using hippotat as an example
> https://www.chiark.greenend.org.uk/~ianmdlvl/hippotat/current/docs/):
>
> devtool add -S a6ac94b4922602af64f22b86ba5347ad95fcda44 -V 1.1.7
> hippotat https://salsa.debian.org/iwj/hippotat.git
> # edit resulting recipe delete boiler plate tasks and add `inherit
> cargo cargo-update-recipe-crates`
> bitbake -c update_crates hippotat
> # edit recipe to add `require ${BPN}-crates.inc`
> devtool build hippotat
> # fix resulting errors (add `DEPENDS += "openssl"`, `inherit
> pkgconfig` in this case)
> devtool build hippotat
>
>
> --
> Alex Kiernan

