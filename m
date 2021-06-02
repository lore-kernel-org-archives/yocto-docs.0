Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.513.1622674538974694514
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 15:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eaGZSSeV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id f2so3817578wri.11
        for <docs@lists.yoctoproject.org>; Wed, 02 Jun 2021 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uz+JK4Ok+EdfTasb6t1pAXz9DnjvvzckJ3ivIzhYip8=;
        b=eaGZSSeVjA5JWHrLcB34269P9DElN7tkMFNXOPLTVfK4PutiETMnIWx9nwjEQucUYT
         Fmz7iDA6KllHCOp4DeFVLT5QeHraxrCynSHMdyszRprGVdvHj//J6WL7MK75QYwRuozI
         JBte3PHYDG/cT1QvXlRJYMKDD0GvXewjAwuuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uz+JK4Ok+EdfTasb6t1pAXz9DnjvvzckJ3ivIzhYip8=;
        b=n8po3JtAFbSD+YlJVT7OlxF9ea7Wb12YAzBJxxtTJd+QVjZWxU93kuZS2ssEaPVxDO
         EAQXJw66vdNVyELqvIBi3le1JKosTyWbZjk3kn0np9NnsoIfyq0BAuEZ90ysDjAWgsTd
         0AZKVekbEfxl8QMXj3WmAqPdkzd1scF5N2oMJxUOQhGoW+XaHbq5NjcR5Mg7L3+EvWi9
         IlCBO8T+sbNTMdeZpozOi+jhfGp2KM7P+8mnSGqviSXhF6sXcPd2DFFt+8augxHp3Efe
         GuJHVINgGEIGIpRdSvxH7RV7wEThbCfvmt79Ii11SMELpBlR4N33kKI6AdNDWC4L96lA
         4amA==
X-Gm-Message-State: AOAM532Yq4yln49u3hoEwgSJSFRmHfccZ7khW6OClCSJqopK+l0bK+cD
	z4w1B25j2XhOerq+1sj3EpPchw==
X-Google-Smtp-Source: ABdhPJxqjCehuPNPS6v61wNs+CY2WioWSCf7+w4HuVitVIuyHJfUzMDOuXQbIRBT2anFL6sYul4Axw==
X-Received: by 2002:adf:c442:: with SMTP id a2mr29312992wrg.277.1622674537282;
        Wed, 02 Jun 2021 15:55:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:aa71:4934:cc48:7546? ([2001:8b0:aba:5f3c:aa71:4934:cc48:7546])
        by smtp.gmail.com with ESMTPSA id y2sm4655322wmq.45.2021.06.02.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 15:55:37 -0700 (PDT)
Message-ID: <0da0fd34b8ab5f5e879f7dbfd76397de62c20d2f.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] yocto-docs: remove obsolete documentation/tools/update-documentation-conf
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 02 Jun 2021 23:55:36 +0100
In-Reply-To: <1684E5A69F204AD5.12726@lists.yoctoproject.org>
References: <20210602150041.586679-1-michael.opdenacker@bootlin.com>
	 <1684E5A69F204AD5.12726@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-02 at 23:51 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> On Wed, 2021-06-02 at 17:00 +0200, Michael Opdenacker wrote:
> > This script references old documentation files that no longer exist
> > 
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  documentation/tools/update-documentation-conf | 158 ------------------
> >  1 file changed, 158 deletions(-)
> >  delete mode 100644 documentation/tools/update-documentation-conf
> 
> You might want to think a little more about this script.
> 
> It takes the documentation.conf file from OE-Core and injected that data
> into the glossary section of the manual (in xml format).
> 
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/documentation.conf
> 
> Would we want to automate injecting that data into the sphinx glossary?

Sorry, it is the other way, it takes the manual data and writes it into 
documentation.conf.

We still need to think about how we plan to look after that data and keep in 
sync (if we need to?)...

Cheers,

Richard

