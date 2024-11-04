Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A72D132C4
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 13:32:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.57455.1730727157774081661
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 05:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JJMmkqxw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FE9D60006;
	Mon,  4 Nov 2024 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730727155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COfiAGPzY0izR/O3moFuQupM56/rey5yORdJ6GZI474=;
	b=JJMmkqxwoGrVqDladUuh+mJUej+vTO7LqSQtACmSyFxOagWmFrKNwMcdFc7Bv8maei0DJt
	KRWRGD+uJvn6lxtryGrhrCZv9SDBtEMacGsIlPulCSs5YUM6QqfOj7UA6b148TLfSUPv4a
	ERODm9LrUQrYVOr74Hrt9GI6cIqhbRVAkMqOjN7dEF/7efA77cIA6E5taOGh+uiLvCqSfV
	3RyPDv1HN57S6WZxeSFVjvjW3l4Bcuca36We1ZKBAYJLrw7XwsBFdmeYAaMtb9Qnp6ZvcW
	Ur8hkUBD2priOqBLIsun1ETshnYzLwZmsFoc9Z7eLCTas7fwfBnZEPSm2jKW6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 14:32:35 +0100
Message-Id: <D5DFKMTI5D6B.3I1ZUOVA7YSR3@bootlin.com>
Subject: Re: [docs] [PATCH 4/5] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com> <20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 13:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5657

Hi Julien,

On top of Ulrich's comments, here are my suggestions/corrections:

On Thu Oct 31, 2024 at 5:56 PM CET, Julien Stephan wrote:
> Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
> SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
> signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
> documentation for them.
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  documentation/ref-manual/variables.rst | 33 ++++++++++++++++++++++++++++=
+++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 07ed143ac5606617c720301ac6621355a341f90a..8cfb978e795e43e3ef25f3e18=
e11baf7c2a28d54 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7880,6 +7880,39 @@ system and gives an overview of their function and=
 contents.
>           might break at runtime if the interface of the recipe was chang=
ed
>           after the other had been built.
> =20
> +   :term:`SIGGEN_LOCKEDSIGS`
> +     The list of locked taks, with the form::
> +
> +       SIGGEN_LOCKEDSIGS +=3D "<package>:<task>:<signature>"
> +
> +     If ``<signature>`` exists for the specified ``<task>`` and ``<packa=
ge>``

How would I find such a signature by hand? Maybe worth explaining it here?

> +     in sstate, BitBake will use the cached output instead of rebuilding=
 the
> +     ``<task>``. If it does not exist, BitBake will build the ``<task>``=
 and
> +     the sstate will be used next time.

Could you give a real-life example of that at the end here?

> +   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
> +     Specifies the debug level of task signature check. 3 levels are sup=
ported:
> +
> +     * info: displays a "Note" message to remind user that a task is loc=
ked
> +       and current signature matches the locked one.
> +     * warn: displays a "Warning" message if a task is locked and curren=
t
> +       signature does not match the locked one.
> +     * error: same as warn but displays an =E2=80=9CError=E2=80=9D messa=
ge and abort.

For "info", "warn" and "error" could you enclose that in double ticks? ``in=
fo``
and so on.

> +   :term:`SIGGEN_LOCKEDSIGS_TYPES`
> +     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly use=
d
> +     for achitecture specific lock. A common value for :term:`SIGGEN_LOC=
KEDSIGS_TYPES`

s/achitecture/architecture/

By "mainly", do you mean "only" or could there by anything other than
architectures covered by the variable?

> +     is ``${PACKAGE_ARCHS}``::
> +
> +       SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> +
> +       SIGGEN_LOCKEDSIGS_core2-64 +=3D "bc:do_compile:abcd"
> +       SIGGEN_LOCKEDSIGS_cortexa57 +=3D "bc:do_compile:efgh"

Maybe real hashes would be better here

> +
> +     Here, the ``do_compile`` task from ``bc`` will be locked only for
> +     ``x86-64`` and ``arm64`` but not for other architectures such as

Wouldn't it be locked for ``core2-64`` and ``cortexa57`` more specifically?=
 I
might misunderstand something here. :)

> +     ``qemumips``.
> +
>     :term:`SITEINFO_BITS`
>        Specifies the number of bits for the target system CPU. The value
>        should be either "32" or "64".

Also I could suggest splitting the series in patches for sphinx-lint/vale a=
nd
patches for documentation of variables/bblock.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


