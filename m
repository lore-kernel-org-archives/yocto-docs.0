Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65819C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 11:13:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.47478.1744629174008415844
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 04:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1u4HkB-0002NR-QE; Mon, 14 Apr 2025 13:12:51 +0200
Message-ID: <08183d24de0d86a03d25c13dc01166389ebfe5ad.camel@pengutronix.de>
Subject: Re: [docs] [PATCH v2 12/12] migration-guides/release-notes-5.2:
 update for upcoming 5.2 release
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexander Sverdlin
 <alexander.sverdlin@siemens.com>, PTX-Internal Yocto List
 <yocto@pengutronix.de>
Date: Mon, 14 Apr 2025 13:12:50 +0200
In-Reply-To: <20250325-release-note-5-2-updates-v2-12-19f050d61da3@bootlin.com>
References: 
	<20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
	 <20250325-release-note-5-2-updates-v2-12-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Apr 2025 11:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6740

Am Dienstag, dem 25.03.2025 um 10:20 +0100 schrieb Antonin Godard via lists=
.yoctoproject.org:
> --=C2=A0 Miscellaneous changes:
> +-=C2=A0 Systemd related changes:
> =C2=A0
> -=C2=A0=C2=A0 -=C2=A0 ``bluez``: fix mesh build when building with musl.
> +=C2=A0=C2=A0 -=C2=A0 ``systemd``:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 set better sane time at startup b=
y creating the ``clock-epoch`` file in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``${libdir}`` if the ``=
set-time-epoch`` :term:`PACKAGECONFIG` config is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 really disable Predictable Networ=
k Interface names if the ``pni-names``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature is not part of =
:term:`DISTRO_FEATURES`. Previously it was only
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 really disable for QEMU=
 machines.

( s/disable/disabled/ )

Quick question: My understanding (and observation) is that not having 'pni-=
names' set in
DISTRO_FEATURES (which will be the default for almost everyone) will change=
 the network naming to
'non predictable' now, correct?
For me, this is quite unexpected and requires me to add 'pni-name' to keep =
the original behavior.
Shouldn't we then at least add this as a hint to the migration notes?

Regards, Enrico

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 split ``networkd`` into its own p=
ackage named ``systemd-networkd``.
> =C2=A0
> =C2=A0=C2=A0=C2=A0 -=C2=A0 ``systemd-bootchart``: now supports the 32-bit=
 *riscv* architecture.
> =C2=A0
> =C2=A0=C2=A0=C2=A0 -=C2=A0 ``systemd-boot``: now supports the *riscv* arc=
hitecture.
> =C2=A0
> +=C2=A0=C2=A0 -=C2=A0 ``systemd-serialgetty``:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 the recipe no longer sets a defau=
lt value for
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`SERIAL_CONSOLES`=
, and uses the one set in ``bitbake.conf``.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 the recipe no longer ships a copy=
 of the ``serial-getty@.service`` as
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is provided by syste=
md directly.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Don't set a default :term:`SERIAL=
_CONSOLES` value in the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``systemd-serialgetty``=
 recipe and take the global value that should
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 already be set.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Replace custom unit files by exis=
ting unit files provided in the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd source code.
> +
> +=C2=A0=C2=A0 -=C2=A0 User unit supports was improved. All the user units=
 are now enabled by
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default.
> +
> +=C2=A0=C2=A0 -=C2=A0 The custom implementation of ``systemctl`` in :term=
:`OpenEmbedded-Core
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (OE-Core)` was removed to use the upstrea=
m one. This ``systemctl`` binary
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is now compiled and used for systemd-rela=
ted operations.
> +
> +-=C2=A0 :ref:`ref-classes-sanity` class changes:
> +
> +=C2=A0=C2=A0 -=C2=A0 Add a sanity check to validate that the C++ toolcha=
in is functional on the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host.
> +
> +=C2=A0=C2=A0 -=C2=A0 Add a sanity check to verify that :term:`TOPDIR` do=
es not contain
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 non-ASCII characters, as it may lead to u=
nexpected build errors.
> +
> +-=C2=A0 Miscellaneous changes:
> +
> +=C2=A0=C2=A0 -=C2=A0 ``bluez``: fix mesh build when building with musl.
> +
> =C2=A0=C2=A0=C2=A0 -=C2=A0 ``python3-pip``: the ``pip`` executable is now=
 left and not deleted, and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be used instead of ``pip3`` and =
``pip2``.
> =C2=A0
> @@ -326,7 +550,8 @@ New Features / Enhancements in |yocto-ver|
> =C2=A0=C2=A0=C2=A0 -=C2=A0 :term:`SOLIBSDEV` and :term:`SOLIBS` are now d=
efined for the *mingw32*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 architecture (``.dll``).
> =C2=A0
> -=C2=A0=C2=A0 -=C2=A0 :ref:`rootfs-postcommands <ref-classes-rootfs*>`: m=
ake opkg status reproducible.
> +=C2=A0=C2=A0 -=C2=A0 :ref:`rootfs-postcommands <ref-classes-rootfs*>`: m=
ake ``opkg`` status
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reproducible.
> =C2=A0
> =C2=A0=C2=A0=C2=A0 -=C2=A0 The default :term:`KERNEL_CONSOLE` value is no=
 longer ``ttyS0`` but the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first entry from the :term:`SERIAL_C=
