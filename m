Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235A8C3DA78
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 18:22:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.122277.1673720570349704362
 for <docs@lists.yoctoproject.org>;
 Sat, 14 Jan 2023 10:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=aYyul7Fa;
 spf=pass (domain: madison.systems, ip: 209.85.208.46, mailfrom: matt@madison.systems)
Received: by mail-ed1-f46.google.com with SMTP id 18so35476383edw.7
        for <docs@lists.yoctoproject.org>; Sat, 14 Jan 2023 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oIq7SqkOGlPZMX+RH3hpWN9V3xpW+ibr+z+gqUq9Seo=;
        b=aYyul7FaSt9Z63LDhb+Y5PhYwgf2Ea0xf4q671TBA/SzfuJuh7V+FSSfQ5q/OrzhgP
         74UlE44SFErNiryIoLPkLt5F9Ro1INAkGSnSeDobc8Jl11R8Z9KXecDpcmZmVHJuYTV7
         1cQc0FYcKEg6cdRAVDY7S5GMnGrsmZP2iw1s2ig4SHbfoyMuZNkB126GBv6zONyBg7qK
         95gr8UbCh8pLyUM9dgWsU2TWcEELWLHCDHM63fShiLfTMpD1b8iT0z6y7B7bbNQhJQcB
         sm/+yhHJOL8H4W+vheDpcDNMUbgp4NyuOp32bR5NLum02K2BEA7kQ+/Z+lBD4901I0dA
         e0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIq7SqkOGlPZMX+RH3hpWN9V3xpW+ibr+z+gqUq9Seo=;
        b=m9OOQeUSBlODO0QYiOmU7xn6Tr/jBvaUwsAfRm0qJtsBTTIzwrirbI9lq/qlg4QOa5
         kODUSRct4kujL2EELBPVhdHppn3AgKn8hAEnJQNMNBomfjx9UelpDN9spem3a9v++uQO
         ETUOD/1B6a+CDuKG9jKyOCEd4dEHW1gTqDsPzwN/DvGhNoZu1niHrJkwEjArJGelBqCt
         /XhdP2duoFxtPek/sxdMF9mRab34Z35CBvhT+/30JL9Q7dsP77oiKrD269A9Oo0381++
         E4UA/p1/WMSqdeojZ4diOx/O2eMK4Mkxq8f/HdqRRskiYuk03fWX4TxwfD9xg0XddPOS
         8LKg==
X-Gm-Message-State: AFqh2kqqx4kUoSEJGBeRr5aHxS341W8KJFerZ4PKnUojBzqpwOd5ooD3
	2UkD3Hqi/sset8k5pgsXoO8atFJ4RUFM6iqq5jj/kg==
X-Google-Smtp-Source: AMrXdXvVpKbid9r+Ue8yrSOSKWroo77eeDIGYt8xl9cD4ZOKlhBThe2tdEI1hPTMUW1+KtOPb7IuuGdM1KZK7LzNIEo=
X-Received: by 2002:a05:6402:d5c:b0:499:f0f:f788 with SMTP id
 ec28-20020a0564020d5c00b004990f0ff788mr3198296edb.25.1673720568647; Sat, 14
 Jan 2023 10:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20230111095109.477423-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230111095109.477423-1-michael.opdenacker@bootlin.com>
From: Matt Madison <matt@madison.systems>
Date: Sat, 14 Jan 2023 10:22:37 -0800
Message-ID: <CAGgRHJogP4+0YpgH+=+y+TjOZzFbQzv26y5io3a_TjKHEOyvnQ@mail.gmail.com>
Subject: Re: [PATCH] ref-manual: initial documentation for go and go-mod classes
To: michael.opdenacker@bootlin.com
Cc: otavio.salvador@gmail.com, pab@pabigot.com, Qi.Chen@windriver.com, 
	alex.kanavin@gmail.com, Ahmed.Hossam@opensynergy.com, raj.khem@gmail.com, 
	docs@lists.yoctoproject.org, Jan Dorniak <jaskij@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 14 Jan 2023 18:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3605

Michael,

The descriptions look good to me.

Thanks,
-Matt

