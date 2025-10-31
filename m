Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B6ACCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:08:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.19164.1761926896727642119
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 09:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lz1ZDNhc;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87c13813464so36946666d6.1
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761926896; x=1762531696; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H6NSOUNMfF2tsRnQeRVjjVsuVG5YBUSiEsIOZrkpISY=;
        b=Lz1ZDNhcbtmDQWl1usw7G+1tnPLJgRaqiu+/QWbkP/CmNOwOlWdOX0abiV/R1MBZSd
         xPoDvjWm2sr2w6x6szMjUCpI40abdeVTut93fO4QuhFCtZ1PgpjZP9Sl/8Jrv8Ge6u33
         p95GLs8qISYDHmbNW/TIDA0CZ7WULQhl3r5gBEslleShw6Ou+iZiDKGB6EDNPXd7IRr8
         4Hg9l3Br1KUxIDYOw7jnj+gV62rbe3xnYASeHzIGJ674IdNFrym+WGso/u+7r/2jYBhb
         a7eNt/jLOeQ2c63s5ExoZY+oFpc5dE1Cmc9GhN83MW52TdbsYfnuKinxQb3P4lHEE5pI
         xmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761926896; x=1762531696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6NSOUNMfF2tsRnQeRVjjVsuVG5YBUSiEsIOZrkpISY=;
        b=n4r3+ixEJQ0S2IHiRzgJnfO2oQW5ujLGlKiQnVjCG0Bw9tIXuIMC1KkOavrwR8pmI4
         Q5SPQqSANx+YkaY6EM8W0AT/m3SNno2iG/9uLEEOXgS6kd0gCCBVX0Ct2r+HnUKPRv2r
         Ct+98rhpZNrWRScefpuWrSAnouSMBbByxt1Rp7lZB5jMGnJlKbgs4Hka5pUipToboiU3
         qeUHZSqZPxElgXGjy+/VH9WxO3Le7BLIzdhrAFxjTsDYEDArlnb72pWmUqrXu2Hk61NK
         Pc4uEWWrWl9hOwEnGhP6aeJnn/KEU6X+hB778ZoZz2YQE98ll88Q7XK5mH3JNULdYHnN
         tCgA==
X-Gm-Message-State: AOJu0Yzq4sD4rXRCIOKxiS4CMC6tLFdju4HrlHorwnM48OJVvwAtnI+j
	BpkDKYg2+/rFwcl21xdblDWF+4y+Z14Yg3zzl2nI7df8EmcR5uJqUguAMNkQl33Ry3qRiIEwk1+
	1M9OTTfvihxO4j94qJdI2nYYC7BGd3Bs=
X-Gm-Gg: ASbGnct0U6sg/RWshlZVTpnpoPBMPsNiMxlzrYoe7oGTDGM5itImP7pqEYcphoRSx2Y
	hfuw+3+4HDUN1TZt+o6V5YC6DGKLq6oQpkvlgmeQRJUZ7mLoYvaVYyvEt8NRHO6I6zDiVQt1rop
	V2nKvfpOIttLrfQNew1eLrKIJQcDrb5HsJuEGv3Lr70SL41oqPWpB4Y9X5F1+cBDCtJTUOuGid0
	WaGKVHIeIB/ifvhFx4q7o2oLedpSwyxqUodNdXfum8iOwScfq1KL/9hWHf0gVmHSormun6zbPtp
	YAPJR0T6yHD1nhYoiuoY88Jro3Rk3dK7CjitPX8IhUn6eod2WWzNFCVYfKEN3CXN0lGR
X-Google-Smtp-Source: AGHT+IGMh3bu7cYSqoKPQqKH2SmMKzOZ2AZJ5b9/1CYoJ1g89f/m6nz+TQjwOwLaamw2aLmqy9yp5aK7rCMfyr2hheU=
X-Received: by 2002:ad4:5bec:0:b0:87d:ff71:8fe6 with SMTP id
 6a1803df08f44-8802f2fe005mr45074416d6.24.1761926895638; Fri, 31 Oct 2025
 09:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:08:03 +0100
