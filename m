Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1797AD132C8
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 13:32:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.57458.1730727161834108861
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 05:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ln8w9l50;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08ACC0003;
	Mon,  4 Nov 2024 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730727160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZMXIGbs0aLE1bCwAMoOb4IxlRUIHUKspYK36siFq80=;
	b=Ln8w9l50udKP1pk/gJJg/6OEcMPCVQtTHealsibsJvRRa4ezoL5Tl1ZnUG+Eh1UZRBLdkn
	d3KBdyhB6DaG9cTkvDILgWYGj/k12yp0IYjZR4genTfzjuXY3g/BbbiBfxTwPxXDgp0BrI
	tZ5jFt5JgzO91w+YU4He7iz2ZijaYB9VZYMmPsZAvwztGkolPt1FeXNtjr1fs63JQxZwbE
	6xc9zfoE6bvkSWTq+P802Bb/1UlOH9UxDBjM/wwSOfCdopshjGARwdB0KKeeH83g52fmQs
	k0Z6JuWFcs8zwYojiozL2at9SQZAl3MWjbwrc24KXGbshCcpMuXu994m2opXcg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 14:32:39 +0100
Message-Id: <D5DFKOSJM77O.216XMAZV67O2@bootlin.com>
Subject: Re: [docs] [PATCH 5/5] dev-manual: add bblock documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com> <20241031-add-bblock-documentation-v1-5-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-5-32b89093bbda@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 13:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5658

Hi Julien,

Thanks for taking the time to document your tool!
On top of Ulrich's comments, here are my suggestions/corrections:

On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> bblock is a helper tool to lock/unlock tasks and recipes to specific
> signatures. Add a documentation page for it.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/dev-manual/bblock.rst | 129 ++++++++++++++++++++++++++++++=
++++++
>  documentation/dev-manual/index.rst  |   1 +
>  2 files changed, 130 insertions(+)
>
> diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manu=
al/bblock.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..3df75799aa638d173764607df=
191bd99612034cf
> --- /dev/null
> +++ b/documentation/dev-manual/bblock.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Locking and Unlocking Recipes Using ``bblock``
> +**********************************************
> +
> +By design, the OpenEmbedded build system builds everything from scratch
> +unless BitBake determines that specific parts do not require rebuilding.

s/parts/tasks/?

> +At startup, it computes a signature for each tasks, based on the task's =
input.
> +Then, it compares these signatures with the ones from sstate (if exist).=
 Any

s/from sstate/from the sstate cache/?
s/if exist/if they exist/

> +changes cause the task to rerun.
> +
> +During development, changes might trigger BitBake to rebuild certain
> +recipes, even when we know they do not require rebuilding at that stage.
> +For example, modifying a recipe can lead to the rebuilding of its native
> +counterpart, which might proves unnecessary. Editing the ``python3`` rec=
ipe,
> +for instance, can prompt BitBake to rebuild ``python3-native`` along wit=
h any
> +recipes that depend on it.
> +
> +To prevent this, use ``bblock`` to lock specific tasks or recipes to
> +specific signatures, forcing BitBake to use the sstate cache for them.
> +
> +.. attention::
> +
> +   Use ``bblock`` only during the development phase.
> +
> +   Forcing BitBake to use sstate cache, regardless of input changes, mea=
ns
> +   the recipe metadata no longer directly reflect the output. Use this f=
eature

s/reflect/reflects/ unless metadata is a plural by default?

> +   with caution. If you do not understand why signatures change, see the=
 section
> +   on `understanding what changed <https://wiki.yoctoproject.org/wiki/Ti=
psAndTricks/Understanding_what_changed_(diffsigs_etc)>`__.

You can use :yocto_wiki: here:

:yocto_wiki:`understanding what changed </TipsAndTricks/Understanding_what_=
changed_(diffsigs_etc)>`.

(syntax needs double-checking ;))

> +
> +Locking tasks and recipes
> +-------------------------
> +
> +To lock a recipe, use::
> +
> +   $ bblock recipe
> +
> +You can also use a space-separated list of recipes to lock many recipes:=
:
> +
> +   $ bblock recipe1 recipe2
> +
> +Locking a recipe, means locking all tasks of the recipe. If you need to

No comma "," between recipe and means, I think.

> +lock only particular tasks use the `-t` switch with a comma-separated

Comma after "tasks" I think would make more sense here (to me at least).

> +list of tasks::
> +
> +  $ bblock -t task1,task2 recipe
> +

Maybe a real-life example would be great here!

> +Unlocking tasks and recipes
> +---------------------------
> +
> +To unlock a recipe, use::

...use the ``-r`` option::

> +
> +   $ bblock -r recipe
> +
> +You can also use a space-separated list of recipes to unlock many recipe=
s::

s/many/multiple/ (many means "a lot of")

> +
> +   $ bblock -r recipe1 recipe2
> +
> +Unlocking a recipe, means unlocking all tasks of the recipe. If you need=
 to
