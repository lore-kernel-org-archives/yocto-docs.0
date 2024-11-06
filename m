Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED229D29FB0
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:31:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.40613.1730878283345506916
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QXvbJZue;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5B401BF203;
	Wed,  6 Nov 2024 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730878281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pr482Fuyaq8xCp+5mYuERVmBDREzkIteL+FF2Up4iz8=;
	b=QXvbJZueez7oJXVjkQ19Wsnm2SA66Oph5rpMRXWNZtQbUO8EhS8IN5qUFxhDVWBpW9oO/A
	pYlz5epvVraqipk2bW5tQhXUqYc3p2H/wKalb2JZ7g4ivp4uzgeCWspkmqnc+tR4f3QaFN
	Z49cLA8J0mh8/bVeUR8XantQqBcSI0creYXPXTSnZRc7GBIiKpJ6SR6dMDJaXUuNjna4Qg
	9cB/Qb5W5W7WY7n5zLHxE3nGy7mLUKzy85WWTygi1O/MXi/LKQKV3c3aHAxdxu3Oe8cs7P
	2yZDIxkJ1yOxWvdRko/2bhNRwaf0LWpdX9W4RRGHFgZz4Pba644gWBHPzscN5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 08:31:20 +0100
Message-Id: <D5EX54T01ETH.3TXXZ6CRFZXYF@bootlin.com>
Subject: Re: [docs] [PATCH v3 2/3] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com> <20241105-add-bblock-documentation-v3-2-b870ded39a2d@baylibre.com>
In-Reply-To: <20241105-add-bblock-documentation-v3-2-b870ded39a2d@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:31:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5683

Hi Julien,

On Tue Nov 5, 2024 at 9:17 AM CET, Julien Stephan wrote:
> Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
> SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
> signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
> documentation for them.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 07ed143ac5606617c720301ac6621355a341f90a..b24286813eafaa562f4ebd070=
190f1e97e0cf23c 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7880,6 +7880,50 @@ system and gives an overview of their function and=
 contents.
>           might break at runtime if the interface of the recipe was chang=
ed
>           after the other had been built.
> =20
> +   :term:`SIGGEN_LOCKEDSIGS`
> +     The list of locked taks, with the form::

s/taks/tasks/

> +
> +       SIGGEN_LOCKEDSIGS +=3D "<package>:<task>:<signature>"
> +
> +     If ``<signature>`` exists for the specified ``<task>`` and ``<packa=
ge>``
> +     in sstate, BitBake will use the cached output instead of rebuilding=
 the

s/in sstate/in the sstate cache/ to use "the sstate cache" everywhere.

> +     ``<task>``. If it does not exist, BitBake will build the ``<task>``=
 and
> +     the sstate will be used next time.

s/the sstate/the sstate cache/

> +
> +     Example::
> +
> +       SIGGEN_LOCKEDSIGS +=3D "bc:do_compile:09772aa4532512baf96d433484f=
27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
> +
> +     To obtain the signature, you can dump all ``bc``'s tasks signature =
using::

To avoid repeating "signature" here, what about:

"""
You can obtain the signature of all the tasks for the recipe ``bc`` using::
"""

> +
> +       bitbake -S none bc
> +
> +     Then you can look at files in ``build/stamps/<arch>/bc`` and search=
 for the
> +     file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b=
7c11dd9cda0d6f56fa1b7ce6f25f0``.
> +
> +   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
> +     Specifies the debug level of task signature check. 3 levels are sup=
ported:
> +
> +     * ``info``: displays a "Note" message to remind the user that a tas=
k is locked
> +       and the current signature matches the locked one.
> +     * ``warn``: displays a "Warning" message if a task is locked and th=
e current
> +       signature does not match the locked one.
> +     * ``error``: same as warn but displays an =E2=80=9CError=E2=80=9D m=
essage and aborts.

Nit but the quotes here are different from the ones above (=E2=80=9C=E2=80=
=9D !=3D "").

> +
> +   :term:`SIGGEN_LOCKEDSIGS_TYPES`
> +     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly use=
d
> +     for architecture specific locks. A common value for
> +     :term:`SIGGEN_LOCKEDSIGS_TYPES` is ``${PACKAGE_ARCHS}``::
> +
> +       SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> +
> +       SIGGEN_LOCKEDSIGS_core2-64 +=3D "bc:do_compile:09772aa4532512baf9=
6d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
> +       SIGGEN_LOCKEDSIGS_cortexa57 +=3D "bc:do_compile:12178eb6d55ef602a=
8fe638e49862fd247e07b228f0f08967697b655bfe4bb61"
> +
> +     Here, the ``do_compile`` task from ``bc`` will be locked only for
> +     ``core2-64`` and ``cortexa57`` but not for other architectures such=
 as
> +     ``mips32r2``.
> +
>     :term:`SITEINFO_BITS`
>        Specifies the number of bits for the target system CPU. The value
>        should be either "32" or "64".

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


