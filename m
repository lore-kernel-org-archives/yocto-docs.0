Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C99BC64E78
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.10140.1650473559796810686
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 09:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e9gUd9F3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso2705832wms.0
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xu+EYL9WXEib+XD7+aT0TTS1tiXwZ0S5+ktvcAiulrA=;
        b=e9gUd9F3iTcZjIz1iI0u7M5LP4dpBylwKP6B2M1Noa8H7wdvhmPJ4qJS1qGr4T09gy
         3QEIyb0RUQQRguuvXvW5cNHGXaMqMOC+GT3z7DtBicstQ4CNH0oJnFmHYycJzT6s9vuD
         UDABxCya6HqnDG8sqsqyNoU8P+tZRzVTMKGjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xu+EYL9WXEib+XD7+aT0TTS1tiXwZ0S5+ktvcAiulrA=;
        b=t25NHFTU9CP6pQqLhK8qDeXBoyHT+VI7Ipm21x537bnlR4RD/a4qpv9DnUiiOaD+G+
         oU72VlrIHssQmy4OrVk7g/sGWxyYxNx8BHvFCUkjP2VZSDVxQ5DE+G97jxA1wxIdP4Jr
         h9s2Ua+SbZTO1wimQT1QseM4oe+BuKH+TlAVJKoRQ0EyL6O+4RYf0kJ2tmCc4aaBhyDY
         +Tjli2c5X0Bhz3sNmsZvSxnWceemLxdEEqd9a/HX7tOpf9HRVrvI9T4THyCczGRjJddG
         rK0BUYIjVsoKMQndWPmnQM+ZlQje2D+ZoCbuZFCHmiYvvkg325LF4sNVyggoWxDMRdPy
         to8g==
X-Gm-Message-State: AOAM531OlVIBJn2A7//rRLUBh/nZACBrMisvOvfGTJrdEUn0C5/CvnFA
	JkNCTzECOjf/1zQTNf/Bil8W4g==
X-Google-Smtp-Source: 
 ABdhPJzM73afVmJ+tre3qT4FUdKmmLDw/xLTF8Ojo2JavHGg22qUMjjRxysb0UwBblnWhIQfo4EQZQ==
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr4550222wmb.29.1650473558395;
        Wed, 20 Apr 2022 09:52:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9745:8b8f:81da:af07?
 ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm440650wry.3.2022.04.20.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:52:37 -0700 (PDT)
Message-ID: 
 <b2a11fde77bf65cecd8b0865636179c82b0b95af.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH][dunfell] conf.py/poky.yaml: Move version
 information to poky.yaml and read in conf.py
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Date: Wed, 20 Apr 2022 17:52:34 +0100
In-Reply-To: 
 <CAOSpxdZEHrrGvB5DC5NnKLCGQeLH=1CN6y_6V4BXOueZkivJZQ@mail.gmail.com>
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
	 <fac6ec38-a689-9bda-3e4f-90528300d974@theobroma-systems.com>
	 <CAOSpxdZEHrrGvB5DC5NnKLCGQeLH=1CN6y_6V4BXOueZkivJZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2814

On Wed, 2022-04-20 at 06:48 -1000, Steve Sakoman wrote:
> On Wed, Apr 20, 2022 at 4:34 AM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
> > 
> > Hi Richard,
> > 
> > Thanks for helping me with this!
> > 
> > On 4/20/22 13:29, Richard Purdie wrote:
> > > Merge in the changes from master allowing conf.py to use information from
> > > poky.yaml. This allows the head version mapped to X.999 on the website to
> > > have the version information displayed clearly and correctly.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >   documentation/conf.py   | 22 ++++++++++++++++++++--
> > >   documentation/poky.yaml |  2 ++
> > >   2 files changed, 22 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/documentation/conf.py b/documentation/conf.py
> > > index 4df8f55d1..df67a5cdf 100644
> > > --- a/documentation/conf.py
> > > +++ b/documentation/conf.py
> > > @@ -15,9 +15,27 @@
> > >   import os
> > >   import sys
> > >   import datetime
> > > +try:
> > > +    import yaml
> > > +except ImportError:
> > > +    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
> > > +    \nPlease make sure to install pyyaml python package.\n")
> > > +    sys.exit(1)
> > > 
> > > -current_version = "3.1.15"
> > > -bitbake_version = "1.46"
> > > +# current_version = "dev"
> > > +# bitbake_version = "" # Leave empty for development branch
> > > +# Obtain versions from poky.yaml instead
> > > +with open("poky.yaml") as data:
> > > +    buff = data.read()
> > > +    subst_vars = yaml.safe_load(buff)
> > > +    if "DOCCONF_VERSION" not in subst_vars:
> > > +        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
> > > +        sys.exit(1)
> > > +    current_version = subst_vars["DOCCONF_VERSION"]
> > > +    if "BITBAKE_SERIES" not in subst_vars:
> > > +        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
> > > +        sys.exit(1)
> > > +    bitbake_version = subst_vars["BITBAKE_SERIES"]
> > > 
> > >   # String used in sidebar
> > >   version = 'Version: ' + current_version
> > > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > > index e0f8166f7..edc23f8aa 100644
> > > --- a/documentation/poky.yaml
> > > +++ b/documentation/poky.yaml
> > > @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> > >   YOCTO_DOC_VERSION : "3.1.15"
> > >   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> > >   DISTRO_REL_TAG : "yocto-3.1.15"
> > > +DOCCONF_VERSION : "3.1.15"
> > > +BITBAKE_SERIES : "1.46"
> > 
> > I was wondering if this was not the opportunity to explicit that after
> > this commit nothing needs to be updated by maintainers for version
> > bumping except git tagging the docs git repo?
> 
> I'm confused!  Do I still need to update the version info in poky.yaml?
> 
> I have a release coming up next week and want to make sure I get this right!

You can and it will look better on the branch but the build process no longer
needs it and will override it on the website :)

Cheers,

Richard


