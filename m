Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC8C54798
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 03:35:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.12817.1708745714371960606
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 19:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNgeUL8R;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d934c8f8f7so13319205ad.2
        for <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 19:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708745714; x=1709350514; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZnnhiTb1KYMhWhyPRRANO5nMX28I5gNSlvFoG4TYYY=;
        b=ZNgeUL8RxNXc6gJdJCfbqqZhSKA8oFVP4TKRNbqJQ0/kteyX+UbcDpjQKGdwXHeEmT
         bzVZfFjH/fa5YEq/VVXD6p4mHsbK4FDAVoFo4v2KfbVXnL4Og6HxRQ59N4UvGkf71j2I
         ZYf7ODxZJHg5rzYr9WwTzevFotSdPTPSx1A/TjBgEwMNLaAnySNFBtoK9AG02vlRRodt
         +K8U1eeLgekuho+R9K4Kozr/mfW+fbIUPCO+9hAWM7Q7sIMhwzxglMm+YUPGuK/QMeMF
         dx/GZk+GQ1tpfF502DCJNpKRew094bhL4AFXerZWf1BCaBewqQTwgvGB32lxmmlOktO+
         6s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708745714; x=1709350514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZnnhiTb1KYMhWhyPRRANO5nMX28I5gNSlvFoG4TYYY=;
        b=tagu/sSSkZ12s45f51VEC6o3nJypoWTGbHVMaCUOwWj24QyfD2PMuvgGgUL+UZKzh9
         DtzByXjaA/xXboosp3AzqNjegSTx+BSUUivCHsIzd088fxIe6bbz2CoOuqxNyDTWciOA
         +C5TUCLAXIbyFBpHKula4eF2zNGHHXDIQEsxqzn+uQKveG/B5e3Nsr2EfN9XXHgVTFER
         p4Gz2QVDb4jB0KZJg74RbclM0qN/G9wcW3Ct2fi+Z1dGcsDnf6lYVvkeZ0E6ZoIpIGX+
         +NkrUzjPxSiTXJHAyfwCKVY8tDqoSKFVrI/HkvDuAvQrDYYe/qzOe00rpJOzIE9sarjN
         BpQg==
X-Forwarded-Encrypted: i=1; AJvYcCWf7d2xg5Y9gDQAscQdzxAo6roOapIrtPEBaigTPJroSbzD5Yh9qnxp1Ty2qc5lfzQKyJffFMS/27CP4AjyyC5RuaiJXc72UkA098g=
X-Gm-Message-State: AOJu0YxNAKmdeCEwgvJ70hDsE+LsBQrApOrfkIU6emJMsQ8skgE1EZ/U
	GmHR0qzcKWZvbPn9eXjM6394lQlQxBSMetwMJ0FhWV6h7X+nYDvfE1EeQa+YJoeusZSDZnt9GAH
	8kSMC9ZAwX8+xX9XU3PksgeGAMdE=
X-Google-Smtp-Source: AGHT+IE89CZSUIRAZOlHYh+qa8VO99XqLkXVKxq1M7XeKU086mRxNPhHqe3OB9cno/Itozgy5hMZC/hgUiPA23MTpkM=
X-Received: by 2002:a17:902:6e10:b0:1dc:6152:7c24 with SMTP id
 u16-20020a1709026e1000b001dc61527c24mr1445820plk.43.1708745713751; Fri, 23
 Feb 2024 19:35:13 -0800 (PST)
MIME-Version: 1.0
References: <b381569f-6a73-4efa-9eed-19119070c467@bootlin.com>
In-Reply-To: <b381569f-6a73-4efa-9eed-19119070c467@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Feb 2024 22:35:02 -0500
Message-ID: <CADkTA4Mpr_jgh7MUYFo1vMC6amMFdOTz3yA1Bh3CJz24KYgmYw@mail.gmail.com>
Subject: Re: [docs] [master] Pull request
To: michael.opdenacker@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 Feb 2024 03:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4869