ONSOLES` variable.
> @@ -364,13 +589,11 @@ New Features / Enhancements in |yocto-ver|
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``virtual-x-terminal-emulator`` runt=
ime provider with
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`PREFERRED_RPROVIDER`.
> =C2=A0
> -=C2=A0=C2=A0 -=C2=A0 ``systemd``: set better sane time at startup by cre=
ating the
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``clock-epoch`` file in ``${libdir}`` if =
the ``set-time-epoch``
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`PACKAGECONFIG` config is set.
> -
> =C2=A0=C2=A0=C2=A0 -=C2=A0 ``cve-update-nvd2-native``: updating the datab=
ase will now result in an
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error if :term:`BB_NO_NETWORK` is en=
abled and
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`CVE_DB_UPDATE_INTERVAL` is not set=
 to ``-1``.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`CVE_DB_UPDATE_INTERVAL` is not set=
 to ``-1``. Users can control the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVD database source using the :term:`NVD_=
DB_VERSION` variable with
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 possible values ``NVD1``, ``NVD2``, or ``=
FKIE``.
> =C2=A0
> =C2=A0=C2=A0=C2=A0 -=C2=A0 ``systemtap``: add ``--with-extra-version=3D"o=
e"`` configure option to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 improve the reproducibility of the r=
ecipe.
> @@ -398,6 +621,65 @@ New Features / Enhancements in |yocto-ver|
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``seat`` group to be able to properl=
y establish connection between the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Weston and the ``seatd`` socket.
> =C2=A0
> +=C2=A0=C2=A0 -=C2=A0 ``webkitgtk``:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Fix build on 32bit arches with 64=
bit ``time_t`` only.
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 Disable JIT on RISCV64.
> +
> +=C2=A0=C2=A0 -=C2=A0 :ref:`ref-classes-report-error`: Add :term:`PN` to =
error report files.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``initrdscripts``: add UBI support for mounting a l=
ive ``ubifs`` rootfs.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``uboot-extlinux-config.bbclass``: add support for =
device tree overlays.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``glibc``: add ``ld.so.conf`` to :term:`CONFFILES`.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``udev-extraconf``: Allow FAT mount group to be spe=
cified with
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`MOUNT_GROUP`.
> +
> +=C2=A0=C2=A0 -=C2=A0 New ``bbverbnote`` log utility which can be used to=
 print on the console
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (equivalent to the ``bb.verbnote`` Python=
 implementation).
> +
> +=C2=A0=C2=A0 -=C2=A0 :ref:``ref-classes-grub-efi``: Add :term:`GRUB_TITL=
E` variable to set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 custom GRUB titles.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``gawk``: Enable high precision arithmetic support =
by default (``mpfr``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled by default in :term:`PACKAGECONFI=
G`).
> +
> +=C2=A0=C2=A0 -=C2=A0 ``licenses``: Map the license ``SGIv1`` to ``SGI-Op=
enGL``, as ``SGIv1`` is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not an SPDX license identifier.
> +
> +=C2=A0=C2=A0 -=C2=A0 Configuration files for the `b4 <https://b4.docs.ke=
rnel.org>`__
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 command-line tool was added to the differ=
ent Yocto Project and OpenEmbedded
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repositories.
> +
> +=C2=A0=C2=A0 -=C2=A0 :ref:`ref-classes-kernel-fitimage`: handle :doc:`mu=
lticonfig
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </dev-manual/multiconfig>` dependency whe=
n
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`INITRAMFS_MULTICONFIG` is set.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``psplash``: when using the ``systemd`` feature fro=
m
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`DISTRO_FEATURES`, start the ``pspl=
ash`` service when the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``/dev/fb0`` framebuffer is detected with=
 Udev.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``gdb``: is now compiled with xz support by default=
 (``--with-lzma``).
> +
> +=C2=A0=C2=A0 -=C2=A0 ``busybox``: drop net-tools from the default ``defc=
onfig``, since these tools
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (``ifconfig``, etc.) have been deprecated=
 since `2009
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <https://lists.debian.org/debian-devel/20=
09/03/msg00780.html>`__.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``perf`` is built with ``zstd`` in :term:`PACKAGECO=
NFIG` by default.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``boost``: add ``charconv`` to built libraries by d=
efault.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``mirrors``: rationalise Debian mirrors to point at=
 the canonical server
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (deb.debian.org) instead of country speci=
fic ones. This server is backed
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by a :wikipedia:`CDN <Content_delivery_ne=
twork>` to properly balance the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 server load.
> +
> +=C2=A0=C2=A0 -=C2=A0 ``lib: sbom30``: Add action statement for affected =
VEX statements with
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Mitigation action unknown", as these are=
 not tracked by the existing
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code.
> =C2=A0
> =C2=A0Known Issues in |yocto-ver|
> =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6624): https://lists.yoctoproject.org/g/docs/message/=
6624
> Mute This Topic: https://lists.yoctoproject.org/mt/111893964/3616721
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub=C2=A0[ejo@pengut=
ronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

