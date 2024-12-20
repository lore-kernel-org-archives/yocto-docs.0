Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DAEE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 11:08:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.149776.1734692903287272292
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 03:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bQowKMn8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CBDEC0007;
	Fri, 20 Dec 2024 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734692901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8G6lubhP+y8e4AZQ+BnsUr0VmHd6GHxT5e7OS0wGpD8=;
	b=bQowKMn8lsnqB1rICXso67joddiZc4Om8PXP9i0YLqwbWrI9JcvigYEzuy38OIX4r+rikW
	6Nc+Pm37qlTxz8EUd0yX1HTTHbCqiasIffuqSlyCndGake7nkokcAaj1jLNq5o7P/P9B0d
	czAfzMzDqGyVQvA7ojPaZAOYFHkEfzf9fgRKRwm1pioIyFgkG0RALm3OwsVZKzVuGTu30h
	ukdElR7nQMYygd4BtM0aNvRO65Uuvun8EM+lbdrXaw58SU5/nuOVTwGnh85x50DA3GXiI3
	9icPOuSLsmH3x2uPOuRd3qEodg9nw4aQkSgm1HP/KPoyR37qBLcrVPEpi2fPqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 12:08:21 +0100
Message-Id: <D6GHB9ATOYPG.LWUCIA5315XZ@bootlin.com>
Subject: Re: [docs][PATCH v2] reproducible-builds.rst: show how to build a
 single package
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241219145225.3367912-1-tgamblin@baylibre.com>
In-Reply-To: <20241219145225.3367912-1-tgamblin@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 11:08:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5997

Hi Trevor,

On Thu Dec 19, 2024 at 3:52 PM CET, Trevor Gamblin wrote:
> Add a bit to the "Can we prove the project is reproducible?" section to
> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
> package (rather than the world build), as this may be useful for
> maintainers.
>
> [YOCTO #15619]
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 adds the Bugzilla ID to the commit message, since this is logged in th=
e
> system already.
>
>  .../test-manual/reproducible-builds.rst       | 22 +++++++++++++------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/test-manual/reproducible-builds.rst b/document=
ation/test-manual/reproducible-builds.rst
> index 91f94a5c7..d581155eb 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -91,13 +91,21 @@ run::
> =20
>     oe-selftest -r reproducible.ReproducibleTests.test_reproducible_build=
s
> =20
> -This defaults to including a ``world`` build so, if other layers are add=
ed, it would
> -also run the tests for recipes in the additional layers. Different build=
 targets
> -can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` variable =
in ``local.conf``.
> -The first build will be run using :ref:`Shared State <overview-manual/co=
ncepts:Shared State>` if
> -available, the second build explicitly disables
> -:ref:`Shared State <overview-manual/concepts:Shared State>` except for r=
ecipes defined in
> -the :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds o=
n the
> +This defaults to including a ``world`` build so, if other layers are add=
ed, it
> +would also run the tests for recipes in the additional layers. Different=
 build
> +targets can be defined using the :term:`OEQA_REPRODUCIBLE_TEST_TARGET` v=
ariable
> +in ``local.conf``. For example, running reproducibility tests for only t=
he
> +``python3-numpy`` recipe can be done by setting::
> +
> +   OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-numpy"
> +
> +in local.conf before running the ``oe-selftest`` command shown above.
> +
> +Reproducibility builds the target list twice. The first build will be ru=
n using
> +:ref:`Shared State <overview-manual/concepts:Shared State>` if available=
, the
> +second build explicitly disables :ref:`Shared State
> +<overview-manual/concepts:Shared State>` except for recipes defined in t=
he
> +:term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS` variable, and builds on th=
e
>  specific host the build is running on. This means we can test reproducib=
ility
>  builds between different host distributions over time on the Autobuilder=
.

Not for this patch but I think there should be a :term: for the Autobuilder=
, for
the people not aware of what it is.

I'll take a note of this.

Otherwise:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


