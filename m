Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937BAC64E77
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.10218.1650473301618283949
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 09:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MXxGYcFe;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id g13so4780325ejb.4
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGUaXytdR/ZXUkOJwlFlOmj8jFGTTqRMfg+ZE1clReI=;
        b=MXxGYcFeECnwRG37x+PNclKPoHU6mA8rui8KdfheASBlFu5HsXtPyAQU6uejhvjK33
         7hSzfK4Cmwe/qxnWge4QGvPjNQi+lSDLk+xsA2LkgnKUK3eTN3SdbThLycUFTui1r4ug
         ZrjTMykKSYljuhTXVauzRIZ/PGR4iIqEVvlh+rp/VlX0HJiJMPRusNvS5CVq4/SA7sQF
         jG1kLG050FDivzUMC+xLXE1hLgtF8jGNclah7h+75WCdJFEo3jO0/IJ/bPyrVPa2MBes
         gVv7atPDefOamCoqHz+cCFi4PcRsqlXbazK5XDykfEKPf2vu4hIUJWUlrDDnMksXHjPi
         l2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGUaXytdR/ZXUkOJwlFlOmj8jFGTTqRMfg+ZE1clReI=;
        b=PxvwIBAOZ+UuU9WMDkJ10Y5f4zeo0zSqbJMdl98ExXy71wvIq3M1hiY6zP6aC0moXk
         TdDRCBN5wQS9Yn5tF/pQGgoMQ9ZeMVfEjqLHRnk8Fquuj/wrvS7X1yNGHPVNsdSH7njB
         IIEy2ubFdFqwp1M4KBlGSXuOMlbXA0uaErNK0n5JR4f1j7y8/cEftqKWO3+8UpZkTaaR
         xrHFmuKIsAmMu04KHTecjddsqf5k/e77rXhSLqOzHaQ1EOoD6AEO02cTQ02D8uf0ARwe
         GotI6yFBYNL9C9Km03K/wajGUtCLj8nnUMjQEubR32KSB/+ngeQEK4n+/jlIo6EiuCFZ
         KXVw==
X-Gm-Message-State: AOAM530li6pstYS2l3NAyfXYqcPxdcb/kVFabUoCz1uvgbH95hC2eUpI
	QQ4pzGFjmQYw8NfNTk2iFsks4bVPWKqxYZOBOfYOzw==
X-Google-Smtp-Source: 
 ABdhPJy734y25eMz6ZG1HguwyrGi0GUOC7cSXV6FJ3elTBIsO/wJ6aKn6HpjBWpkf4qkg6EnzoO7ZZcS0VIcMli1Tcg=
X-Received: by 2002:a17:907:6da9:b0:6ef:f582:6fcd with SMTP id
 sb41-20020a1709076da900b006eff5826fcdmr4965293ejc.685.1650473299893; Wed, 20
 Apr 2022 09:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
 <fac6ec38-a689-9bda-3e4f-90528300d974@theobroma-systems.com>
In-Reply-To: <fac6ec38-a689-9bda-3e4f-90528300d974@theobroma-systems.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 20 Apr 2022 06:48:08 -1000
Message-ID: 
 <CAOSpxdZEHrrGvB5DC5NnKLCGQeLH=1CN6y_6V4BXOueZkivJZQ@mail.gmail.com>
Subject: Re: [docs] [PATCH][dunfell] conf.py/poky.yaml: Move version
 information to poky.yaml and read in conf.py
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2813

On Wed, Apr 20, 2022 at 4:34 AM Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Hi Richard,
>
> Thanks for helping me with this!
>
> On 4/20/22 13:29, Richard Purdie wrote:
> > Merge in the changes from master allowing conf.py to use information from
> > poky.yaml. This allows the head version mapped to X.999 on the website to
> > have the version information displayed clearly and correctly.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   documentation/conf.py   | 22 ++++++++++++++++++++--
> >   documentation/poky.yaml |  2 ++
> >   2 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 4df8f55d1..df67a5cdf 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -15,9 +15,27 @@
> >   import os
> >   import sys
> >   import datetime
> > +try:
> > +    import yaml
> > +except ImportError:
> > +    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
> > +    \nPlease make sure to install pyyaml python package.\n")
> > +    sys.exit(1)
> >
> > -current_version = "3.1.15"
> > -bitbake_version = "1.46"
> > +# current_version = "dev"
> > +# bitbake_version = "" # Leave empty for development branch
> > +# Obtain versions from poky.yaml instead
> > +with open("poky.yaml") as data:
> > +    buff = data.read()
> > +    subst_vars = yaml.safe_load(buff)
> > +    if "DOCCONF_VERSION" not in subst_vars:
> > +        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
> > +        sys.exit(1)
> > +    current_version = subst_vars["DOCCONF_VERSION"]
> > +    if "BITBAKE_SERIES" not in subst_vars:
> > +        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
> > +        sys.exit(1)
> > +    bitbake_version = subst_vars["BITBAKE_SERIES"]
> >
> >   # String used in sidebar
> >   version = 'Version: ' + current_version
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index e0f8166f7..edc23f8aa 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> >   YOCTO_DOC_VERSION : "3.1.15"
> >   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> >   DISTRO_REL_TAG : "yocto-3.1.15"
> > +DOCCONF_VERSION : "3.1.15"
> > +BITBAKE_SERIES : "1.46"
>
> I was wondering if this was not the opportunity to explicit that after
> this commit nothing needs to be updated by maintainers for version
> bumping except git tagging the docs git repo?

I'm confused!  Do I still need to update the version info in poky.yaml?

I have a release coming up next week and want to make sure I get this right!

Steve

> e.g. DOCCONF_VERSION :
> "autogenerated-from-set_versions.py-from-master-branch"
> or something like that.
> Or a comment at the top of the file explaining which variables are now
> auto-generated by set_versions.py?
>
> Otherwise, I tested this on all branches listed in this patch series
> with the autobuilder script and it does what I'd expect them to :)
>
> Thanks!
> Quentin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2806): https://lists.yoctoproject.org/g/docs/message/2806
> Mute This Topic: https://lists.yoctoproject.org/mt/90581577/3620601
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