On Wed, Jan 11, 2023 at 1:51 AM <michael.opdenacker@bootlin.com> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This addresses [YOCTO #14582]
>
> ---
>  If you are familiar with the Go classes, please review and propose corrections
>  or extensions to what I wrote. My understanding of Go is very limited,
>  and I'm not even sure go-mod.bbclass is for building or just importing
>  Go modules.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Jan Dorniak <jaskij@gmail.com>
> ---
>  documentation/ref-manual/classes.rst   | 23 +++++++++
>  documentation/ref-manual/variables.rst | 67 ++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 7dba617db5..0cb507b500 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -758,6 +758,29 @@ software from the GNOME stack. This class sets
>  mirrors as well as extending :term:`FILES` with the typical
>  GNOME installation paths.
>
> +.. _ref-classes-go:
> +
> +``go``
> +======
> +
> +The :ref:`ref-classes-go` class supports building Go programs. The behavior of
> +this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
> +by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
> +
> +To build a Go program with the Yocto Project, you can use the
> +:yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
> +recipe as an example.
> +
> +.. _ref-classes-go-mod:
> +
> +``go-mod``
> +==========
> +
> +The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
> +:ref:`ref-classes-go` class.
> +
> +See the associated :term:`GO_WORKDIR` variable.
> +
>  .. _ref-classes-gobject-introspection:
>
>  ``gobject-introspection``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index f2decd713b..8419c80d03 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3012,6 +3012,73 @@ system and gives an overview of their function and contents.
>
>           GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
>
> +   :term:`GO_IMPORT`
> +      When inheriting the :ref:`ref-classes-go` class, this mandatory variable
> +      sets the import path for the Go package that will be created for the code
> +      to build. If you have a ``go.mod`` file in the source directory, this
> +      typically matches the path in the ``module`` line in this file.
> +
> +      Other Go programs importing this package will use this path.
> +
> +      Here is an example setting from the
> +      :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
> +      recipe::
> +
> +          GO_IMPORT = "golang.org/x/example"
> +
> +   :term:`GO_INSTALL`
> +      When inheriting the :ref:`ref-classes-go` class, this optional variable
> +      specifies which packages in the sources should be compiled and
> +      installed in the Go build space by the
> +      `go install <https://go.dev/ref/mod#go-install>`__ command.
> +
> +      Here is an example setting from the
> +      :oe_git:`crucible </meta-openembedded/tree/meta-oe/recipes-support/crucible/>`
> +      recipe::
> +
> +         GO_INSTALL = "\
> +             ${GO_IMPORT}/cmd/crucible \
> +             ${GO_IMPORT}/cmd/habtool \
> +         "
> +
> +      By default, :term:`GO_INSTALL` is defined as::
> +
> +         GO_INSTALL ?= "${GO_IMPORT}/..."
> +
> +      The ``...`` wildcard means that it will catch all
> +      packages found in the sources.
> +
> +      See the :term:`GO_INSTALL_FILTEROUT` variable for
> +      filtering out unwanted packages from the ones
> +      found from the :term:`GO_INSTALL` value.
> +
> +   :term:`GO_INSTALL_FILTEROUT`
> +      When using the Go "vendor" mechanism to bring in dependencies for a Go
> +      package, the default :term:`GO_INSTALL` setting, which uses the ``...``
> +      wildcard, will include the vendored packages in the build, which produces
> +      incorrect results.
> +
> +      There are also some Go packages that are structured poorly, so that the
> +      ``...`` wildcard results in building example or test code that should not
> +      be included in the build, or could fail to build.
> +
> +      This optional variable allows for filtering out a subset of the sources.
> +      It defaults to excluding everything under the ``vendor`` subdirectory
> +      under package's main directory. This is the normal location for vendored
> +      packages, but it can be overridden by a recipe to filter out other
> +      subdirectories if needed.
> +
> +   :term:`GO_WORKDIR`
> +      When using Go Modules, the current working directory must be the directory
> +      containing the ``go.mod`` file, or one of its subdirectories. When the
> +      ``go`` tool is used, it will automatically look for the ``go.mod`` file
> +      in the Go working directory or in any parent directory, but not in
> +      subdirectories.
> +
> +      When using the :ref:`ref-classes-go-mod` class to use Go modules,
> +      the optional :term:`GO_WORKDIR` variable, defaulting to the value
> +      of :term:`GO_IMPORT`, allows to specify a different Go working directory.
> +
>     :term:`GROUPADD_PARAM`
>        When inheriting the :ref:`ref-classes-useradd` class,
>        this variable specifies for a package what parameters should be
> --
> 2.37.2
>

