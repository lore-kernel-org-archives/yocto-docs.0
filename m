Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA8DF44845
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 11:52:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154648.1775821951931767117
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 04:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LuKePn0J;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4603E1A3259;
	Fri, 10 Apr 2026 11:52:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 142C2603F0;
	Fri, 10 Apr 2026 11:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9A9810450017;
	Fri, 10 Apr 2026 13:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775821948; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vp+flzhWOr2BotlovMBy5i57kl0W2ZsqqnQgU3155oc=;
	b=LuKePn0J4BsB6zMfuONhCiT+0Viu0sS8AFU6je1IBQ3dqaysUJiofYKeXUjVZFhcqch68F
	eX0U52e7FRzvTitsN1lc8eK2V6ZRBHur7tpuAxwuzZNKlcLT1XSKQfPSY6Dj5uyuw9i5tb
	LHycNv7rcnjNSvsAluwBwOEnvkLkFZocOt+XH+cqSNlaBGMTDo2TibYFRqgqzTsP/rMQKa
	7xchhXTlEkSTAOxiEfzlKvr6lOxuDIVeDRzE2Qwy+Seq7xqgi1VwCxDRwrKYYO1+oUML0i
	NHthROT97x3nBMwwXVMdfGBnqIWak01F+HPXUysgoz+HCm2C1H/d1AnBhdhQ8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 13:52:27 +0200
Message-Id: <DHPGCCAE5N7Z.SDEZOA3UK7BL@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adam.blank.g@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 5/6] ref-manual/variables.rst: update
 STAGING_DIR* descriptions
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com> <20260408-staging_and_packaging_vars-v1-5-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-5-387f482308e5@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 11:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9222

Hi,

On Wed Apr 8, 2026 at 3:05 PM CEST, Adam Blank via lists.yoctoproject.org w=
rote:
> Slightly reword to emphasize the sysroots' roles during the build.
> Drop double back-quote from the uses of '-native' to make it a bit
> easier on the eyes.
>
> Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 45 +++++++++++++++++-----------=
------
>  1 file changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index aa142a701..67176917c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10178,31 +10178,31 @@ system and gives an overview of their function =
and contents.
>           those files into the sysroot.
> =20
>     :term:`STAGING_DIR_HOST`
> -      Specifies the path to the sysroot directory for the system on whic=
h
> -      the component is built to run (the system that hosts the component=
).
> -      For most recipes, this sysroot is the one in which that recipe's
> -      :ref:`ref-tasks-populate_sysroot` task copies
> -      files. Exceptions include ``-native`` recipes, where the
> -      :ref:`ref-tasks-populate_sysroot` task instead uses
> -      :term:`STAGING_DIR_NATIVE`. Depending on
> -      the type of recipe and the build target, :term:`STAGING_DIR_HOST` =
can
> -      have the following values:
> +      Specifies the path to the recipe's input sysroot directory, popula=
ted with files
> +      for the system on which the component is built to run
> +      (the system that hosts the component).
> +      For most recipes, this sysroot is the one into which that recipe's=
 files from
> +      :ref:`ref-tasks-populate_sysroot` task will be copied (when sharin=
g files
> +      between recipes).

I'd suggest the following phrasing which is more straightforward:

"""
For most recipes, this sysroot is populated by their
:ref:`ref-tasks-populate_sysroot` task (when sharing files between recipes)=
.
"""

> +      Exceptions include native recipes, for which the files from
> +      :ref:`ref-tasks-populate_sysroot` task are instead copied to
> +      :term:`STAGING_DIR_NATIVE`. Depending on the type of recipe and th=
e build target,
> +      :term:`STAGING_DIR_HOST` can have the following values:
> =20
>        -  For recipes building for the target machine, the value is
> -         "${:term:`STAGING_DIR`}/${:term:`MACHINE`}".
> +         ``"${RECIPE_SYSROOT}"``, check :term:`RECIPE_SYSROOT`.
> =20
> -      -  For native recipes building for the build host, the value is em=
pty
> +      -  For native recipes (building for the build host), the value is =
empty
>           given the assumption that when building for the build host, the
>           build host's own directories should be used.
> =20
>           .. note::
> =20
> -            ``-native`` recipes are not installed into host paths like s=
uch
> -            as ``/usr``. Rather, these recipes are installed into
> -            :term:`STAGING_DIR_NATIVE`. When compiling ``-native`` recip=
es,
> +            Native recipes' files are not installed into host paths such

s/Native recipes' files/Native recipe files/

> +            as ``/usr``. Rather, such recipes' files are installed into

s/such recipes' files/such files/

> +            :term:`STAGING_DIR_NATIVE`. When compiling native recipes,
>              standard build environment variables such as
>              :term:`CPPFLAGS` and
> -            :term:`CFLAGS` are set up so that both host paths
> +            :term:`CFLAGS` are set up so that both build host's paths
>              and :term:`STAGING_DIR_NATIVE` are searched for libraries an=
d
>              headers using, for example, GCC's ``-isystem`` option.
> =20
> @@ -10210,16 +10210,15 @@ system and gives an overview of their function =
and contents.
>              should be viewed as input variables by tasks such as
>              :ref:`ref-tasks-configure`,
>              :ref:`ref-tasks-compile`, and
> -            :ref:`ref-tasks-install`. Having the real system
> -            root correspond to :term:`STAGING_DIR_HOST` makes conceptual=
 sense
> -            for ``-native`` recipes, as they make use of host headers an=
d
> -            libraries.
> -
> -      Check :term:`RECIPE_SYSROOT` and :term:`RECIPE_SYSROOT_NATIVE`.
> +            :ref:`ref-tasks-install`. Having the real system root
> +            (the build host's root) play the role of :term:`STAGING_DIR_=
HOST`
> +            makes conceptual sense for native recipes, as they make use
> +            of the build host's headers and libraries.
> =20
>     :term:`STAGING_DIR_NATIVE`
> -      Specifies the path to the sysroot directory used when building
> -      components that run on the build host itself.
> +      Specifies the path to the recipe's input sysroot directory, popula=
ted with
> +      files provided by native recipes (recipes building components that
> +      run on the build host itself).

s/build host/:term:`build host`/

Can you make this replacement in the different places where it is used in y=
our
patches?

The rest of the patches look good. Thanks for splitting the patches and for=
 the
commit descriptions, it helped :)

Antonin

