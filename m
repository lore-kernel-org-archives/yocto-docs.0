Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E9AD1266A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 08:18:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.13209.1730794730424876426
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 00:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=taEd3eB6;
 spf=pass (domain: baylibre.com, ip: 209.85.218.53, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so673618166b.0
        for <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730794729; x=1731399529; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7yRsggwl02gmeQZ2mY4D+jhbOJSuPnFK3meAwybTo4=;
        b=taEd3eB6qJt8j1qv3G1z98HP0H+1hiw6V4VXpM1NNOCTKCc1HI5zZy0o4r+iNv8GRQ
         cFZML0mNKPT9599vHGfOMpXcnvqq1XAHweaQFStci0pKa5zyQRS8jflldufLRT5KACCZ
         HQWnh0Ni5TbQ5WuBf0187aeSGubwuM7nzh58s2goofrlTaXNrpnPLVStvOICg61fIiJj
         jCzPu3ALQVOR1J1v8J8Mvj2GNyHKkWayPO318D5CU1G81rDauZtUmoJxEzIF1t69K3GU
         nsX8/JUWNi67+/Fqzyb9KUxTKCzAqahAkbjJ3z2elb+Vmc/zwhu5qK4iVvuJ+4O7A6+L
         hT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794729; x=1731399529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7yRsggwl02gmeQZ2mY4D+jhbOJSuPnFK3meAwybTo4=;
        b=VfqGxG45bKjFBVQmRu0zwQtpY0DD+TjZwc9bdTI0Jdk24U+y2YHjYBSfQETrG5kScx
         J82FXDF4cPA/ZOjtYBOtikDxuBMKGvnzK0cywiwbySVLs9YA648vBcbs3LQMzrp4/JOd
         NA5dY5ZbGc5XM72RGalcFnZBev/WC1N8dS2EX6p8uYhpdoRjgrzm+mseTLWyYMtoY70o
         UzdkBHwn19KB8+CmBBRkFRupFQHGbqLuOBwq3vIgOcN1IKSRfc26a4AcP6puFbatDKGZ
         1wX5ofZEJkwTrLXy57QqEpJvzF7wJjnLZqUld2CNybK/SdvjR0uVxgMHwI5fQJjV9pva
         4GKg==
X-Gm-Message-State: AOJu0YyAaIbZGODkwIlyK8D6qFaBr9kdFMJJ5aiYKP3AjEj8nPSlDmPR
	kt7qwlC2fdVMs7DWwgJjGTHdVe1gMPtv0VHlVr6ZnZlduf9IOrezPu/fskEwPPzYSugiwViTvfE
	+5Jy3XrWDBmCFugNVrDqJp5aQrpru0r+ZfNmJmQ==
X-Google-Smtp-Source: AGHT+IG+JFC0RyRN3e+OGtwPfrXOE8IRLMNgEtods3gBM9UA76bPxr28XsjiBGTpGFDt44bo5UTnY47lPaFZlpZdtoE=
X-Received: by 2002:a17:906:f58a:b0:a99:6036:90a with SMTP id
 a640c23a62f3a-a9e508cf502mr1648605966b.14.1730794728643; Tue, 05 Nov 2024
 00:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
 <20241104-add-bblock-documentation-v2-3-0704e4d59929@baylibre.com> <6rjzdiruxu.fsf@pengutronix.de>
In-Reply-To: <6rjzdiruxu.fsf@pengutronix.de>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 5 Nov 2024 09:18:37 +0100
Message-ID: <CAEHHSvZaVEG4UBMfiCjgG2mpdehU0VShX9Zjj3R376H8664uUg@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 3/3] dev-manual: add bblock documentation
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 08:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5676

Le mar. 5 nov. 2024 =C3=A0 08:39, Ulrich =C3=96lmann <u.oelmann@pengutronix=
.de> a =C3=A9crit :
>
> Hi Julien,
>
> two typos and one suggestion from my review of the v1 series that you
> probably forgot:

Hi Ulrich,

You're right, I missed them! I just sent a v3 to fix them.
Thank you for your review!

