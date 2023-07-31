Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A82C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:21:56 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3559.1690795311693108421
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 02:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CLxLaX2Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9b6e943ebso63982931fa.1
        for <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690795310; x=1691400110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+e/C7kinttU1I6n6SuA3uihONgel7U34oeorJFrhws=;
        b=CLxLaX2YlgpJU2CokgrWdG4Y4ZZggcTCL5GCar6c2v3lE2tBI6L1V5UI9Ogq1t9IbN
         MlHcWTdiUdEeA81kt1CwB0f1uKtUtWi5eAzmkjJMEyyvP1Pr4J7VH870emPbmnAw0DrC
         YH7X/pRJ394uVZP5Xi6hjCp45wyWPFPu4aeweNEGWCzfmH2wrGczQTfLWyiSkwG7546S
         tOii41ShYk6tq3wZqeEj+7kB0ayEq/6HqZS1rF0PEwsWVkWw415/Iv+7lb+SQ41GRDmi
         +OpWbflHLUlzlUY/XZIzZN1HzmJKt/B3JbOs9eN2Joy0dhQPS2048GwaZdHnXY0GQ4ci
         wz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795310; x=1691400110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+e/C7kinttU1I6n6SuA3uihONgel7U34oeorJFrhws=;
        b=DU36UMinwpLadUOcRf+vNFedZ+SQasGoPCxpDGrOgD4UY1dsOanYDYf1dEHraqwJS3
         io6Y6JZ/ooReL9UWM1jNZQmGXdR9bWsLqJzeaR0K+0P993YP+IRJkg1R8cwSk+JFU8+x
         gLptpVnhTvJVY7y8Fk4pl9t7uJXDmo3v7YjvvnMqvqJ6IwE4PNeMsKU+zlrFfp7G0JlW
         hZRBWg4TrdztsPF0fxsm2/xzGdXLvsAg4M+5fm/puG3ns251Mh7aXGVer/TgAzV4KbgJ
         0cXrhsmHO31ZVTKjVOXCUl5jOMu8Ctq3ECmzwDuPt0uGd/gStqQHLXEz7IPDIDff9oKa
         m0pA==
X-Gm-Message-State: ABy/qLbhdwT6qp8i9S5VxcCkBIxb0EIzzgTpp0VocWdRWSh6EHSUsv0E
	zx2Cp+z5LtwJPuRrE816OMoBmKkv0oe3YP0Lh3w=
X-Google-Smtp-Source: APBJJlHDJpJuAVnoIZMqfsSbDfeF+lLWJpRQRV78D8FhV2Y7rf4OFNB7iNsXPxiOvni5KI5Ai4iz5ouIcqAykrA8+G4=
X-Received: by 2002:a05:651c:10ae:b0:2b6:9e1d:cd0f with SMTP id
 k14-20020a05651c10ae00b002b69e1dcd0fmr4741128ljn.12.1690795309591; Mon, 31
 Jul 2023 02:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230728165026.862640-1-alex@linutronix.de> <ae535037-9245-66aa-c71a-cb4e6fe70454@theobroma-systems.com>
In-Reply-To: <ae535037-9245-66aa-c71a-cb4e6fe70454@theobroma-systems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 11:21:38 +0200
Message-ID: <CANNYZj_vV3pwbPhN3geFdBuBLKM+X1jFAt4nHdyzqNyTZatDZA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 09:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4088

That's right. Needs to be fixed. Michael, can you squash the fixup in
master-next please?

Alex

On Mon, 31 Jul 2023 at 11:11, Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Hi Alex,
>
> On 7/28/23 18:50, Alexander Kanavin via lists.yoctoproject.org wrote:
> > This has been around without being properly documented since 2019 (!!!),
> > and is nowadays the preferred method for enforcing license restrictions,
> > especially since meta-gplv2 is officially obsolete.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   documentation/ref-manual/images.rst    | 16 +++++++++-------
> >   documentation/ref-manual/variables.rst | 13 +++++++++++--
> >   2 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> > index d3aeb0829..19c31e0fc 100644
> > --- a/documentation/ref-manual/images.rst
> > +++ b/documentation/ref-manual/images.rst
> > @@ -14,15 +14,17 @@ image you want.
> >      Building an image without GNU General Public License Version 3
> >      (GPLv3), GNU Lesser General Public License Version 3 (LGPLv3), and
> >      the GNU Affero General Public License Version 3 (AGPL-3.0) components
> > -   is only supported for minimal and base images. Furthermore, if you
> > -   are going to build an image using non-GPLv3 and similarly licensed
> > -   components, you must make the following changes in the ``local.conf``
> > -   file before using the BitBake command to build the minimal or base
> > -   image:
> > +   is only tested for core-image-minimal image. Furthermore, if you would like to
> > +   build an image and verify that it does not include GPLv3 and similarly licensed
> > +   components, you must make the following changes in the image recipe
> > +   file before using the BitBake command to build the image:
> >
> > -   #. Comment out the :term:`EXTRA_IMAGE_FEATURES` line
> > +       INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0*"
> >
> > -   #. Set :term:`INCOMPATIBLE_LICENSE` to "GPL-3.0* LGPL-3.0* AGPL-3.0*"
> > +   Alternatively, you can adjust ``local.conf`` file, repeating and adjusting the line
> > +   for all images where the license restriction must apply:
> > +
> > +       INCOMPATIBLE_LICENSE:pn:your-image-name = "GPL-3.0* LGPL-3.0*"
> >
>
> I believe there's a typo here in the override and we should read:
>
> INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
>
> (note the `:` transformed into `-`).
>
> Is this a correct assumption?
>
> Cheers,
> Quentin

