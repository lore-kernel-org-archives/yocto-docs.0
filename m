Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA469C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 07:29:44 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.6875.1666250981085719503
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 00:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5RFz8g6;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id bs14so25172104ljb.9
        for <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR2pE9CRLCKCbj4l4A8Pv8L6R3T4Tl4KEGi9h5nGN98=;
        b=d5RFz8g6nwVN2arrrR2V7gp1TZ23HF9dwmaZs+kSyU4c6WWBY40Z01NkJCflgNS/fX
         zT4MAvjVHMOMKNxUadBeq6KGxdJsnjdm4v19G2v/gjn8+ceM9+MwMfcVIWmXbGrS0B/t
         j0Bf2r6rSxQXZiiBl+9IT247ZfVVSlCZWuRoYoZnrCW6P0uiavrtA9sFe7KlBDD4JjPw
         LGE7AKM2RKUmKnYkd579gGYyZl6E+bLMwxSOZ1mtfOnNhu5e/maaT2Cotd5Vrx7wxoBd
         b753bUAGCIbndRzxcm0lRKKyZzG7IWKznPjJxkQBW5Lg84n2JYldg/6fi0/YpRmj2j/m
         2LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR2pE9CRLCKCbj4l4A8Pv8L6R3T4Tl4KEGi9h5nGN98=;
        b=xl/lFMWLukTU0OXoLCD8+dgkB+OK/3f0YuJ7Rwwzdm8mboG1QJlOgSRCewndPA8CtB
         mQdyO4ZvMpKR1xJQ1ISMsTZlywAt/nRP249NjMLL26pHx44cxeHUwCG/bCFP91//VZft
         enM93vnDzbYjW+8SLyy4eXT6yvERIWK/glCbjXc5llWRCO3cn4oWcQZnYE94TtkAMSg9
         mmhLHJBUYdwkSF23ayKgeLFteAredwiBr2VDlpeXfQrzG5p8KZNX230jiTSDaZt5xNzr
         iBVhL84k/BZoXyGLhFzU/9+fFs1i66YXE9wuBzgcVTcZp+UxF0VZYmg5idPax9aHClnO
         aztg==
X-Gm-Message-State: ACrzQf2BobzqV00FMPd3PLK5FVo5NXt5ssv7uiqNDNUaJbZNOAnHvU8P
	8E35zA+kKTXDE1wxuTqTkUuJQaFo2/vOcTHizyE=
X-Google-Smtp-Source: AMsMyM4OpGUTtCOWE7CQGfeQV5uYLfO07eLyoHedpJTMwai0JqXAMskGToRh7FfPiZ9dUIN13TLtyGIz/W/8UaeB6J0=
X-Received: by 2002:a2e:b5af:0:b0:26f:d634:2f0d with SMTP id
 f15-20020a2eb5af000000b0026fd6342f0dmr4480583ljn.33.1666250978997; Thu, 20
 Oct 2022 00:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221020065246.33834-1-ito@lineo.co.jp> <39e4d562-ea12-9fe3-7d6d-853c57f45cc7@bootlin.com>
 <57f9883f-b4a5-34b0-9a57-80b4a6ca9d5d@lineo.co.jp>
In-Reply-To: <57f9883f-b4a5-34b0-9a57-80b4a6ca9d5d@lineo.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Oct 2022 09:29:27 +0200
Message-ID: <CANNYZj89KMUU5DwmceqOPWK0hn7v6r-_7RV2jRWNqnwwZxBz1Q@mail.gmail.com>
Subject: Re: [docs][PATCH v6] release-notes-4.1.rst remove bitbake-layers
 subcommand argument
To: Takayasu Ito <ito@lineo.co.jp>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3389

I agree with the change: only the command should be mentioned, and all
arguments should be left out, even if they're mandatory.

Alex