Cheers
Julien
>
> On Mon, Nov 04 2024 at 16:55 +0100, "Julien Stephan" <jstephan@baylibre.c=
om> wrote:
> > bblock is a helper tool to lock/unlock tasks and recipes to specific
> > signatures. Add a documentation page for it.
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  documentation/dev-manual/bblock.rst    | 129 +++++++++++++++++++++++++=
++++++++
> >  documentation/dev-manual/index.rst     |   1 +
> >  documentation/ref-manual/structure.rst |   8 ++
> >  documentation/ref-manual/variables.rst |   3 +
> >  4 files changed, 141 insertions(+)
> >
> > diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-ma=
nual/bblock.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e114bd34673e7b9853d6871=
b04863f2d741dc6ca
> > --- /dev/null
> > +++ b/documentation/dev-manual/bblock.rst
> > @@ -0,0 +1,129 @@
> > +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> > +
> > +Locking and Unlocking Recipes Using ``bblock``
> > +**********************************************
> > +
> > +By design, the OpenEmbedded build system builds everything from scratc=
h
> > +unless BitBake determines that specific tasks do not require rebuildin=
g.
> > +At startup, it computes a signature for each tasks, based on the task'=
s input.
>
> s/for each tasks/for each task/   or perhaps    s/for each tasks/for all =
tasks/
>
> > +Then, it compares these signatures with the ones from the sstate (if t=
hey
> > +exist). Any changes cause the task to rerun.
> > +
> > +During development, changes might trigger BitBake to rebuild certain
> > +recipes, even when we know they do not require rebuilding at that stag=
e.
> > +For example, modifying a recipe can lead to the rebuilding of its nati=
ve
>
> The sentence in its current form is correct. Nevertheless it would sound
> more smooth and less formal to me if the definite article "the" is left
> out: s/to the rebuilding/to rebuilding/
>
> > +counterpart, which might proves unnecessary. Editing the ``python3`` r=
ecipe,
>
> s/which might proves/which might prove/
>
> Best regards
> Ulrich
>
>
> > +for instance, can prompt BitBake to rebuild ``python3-native`` along w=
ith any
> > +recipes that depend on it.
> > +
> > +To prevent this, use ``bblock`` to lock specific tasks or recipes to
> > +specific signatures, forcing BitBake to use the sstate cache for them.
> > +
> > +.. attention::
> > +
> > +   Use ``bblock`` only during the development phase.
> > +
> > +   Forcing BitBake to use sstate cache, regardless of input changes, m=
eans
> > +   the recipe metadata no longer directly reflect the output. Use this=
 feature
