Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C359FC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 09:43:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.12010.1716543789068959513
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 02:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=uLPhh4ad;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.215.176, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6819b3c92bbso534297a12.2
        for <docs@lists.yoctoproject.org>; Fri, 24 May 2024 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1716543788; x=1717148588; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVim8i/WizL4dNuUggnODlxIa4t7Q2kFQmyiXzwh1QM=;
        b=uLPhh4ad6ZBtbaaK00tgKWwISG86n4TRiAzQ1SUchKP+gI3hZXDVfzsYlYfNlv2NRw
         qCmd4g/JkIK7u1ppsFmnsPaumvA+NPmf0LyGtJlryHvWDFK7EOUZ5XeJHmmNOEfGGQh+
         L6PUtv6RYrAjsDK1rMt4zd+z6YT6N+9VwcESMCDR4ORjwXFRM1QzALotPqxLJ4QzxIQB
         tWlu717cswxJezB4VoENO11s8SmJWNSRfmop917TngN2j9QCqMZP6lsJDu5eNASylvaW
         exTyyht3P9BrSbZzL47ajqzKREHYd+nTmxHOmJs+SD6cVinHAqC/G3sWKboycZHQFnc7
         JAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716543788; x=1717148588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVim8i/WizL4dNuUggnODlxIa4t7Q2kFQmyiXzwh1QM=;
        b=t451FvoYFkr+mue1fFbV6TfQR//nXiycomC/QcjcmWRGGuJS4ghM4YEhe4U9mnq4/y
         omfjYVesc11wPomTo+/3l35dy2xdw8sBN/E+AYzlvqJADKfNXnnNvDSCJ8zunDjv7O6I
         JFiWcHIlF7Q45t0HvFCVj4gqOT5zDu2I62rhW8bOncZ0vlI7c332HlA7ab7ONSDDQzye
         ISvGH5fTt5Jm3rxOCM1gYW9Wgg2MDDOG9CuFwGl2bjpw2S05pl7qO5sT8Lgn7mfhn2SJ
         tTrplddhsqkDT49SiPOYU8gy4hoblS5CvWQ7bRi7SUmpHxf/AKQS/xtg8JwTQBjUtFZ6
         /n0g==
X-Gm-Message-State: AOJu0Ywd3r3db9CrYcoWz2LQa8oOJMLkuvHRa8/hrPKiwbrqfYc4o+D0
	KBPDNWH4a0JdALl82qEO6TBS4x6etcElznp+XAS23YQP3ajtNv65SpZewnKNOmVgcQrM6wH04X8
	cUfzy2hcJWA9f0ZrWlrm9PlkIKS7uQp9fK8SYbQ==
X-Google-Smtp-Source: AGHT+IH7u6sEG2hxVzVXL9gQmLU4qsYEey+rwTMZOfz83cb2kaxAbVyqt72mvxZb1C+yzIjDf9mO8Jgfot2hSw8pV6I=
X-Received: by 2002:a05:6a20:d80b:b0:1af:66aa:7fc7 with SMTP id
 adf61e73a8af0-1b212cc3935mr2477734637.3.1716543788122; Fri, 24 May 2024
 02:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240524091538.2336331-1-chee.yang.lee@intel.com>
In-Reply-To: <20240524091538.2336331-1-chee.yang.lee@intel.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Fri, 24 May 2024 10:42:57 +0100
Message-ID: <CALqELGyaxi-_ahj4+mHAnoGktV0ZF2wKfgZ1wHf0tk3UAAVZBw@mail.gmail.com>
Subject: Re: [docs] [PATCH] migration-notes: add release notes for 5.0.1
To: chee.yang.lee@intel.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 09:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5250

