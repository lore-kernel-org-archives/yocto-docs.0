Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.312.1622673407108414139
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 15:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HO0TTDbC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id b145-20020a1c80970000b029019c8c824054so4679325wmd.5
        for <docs@lists.yoctoproject.org>; Wed, 02 Jun 2021 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6lxBh1sQYFHoJgLFSlQCd/ISnJ48p2BffRbUCB0ouCk=;
        b=HO0TTDbC1wIchPD/n0EQR5QPhL6Yi/98wpMuIub78lFJDXnInBGsXYmAzv/p7pw2ew
         c8GLoRdFe7n0AOYR880sQ2qvRJuww0XpMz+nSj/hOHgXegEn1+uSmjfy24mZJkmlai3B
         SDEqe4mNOjVEsl2CHXXYom7HAn81zwFmmLSII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6lxBh1sQYFHoJgLFSlQCd/ISnJ48p2BffRbUCB0ouCk=;
        b=AbxVQL7EsdGLvTAsyZtOelInWfvZdxsEouwN3SLvcZgyiYcCVmpEGOrte9t9V5nD6K
         BcQh5DfUmjJpr4ItbFkC1ilzg8BqcOZP+pP0puO2JtVc2MJ/yKtMYglB853cdnKdV/8r
         vLjPjiq0yuImo2bS64kDX2XiTy1fNMgf1J6Jp/pd5YxY3vMP2kh3pitN6vwVfwicav9z
         I8vVJ7h0eX7oHP9fgxPl9LJBMrXygvyZ8yah/vN9NVgWwEtIxuY8jjSGlZvPqIF/KPT1
         dYvT9l6YG0GR4MtEDxz05GQ2Xq+5vCSNsBmJXcE+lEizqBCClwv6xG61L2BR0Ac2ZH8g
         +i/A==
X-Gm-Message-State: AOAM530fQZoQvH6M+2FRcRtxnKRaYhinCQVgLb8jxtsoWnzlFMeWVWZ7
	MgQR2CDx9BrHTsEJjCQFAVKwIQ==
X-Google-Smtp-Source: ABdhPJy1lM8R0e5HSlyg0QWNxnN3eiNyCjBqsenqFA4KrN+pxUeiyLIzhVZDY2/ExFW71VX/q/a7fA==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr7015042wmf.113.1622673405423;
        Wed, 02 Jun 2021 15:36:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:aa71:4934:cc48:7546? ([2001:8b0:aba:5f3c:aa71:4934:cc48:7546])
        by smtp.gmail.com with ESMTPSA id z12sm1242890wrv.68.2021.06.02.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 15:36:45 -0700 (PDT)
Message-ID: <dc93923039b634c48ab47fbd5b09f93ba1fae8cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott] [PATCH 1/5] expat: set CVE_PRODUCT
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 02 Jun 2021 23:36:41 +0100
In-Reply-To: <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
	 <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-02 at 16:34 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 6/2/21 3:27 PM, Richard Purdie wrote:
> > --- a/meta/recipes-core/expat/expat_2.2.10.bb
> > +++ b/meta/recipes-core/expat/expat_2.2.10.bb
> > @@ -25,3 +25,5 @@ do_install_ptest_class-target() {
> >  }
> >  
> > 
> > 
> > 
> >  BBCLASSEXTEND += "native nativesdk"
> > +
> > +CVE_PRODUCT = "expat libexpat"
> 
> 
> Oops, this variable doesn't appear in the documentation and more
> generally CVE management doesn't seem to be documented.
> 
> Your comments and suggestions are welcome. I created a new bug
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=14419) to track this.

It isn't documented and should be. Having the bug is good and we should 
fix/improve this.

Cheers,

Richard