> > +   with caution. If you do not understand why signatures change, see t=
he section
> > +   on :yocto_wiki:`understanding what changed </TipsAndTricks/Understa=
nding_what_changed_(diffsigs_etc)>`.
> > +
> > +
> > +Locking tasks and recipes
> > +-------------------------
> > +
> > +To lock a recipe, use::
> > +
> > +   $ bblock recipe
> > +
> > +You can also use a space-separated list of recipes to lock multiple re=
cipes::
> > +
> > +   $ bblock recipe1 recipe2
> > +
> > +Locking a recipe means locking all tasks of the recipe. If you need to
> > +lock only particular tasks, use the `-t` option with a comma-separated
> > +list of tasks::
> > +
> > +  $ bblock -t task1,task2 recipe
> > +
> > +
> > +Unlocking tasks and recipes
> > +---------------------------
> > +
> > +To unlock a recipe, use the ``-r`` option::
> > +
> > +   $ bblock -r recipe
> > +
> > +You can also use a space-separated list of recipes to unlock multiple =
recipes::
> > +
> > +   $ bblock -r recipe1 recipe2
> > +
> > +Unlocking a recipe means unlocking all tasks of the recipe. If you nee=
d to
> > +unlock only particular tasks use the ``-t`` option with a comma-separa=
ted
> > +list of tasks::
> > +
> > +  $ bblock -r -t task1,task2 recipe
> > +
> > +To unlock all recipes, do not specify any recipe::
> > +
> > +  $ bblock -r
> > +
> > +
> > +Configuration file
> > +------------------
> > +
> > +``bblock`` will dump the signatures in the ``build/conf/bblock.conf`` =
file,
> > +included by default in :oe_git:`meta/conf/bitbake.conf </openembedded-=
core/tree/meta/conf/bitbake.conf>`.
> > +
> > +To dump the file, use the ``-d`` option::
> > +
> > +  $ bblock -d
> > +
> > +
> > +Locking mechanism
> > +-----------------
> > +
> > +``bblock`` computes the signature(s) of the task(s) and sets the 3 fol=
lowing
> > +variables: :term:`SIGGEN_LOCKEDSIGS`, :term:`SIGGEN_LOCKEDSIGS_TYPES`
> > +and :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`.
> > +
> > +In particular, ``bblock`` sets::
> > +
> > +  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "info"
> > +  SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> > +
> > +  SIGGEN_LOCKEDSIGS_<package_arch> +=3D "<recipe>:<task>:<signature>"
> > +
> > +This produces architecture specific locks and reminds user that some t=
asks
> > +have locked signatures.
> > +
> > +Example
> > +-------
> > +
> > +When working on the ``python3`` recipe, we can lock ``python3-native``=
 with
> > +the following::
> > +
> > +  $ bblock python3-native
> > +  $ bblock -d
> > +  # Generated by bblock
> > +  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "info"
> > +  SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> > +
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_patch:865859c27e603=
ba42025b7bb766c3cd4c0f477e4962cfd39128c0619d695fce7"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_populate_sysroot:f8=
fa5d3194cef638416000252b959e86d0a19f6b7898e1f56b643c588cdd8605"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_prepare_recipe_sysr=
oot:fe295ac505d9d1143313424b201c6f3f2a0a90da40a13a905b86b874705f226a"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_fetch:1b6e4728fee63=
1bc7a8a7006855c5b8182a8224579e32e3d0a2db77c26459f25"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_unpack:2ad74d6f865e=
f75c35c0e6bbe3f9a90923a6b2c62c18a3ddef514ea31fbc588f"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_deploy_source_date_=
epoch:15f89b8483c1ad7507480f337619bb98c26e231227785eb3543db163593e7b42"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_configure:7960c13d2=
3270fdb12b3a7c426ce1da0d2f5c7cf5e5d3f5bdce5fa330eb7d482"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_compile:012e1d4a63f=
1a78fc2143bd90d704dbcf5865c5257d6272aa7540ec1cd3063d9"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_install:d3401cc2afa=
4c996beb154beaad3e45fa0272b9c56fb86e9db14ec3544c68f9d"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_build:fa88bb7afb904=
6c0417c24a3fa98a058653805a8b00eda2c2d7fea68fc42f882"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_collect_spdx_deps:c=
c9c53ba7c495567e9a38ec4801830c425c0d1f895aa2fc66930a2edd510d9b4"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_spdx:766a1d0=
9368438b7b5a1a8e2a8f823b2b731db44b57e67d8b3196de91966f9c5"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_package_spdx=
:46f80faeab25575e9977ba3bf14c819489c3d489432ae5145255635108c21020"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_recipe_qa:cb960cdb0=
74e7944e894958db58f3dc2a0436ecf87c247feb3e095e214fec0e4"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_populate_lic:156574=
41621ee83f15c2e650e7edbb036870b56f55e72e046c6142da3c5783fd"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_manifest:24f=
0abbec221d27bbb2909b6e846288b12cab419f1faf9f5006ed80423d37e28"
> > +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_addto_recipe_sysroo=
t:bcb6a1905f113128de3f88d702b706befd6a786267c045ee82532759a7c214d7"
> > +
> > diff --git a/documentation/dev-manual/index.rst b/documentation/dev-man=
ual/index.rst
> > index 9ccf60f7012ea344612298e77ebabed84ad6de3e..7afd0d820e94d56cb214596=
2b9b1a976c7951936 100644
> > --- a/documentation/dev-manual/index.rst
> > +++ b/documentation/dev-manual/index.rst
> > @@ -48,5 +48,6 @@ Yocto Project Development Tasks Manual
> >     error-reporting-tool
> >     wayland
> >     qemu
> > +   bblock
> >
> >  .. include:: /boilerplate.rst
> > diff --git a/documentation/ref-manual/structure.rst b/documentation/ref=
-manual/structure.rst
> > index bbeda78c791d430faa55356a3209f5eeb1402837..339ee2fbd77b1264e62b9b7=
0381ff970b816d728 100644
> > --- a/documentation/ref-manual/structure.rst
> > +++ b/documentation/ref-manual/structure.rst
> > @@ -335,6 +335,14 @@ Once the build process gets the sample file, it us=
es ``sed`` to substitute final
> >     version of the ``bblayers.conf.sample`` file in the ``meta-poky/con=
f/templates/default``
> >     directory.
> >
> > +.. _structure-build-conf-bblock.conf:
> > +
> > +``build/conf/bblock.conf``
> > +--------------------------
> > +
> > +This configuration file is generated by :doc:`bblock </dev-manual/bblo=
ck>` and
> > +contains the signatures locked by ``bblock``.
> > +
> >  .. _structure-build-downloads:
> >
> >  ``build/downloads/``
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index b24286813eafaa562f4ebd070190f1e97e0cf23c..3d2d3f95695c98e583377ef=
5392fdfe7fa0ab28e 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -7901,6 +7901,9 @@ system and gives an overview of their function an=
d contents.
> >       Then you can look at files in ``build/stamps/<arch>/bc`` and sear=
ch for the
> >       file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d=
4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
> >
> > +     Alternatively, you can also use :doc:`bblock </dev-manual/bblock>=
` to
> > +     generate this line for you.
> > +
> >     :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
> >       Specifies the debug level of task signature check. 3 levels are s=
upported:
> --
> Pengutronix e.K.                           | Ulrich =C3=96lmann          =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|