On Fri, 24 May 2024 at 10:17, Lee Chee Yang via lists.yoctoproject.org
<chee.yang.lee=3Dintel.com@lists.yoctoproject.org> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> add release notes for 5.0.1 (rc2).
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-5.0.rst          |   1 +
>  .../migration-guides/release-notes-5.0.1.rst  | 134 ++++++++++++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-5.0.1.rs=
t
>
> diff --git a/documentation/migration-guides/release-5.0.rst b/documentati=
on/migration-guides/release-5.0.rst
> index bd19b707f..44a02ab04 100644
> --- a/documentation/migration-guides/release-5.0.rst
> +++ b/documentation/migration-guides/release-5.0.rst
> @@ -7,3 +7,4 @@ Release 5.0 (scarthgap)
>
>     migration-5.0
>     release-notes-5.0
> +   release-notes-5.0.1
> diff --git a/documentation/migration-guides/release-notes-5.0.1.rst b/doc=
umentation/migration-guides/release-notes-5.0.1.rst
> new file mode 100644
> index 000000000..6292661f5
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.0.1.rst
> @@ -0,0 +1,134 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-5.0.1 (Scarthgap)
> +-----------------------------------------
> +
> +Security Fixes in Yocto-5.0.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +
> +Fixes in Yocto-5.0.1
> +~~~~~~~~~~~~~~~~~~~~
> +
> +-  babeltrace2: upgrade 2.0.5 -> 2.0.6
> +-  bind: upgrade 9.18.24 -> 9.18.25
> +-  bitbake: cooker: Use hash client to ping upstream server
> +-  build-appliance-image: Update to scarthgap head revision (b9b47b1a392=
b...)
> +-  docs: add support for scarthgap 5.0 release
> +-  docs: brief-yoctoprojectqs: explicit version dependency on websockets=
 python module
> +-  docs: brief-yoctoprojectqs: Update to the correct hash equivalence se=
rver address
> +-  documentation/poky.yaml.in: drop mesa/sdl from essential host package=
s
> +-  ell: upgrade 0.63 -> 0.64
> +-  gcr: upgrade 4.2.0 -> 4.2.1
> +-  icu: update 74-1 -> 74-2
> +-  libdnf: upgrade 0.73.0 -> 0.73.1
> +-  libsdl2: upgrade 2.30.0 -> 2.30.1
> +-  libx11: upgrade 1.8.7 -> 1.8.9
> +-  libxcursor: upgrade 1.2.1 -> 1.2.2
> +-  libxml2: upgrade 2.12.5 -> 2.12.6
> +-  local.conf.sample: Fix hashequivalence server address
> +-  lttng-tools: upgrade 2.13.11 -> 2.13.13
> +-  manuals: standards.md: add standard for project names
> +-  mesa: upgrade 24.0.2 -> 24.0.3
> +-  migration-notes: add release notes for 4.0.18
> +-  mpg123: upgrade 1.32.5 -> 1.32.6
> +-  pango: upgrade 1.52.0 -> 1.52.1
> +-  poky.conf: bump version for 5.0.1
> +-  python3: skip test_concurrent_futures/test_shutdown
> +-  ref-manual: update releases.svg
> +-  ref-manual: variables: add :term:`USERADD_DEPENDS`
> +-  release-notes-5.0: update Repositories / Downloads section
> +-  release-notes-5.0: update recipes changes
> +-  release-notes-5.0: update new features
> +-  rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once
> +-  rpm: update 4.19.1 -> 4.19.1.1
> +-  scripts/oe-setup-build: write a build environment initialization one-=
liner into the build directory
> +-  sstate.bbclass: Add _SSTATE_EXCLUDEDEPS_SYSROOT to vardepsexclude
> +-  systemd: sed :term:`ROOT_HOME` only if sysusers :term:`PACKAGECONFIG`=
 is set
> +
> +
> +Known Issues in Yocto-5.0.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +
> +Contributors to Yocto-5.0.1
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Alexander Kanavin
> +-  Christian Br=C3=A4uner S=C3=B8rensen
> +-  Lee Chee Yang
> +-  Mark Hatle
> +-  Michael Glembotzki
> +-  Michael Halstead
> +-  Michael Opdenacker
> +-  Paul Eggleton
> +-  Quentin Schulz
> +-  Richard Purdie
> +-  Steve Sakoman
> +-  Trevor Gamblin
> +-  Wang Mingyu
> +-  joshua Watt

Should this be a capitalised J, i.e. s/joshua/Joshua/ ?

Andrew Murray

