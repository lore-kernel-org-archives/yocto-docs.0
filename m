Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23B5C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 19:30:49 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.177220.1673897448029752302
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 11:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhOY8Gkg;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n85so6319244iod.7
        for <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UZpkyYFnmKuJZeZfmL8NOcZ+UW9K1erjZSUWyprM46k=;
        b=NhOY8GkggTL9UudJvkNlFYOduCfUdA90wlgM/yorFlw1fB0PVKrPSCVEyPKE77jykq
         1S0VNm5K/bqEuMDKM05/rAZ2EcYTt0Bjr2zEZzzCZmiQ64QLzSmEF97+kRvPi4EiGgHS
         2ObQVBxwKOZjGYSTul+JjU3auW/rEz7t3BGYlXYmn3GxwqCnjPZeHZHFOwExrYp5qozy
         VLpsft2Bdh07piR837dd++G2ooipGBzE6+5m3BmBEsF4zku2MLfAx9CKKvhkPlyKPbLY
         924kc0ZFwRO1Kj8dcWwlPpYOplgUHlFQbfUyhpW6IYgU4nDpvrwLcZkMl4GwcHOQIikE
         wOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZpkyYFnmKuJZeZfmL8NOcZ+UW9K1erjZSUWyprM46k=;
        b=jYXgcuSmCOdP0g6ehyt94gjYNiZr8Qo7wA3nBqIItl/RkAntDG7lNfJTC67631ZfV5
         iEFD5ciaJlMPpbHq0QeMYUCXi40qVg3DaY2OVKaj4gcu8Uw3W/BGAm4VO5vXWt97c97O
         yMZOEtVAk/5w/HyBfgeCM7micULsoXwAJwsStKsQlQ4UcBHkBs/pJrOR1M8pcIjpAPJR
         Gh8NMAzfezu4jrW//fvQz1sgPk8HrVHTqjnwWw+1GrH2NtlMRbjD3bkRhEPuBMPveXYB
         zZM78xjEKv2dqXN0oUAskXpQlY/Up9AHHe2PYpzyTcTMdpiUxpYxI0zoTgmYT8BIkaZE
         T+IA==
X-Gm-Message-State: AFqh2ko8PEFXes/jN3M8vE9Qwu8FnaU2L0ZuWUEw25fxmuqliN02hQR8
	Q4FJYJoFGXtFB2Shsj77xFe/ybKGwwPEeZ1Mk/U=
X-Google-Smtp-Source: AMrXdXvEjmwClcmxYVb0nzZ8NgeXPifeWa7lQG3dtISEZnN8fLtkhwJHCRI56r2DstC+QsuKRpPV8tZ9jlXTNkNwAXE=
X-Received: by 2002:a02:866e:0:b0:39d:234a:8f18 with SMTP id
 e101-20020a02866e000000b0039d234a8f18mr7941304jai.123.1673897447219; Mon, 16
 Jan 2023 11:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com> <6c8a96b9-8000-723e-e39a-c8ee3d13cc98@bootlin.com>
In-Reply-To: <6c8a96b9-8000-723e-e39a-c8ee3d13cc98@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 Jan 2023 19:30:35 +0000
Message-ID: <CAO5Uq5QrNFtj4d_6Noo=zgWxbm0QRD2h9SkN73xy4RpLuhmXpA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 19:30:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3614

On Mon, Jan 16, 2023 at 5:18 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Alex,
>
> On 15.01.23 at 21:03, Alex Kiernan wrote:
> > On Fri, Jan 13, 2023 at 6:09 PM Michael Opdenacker via
> > lists.yoctoproject.org
> > <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> >> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >>
> >> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >> ---
> >>   documentation/ref-manual/classes.rst | 54 ++++++++++++++++++++++++++++
> >>   1 file changed, 54 insertions(+)
> >>
> >> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> >> index 0cb507b500..cc6ba04bff 100644
> >> --- a/documentation/ref-manual/classes.rst
> >> +++ b/documentation/ref-manual/classes.rst
> >> @@ -254,6 +254,42 @@ When inherited globally, prints statistics at the end of the build on
> >>   sstate re-use. In order to function, this class requires the
> >>   :ref:`ref-classes-buildstats` class be enabled.
> >>
> >> +.. _ref-classes-cargo:
> >> +
> >> +``cargo``
> >> +=========
> >> +
> >> +The :ref:`ref-classes-cargo` class allows to compile Rust language programs
> >> +using `Cargo <https://doc.rust-lang.org/cargo/>`__. Cargo is Rust's package
> >> +manager, allowing to fetch package dependencies and build your program.
> >> +
> >> +Using this class makes it very easy to build Rust programs. All you need
> >> +is to use the :term:`SRC_URI` variable to point to a source repository
> >> +which can be built by Cargo, typically one that was created by the
> >> +``cargo new`` command, containing a ``Cargo.toml`` file and an ``src``
> >> +subdirectory.
> >> +
> >> +You will find a simple example in the
> >> +:oe_git:`rust-hello-world_git.bb </openembedded-core/tree/meta/recipes-extended/rust-example/rust-hello-world_git.bb>`
> >> +recipe. A more complex example, with package dependencies, is the
> >> +:oe_git:`uutils-coreutils </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
> >> +recipe, which was generated by the `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__
> >> +tool.
> >> +
> > We should reference `cargo-update-recipe-crates` here rather than
> > `cargo bitbake`. The flow for creating a recipe then goes something
> > like (using hippotat as an example
> > https://www.chiark.greenend.org.uk/~ianmdlvl/hippotat/current/docs/):
> >
> > devtool add -S a6ac94b4922602af64f22b86ba5347ad95fcda44 -V 1.1.7
> > hippotat https://salsa.debian.org/iwj/hippotat.git
> > # edit resulting recipe delete boiler plate tasks and add `inherit
> > cargo cargo-update-recipe-crates`
> > bitbake -c update_crates hippotat
> > # edit recipe to add `require ${BPN}-crates.inc`
> > devtool build hippotat
> > # fix resulting errors (add `DEPENDS += "openssl"`, `inherit
> > pkgconfig` in this case)
> > devtool build hippotat
>
>
> Thanks for the review and suggestion. I overlooked this class so I will
> mention it in the docs, as well as the example you gave.

Happy to pick up on Alex's suggestion and try and get you some words,
just it's likely to take me a few days.


-- 
Alex Kiernan

