Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3876BC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:11:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.6215.1636603888814965874
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 20:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iyKmKYBK;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.49,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f49.google.com with SMTP id 133so3971436wme.0
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 20:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6O6jKRaw7+f4cEUQfZdG1kPRnyU+5eb+VTx0T+AbYgk=;
        b=iyKmKYBKsAlx4uUkNb2UfW0Uw7+kH8SaHg2JD7InIOu72okqijK1T+tiSvPGUfxfYS
         oeN5J5w/m50DXqqfVTeqxuyhuGTD44gc1hZIbHQ1bgPn81Ji9ELmzYSZzWiZD6w5YNXK
         5u5ZJUFURgZs0kGx6FCdlBcnyVhx3GNaAaKRMQJycwOFXbJqJhDMB9c9qCbO2+lJVDr/
         Z2GSdANSNFezx163FuO58skQQ6ZI9cPYDa5KhoXY+31nLCE7kX+cdDorL2dGmy48jvmC
         6CSP3OA9qSEW0+eG2XtiBKxmrykuLnBK2ovyD9VWUJ1vJzI0i/dNwaBvhhfq+o+oaiyu
         3QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6O6jKRaw7+f4cEUQfZdG1kPRnyU+5eb+VTx0T+AbYgk=;
        b=pjwYmeu5/kwsg+zhrXrG5ohJKWy52cB34hBLG6DC0IGvy846qWnPjR/94Q5IsKytkU
         emsiswp/ccQnwDzpW3zOyrSID+XP5XPYuDZvaGkXAaYrNrfjcz0U6E8Z5oNwlsjvZ+zX
         elDkVvC2UXH5z1ziPjUTQ9b+a70RI7RuImoOWMdj/2x2PnY9QFQvDaABLbw10ypdShLD
         csbhTyJaSfllYTL31LolnbsPhlQ7Qbds4+bQLE0a1wfO7dMUUTRDQ766XOjznluA67QB
         S6AnN9tYDB+5n0EZN/mqnx0pIQW3ay5jVN7X4AYpGhvzT94QqtVelDOKPZpNXfB60HPQ
         hIHg==
X-Gm-Message-State: AOAM53054HdQJKCurxfl1/J8fR0ow4Av5ZlUgPFALqMxB6aI/+JfuLA4
	zmJGXIN0AfPdJ/iDKZNh14CkGUItuyvde9NQlj/Cew==
X-Google-Smtp-Source: 
 ABdhPJx0X+pNS510tPwAl623kdhSj7GLdvJuvoSvBy08GXYCr4P2fz09FkXvB2etsih7C6bnBbNOGz1QdwIHAGIJlSs=
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr4992915wmq.48.1636603887042;
 Wed, 10 Nov 2021 20:11:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636564016.git.steve@sakoman.com>
 <c3b650f759d7983db563500d52ad5b68f18728e7.1636564016.git.steve@sakoman.com>
 <331d6852e3e5bb9afeed9c9be927f72cd0e57a5b.camel@intel.com>
In-Reply-To: <331d6852e3e5bb9afeed9c9be927f72cd0e57a5b.camel@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Nov 2021 18:11:16 -1000
Message-ID: 
 <CAOSpxdaN29DYxpsnPKop0C0LPPL5FcHtxHMmx=4ySB7DCAuAUw@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 3/3] documentation: prepare for
 3.1.12 release
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Nov 2021 04:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2126

On Wed, Nov 10, 2021 at 6:08 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2021-11-10 at 07:08 -1000, Steve Sakoman wrote:
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  documentation/conf.py                    | 2 +-
> >  documentation/poky.yaml                  | 8 ++++----
> >  documentation/releases.rst               | 1 +
> >  documentation/sphinx-static/switchers.js | 2 +-
> >  4 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 6f10fc151..6eb284e65 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -16,7 +16,7 @@ import os
> >  import sys
> >  import datetime
> >
> > -current_version = "3.1.11"
> > +current_version = "3.1.12"
> >
> >  # String used in sidebar
> >  version = 'Version: ' + current_version
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index bda8ff123..af041e373 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -1,11 +1,11 @@
> > -DISTRO : "3.1.11"
> > +DISTRO : "3.1.12"
> >  DISTRO_NAME_NO_CAP : "dunfell"
> >  DISTRO_NAME : "Dunfell"
> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> > -YOCTO_DOC_VERSION : "3.1.11"
> > +YOCTO_DOC_VERSION : "3.1.12"
> >  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
> > -DISTRO_REL_TAG : "yocto-3.1.11"
> > -POKYVERSION : "23.0.11"
> > +DISTRO_REL_TAG : "yocto-3.1.12"
> > +POKYVERSION : "23.0.12"
> >  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> >  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> >  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
> > diff --git a/documentation/releases.rst b/documentation/releases.rst
> > index 70393084c..60872cca2 100644
> > --- a/documentation/releases.rst
> > +++ b/documentation/releases.rst
> > @@ -20,6 +20,7 @@
> >  - :yocto_docs:`3.1.9 Documentation </3.1.9>`
> >  - :yocto_docs:`3.1.10 Documentation </3.1.10>`
> >  - :yocto_docs:`3.1.11 Documentation </3.1.11>`
> > +- :yocto_docs:`3.1.11 Documentation </3.1.12>`
>
> Should be 3.1.12 here?

Yes, indeed! Thanks for catching this.

Steve

