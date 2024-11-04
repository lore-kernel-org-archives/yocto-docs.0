Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A960FCFB422
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:44:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.60839.1730735065524499132
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=U0A4P4sJ;
 spf=pass (domain: baylibre.com, ip: 209.85.218.41, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so574718266b.0
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735064; x=1731339864; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daTM4AIzmJWSiNMt6DNXPuX0LuH9tXkoCRjFKC2v3a4=;
        b=U0A4P4sJRxDBKrbQS6KAw44Yi5L9G8MEH1wIn+JIXmMSBMF0x7qNeetIpYfyT7csHM
         5ZuT6q3uMN5KOStrBZaqrGJb5wCiuQEGmTkXmJ8Vpnjb4Uv/3nCCUFTMHHjpGe2LygoQ
         Jrd5f0WBzjVFnPhHq1VGReIYRRaN1mRsngkFAHT1D2sR1SjUlweX5iHxyouZ2WoIMSji
         JYSBvfCuerP7DM5fMo64MCFIce7a9m6cPNBhXPHTOvG17HNFuVJO5UfqjwDtqXLPFjbI
         BSYZGycq36NlXv9c/LE24N0FXrMU7FO7OJvo45gPNooVe5OqOpTioB2SKWqiFm2IS0P9
         TxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735064; x=1731339864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daTM4AIzmJWSiNMt6DNXPuX0LuH9tXkoCRjFKC2v3a4=;
        b=Az0DxVfbLCJF/oyJpwT7zC5R46Y/uMLas4NHHORO9Jf/Ua4tT9a0ylV4N00qohLWeO
         hibsGwZg43OcNjLIbW20am9yx3pEGdYWA+INnrOkKajPHbi9sT27ZJF5rJrqsCZatcZK
         UjFSavJuEzU9OoiM4Qi0r2d5/yceJVg06dCAxgOmwfBeSKZVSYbT1i2TfAoyb+GOFl+2
         1vY0arKzzWZz7R7Ge9DE4MPDQ9+YIGN1c/kwCYpciapXbGLe5e5B/CtceAeut8Fw4bW9
         vwdZlKYIgo6j5CUTY63q1UTli7dsIzQnjVEBRqcu9BVoyPr5fiEgfwynnUbuz4W3XaRK
         NBmA==
X-Gm-Message-State: AOJu0YxAcTQuokj1WGNa8VoQN9LiKO1pwtj1r8jRRWeSULLolVPwWsvm
	Mqh9k02ql6rHVXV2xPn5UE8CsjVGDxeUzF4MLnh4oPSXw1AGWUYH0Mh6OUmxzv4b7fosk28LnUI
	e+zOX1fdhOXH3Vshc71TpXiJ6WtjaxBFqQn4N0A==
X-Google-Smtp-Source: AGHT+IEfbt6XAlyD9CvUpKZQH5Ut5eqZiuPi0M8nm/btHdVeT2RykUQZsnEd3T6jnvxBeOUEEd/lllN/r0UIwSY/N3w=
X-Received: by 2002:a17:906:7310:b0:a99:f779:ae0c with SMTP id
 a640c23a62f3a-a9e50916803mr1727130766b.25.1730735063784; Mon, 04 Nov 2024
 07:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
 <20241031-add-bblock-documentation-v1-5-32b89093bbda@baylibre.com> <D5DFKOSJM77O.216XMAZV67O2@bootlin.com>
In-Reply-To: <D5DFKOSJM77O.216XMAZV67O2@bootlin.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 4 Nov 2024 16:44:12 +0100
Message-ID: <CAEHHSvbFaYp0ks2m7bOjetBXwM-iuHz7_2yC-TgZmPT2MD6H_A@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/5] dev-manual: add bblock documentation
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:44:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5662