On Thu, 20 Oct 2022 at 09:28, Takayasu Ito <ito@lineo.co.jp> wrote:
>
> Hi Michael
>
> The subcommand save-build-conf, which was added at the same time, only
> contains the subcommand name and no parameters, so we have made a
> proposal to unify the notation.
>
> If "bitbake-layers create-layers-setup destdir" is used, it would be
> better to use "bitbake-layers save-build-conf layerpath templatename"
> with the required parameters to unify the notation.
>
> On 2022/10/20 16:06, Michael Opdenacker wrote:
> > Hi again Ito
> >
> > Now that the patch is correct, let's talk about the proposed change
> > itself...
> >
> > On 10/20/22 08:52, Takayasu Ito wrote:
> >> From: Takayasu Ito <ito@lineo.co.jp>
> >>
> >> Signed-off-by: Takayasu Ito <ito@lineo.co.jp>
> >> ---
> >>   documentation/migration-guides/release-notes-4.1.rst | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/documentation/migration-guides/release-notes-4.1.rst
> >> b/documentation/migration-guides/release-notes-4.1.rst
> >> index 0c552bf1a..a2d4b3d6c 100644
> >> --- a/documentation/migration-guides/release-notes-4.1.rst
> >> +++ b/documentation/migration-guides/release-notes-4.1.rst
> >> @@ -18,7 +18,7 @@ New Features / Enhancements in 4.1
> >>     - New ``scripts/oe-setup-layers`` standalone script to restore the
> >> layer
> >>       configuration from a json file
> >> -  - New ``bitbake-layers create-layers-setup destdir`` command to
> >> save the
> >> +  - New ``bitbake-layers create-layers-setup`` command to save the
> >>       layer configuration to a json file
> >>     - New ``bitbake-layers save-build-conf`` command to save the
> >> active build
> >>       configuration as a template into a layer
> >
> >
> > I'm not sure what you propose to modify is correct though.
> >
> > Here's what I have with the latest "master" branch from the poky
> > repository:
> >
> > $ bitbake-layers create-layers-setup
> >
> > NOTE: Starting bitbake server...
> >
> > usage: bitbake-layers create-layers-setup [-h] [--output-prefix
> > OUTPUT_PREFIX] [--writer {oe-setup-layers}] [--json-only] destdir
> >
> > bitbake-layers create-layers-setup: error: the following arguments are
> > required: destdir
> >
> > $ mkdir my-conf
> >
> > $ bitbake-layers create-layers-setup my-conf
> >
> > NOTE: Starting bitbake server...
> >
> > NOTE: Created
> > /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers.jso=
n
> >
> > NOTE: Created
> > /home/mike/work/git/git.yoctoproject.org/build/my-conf/setup-layers
> >
> > Which version did you make your tests with? Or what misled you?
> > Cheers
> > Michael.
> >
>
> --
> =E3=83=AA=E3=83=8D=E3=82=AA=E3=82=BD=E3=83=AA=E3=83=A5=E3=83=BC=E3=82=B7=
=E3=83=A7=E3=83=B3=E3=82=BA=E6=A0=AA=E5=BC=8F=E4=BC=9A=E7=A4=BE =E6=9C=AC=
=E7=A4=BE
> =E4=BC=8A=E6=9D=B1=E5=AD=9D=E5=BA=B7 <ito@lineo.co.jp>
> =E3=80=92399-0651 =E9=95=B7=E9=87=8E=E7=9C=8C=E5=A1=A9=E5=B0=BB=E5=B8=82=
=E5=8C=97=E5=B0=8F=E9=87=8E1589-1
> Tel +81-263-56-2317 Fax +81-263-56-2319
>    =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> =E2=94=8F=E2=94=AB=E3=80=80  =E3=83=AA=E3=83=8D=E3=82=AA=E3=81=AF =E3=81=
=8A=E5=AE=A2=E6=A7=98=E3=81=AE =E3=81=93=E3=82=8C=E3=82=8A=E3=81=AA =E3=82=
=92=E5=BE=8C=E6=8A=BC=E3=81=97=E3=80=80=E3=80=80 =E2=94=A3=E2=94=93
> =E2=94=83=E2=94=97=E2=94=B3=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=B3=E2=94=
=9B=E2=94=83
> =E2=94=97=E2=94=81=E2=94=9B         https://www.lineo.co.jp        =E2=94=
=97=E2=94=81=E2=94=9B
> =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=93
> =E2=94=83 =E3=81=93=E3=82=8C=E3=82=8A=E3=81=AA =3D =E3=81=93=E3=82=8C=E3=
=81=8B=E3=82=89=E3=81=AFLinux / =E3=81=93=E3=82=8C=E3=81=8B=E3=82=89=E3=82=
=82Linux =E2=94=83
> =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=9B
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3388): https://lists.yoctoproject.org/g/docs/message/=
3388
> Mute This Topic: https://lists.yoctoproject.org/mt/94448743/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