X-Gm-Features: AWmQ_bnwswLtDo53eE5ZPOSt7gbuYJY77SX4mwGWdp_vH5YPgSAP1nYqejfLO9A
Message-ID: <CANNYZj8=Fvwcqf+Mei7DoH1egppRtdmTb7S6EcnpESMh3+z+EQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/6] brief-yoctoprojectqs: switch to bitbake-setup
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 16:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7954

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +The ``init`` command creates a new folder in the top directory. Its name is
> +derived from the selected configuration above.
> +
> +For the selected options in the above example, this would be::
> +
> +   poky-master-poky-distro_poky-machine_qemux86-64
> +
> +This will be our example configuration in the following sections.
> +
> +This directory contains:
> +
> +-  The :term:`Build Directory`, named ``build``. Later, when the build
> +   completes, the :term:`Build Directory` contains all the files created during
> +   the build.
> +
> +   This :term:`Build Directory` also contains a ``README``, describing the
> +   currently configuration and minimal instructions.
> +
> +-  The :term:`layers <Layer>` needed to build the Poky reference distribution,
> +   in the ``layers`` directory.
> +
> +-  A ``config`` directory, representing the current configuration used in this
> +   directory.

Note the terminology section here:
https://git.openembedded.org/bitbake/commit/?id=b96154aeb1fc89184ac245e0d68e6e726fe80c04

Particularly, the build directory is
'poky-master-poky-distro_poky-machine_qemux86-64', and 'build' is
*bitbake* build directory under that. I'm not sure if existing
definitions in documentation can be adjusted, but confusion should be
avoided as much as possible :)

> +#.  **Initialize the Build Environment:** Source the ``init-build-env``
> +    environment setup script within the build directory to setup Yocto Project's
> +    build environment on your :term:`Build Host`:

Better: bitbake build directory, bitbake build environment.

> +    The current configuration does not allow the ``root`` user to login. As this
> +    can be useful for development, you can enable ``root`` login by opening the
> +    :ref:`structure-build-conf-site.conf` file and adding the following
> +    statement::
> +       EXTRA_IMAGE_FEATURES = "allow-empty-password empty-root-password allow-root-login"

This should be going to local.conf, certainly not site.conf! (because
site.conf is shared between all builds set up by bitbake-setup, and so
they will all have root with empty password :)

Also, I proposed a fragment that does the same (patches sent),
hopefully that goes through review and lands in master soon-ish, then
this can be too described in fragment termsB.

> +    .. note::
> +
> +       These set up the environment similar to what was previously in the local
> +       configuration file :ref:`local.conf <structure-build-conf-local.conf>`,
> +       which is now largely empty.
> +
> +    .. note::
> +
> +       You can significantly speed up your build and guard against fetcher
> +       failures by using :ref:`overview-manual/concepts:shared state cache`
> +       mirrors and enabling :ref:`overview-manual/concepts:hash equivalence`.
> +       This way, you can use pre-built artifacts rather than building them.
> +       This is relevant only when your network and the server that you use
> +       can download these artifacts faster than you would be able to build them.
> +
> +       To use such mirrors, enable the
> +       :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment::
> +
> +          $ bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn

Or you can make that choice (poky with sstate) when setting up a build
with bitbake-setup in the first place.

> +#.  **Find a Layer:** Many hardware layers, or :ref:`BSP layers
> +    <overview-manual/concepts:bsp layer>` are available. The
> +    :oe_layerindex:`layer index <>` can be used to find such layers. This example
> +    adds the :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>` BSP
> +    layer.

That is assuming the user has selected 'nodistro' which does not
include meta-yocto. If they selected poky, then we need another layer
as an example, probably meta-raspberrypi?

Alex

