Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DC8C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:32:55 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.13364.1639413174763166685
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G/uo98fG;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.176,
 mailfrom: steve@sakoman.com)
Received: by mail-yb1-f176.google.com with SMTP id f9so39651586ybq.10
        for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/AfMr/ykVaPZFH6YR/9p9kAJPjVRkkb1rADxW3c55rU=;
        b=G/uo98fGGTMPVQAHd/tYBOWdiuawsIT0eFOJ1amfLXlkLUOQcQ2XklXibaZawKx3XT
         unZqVq7NORRV2GHDu/ac39ZZljTQ58QeT0MkbS2dJDwqgDcSFS8lw2NbKPFYq8lI5ELJ
         qUvtY2cMurd/P+wNtf5FJRacrfVGCCtAwAH3WFhumiO5PceUvQSoBiyYY4pUCxKuY8QQ
         hKjjhHsJxf7/VSj2aepqHFqg91pd6iX9TKzQZnaAfAjxkp1UDy56s4HTWpFc4EdPpcau
         iaqnEMtLC1QMA8Bz2wydcSOfVRewGHzs+WOlAcGJs2M5kQDty8B+qhQSLed2LKBiSCeD
         eWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/AfMr/ykVaPZFH6YR/9p9kAJPjVRkkb1rADxW3c55rU=;
        b=JKpoA7bVC0PDooVr0gbW/Ce8Uie1idvcoar19t23ZyKBcamzh7vKRQFQHFdtpws+2x
         gZ5I0LNdQpSBijD8vFQ/xJTY94T6yU7ZiYcGhY9xAZgxLhZBmkTnuObX2g1PzhKvtjgW
         SpVal6wvSsnzksmI53VdXgB9yZ7NPjVqSLGG+/oSzDMHmp3fsFI2Qc9nNyytBJXsK2KW
         P9MlOlG8/6+D9pfn4BG1jn3/MCttz/7zkF9RnfWtJr6hpUuaIezHQGFANr6HqnMxfE63
         5nuFaLjrQjIW+hi+E9/BcpDVUcWCfoid3q5tjtxtQ6935b1sX9MTTWI+fD4gyJ0bWHz4
         CLhg==
X-Gm-Message-State: AOAM530YD0s4nrbkSXO2fPvs31aMjs8KrK/SkMAYh1igUdarAnI2+AbH
	P/+GVzkrW8IxjmdQXGiiOOwKiK1zaVNdlnciqig64w==
X-Google-Smtp-Source: 
 ABdhPJx+zfiBjljy70imrHjHbKSgu6fK+l1RxMe7RKTtFM/J3P+iv2L8MXcROCtb1KMVVdnBllEaq9pIcb04xcCZvUw=
X-Received: by 2002:a25:5f05:: with SMTP id t5mr36592805ybb.399.1639413173693;
 Mon, 13 Dec 2021 08:32:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639408799.git.steve@sakoman.com>
 <ab25582a2b64f294bc397894113a3438b48ad544.1639408799.git.steve@sakoman.com>
 <62c35ec8-121b-b4f5-39b8-504aee1b533e@bootlin.com>
In-Reply-To: <62c35ec8-121b-b4f5-39b8-504aee1b533e@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 Dec 2021 06:32:41 -1000
Message-ID: 
 <CAOSpxdb094ygJUQxxUAkr8zizdpraHhLPKCwT+Yv2OYYRZfh2g@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: prepare for
 3.1.13 release
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2249

On Mon, Dec 13, 2021 at 5:58 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Steve,
>
> On 12/13/21 4:24 PM, Steve Sakoman wrote:
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  documentation/conf.py                    | 2 +-
> >  documentation/poky.yaml                  | 8 ++++----
> >  documentation/releases.rst               | 1 +
> >  documentation/sphinx-static/switchers.js | 2 +-
> >  4 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 0790b50a7..0d61afc9d 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -16,7 +16,7 @@ import os
> >  import sys
> >  import datetime
> >
> > -current_version = "3.1.12"
> > +current_version = "3.1.13"
> >  bitbake_version = "1.46"
> >
> >  # String used in sidebar
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index af041e373..ec0ecadb1 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -1,11 +1,11 @@
> > -DISTRO : "3.1.12"
> > +DISTRO : "3.1.13"
> >  DISTRO_NAME_NO_CAP : "dunfell"
> >  DISTRO_NAME : "Dunfell"
> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> > -YOCTO_DOC_VERSION : "3.1.12"
> > +YOCTO_DOC_VERSION : "3.1.13"
> >  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> > -DISTRO_REL_TAG : "yocto-3.1.12"
> > -POKYVERSION : "23.0.12"
> > +DISTRO_REL_TAG : "yocto-3.1.13"
> > +POKYVERSION : "23.0.13"
> >  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> >  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> >  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> > diff --git a/documentation/releases.rst b/documentation/releases.rst
> > index 3e27406ea..50803e383 100644
> > --- a/documentation/releases.rst
> > +++ b/documentation/releases.rst
> > @@ -21,6 +21,7 @@
> >  - :yocto_docs:`3.1.10 Documentation </3.1.10>`
> >  - :yocto_docs:`3.1.11 Documentation </3.1.11>`
> >  - :yocto_docs:`3.1.12 Documentation </3.1.12>`
> > +- :yocto_docs:`3.1.13 Documentation </3.1.13>`
> >
> >  ==========================
> >   Previous Release Manuals
> > diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> > index 87160d8ba..65e4d261f 100644
> > --- a/documentation/sphinx-static/switchers.js
> > +++ b/documentation/sphinx-static/switchers.js
> > @@ -3,7 +3,7 @@
> >
> >    var all_versions = {
> >      'dev': 'dev (3.3)',
> > -    '3.1.12': '3.1.12',
> > +    '3.1.13': '3.1.13',
> >      '3.0.4': '3.0.4',
> >      '2.7.4': '2.7.4',
> >    };
>
>
> Many thanks for this update.
> I'll merge it when 3.1.13 is out, as we discussed with Anuj when the
> 3.4.1 release was prepared for. If we apply this change too early,
> before a new released is tagged, we end up with a link to a
> documentation version that is not generated yet.
>
> I'll take care of changing the commit subject to "documentation: update
> for 3.1.13 release".

Thanks Michael, I'll make sure to use that wording for the 3.1.14 release!

Steve