> +unlock only particular tasks use the `-t` switch with a comma-separated
> +list of tasks::
> +
> +  $ bblock -r -t task1,task2 recipe
> +
> +To unlock all recipes, do not specify any recipe::
> +
> +  $ bblock -r
> +
> +
> +Configuration file
> +------------------
> +
> +``bblock`` will dump the signatures in the ``build/conf/bblock.conf`` fi=
le,
> +included by default in ``poky/meta/conf/bitbake.conf``.

Here you can use:

:oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.=
conf>`

Also, I believe that bblock.conf is a candidate for being in
`documentation/ref-manual/structure.rst`, alongside local.conf and
bblayers.conf in the section "The Build Directory --- ``build/``". Could yo=
u add
a section there that explains this file briefly and that redirects the user=
 to
this document?

> +
> +To dump it, use::

s/To dump it/To dump the file/

> +
> +  $ bblock -d
> +
> +
> +Locking mechanism
> +-----------------
> +
> +``bblock`` computes the signature(s) of the task(s) then uses the 3 foll=
owing

s/then uses/and sets/? I.e. explain what it really does with them.

> +variables: :term:`SIGGEN_LOCKEDSIGS`, :term:`SIGGEN_LOCKEDSIGS_TYPES`
> +and :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`.
> +
> +In particular, ``bblock`` sets::
> +
> +  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "info"
> +  SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> +
> +  SIGGEN_LOCKEDSIGS_<package_arch> +=3D "<recipe>:<task>:<signature>"
> +
> +This produces architecture specific locks and reminds user that some tas=
ks
> +have locked signatures.
> +
> +Example
> +-------
> +
> +When working on ``python3`` recipe, we can lock ``pyton3-native`` with t=
he

s/on ``python3`` recipe/on the ``python3`` recipe/
s/pyton3-native/python3-native/

> +following::
> +
> +  $ bblock python3-native
> +  $ bblock -d
> +  # Generated by bblock
> +  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "info"
> +  SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> +
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_patch:865859c27e603ba=
42025b7bb766c3cd4c0f477e4962cfd39128c0619d695fce7"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_populate_sysroot:f8fa=
5d3194cef638416000252b959e86d0a19f6b7898e1f56b643c588cdd8605"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_prepare_recipe_sysroo=
t:fe295ac505d9d1143313424b201c6f3f2a0a90da40a13a905b86b874705f226a"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_fetch:1b6e4728fee631b=
c7a8a7006855c5b8182a8224579e32e3d0a2db77c26459f25"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_unpack:2ad74d6f865ef7=
5c35c0e6bbe3f9a90923a6b2c62c18a3ddef514ea31fbc588f"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_deploy_source_date_ep=
och:15f89b8483c1ad7507480f337619bb98c26e231227785eb3543db163593e7b42"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_configure:7960c13d232=
70fdb12b3a7c426ce1da0d2f5c7cf5e5d3f5bdce5fa330eb7d482"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_compile:012e1d4a63f1a=
78fc2143bd90d704dbcf5865c5257d6272aa7540ec1cd3063d9"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_install:d3401cc2afa4c=
996beb154beaad3e45fa0272b9c56fb86e9db14ec3544c68f9d"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_build:fa88bb7afb9046c=
0417c24a3fa98a058653805a8b00eda2c2d7fea68fc42f882"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_collect_spdx_deps:cc9=
c53ba7c495567e9a38ec4801830c425c0d1f895aa2fc66930a2edd510d9b4"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_spdx:766a1d093=
68438b7b5a1a8e2a8f823b2b731db44b57e67d8b3196de91966f9c5"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_package_spdx:4=
6f80faeab25575e9977ba3bf14c819489c3d489432ae5145255635108c21020"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_recipe_qa:cb960cdb074=
e7944e894958db58f3dc2a0436ecf87c247feb3e095e214fec0e4"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_populate_lic:15657441=
621ee83f15c2e650e7edbb036870b56f55e72e046c6142da3c5783fd"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_create_manifest:24f0a=
bbec221d27bbb2909b6e846288b12cab419f1faf9f5006ed80423d37e28"
> +  SIGGEN_LOCKEDSIGS_x86_64 +=3D "python3-native:do_addto_recipe_sysroot:=
bcb6a1905f113128de3f88d702b706befd6a786267c045ee82532759a7c214d7"
> +
> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manua=
l/index.rst
> index 9ccf60f7012ea344612298e77ebabed84ad6de3e..7afd0d820e94d56cb2145962b=
9b1a976c7951936 100644
> --- a/documentation/dev-manual/index.rst
> +++ b/documentation/dev-manual/index.rst
> @@ -48,5 +48,6 @@ Yocto Project Development Tasks Manual
>     error-reporting-tool
>     wayland
>     qemu
> +   bblock
> =20
>  .. include:: /boilerplate.rst

Thanks!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