Le lun. 4 nov. 2024 =C3=A0 14:32, Antonin Godard
<antonin.godard@bootlin.com> a =C3=A9crit :
>
> Hi Julien,
>
> Thanks for taking the time to document your tool!
> On top of Ulrich's comments, here are my suggestions/corrections:
>
> On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> > bblock is a helper tool to lock/unlock tasks and recipes to specific
> > signatures. Add a documentation page for it.
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  documentation/dev-manual/bblock.rst | 129 ++++++++++++++++++++++++++++=
++++++++
> >  documentation/dev-manual/index.rst  |   1 +
> >  2 files changed, 130 insertions(+)
> >
> > diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-ma=
nual/bblock.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3df75799aa638d173764607=
df191bd99612034cf
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
> > +unless BitBake determines that specific parts do not require rebuildin=
g.
>
> s/parts/tasks/?
>
> > +At startup, it computes a signature for each tasks, based on the task'=
s input.
> > +Then, it compares these signatures with the ones from sstate (if exist=
). Any
>
> s/from sstate/from the sstate cache/?
> s/if exist/if they exist/
>
> > +changes cause the task to rerun.
> > +
> > +During development, changes might trigger BitBake to rebuild certain
> > +recipes, even when we know they do not require rebuilding at that stag=
e.
> > +For example, modifying a recipe can lead to the rebuilding of its nati=
ve
> > +counterpart, which might proves unnecessary. Editing the ``python3`` r=
ecipe,
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
>
> s/reflect/reflects/ unless metadata is a plural by default?

I tend to consider metadata plural by default. Maybe I'm wrong?

>
> > +   with caution. If you do not understand why signatures change, see t=
he section
> > +   on `understanding what changed <https://wiki.yoctoproject.org/wiki/=
TipsAndTricks/Understanding_what_changed_(diffsigs_etc)>`__.
>
> You can use :yocto_wiki: here:
>
> :yocto_wiki:`understanding what changed </TipsAndTricks/Understanding_wha=
t_changed_(diffsigs_etc)>`.
>
> (syntax needs double-checking ;))
>
> > +
> > +Locking tasks and recipes
> > +-------------------------
> > +
> > +To lock a recipe, use::
> > +
> > +   $ bblock recipe
> > +
> > +You can also use a space-separated list of recipes to lock many recipe=
s::
> > +
> > +   $ bblock recipe1 recipe2
> > +
> > +Locking a recipe, means locking all tasks of the recipe. If you need t=
o
>
> No comma "," between recipe and means, I think.
>
> > +lock only particular tasks use the `-t` switch with a comma-separated
>
> Comma after "tasks" I think would make more sense here (to me at least).
>
> > +list of tasks::
> > +
> > +  $ bblock -t task1,task2 recipe
> > +
>
> Maybe a real-life example would be great here!

I already put a real life example at the end. The idea was to avoid
having an example in each section. Is it sufficient?

>
> > +Unlocking tasks and recipes
> > +---------------------------
> > +
> > +To unlock a recipe, use::
>
> ...use the ``-r`` option::
>
> > +
> > +   $ bblock -r recipe
> > +
> > +You can also use a space-separated list of recipes to unlock many reci=
pes::
>
> s/many/multiple/ (many means "a lot of")

Yeah.. I will put "multiple" back.. But according to Vale:

warning     'multiple' is too wordy.
                         write-good.TooWordy
warning     'several' is a weasel word!
                         write-good.Weasel

That's the reason why I put "many" ^^(but I agree it does not fit well here=
)
>
> > +
> > +   $ bblock -r recipe1 recipe2
> > +
> > +Unlocking a recipe, means unlocking all tasks of the recipe. If you ne=
ed to
> > +unlock only particular tasks use the `-t` switch with a comma-separate=
d
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
> > +included by default in ``poky/meta/conf/bitbake.conf``.
>
> Here you can use:
>
> :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbak=
e.conf>`
>
> Also, I believe that bblock.conf is a candidate for being in
> `documentation/ref-manual/structure.rst`, alongside local.conf and
> bblayers.conf in the section "The Build Directory --- ``build/``". Could =
you add
> a section there that explains this file briefly and that redirects the us=
er to
> this document?
>

Sure!
> > +
> > +To dump it, use::
>
> s/To dump it/To dump the file/
>
> > +
> > +  $ bblock -d
> > +
> > +
> > +Locking mechanism
> > +-----------------
> > +
> > +``bblock`` computes the signature(s) of the task(s) then uses the 3 fo=
llowing
>
> s/then uses/and sets/? I.e. explain what it really does with them.
>
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
> > +When working on ``python3`` recipe, we can lock ``pyton3-native`` with=
 the
>
> s/on ``python3`` recipe/on the ``python3`` recipe/
> s/pyton3-native/python3-native/
>
> > +following::
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
>
> Thanks!
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

