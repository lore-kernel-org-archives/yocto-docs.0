Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7856AD111A2
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 07:39:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.12753.1730792351523614121
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 23:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8E9d-0000b2-LA; Tue, 05 Nov 2024 08:39:09 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8E9d-0026qB-1J;
	Tue, 05 Nov 2024 08:39:09 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t8E9d-00FHAg-14;
	Tue, 05 Nov 2024 08:39:09 +0100
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: "Julien Stephan" <jstephan@baylibre.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 3/3] dev-manual: add bblock documentation
In-Reply-To: <20241104-add-bblock-documentation-v2-3-0704e4d59929@baylibre.com>
	(Julien Stephan's message of "Mon, 04 Nov 2024 16:55:01 +0100")
References: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
	<20241104-add-bblock-documentation-v2-3-0704e4d59929@baylibre.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Tue, 05 Nov 2024 08:39:09 +0100
Message-ID: <6rjzdiruxu.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 07:39:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5671

Hi Julien,

two typos and one suggestion from my review of the v1 series that you
probably forgot:

On Mon, Nov 04 2024 at 16:55 +0100, "Julien Stephan" <jstephan@baylibre.com=
> wrote:
> bblock is a helper tool to lock/unlock tasks and recipes to specific
> signatures. Add a documentation page for it.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/dev-manual/bblock.rst    | 129 +++++++++++++++++++++++++++=
++++++
>  documentation/dev-manual/index.rst     |   1 +
>  documentation/ref-manual/structure.rst |   8 ++
>  documentation/ref-manual/variables.rst |   3 +
>  4 files changed, 141 insertions(+)
>
> diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manu=
al/bblock.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..e114bd34673e7b9853d6871b0=
4863f2d741dc6ca
> --- /dev/null
> +++ b/documentation/dev-manual/bblock.rst
> @@ -0,0 +1,129 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Locking and Unlocking Recipes Using ``bblock``
> +**********************************************
> +
> +By design, the OpenEmbedded build system builds everything from scratch
> +unless BitBake determines that specific tasks do not require rebuilding.
> +At startup, it computes a signature for each tasks, based on the task's =
input.

s/for each tasks/for each task/   or perhaps    s/for each tasks/for all ta=
sks/

> +Then, it compares these signatures with the ones from the sstate (if they
> +exist). Any changes cause the task to rerun.
> +
> +During development, changes might trigger BitBake to rebuild certain
> +recipes, even when we know they do not require rebuilding at that stage.
> +For example, modifying a recipe can lead to the rebuilding of its native

The sentence in its current form is correct. Nevertheless it would sound
more smooth and less formal to me if the definite article "the" is left
out: s/to the rebuilding/to rebuilding/

> +counterpart, which might proves unnecessary. Editing the ``python3`` rec=
ipe,

s/which might proves/which might prove/

Best regards
Ulrich


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
> +   with caution. If you do not understand why signatures change, see the=
 section
> +   on :yocto_wiki:`understanding what changed </TipsAndTricks/Understand=
ing_what_changed_(diffsigs_etc)>`.
> +
> +
> +Locking tasks and recipes
> +-------------------------
> +
> +To lock a recipe, use::
> +
> +   $ bblock recipe
> +
> +You can also use a space-separated list of recipes to lock multiple reci=
pes::
> +
> +   $ bblock recipe1 recipe2
> +
> +Locking a recipe means locking all tasks of the recipe. If you need to
> +lock only particular tasks, use the `-t` option with a comma-separated
> +list of tasks::
> +
> +  $ bblock -t task1,task2 recipe
> +
> +
> +Unlocking tasks and recipes
> +---------------------------
> +
> +To unlock a recipe, use the ``-r`` option::
> +
> +   $ bblock -r recipe
> +
> +You can also use a space-separated list of recipes to unlock multiple re=
cipes::
> +
> +   $ bblock -r recipe1 recipe2
> +
> +Unlocking a recipe means unlocking all tasks of the recipe. If you need =
to
> +unlock only particular tasks use the ``-t`` option with a comma-separated
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
> +included by default in :oe_git:`meta/conf/bitbake.conf </openembedded-co=
re/tree/meta/conf/bitbake.conf>`.
> +
> +To dump the file, use the ``-d`` option::
> +
> +  $ bblock -d
> +
> +
> +Locking mechanism
> +-----------------
> +
> +``bblock`` computes the signature(s) of the task(s) and sets the 3 follo=
wing
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
> +When working on the ``python3`` recipe, we can lock ``python3-native`` w=
ith
> +the following::
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
>=20=20
>  .. include:: /boilerplate.rst
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index bbeda78c791d430faa55356a3209f5eeb1402837..339ee2fbd77b1264e62b9b703=
81ff970b816d728 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -335,6 +335,14 @@ Once the build process gets the sample file, it uses=
 ``sed`` to substitute final
>     version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/=
templates/default``
>     directory.
>=20=20
> +.. _structure-build-conf-bblock.conf:
> +
> +``build/conf/bblock.conf``
> +--------------------------
> +
> +This configuration file is generated by :doc:`bblock </dev-manual/bblock=
>` and
> +contains the signatures locked by ``bblock``.
> +
>  .. _structure-build-downloads:
>=20=20
>  ``build/downloads/``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index b24286813eafaa562f4ebd070190f1e97e0cf23c..3d2d3f95695c98e583377ef53=
92fdfe7fa0ab28e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7901,6 +7901,9 @@ system and gives an overview of their function and =
contents.
>       Then you can look at files in ``build/stamps/<arch>/bc`` and search=
 for the
>       file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b=
7c11dd9cda0d6f56fa1b7ce6f25f0``.
>=20=20
> +     Alternatively, you can also use :doc:`bblock </dev-manual/bblock>` =
to
> +     generate this line for you.
> +
>     :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
>       Specifies the debug level of task signature check. 3 levels are sup=
ported:
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

