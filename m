Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B8EECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 17:29:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.1462.1662139786412684234
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 10:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6Mis4gH;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id k18so2894831lji.13
        for <docs@lists.yoctoproject.org>;
 Fri, 02 Sep 2022 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=pyRNZ/tstHf0Dw+kwGc646Yb48QUvUetYyEW/peUZW0=;
        b=p6Mis4gHoti/1+DAN/RT9u6EBdXHsavuILeNkH7LVa9DKYkMR115sw2xPvqSnkieyD
         rEwcwsUHP9pEyYzHi24jkitsBydoa+o483bcJOjv+1yTFXweK438DNBqyE7oaYMAdAUz
         4zGnoYAzI01ccaf2YMB0W659hYpnCz0CXS7AeDXKSVibE1D+6c6v9jR62pcZ5tev13+b
         R3dx7+HszhzvitMbbrHKmv5IPJRP1XJE6z2hawdH1bIOapcz9KSYzF3T+MQLtzNeb3/k
         chHmd+dnmAEW1SUka5+Ks4n5jgZMgG1+VsU/I7ypyoJgTM14Joku1ic+PCoRHK/xz4vx
         cjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pyRNZ/tstHf0Dw+kwGc646Yb48QUvUetYyEW/peUZW0=;
        b=Fug+Rl6zy4zVB07yL2HVOXx2ITy2vISEbeLnAa0OdpV+VF5ajnLLlEz73KzdLevIIh
         mVNAUWiF1vNIL8mUdltXdASyKFY46YlwW06slIhotvZ7AjXE+eXL5cLk1ueJitQ4o5iM
         KT21W+Nl9hlFbPiZm2zd6LjHxVI6X14cO16vnO9FiGLzmR5mmklyJrGmYRQp3zdZ8mub
         NL294iSYTFGfyae3+4FEgyLV4/qrzTRDU6aGhU+7qP6sQfplS0AInJ+GOG94pYso5KpT
         tAMAXtCeKpUnUwfd0nRtT0WtrVa64C1CMSMRXfgDPQ6+EgAFp5btm0LWe7JH9BweFkD3
         mD1g==
X-Gm-Message-State: ACgBeo3fOJbq+01sQAcf7WAjP/WAlaE+C7V6pVxfxrrk87HdUALPiu8D
	CTgkyFLFIFBpHtxcZDEc3OPX4q/KE1lh4LZOpZ4=
X-Google-Smtp-Source: 
 AA6agR5qJsVHyRI/vmgTF8QmIBHIBcgh4FNhO8v/KhYLAQ/AGo69LIijTR4siTTbRAe8sKE6YhkcYvlw6/eilLNkTmE=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr10617576ljh.109.1662139784317; Fri, 02
 Sep 2022 10:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220902112930.2444332-1-u.oelmann@pengutronix.de>
 <1a2181ca-7ab2-dc68-1476-959ea76f57ec@bootlin.com>
In-Reply-To: <1a2181ca-7ab2-dc68-1476-959ea76f57ec@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 19:29:32 +0200
Message-ID: 
 <CANNYZj_EPwZx0q0V5x3WmZU+5KnXXq8qzxVuAM9rhgNTXqV_1A@mail.gmail.com>
Subject: Re: [docs] [PATCH] manuals: fix paths to default templates & clean up
 whitespaces
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>,
	Yocto Project Documentation <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 02 Sep 2022 17:29:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3134

Thanks from me as well, the documentation needs to be updated to cover
the new layer setup functions, and changes to config management as
well, but I'll try to get to it next week.

Alex

On Fri, 2 Sept 2022 at 19:20, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> Hi Ulrich,
>
> On 9/2/22 13:29, Ulrich =C3=96lmann wrote:
> > The templates have recently been moved by meta-yocto's commit [1].
> > Clean up some whitespace issues along the way.
> >
> > [1] 29608bd03e1b ("meta-poky/conf: move default templates to conf/templ=
ates/default/")
> >
> > Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> > ---
> >   documentation/dev-manual/common-tasks.rst  | 16 +++++++-------
> >   documentation/overview-manual/concepts.rst |  4 ++--
> >   documentation/ref-manual/faq.rst           |  7 +++---
> >   documentation/ref-manual/variables.rst     | 25 +++++++++++----------=
-
> >   4 files changed, 26 insertions(+), 26 deletions(-)
>
>
> Many thanks for the updates and for the spacing fixes.
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into "master-next".
>
> Thanks again
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
> View/Reply Online (#3133): https://lists.yoctoproject.org/g/docs/message/=
3133
> Mute This Topic: https://lists.yoctoproject.org/mt/93416899/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

