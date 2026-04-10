Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEE6E9906B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:01:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153012.1775815302939274700
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 03:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b3RgR32n;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2beae348eso2014000e87.0
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 03:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815301; cv=none;
        d=google.com; s=arc-20240605;
        b=J0nKOISSyxWrxD+ZcgQtFdyDa7Do3QbXWZDKoRmVFiyq0nWhkDw3hFQiJszQBPOcyf
         ry9VwH6pqF2ES0YTMep64s0tarn21xIpoXs2LJbTXrjit7DZVUrVSMxJO29vtYxqppbW
         fEfoeVTp58tyRt5eNwLSut93+n16lwwfM4colY+Nt4ElSCuaWIuHHgm3k7suWVUmpstd
         GYoEHwFYeR/SESGYyKRVpgdvOT/m8OPfBSjJtCoBLbnZoSZ6/dMG1ph6GkpJ7h7Ia+Kv
         gycdXjwG4K32lfTRIW4Q8gRuUkl3dSvZ8AfBvdtrGRlfJqgFQdKzobHGDCRYqvxgttwp
         3j6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cxjqIHSR78btsry8xvTKnqunzqx4NqNaKLzfLyoPBRA=;
        fh=LKFIMfZfa7BHkMgJqICNWhKmtY/ACxMpPVhzKWCUZCE=;
        b=Q5aWy3j8OYHJyoHoH3ZuSOjm5rijBFx0RUeE3411yGzP53ypdUsBhdCDaag9aVrmfu
         qb+BalxyWMOr1eKHLBn38NUUowzEmTC+daWPJ3lSmAthR8gElcnK/uLSagStCGHrPhZi
         1oknQeNgtiuhU7eTTo4+6MbgVt42bxJ/V3VfOitBuc9bgfXXno1YxXck5legL6T9h92a
         m1zuHYxLusN7NKO/66eChgwjOjcf39WRlLA9ddkQy6AU07wW8Z6YZ1whWE5biQiOQE/k
         MPSdLPGWpuIlfvxJZz72Op2qSDtagYBkqt314bwJAjSoAuBC2ZKLSlxXVYMfoZmpIVL5
         OTbQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815301; x=1776420101; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxjqIHSR78btsry8xvTKnqunzqx4NqNaKLzfLyoPBRA=;
        b=b3RgR32nTNwoQDGNklP3OsStx7L5Nt0cJ66YytXKlH0mMwy93kHn7cYqKdh8fIyXml
         erjszkdtFtQkOjPhUYBdjGpnVuSwPUwSUOzqIJhWN+qHSK4JKQ5r6bKNKu3cdhrCRXaR
         PwEIbppqyHfOgBwIMWpG6og310pq117SmRxYsYm03djKF90ABH+SWAIEIEf2HpETxCos
         iR6LecvnAtRdPdyu/zBoSoJ3DMTaPLACS1u5tXo+EDKRu84Y77ZEI79YUicrk2AHS/mF
         hvxv06s11d+CcZW87CSaq4gX4ZR2rIKPiNCzYi192F0afQrlgHobXcP6pY7v3z/Bsdh4
         oolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815301; x=1776420101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxjqIHSR78btsry8xvTKnqunzqx4NqNaKLzfLyoPBRA=;
        b=JdxoXLxqECcOAL8kYf+AK8Z9Q2Ex3ADeMcoHk+FEakVTb3lYYzV8Fmu3cbxYMJ2kA/
         G1o+mj5DRaNKmAIdnSWJLmZQZkEl1aFfWRkadZGygnFG5AP8dR2qpeVNSvcmF6/vQzBG
         ZhDHNRBLAF50OIMkJi5IqlVUqNUJatDXhWWx0LzFCvmV+jrhbbrfFOA63xOhMbbXoeci
         7Wik8o8NOinNJ7Gaf3vgBidu3t78ZetNX0p5OFSAoHRUiu6wm3r/WoV6EMpJG+uM0txV
         2HYRre5J1pN2jeBJCEnkdtnoLGraTgr1xmaS9cKu668fqOOwYdGhOpwdNYWnzEkACYaT
         DCZA==
X-Gm-Message-State: AOJu0Yz9nv+69zxkdlRvk5GzEK0hn2BQQvZ7xQxLCuVwfytIeTSvBujQ
	84Qx1X2F2plFqALda9w4F20/dEzObmeTyMfo5IJ7UhHjQdE9umHL6MqYIvR6MBlED1Nqq7g0Hcj
	RQ9lhD3Sl8yXChk+6YTvNhqXP7t5b3E4=
