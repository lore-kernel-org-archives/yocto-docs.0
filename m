Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A62C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:01:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.940.1647882063671861252
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fguh7Wfs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id b19so21557813wrh.11
        for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WyLfT3tG9bc4BjS+YHwGl7jrUBzYkY0ODXhfBD7tnI0=;
        b=Fguh7WfsYkRaA+Fp1matWd6wxiPhWT4QMRIAu8jAT44FlRxjDEp6HxAz9yBh94JdnL
         w7/IUQgrJYBDUeXo/I3xQ5QNHF8EPgy8jvnH/bflBqlhGQT2wElRppz04256aO7O8Lzn
         4EerU/l4T+jsS7KWaOy81rsg5bZ0NPaO/cn8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WyLfT3tG9bc4BjS+YHwGl7jrUBzYkY0ODXhfBD7tnI0=;
        b=TNpOsqeGql/9iKAiBZJDYop6H6y3M2AUqnMwicJUA4PrzUqfr3kyyN2ZuumNO9xHJD
         Zi8oskVaWH/R//MwNkj94VAvke3eqOkKowgIcHF9zjHDcUqecoR73rtOOtKfnc2FAT9t
         h7DJ9Ge7l1oyPVwknC9ML1fQ8yJWbWIRa08VuqL++qbFvWiHKWfLvJk+9rJxWwCyGTn8
         QneVJ16/j39q3gSa3gSUAnLl7WUtK8ZS7rMu5sJ4NGiBL7THGeY96Hd55RF/EIrzxl8T
         kmA62rTOssDUua4JIzYT/SpiJ1l4lHu7nuLDVAFEXHmjvxl46NfgCCv8vF5b3Oia6wlj
         U7aQ==
X-Gm-Message-State: AOAM532EhlWvj8hU3tFpvPDjSpbpphic3wnRoalrmQvNW8e+z6LdxT02
	hjFWrpZlHIhjle0mDvFIok1nQ1T47v7loAck
X-Google-Smtp-Source: 
 ABdhPJwERUjWztSYyqb2qRBcedKscvDE4aWDhvmaScqq41ziLbdzP0vEb9L9QKulTGZmE5xdf+JWOg==
X-Received: by 2002:a5d:49cb:0:b0:1f1:d7e0:3f66 with SMTP id
 t11-20020a5d49cb000000b001f1d7e03f66mr19065297wrs.218.1647882062150;
        Mon, 21 Mar 2022 10:01:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7422:13d5:6a39:d39?
 ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a5d6181000000b00203fc0e79a3sm7613554wru.46.2022.03.21.10.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:01:01 -0700 (PDT)
Message-ID: 
 <f7cb69aa180ec385e9ca7527bcc7a91bd247ccda.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/3] conf.py/set_versions/poky.yaml: Set version
 in conf.py from poky.yaml
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Date: Mon, 21 Mar 2022 17:01:00 +0000
In-Reply-To: <3140add6-343e-28fd-3d29-d3754bbd33b9@theobroma-systems.com>
References: <20220318154228.1071136-1-richard.purdie@linuxfoundation.org>
	 <20220318154228.1071136-2-richard.purdie@linuxfoundation.org>
	 <3140add6-343e-28fd-3d29-d3754bbd33b9@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2655

On Mon, 2022-03-21 at 16:55 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On 3/18/22 16:42, Richard Purdie wrote:
> > Allow conf.py to read the versions it needs from poky.yaml and have
> > set_versions.py write this out. This means we don't have to change as
> > many files when making new releases.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   documentation/conf.py         | 11 +++++++++--
> >   documentation/poky.yaml.in    |  2 ++
> >   documentation/set_versions.py | 20 ++++++++++++++++++++
> >   3 files changed, 31 insertions(+), 2 deletions(-)
> > 
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 3015892d2..4bbe9b574 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -16,8 +16,15 @@ import os
> >   import sys
> >   import datetime
> >   
> > -current_version = "dev"
> > -bitbake_version = "" # Leave empty for development branch
> > +# current_version = "dev"
> > +# bitbake_version = "" # Leave empty for development branch
> > +# Obtain versions from poky.yaml instead
> > +with open("poky.yaml") as data:
> > +    for line in data.readlines():
> > +        if line.startswith("DOCCONF_VERSION"):
> > +            current_version = line.split(":")[1].strip().replace('"', '')
> > +        if line.startswith("BITBAKE_SERIES"):
> > +            bitbake_version = line.split(":")[1].strip().replace('"', '')
> >   
> 
> Please use yaml loading here.

Agreed, that would be better. I'd just borrowed code I already knew worked
without thinking about the context.

> >   # String used in sidebar
> >   version = 'Version: ' + current_version
> > diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> > index 89a059ef1..a346b7623 100644
> > --- a/documentation/poky.yaml.in
> > +++ b/documentation/poky.yaml.in
> > @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
> >   DISTRO_NAME_NO_CAP_LTS : "dunfell"
> >   YOCTO_DOC_VERSION : "3.4.2"
> >   DISTRO_REL_TAG : "yocto-3.4.2"
> > +DOCCONF_VERSION : "dev"
> > +BITBAKE_SERIES : ""
> >   YOCTO_DL_URL : "https://urldefense.proofpoint.com/v2/url?u=https-3A__downloads.yoctoproject.org&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=5bOZnDEv39WIAA9f1qL5vv-kisLv98s5Xz7QWJFkX3FdBZ_HIDjlbL1LB-0BWVp5&s=j5LkQTKxO-b4aoleGDRBUWLKGNHceTefO7vyV_X0MTg&e= "
> >   YOCTO_AB_URL : "https://urldefense.proofpoint.com/v2/url?u=https-3A__autobuilder.yoctoproject.org&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=5bOZnDEv39WIAA9f1qL5vv-kisLv98s5Xz7QWJFkX3FdBZ_HIDjlbL1LB-0BWVp5&s=bzAojsSaFdTWXYcTSVQ2Y2HNf4yAdaUPfAkLFgQvF2s&e= "
> >   YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> > diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> > index 266ccf464..32259238e 100755
> > --- a/documentation/set_versions.py
> > +++ b/documentation/set_versions.py
> > @@ -25,9 +25,20 @@ release_series["hardknott"] = "3.3"
> >   release_series["gatesgarth"] = "3.2"
> >   release_series["dunfell"] = "3.1"
> >   
> > +bitbake_mapping = {
> > +    "langdale" : "2.2",
> 
> This needs to be commented out otherwise the indices are wrong since 
> based on release_series index (c.f. i variable below).

Ok, I think the code originally needed that but in later changes it probably can
be commented out.

> I'm starting to think a dictionary would be a much better data structure 
> for release name, version, lts status, and bitbake version than trying 
> to maintain multiple lists or dicts and aaccessing them via the same index.

I went around in circles on that. Note that:

* the bitbake version is only needed for a subset of the releases (dunfell
onwards)
* the poky version is only needed for dunfell->honister
* the lts list is much smaller (once every 3 releases and no history)

and the current form of access seemed easier to code this way.

Cheers,

Richard







