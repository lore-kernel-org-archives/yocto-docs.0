Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B472CECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.9291.1663661758051719676
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 01:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AmXhLR4S;
 spf=pass (domain: linaro.org, ip: 209.85.216.44,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f44.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso1679766pjm.5
        for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=P6W5VCpgxnIasw5g9rHKZUTVxwLO9x/YPHzh7j1l3eg=;
        b=AmXhLR4SsTPajxSET0tdqpea/G23bLrh6fYmtW63CApMBQ4G3dJKuzXQ6oFsDAJDIO
         J7A2vgHfvHlycLb4PsPh0NlN1s+NEhsca/s6znFRwOfDcFXNKr/5Zy788ehpq76CGQR9
         m0qYrzS1tvc0sEAvro21KSOt5Tf/cqyZI0cVS1nPQXktI4bO4/n1jqq97WK0BfL0apDK
         fVtYKQw8hzKVr+sez2zRGrOwDnrLa41L6zlnYIzL4swnE/rDkn9VL7mvXBNwsaNxLEx6
         C0BNIeAb2nkYEJrCX+Wsffqv1fUDsD4uWPNI1ufX4mSOvI4ZtujzRZz5RPWpBmOPhIlR
         0N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=P6W5VCpgxnIasw5g9rHKZUTVxwLO9x/YPHzh7j1l3eg=;
        b=IIYlMPP4cETGpcWc/f+4qlQSm7H7+zFmlNiIn46Rr++MmPyB0JyuhO7UqO2FKWu8sD
         AC8Ot0us+al7ymFOwEDfmzP/LmuQq9XkcbURKliNbNmevMoEawPSAB+an8EmUWM+Z030
         CLuz+cAfXa5MPk/Ibx3HPsGPyFi2ye7EX7woIWNcsjDrBZpEgBGthvAd6NbMz5vkFgNn
         Noq91uzNgDhbN92Xne3qRd21L8b54W0Rm0IjI1t9esHV8TNA4/OOYA4Ckvtyp1TA+jrS
         S1DqD5qmWOM5wtoT2U453VwVAoOwL5RrgMPILB5uy05XD/uuwfVTvgSFBf7KhW2Ck9av
         AFZA==
X-Gm-Message-State: ACrzQf2Mj/uhCSyGgNwftphJymXZ63CbLfNaq41BHt6MFJVv4LgAEwyf
	GFKcShbbnIqOLyJIpAqi8Wyh5WIZriVJPBbgqBovfA==
X-Google-Smtp-Source: 
 AMsMyM7xAjPTF9JT/Lpy0tcJZZsKkgb85igWCQegA1rbAcxINiWBJvG+r4Dj7xKXWiyLS5yD4Wo+u/hxf3kB06SC4Xk=
X-Received: by 2002:a17:90b:17cd:b0:202:ee1c:9578 with SMTP id
 me13-20020a17090b17cd00b00202ee1c9578mr2632499pjb.87.1663661757474; Tue, 20
 Sep 2022 01:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220920074548.17466-1-mikko.rapeli@linaro.org>
 <20220920074548.17466-2-mikko.rapeli@linaro.org>
 <cab69782-69f6-14f5-7a13-d9016432328c@bootlin.com>
In-Reply-To: <cab69782-69f6-14f5-7a13-d9016432328c@bootlin.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 20 Sep 2022 11:16:07 +0300
Message-ID: 
 <CAJFpGrNTu7FmBg=sdTCCVG330LD-RQ8b=vDXRjkXJWUx8f5+Tg@mail.gmail.com>
Subject: Re: [docs] [doc][PATCH v3 2/2] kernel-dev/common.rst: remove
 SRC_URI:append from examples
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 08:16:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3184

Hi,

On Tue, 20 Sept 2022 at 11:12, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hello Mikko
>
> On 9/20/22 08:45, Mikko Rapeli wrote:
> > It's better to use SRC_URI += to append patches etc. If anything
> > is added via :append, that can only be removed with :remove which
> > makes the changes rather permanent compared to light weight +=
> > amendmends.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   documentation/kernel-dev/common.rst | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> > index 16ef6453bd..fb8d7cd029 100644
> > --- a/documentation/kernel-dev/common.rst
> > +++ b/documentation/kernel-dev/common.rst
> > @@ -360,9 +360,9 @@ home directory:
> >
> >         FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >
> > -      SRC_URI:append = " file://patch-file-one.patch"
> > -      SRC_URI:append = " file://patch-file-two.patch"
> > -      SRC_URI:append = " file://patch-file-three.patch"
> > +      SRC_URI += "file://patch-file-one.patch"
> > +      SRC_URI += "file://patch-file-two.patch"
> > +      SRC_URI += "file://patch-file-three.patch"
> >
> >      The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
> >      enable the OpenEmbedded build system to find patch files. For more
> > @@ -1002,7 +1002,7 @@ Section.
> >      contents::
> >
> >         FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> > -      SRC_URI:append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
> > +      SRC_URI += "file://0001-calibrate.c-Added-some-printk-statements.patch"
> >
> >      The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
> >      enable the OpenEmbedded build system to find the patch file.
> > @@ -1875,7 +1875,7 @@ build.
> >   2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
> >      recipe's :term:`SRC_URI` statement::
> >
> > -      SRC_URI:append = " file://test.scc"
> > +      SRC_URI += "file://test.scc"
> >
> >      The leading space before the path is important as the path is
> >      appended to the existing path.
> > @@ -1884,7 +1884,7 @@ build.
> >      :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
> >      feature::
> >
> > -      KERNEL_FEATURES:append = " test.scc"
> > +      KERNEL_FEATURES += "test.scc"
> >
> >      The OpenEmbedded build
> >      system processes the kernel feature when it builds the kernel.
>
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into master-next too.
>
> Will you send further commit message updates to the other patches in
> these series?

The other changes in the original series are already merged in master
so it's a bit
late for commit message updates.

Cheers,
-Mikko