X-Gm-Gg: AeBDiev3lEoVJRSuu+/3mZKaWvySAVIZuaf2wn18hj2jxES8iAbOMyUe9fd8YSXHu2j
	lz4Han37ZwtMESjGiyORtMp8gjpZFccV0l7URY5i3FiPKh/8Vp6h3sApQZpc3NXP2BsW8We7l7D
	1DhfKdwra8LtRv84qbkiOhEjikuQ8SKNfuCG59VnGAUWcqR11/xm7YZY4UyPSJFQ9eK5YDaL/ty
	Lil5noclw+h+GNdrtY4c1IfD0A1RnVDX1evlbfFvuUdy/N/uZqFXRr/PKVKOddgclJI/FhEOEIw
	n+Ur6wz9B0bfWrJnrAjBSO3gi5MVPyZaPxwyGOjjx9+2CK0Bxa35NFVECuczQyuyOg==
X-Received: by 2002:a05:6512:6d0:b0:5a2:a1d7:9cf5 with SMTP id
 2adb3069b0e04-5a3efb41b70mr1040164e87.14.1775815300603; Fri, 10 Apr 2026
 03:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260410093916.3788848-1-martin.jansa@gmail.com> <060888d0-0274-4876-82e9-bb2a071d338e@cherry.de>
In-Reply-To: <060888d0-0274-4876-82e9-bb2a071d338e@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 12:01:26 +0200
X-Gm-Features: AQROBzAA5-deUGIOckboDN14tQtvVbAc6kMk4r5e6_iGpIvVUFdAIQEhrDjWUqU
Message-ID: <CA+chaQcueymnjRoZiwCx2cxYRMsJc-e22+ys9DkqEvAw5PXbfQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: ubuntu_essential.sh: explicitly add libcrypt-dev
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 10:01:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9221

On Fri, Apr 10, 2026 at 11:48=E2=80=AFAM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi Martin,
>
> On 4/10/26 11:39 AM, Martin Jansa via lists.yoctoproject.org wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > In latest ubuntu-26.04 build-essential no longer installs libcrypt-dev
> > But virtual/crypt-native is in ASSUME_PROVIDED and is expected to be
> > usable for development.
> >
> > It used to be installed as build-essential -> libc6-dev -> libcrypt-dev=
,b
> > ut not anymore since 2.42-7:
> >
> > 25.10 questing with 2.42-0ubuntu3.1:
> > https://packages.ubuntu.com/questing/libc6-dev
>
> Broken link.

That's probably temporarily broken as it often returns 500 Internal
Server Error, but it was working link yesterday :).

> > 26.04 resolute with 2.43-2ubuntu1:
> > https://packages.ubuntu.com/resolute/libc6-dev
> >
> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2=
ubuntu1/changelog:
> > ...
> > glibc (2.42-7) unstable; urgency=3Dmedium
> >
> >    [ Aurelien Jarno ]
> >    * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt=
-dev
> >      dependency from libc6-dev. Thanks to Helmut Grohne for proposing t=
hat,
> >      doing an archive rebuild and filling the bug reports.
> >    * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap =
static
> >      probes.
> >    * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the remo=
val of
> >      the obsolete termio interface.  Closes: #1124068.
> >    * debian/rules.d/debhelper.mk: ensure that linker scripts work even =
when
> >      /usr is unmerged.  Closes: #1120508
> >    * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
> >      source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
> >      unpack-message-for-{orig,source} overrides, fixed in lintian 2.128=
.0.
> >    * debian/control.in/main: drop Rules-Requires-Root: no, this is now =
the
> >      default.
> >    * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: =
remove
> >      the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
> >    * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed w=
rt
> >      GLIBC_ABI_GNU_TLS.
> >
> >   -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +01=
00
> > ...
> >
> > Without libcrypt-dev installed on host building shadow-native will
> > fail with:
> >    checking for crypt in -lcrypt... no
> >    configure: error: crypt() not found
> > and python3-native with:
> >    The necessary bits to build these optional modules were not found:
> >    _crypt
> >    To find the necessary bits, look in configure.ac and config.log.
> >
>
> Note that we share the Ubuntu instructions with Debian (and for many
> different versions).
>
> On pkgs.org, libcrypt-dev exists for Debian Bullseye, Bookworm and Trixie=
.
> I manually installed the package on 22.04, 24.04, 25.04 and 25.10 and
> they all exist.

Yes, the package exists and will probably exist for a long time, it's
just not installed as build-essential dependency anymore.

