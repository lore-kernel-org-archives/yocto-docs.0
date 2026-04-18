Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1314BF99C89
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 14:48:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68160.1776523703891641718
 for <docs@lists.yoctoproject.org>;
 Sat, 18 Apr 2026 07:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1wE6y6-0005yr-0E; Sat, 18 Apr 2026 16:48:22 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1wE6y5-0061Vz-0W;
	Sat, 18 Apr 2026 16:48:21 +0200
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1wE6y5-00000000GKz-0EAn;
	Sat, 18 Apr 2026 16:48:21 +0200
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: "Antonin Godard via lists.yoctoproject.org"
 <antonin.godard=bootlin.com@lists.yoctoproject.org>
Cc: docs@lists.yoctoproject.org,  antonin.godard@bootlin.com,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH] Document shared state signing
In-Reply-To: <20260417-sstate-signing-v1-1-5df11613249e@bootlin.com> (Antonin
	Godard via lists yoctoproject org's message of "Fri, 17 Apr 2026
	15:30:23 +0200")
References: <20260417-sstate-signing-v1-1-5df11613249e@bootlin.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 18 Apr 2026 16:48:21 +0200
Message-ID: <6reckcnx3e.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 18 Apr 2026 14:48:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9277

Hi Antonin,

didn't know that we can sign the sstate - thanks for writing things down!
Just a few typos.

On Fri, Apr 17 2026 at 15:30 +0200, "Antonin Godard via lists.yoctoproject.=
org" <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> Document the shared state signing feature. Add a new document in the
> Security manual, and definitions for the variables involved in this
> process in the variable glossary.
>
> [YOCTO #15217]
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/overview-manual/concepts.rst       |   6 +
>  documentation/ref-manual/variables.rst           |  50 +++++
>  documentation/security-manual/index.rst          |   1 +
>  documentation/security-manual/sstate-signing.rst | 272 +++++++++++++++++=
++++++
>  4 files changed, 329 insertions(+)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
> index ab723d7c3..f0b336226 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1240,6 +1240,12 @@ variable is the function that determines whether a=
 given dependency
>  needs to be followed, and whether for any given relationship the
>  function needs to be passed. The function returns a True or False value.
>
> +.. note::
> +
> +   Is is possible to sign these artifacts with :wikipedia:`GPG
> +   <GNU_Privacy_Guard>`. See :doc:`/security-manual/sstate-signing` in t=
he Yocto
> +   Project Security Manual for more information.
> +
>  Images
>  ------
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 317b75913..7387a5d25 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10097,6 +10097,25 @@ system and gives an overview of their function a=
nd contents.
>
>        For details on the process, see the :ref:`ref-classes-staging` cla=
ss.

[...]

> +   :term:`SSTATE_VERIFY_SIG`
> +      The :term:`SSTATE_VERIFY_SIG` variable controls whether to enable =
of
> +      disable the :ref:`shared state <overview-manual/concepts:setscene =
tasks

s/whether to enable of disable/whether to enable or disable/

> +      and shared state>` artifacts signing feature.

[...]

> diff --git a/documentation/security-manual/sstate-signing.rst b/documenta=
tion/security-manual/sstate-signing.rst
> new file mode 100644
> index 000000000..1845b890f
> --- /dev/null
> +++ b/documentation/security-manual/sstate-signing.rst
> @@ -0,0 +1,272 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Shared State Signing
> +********************
> +
> +The :term:`OpenEmbedded Build System` build system has a built-in mechan=
ism
> +allowing to save execution time by re-using pre-built artifacts: the
> +:ref:`shared state cache (sstate cache) <overview-manual/concepts:shared=
 state
> +cache>`. These artifacts are stored in a directory (:term:`SSTATE_DIR`) =
are not
> +signed by default.

The last sentence probably misses a conjunction, what about

s/are not signed by default/and are not signed by default/ ?

> +
> +This document goes through the steps to enable shared state signing.
> +This feature is fully dependent on :wikipedia:`GPG <GNU_Privacy_Guard>`,=
 meaning
> +examples shown in this document will use the ``gpg`` command-line tool.

[...]

> +Shared State Location
> +---------------------
> +
> +Our build system needs to be configured to sign new sstate artifacts whe=
n they
> +are generated. The generation of new artifacts is done once a task has f=
inished
> +being executed.
> +
> +For the following sections let's assume that our build system has the sh=
ared
> +state directory location (:term:`SSTATE_DIR`) defined as follows::
> +
> +   SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
> +
> +Assuming this directory and our temporary directory (:term:`TMPDIR`) is =
empty,

s/is empty/are empty/

> +as an example throughout this document, let's run the ``create_recipe_sp=
dx``
> +task of the ``gettext-minimal-native`` recipe:
> +
> +.. code-block:: console
> +
> +   $ bitbake gettext-minimal-native -c create_recipe_spdx
> +
> +After execution, our shared state directory should be populated with new=
 files:
> +
> +.. code-block:: console
> +
> +   $ find $BUILDDIR/sstate-cache/ -name "*gettext-minimal-native*create_=
recipe_spdx*"
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-lin=
ux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978=
b2b3b617a_create_recipe_spdx.tar.zst
> +   sstate-cache/universal/a3/6e/sstate:gettext-minimal-native:x86_64-lin=
ux:1.0:r0:x86_64:14:a36ef66df6b8c0cb5a849bc70a99dcfd61e4bacd11cefe6bbaf4978=
b2b3b617a_create_recipe_spdx.tar.zst.siginfo

[...]

> +Verifying Signed Shared State Artifacts
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Now that we have setup our build to sign shared state artifacts,
> let's see how

s/we have setup our build/we have set up our build/

> +we can verify them with the public key counterpart of the private key.
> +
> +.. note::
> +
> +   Signature of shared state and its verification can happen on two diff=
erent
> +   hosts, meaning one host can be in charge of the signature while anoth=
er only
> +   verifies the artifacts. This is preferred as the private key should n=
ot be
> +   shared spread on multiple hosts.

[...]

> +   As you can see, this does not prevent :term:`BitBake` from continuing=
, but
> +   the the real task is executed instead of re-using the shared state.

s/but the the real task/but the real task/

Best regards,
Ulrich


>
> ---
> base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
> change-id: 20260417-sstate-signing-f96c75ce1917
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9276): https://lists.yoctoproject.org/g/docs/message/=
9276
> Mute This Topic: https://lists.yoctoproject.org/mt/118875161/3618626
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [u.oelmann@pengu=
tronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

