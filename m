Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82430C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:04:17 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.28469.1639501456363000893
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 09:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ghtRalvK;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id t5so65149138edd.0
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uj8oaP/R+4Q3QLFuHArr8s1kz+FJvcxSVh4GoHPgoho=;
        b=ghtRalvKNxayPaEhkDq2ImOtrzjcWs1rVZuFgklFOBT+J6Zu+Zx3zZjyfKdn6J3WXP
         K+aO1nRuy0XUF+dWeK85qzvusFQLwV67iT+By+G+punrn/35rDzgJynuWd2EEEK/2Cl6
         AApubK4WAzJ+CiLBCDCjBCjpHcMdKj7lLXre0vMTNjszJ70GuZNFSm9vjS6NGxzBzzI0
         EjaQ7AhmFk+IsaUKVzQ87/5Hfnmu+1ZyOY3w+gKVbAM8l5OsMFUy3RINJwX0Cu//UIl7
         pRXVPJKMybPY1QO+mdv37TcvkpulRUTtY/cMT7GIq1+AB9PUF7N3GT2XL8vfw9xsby3W
         iVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uj8oaP/R+4Q3QLFuHArr8s1kz+FJvcxSVh4GoHPgoho=;
        b=nwJIj1k9Bo6RGhbvdw/Jh+HPJkHJ4uqc0ya4AWUAwYZPzovJ3EW8XvITRkbpecRPhR
         BT4Y0xt8MWy9PDcuAb8OxC9W+YiiEjiPlns8KvNSsUBF4jv6aU+CgQ8DkBTDjwu83scs
         TmWfOTHCxmA4ZENWC0bQpBxZjCLl3TjJEdpnmoem1ASw30qlXgZu4ytJGO+IxWCRS8n2
         m78V5nTa13fJ85vRrBYlul1WARt5EHoIdNIOuZJEqjUArjFOva20Y3viybGQ7QGjwM5V
         UCQkleEeNTLLAzqDRI/zpIGf5eL5ne2xIXRIA7E5FxQUyiA4G/NY/+aRivYQiy1KFmI4
         f8lg==
X-Gm-Message-State: AOAM530WO2eb+2bTZggAoN+U+NGdu0dkXD28HvX5EOnRO1VZlrZBafab
	j7/kFl0552AT+mbVpgRCQJ54yN+/UjdWZFF2wVi/fg==
X-Google-Smtp-Source: 
 ABdhPJzDjKfPVmamRJQAxgMB471w8XvCN5drc/I6TgDj3YSltMwmRDCFMeDA1+qbtcAVkGw6vSM+WmC/0rb1ge3fHeU=
X-Received: by 2002:a17:907:a41e:: with SMTP id
 sg30mr7074503ejc.612.1639501454325;
 Tue, 14 Dec 2021 09:04:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639408799.git.steve@sakoman.com>
 <ab25582a2b64f294bc397894113a3438b48ad544.1639408799.git.steve@sakoman.com>
 <62c35ec8-121b-b4f5-39b8-504aee1b533e@bootlin.com>
In-Reply-To: <62c35ec8-121b-b4f5-39b8-504aee1b533e@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Dec 2021 07:04:03 -1000
Message-ID: 
 <CAOSpxdYTVqRqUevdT0mnMDzPg8LZzjv3+Cy-EammQzZkDvC_4Q@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: prepare for
 3.1.13 release
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 17:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2256

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

We'll be building 3.1.13 sometime in the next few days so we can get
it in before the autobuilder goes down next week for upgrades.

So we should take that into account, since the autobuilder may be down
when we release 3.1.13!

Steve

