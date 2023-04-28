Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1937C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 07:19:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.13745.1682666342921794618
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 00:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1psINd-0002id-94; Fri, 28 Apr 2023 09:18:57 +0200
Received: from uol by pty.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1psINb-00CsmS-8O; Fri, 28 Apr 2023 09:18:55 +0200
References: <20230427155308.56744-1-michael.opdenacker@bootlin.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: michael.opdenacker@bootlin.com
Cc: Paul Eggleton <bluelightning@bluelightning.org>, "Michael Opdenacker via
 lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: expand init manager documentation
Date: Fri, 28 Apr 2023 09:11:26 +0200
In-reply-to: <20230427155308.56744-1-michael.opdenacker@bootlin.com>
Message-ID: <6redo4bhk0.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Apr 2023 07:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3877

Hi Michael,

On Thu, Apr 27 2023 at 17:53 +0200, "Michael Opdenacker via lists.yoctoproj=
ect.org" <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Add details about INIT_MANAGER
>   Correct the fact that "none" currently generates
>   an image with "sysvinit", at least on Poky.
>   This behaviour should probably be changed.
>
> - Expand the "Selecting an Initialization Manager" section.
>
> - Stop mentioning "rescue image" generation, as this
>   is not detailed anywhere else.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Paul Eggleton <bluelightning@bluelightning.org>
> ---
>  documentation/dev-manual/device-manager.rst |   2 +
>  documentation/dev-manual/init-manager.rst   | 108 +++++++++++++-------
>  documentation/ref-manual/variables.rst      |  31 ++++--
>  3 files changed, 98 insertions(+), 43 deletions(-)
>

[...]

>=20=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 01b710199d..acfdd7a544 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3959,16 +3959,33 @@ system and gives an overview of their function an=
d contents.
>     :term:`INIT_MANAGER`
>        Specifies the system init manager to use. Available options are:
>=20=20
> -      -  ``sysvinit`` - System V init (default for poky)
> -      -  ``systemd`` - systemd
> -      -  ``mdev-busybox`` - mdev provided by busybox
> -      -  ``none`` - no init manager
> +      -  ``sysvinit``
> +      -  ``systemd``
> +      -  ``mdev-busybox``
> +      -  ``none``
> +
> +      With ``sysvinit``, the init manager is set to
> +      :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
> +      system. This is the default choice in the Poky distribution, toget=
her with
> +      the Udev device manager (see the ":ref:`device-manager`" section).
> +
> +      With ``systemd``, the init manager becomes :wikipedia:`systemd <Sy=
stemd>`,
> +      which comes with the :wikipedia:`udev <Udev>` device manager.
> +
> +      With ``mdev-busybox``, the init manager becomes the must simpler B=
usyBox

here a typo probably slipped in:

  s/becomes the must simpler/becomes the much simpler/

> +      init, together with the BusyBox mdev device manager. This is the s=
implest
> +      and lightest solution, and probably the best choice for low-end sy=
stems
> +      with a rather slow CPU and a limited amount of RAM.
> +
> +      With ``none``, the init manager is also set to ``sysvinit``. This =
is the
> +      default setting in OpenEmbedded-Core. This option also selects the
> +      :wikipedia:`udev <Udev>` device manager.
>=20=20
>        More concretely, this is used to include
>        ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the =
global
> -      configuration. You can have a look at the ``conf/distro/include/in=
it-manager-*.inc``
> -      files for more information, and also the
> -      ":ref:`dev-manual/init-manager:selecting an initialization manager=
`"
> +      configuration. You can have a look at the
> +      :yocto_git:`meta/conf/distro/include/init-manager-*.inc </poky/tre=
e/meta/conf/distro/include>`
> +      files for more information, and also the ":ref:`init-manager`"
>        section in the Yocto Project Development Tasks Manual.
>=20=20
>     :term:`INITRAMFS_DEPLOY_DIR_IMAGE`

A nice refinement for the documentation - thanks!

Best regards
Ulrich
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