On Fri, Feb 23, 2024 at 1:47=E2=80=AFPM Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> Hi Richard,
>
> The following changes since commit 79530aeb97976b9a63bf04ed247f98061fc9d7=
37:
>
>    release-notes-4.3: fix spacing (2024-02-05 15:22:33 +0100)
>
> are available in the Git repository at:
>
>    git://git.yoctoproject.org/yocto-docs master-next
>
> for you to fetch changes up to b63e6a5ac71b347961037b7ee496c2e958ad22c5:
>
>    dev-manual: packages: need enough free space (2024-02-23 09:50:37 +010=
0)
>
> ----------------------------------------------------------------
> Adrian Freihofer (1):
>        sdk-manual: extensible.rst: cover devtool ide-sdk
>
> Khem Raj (1):
>        ref-manual: variables: remove PYTHON_PN
>
> Lee Chee Yang (1):
>        migration-guide: add release notes for 4.3.3
>
> Michael Opdenacker (5):
>        ref-manual: system-requirements: update packages to build docs
>        ref-manual: release-process: grammar fix
>        manuals: suppress excess use of "following" word
>        dev-manual: packages: clarify shared PR service constraint
>        dev-manual: packages: need enough free space
>
> Simone Wei=C3=9F (1):
>        dev-manual: Rephrase spdx creation
>
> Vyacheslav Yurkov (1):
>        manuals: kernel-dev: Fix BSP in recipe space

As I commented on the patch itself, the above documentation tweak
isn't correct and should be dropped.

Bruce

>
>   documentation/bsp-guide/bsp.rst                        |   9 ++--
>   documentation/dev-manual/building.rst                  |   2 +-
>   documentation/dev-manual/debugging.rst                 |   8 ++--
>   documentation/dev-manual/development-shell.rst         |   2 +-
>   documentation/dev-manual/layers.rst                    |   8 ++--
>   documentation/dev-manual/libraries.rst                 |   4 +-
>   documentation/dev-manual/licenses.rst                  |   2 +-
>   documentation/dev-manual/new-machine.rst               |   2 +-
>   documentation/dev-manual/new-recipe.rst                |   8 ++--
>   documentation/dev-manual/packages.rst                  |  22 +++++++---
>   documentation/dev-manual/prebuilt-libraries.rst        |   4 +-
>   documentation/dev-manual/python-development-shell.rst  |   2 +-
>   documentation/dev-manual/qemu.rst                      |   4 +-
>   documentation/dev-manual/runtime-testing.rst           |   4 +-
>   documentation/dev-manual/sbom.rst                      |  40
> ++++++++++-------
>   documentation/dev-manual/speeding-up-build.rst         |   4 +-
>   documentation/dev-manual/start.rst                     |   6 +--
>   documentation/kernel-dev/advanced.rst                  |   2 +-
>   documentation/kernel-dev/common.rst                    |   4 +-
>   documentation/migration-guides/migration-1.5.rst       |   6 +--
>   documentation/migration-guides/migration-2.2.rst       |   6 +--
>   documentation/migration-guides/migration-2.4.rst       |   8 ----
>   documentation/migration-guides/migration-2.5.rst       |   8 +---
>   documentation/migration-guides/migration-4.0.rst       |   2 +-
>   documentation/migration-guides/release-4.3.rst         |   1 +
>   documentation/migration-guides/release-notes-4.3.3.rst | 200
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
>   documentation/overview-manual/concepts.rst             |  18 ++++----
>   documentation/overview-manual/yp-intro.rst             |   2 +-
>   documentation/ref-manual/classes.rst                   |   8 ++--
>   documentation/ref-manual/devtool-reference.rst         |   4 +-
>   documentation/ref-manual/faq.rst                       |   6 +--
>   documentation/ref-manual/features.rst                  |   2 +-
>   documentation/ref-manual/images.rst                    |   2 +-
>   documentation/ref-manual/release-process.rst           |   8 ++--
>   documentation/ref-manual/structure.rst                 |   2 +-
>   documentation/ref-manual/system-requirements.rst       |  10 ++---
>   documentation/ref-manual/terms.rst                     |   4 +-
>   documentation/ref-manual/variables.rst                 |  22 ++--------
>   documentation/sdk-manual/appendix-obtain.rst           |  10 ++---
>   documentation/sdk-manual/extensible.rst                | 283
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++-
>   documentation/sdk-manual/intro.rst                     |   2 +-
>   documentation/toaster-manual/setup-and-use.rst         |   4 +-
>   42 files changed, 614 insertions(+), 141 deletions(-)
>   create mode 100644 documentation/migration-guides/release-notes-4.3.3.r=
st
>
> Thank you in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4867): https://lists.yoctoproject.org/g/docs/message/=
4867
> Mute This Topic: https://lists.yoctoproject.org/mt/104534340/1050810
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [bruce.ashfield@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

