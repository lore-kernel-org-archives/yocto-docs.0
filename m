Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F54C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 20:03:53 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.149047.1673813022753063433
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Jan 2023 12:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/l0ezU1;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id p189so832537iod.0
        for <docs@lists.yoctoproject.org>; Sun, 15 Jan 2023 12:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ggMufAUPpkqsFpqVdYelBJOnuM7IiYjVMDhtFSfHJVI=;
        b=Q/l0ezU1qmfo85RmwHkqHgXZHVAbIPM6bLBCTIk4ZtOVJ1JY2SZNO+J1FfAUuluWJ+
         zk1ExkLa80tW15as4OLEVpDRir5PvRCaNjjUHywGbaHr1j/cj6w/JcfjKk3OxUFUU0Xo
         yX1bob4Wvv7GfqMeSfgD9jK6P0WSkfGdfUhZMD0nWBDNcT7e3wG3AbBDANVqn3hAI/De
         r4XsrAAuVVz9yLEX8BM49DmndmeHao0uoW3SpmnoRa6nJ3rPVsuIpgkXdRMR2LqdSY0B
         ljB3BKe4i+o3ZNTO8uVpQveWl3MWYTovr5nMx0095qci5lJGvZpMXELvRb8M2K4/fDGQ
         mAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggMufAUPpkqsFpqVdYelBJOnuM7IiYjVMDhtFSfHJVI=;
        b=to3WdW+TkLDQojrVCHWR5nrWDkVzq7w8kXIaad3gQxRDC0hM623ePXDc3344ke3F04
         M7qlumPEOP9d0+AYTsrNoW8H6C2uV+Uge4SfuDxSnhZlmX6LqUhbP+y0xIImTkxmpmNr
         zpgXmmrCzJa7QC1vQh3/+itm79vgcaDfVeqAo+rmd0Ml92p0mv/2mKyxBGmDn+s7a+qc
         D8WvU4vzg3XUJZ6b3L95Xycqvg3PPEBHqyVeSDyi1cccMlyTm66iBopiSisKy8jlEj6a
         iw6AxnobqHOygl34q7GzJnhMnKWlgmTO0fc4tw7X5eEzahgK9pL/7XMmoYQBP4qwbS6R
         r4XQ==
X-Gm-Message-State: AFqh2krUjpdEY5vRagVIgWxWnKyzuJpdzLynRoCjj/TmqWK6pxa99vNo
	o3u4PHgXFxUKGU+kBF2x26TWP9AS5VRER4Wqqzs=
X-Google-Smtp-Source: AMrXdXuJ7nUykT2KFHHcCjR2QduuExiXvCmdtipAQgMgKoPZA+ZkPvh6kU1OD7EAxU+aysEimdSWr9tcMLQZ7YCUl1s=
X-Received: by 2002:a05:6638:1b0f:b0:3a0:794e:93b1 with SMTP id
 cb15-20020a0566381b0f00b003a0794e93b1mr674198jab.74.1673813022058; Sun, 15
 Jan 2023 12:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 15 Jan 2023 20:03:31 +0000
Message-ID: <CAO5Uq5TgP2N0fhR_zPpK4FBzZ6RO67tqiSOYWDsyS2wbfAfuNw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 15 Jan 2023 20:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3606

On Fri, Jan 13, 2023 at 6:09 PM Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 54 ++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 0cb507b500..cc6ba04bff 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -254,6 +254,42 @@ When inherited globally, prints statistics at the end of the build on
>  sstate re-use. In order to function, this class requires the
>  :ref:`ref-classes-buildstats` class be enabled.
>
> +.. _ref-classes-cargo:
> +
> +``cargo``
> +=========
> +
> +The :ref:`ref-classes-cargo` class allows to compile Rust language programs
> +using `Cargo <https://doc.rust-lang.org/cargo/>`__. Cargo is Rust's package
> +manager, allowing to fetch package dependencies and build your program.
> +
> +Using this class makes it very easy to build Rust programs. All you need
> +is to use the :term:`SRC_URI` variable to point to a source repository
> +which can be built by Cargo, typically one that was created by the
> +``cargo new`` command, containing a ``Cargo.toml`` file and an ``src``
> +subdirectory.
> +
> +You will find a simple example in the
> +:oe_git:`rust-hello-world_git.bb </openembedded-core/tree/meta/recipes-extended/rust-example/rust-hello-world_git.bb>`
> +recipe. A more complex example, with package dependencies, is the
> +:oe_git:`uutils-coreutils </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
> +recipe, which was generated by the `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__
> +tool.
> +

We should reference `cargo-update-recipe-crates` here rather than
`cargo bitbake`. The flow for creating a recipe then goes something
like (using hippotat as an example
https://www.chiark.greenend.org.uk/~ianmdlvl/hippotat/current/docs/):

devtool add -S a6ac94b4922602af64f22b86ba5347ad95fcda44 -V 1.1.7
hippotat https://salsa.debian.org/iwj/hippotat.git
# edit resulting recipe delete boiler plate tasks and add `inherit
cargo cargo-update-recipe-crates`
bitbake -c update_crates hippotat
# edit recipe to add `require ${BPN}-crates.inc`
devtool build hippotat
# fix resulting errors (add `DEPENDS += "openssl"`, `inherit
pkgconfig` in this case)
devtool build hippotat


--
Alex Kiernan

