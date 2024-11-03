Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA70D1118F
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 19:37:48 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.42355.1730662660423033869
 for <docs@lists.yoctoproject.org>;
 Sun, 03 Nov 2024 11:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t7gPq-0004of-VJ; Sun, 03 Nov 2024 20:37:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t7gPp-001rgK-2g;
	Sun, 03 Nov 2024 20:37:37 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1t7gPp-00Bh4m-2P;
	Sun, 03 Nov 2024 20:37:37 +0100
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: "Julien Stephan" <jstephan@baylibre.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 4/5] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
In-Reply-To: <20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com>
	(Julien Stephan's message of "Thu, 31 Oct 2024 17:56:19 +0100")
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
	<20241031-add-bblock-documentation-v1-4-32b89093bbda@baylibre.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Sun, 03 Nov 2024 20:37:37 +0100
Message-ID: <6rses8t8fy.fsf@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Sun, 03 Nov 2024 19:37:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5644

Hi Julien,

thanks for your documentation work!
Please find some typo fixes below.

On Thu, Oct 31 2024 at 17:56 +0100, "Julien Stephan" <jstephan@baylibre.com=
> wrote:
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
>
> +   :term:`SIGGEN_LOCKEDSIGS`
> +     The list of locked taks, with the form::
> +
> +       SIGGEN_LOCKEDSIGS +=3D "<package>:<task>:<signature>"
> +
> +     If ``<signature>`` exists for the specified ``<task>`` and ``<packa=
ge>``
> +     in sstate, BitBake will use the cached output instead of rebuilding=
 the
> +     ``<task>``. If it does not exist, BitBake will build the ``<task>``=
 and
> +     the sstate will be used next time.
> +
> +   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
> +     Specifies the debug level of task signature check. 3 levels are sup=
ported:
> +
> +     * info: displays a "Note" message to remind user that a task is loc=
ked

s/to remind user/to remind the user/

> +       and current signature matches the locked one.

s/and current signature/and the current signature/

> +     * warn: displays a "Warning" message if a task is locked and current

s/and current/and the current/

> +       signature does not match the locked one.
> +     * error: same as warn but displays an =E2=80=9CError=E2=80=9D messa=
ge and abort.

s/and abort./and aborts./

> +
> +   :term:`SIGGEN_LOCKEDSIGS_TYPES`
> +     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly used
> +     for achitecture specific lock. A common value for :term:`SIGGEN_LOC=
KEDSIGS_TYPES`

s/for achitecture specific lock./for achitecture specific locks./

Best regards
Ulrich

> +     is ``${PACKAGE_ARCHS}``::
> +
> +       SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"
> +
> +       SIGGEN_LOCKEDSIGS_core2-64 +=3D "bc:do_compile:abcd"
> +       SIGGEN_LOCKEDSIGS_cortexa57 +=3D "bc:do_compile:efgh"
> +
> +     Here, the ``do_compile`` task from ``bc`` will be locked only for
> +     ``x86-64`` and ``arm64`` but not for other architectures such as
> +     ``qemumips``.
> +
>     :term:`SITEINFO_BITS`
>        Specifies the number of bits for the target system CPU. The value
>        should be either "32" or "64".
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

