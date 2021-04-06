Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12497.1617718020343485549
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 07:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fyWKAZ9x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a12so4615239wrq.13
        for <docs@lists.yoctoproject.org>; Tue, 06 Apr 2021 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fcNb7OlvPUsAKpND5tzujQCG2eyWRlx34ssdIcIg308=;
        b=fyWKAZ9xbAbNV06PXZ0FP3ZomHFMqUTo2zG93sxgPlcJ1SGcvul53fK4risigmAjDc
         8FlKKcRq3XJigpiuFC5LqVOPaelYOJWXyxP8kvmJtRWjw8WH+wKGsgzRMFARWUsnk095
         wpQGgsAiBpFgokng/RvBenQbY+lhjhJe14W0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fcNb7OlvPUsAKpND5tzujQCG2eyWRlx34ssdIcIg308=;
        b=jOJN4pF0Gt26UnC6cUtddHprmIA5hCTQFE/uGSNeFzyDT56PiNAcg+aCkFPtHs5Fip
         AkxgbFcznS4C+P3+WU6N6Y1s25uyl8jNhv8B6ZVbO2ea813binRGJ39szZu+E7qpK0gc
         somvUDObYeFacYIyBuQKd4nmR7mxiWhd59H0Wwp0H3z8h3sHxu7Yl3uygPlKGaFRXBrW
         e1D+R+1Lz2VxcFOtuG0X2sUaL1NYB9LGEoGrkJRwjcDsz7Uqj9ssRr2/xnaGm34wFyO3
         fhyBJBVi6mxSFpiRGHBK4ZpGKeEUMMaxKblzOo0VktG9lmUoYkNaIptWBAT7vKzUcFi4
         H68A==
X-Gm-Message-State: AOAM5313+O57id7V7Se4nbOrRg2VGL11bhXC4WJlunJ+fbvJVE/mxLPG
	rXo+sY68ZeOEK576eOwR7XYbDiVp8UDeZw==
X-Google-Smtp-Source: ABdhPJwsgWoxZR6aVXI8FEmPGjSX3c00/3ButhKbf2UqJZxXrg2zinuzt0Ktg2Zip3uT6pV39piF3w==
X-Received: by 2002:a5d:61c7:: with SMTP id q7mr16354278wrv.215.1617718019039;
        Tue, 06 Apr 2021 07:06:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id n3sm2935983wmi.7.2021.04.06.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:06:58 -0700 (PDT)
Message-ID: <724339bcbea412e7b2b5097d091692d5f9385474.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] releases: update to include 3.2.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "docs@lists.yoctoproject.org"
	 <docs@lists.yoctoproject.org>, "mhalstead@linuxfoundation.org"
	 <mhalstead@linuxfoundation.org>
Cc: "rpurdie@linuxfoundation.org" <rpurdie@linuxfoundation.org>, 
	"nicolas.dechesne@linaro.org"
	 <nicolas.dechesne@linaro.org>
Date: Tue, 06 Apr 2021 15:06:57 +0100
In-Reply-To: <bcee72baa511ae69997ad5d182e96f0838fc29b8.camel@intel.com>
References: <20210402223011.309701-1-mhalstead@linuxfoundation.org>
	 <bcee72baa511ae69997ad5d182e96f0838fc29b8.camel@intel.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-04-05 at 01:16 +0000, Mittal, Anuj wrote:
> Hi Michael,
> 
> On Fri, 2021-04-02 at 15:30 -0700, Michael Halstead wrote:
> > Updating to build 3.2.3 docs and add missing 3.0.4 release line.
> > 
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > ---
> >  documentation/poky.yaml                  | 6 +++---
> >  documentation/releases.rst               | 2 ++
> >  documentation/sphinx-static/switchers.js | 2 +-
> >  3 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index 3c30c4430..de264c963 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -1,12 +1,12 @@
> > -DISTRO : "3.2.2"
> > +DISTRO : "3.2.3"
> >  DISTRO_NAME_NO_CAP : "gatesgarth"
> >  DISTRO_NAME : "Gatesgarth"
> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
> >  DISTRO_NAME_NO_CAP_LTS : "dunfell"
> > -YOCTO_DOC_VERSION : "3.2.2"
> > +YOCTO_DOC_VERSION : "3.2.3"
> >  YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
> >  DISTRO_REL_TAG : "yocto-3.2.2"
> 
> Should this be yocto-3.2.3?

I think it should, well spotted. I've queued a patch for that, thanks.

Richard

