Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.2877.1604000998428232375
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 12:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R6B6RryT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t9so4043175wrq.11
        for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2020 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HCLmPYb+J2+LYHZQkF1xz6bonXfufLhpQiRaUM/Romw=;
        b=R6B6RryTFKZTQwE0ixobgoA/iyFriXdPVlxXw6VQwbYrxTdCCix+VCeNptUPOQOeuU
         tYRYvg8Ohl9A8VYtL9m8ldWdFIuA8Si6cufSmaAD3GzSui80Dhn0sIi+2OwbXtGiLdff
         dOtqlyIA+rtSfQ3GxYkgzRgt58rVc+o0yRcm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HCLmPYb+J2+LYHZQkF1xz6bonXfufLhpQiRaUM/Romw=;
        b=rwQuVpA33Zjr7uR8fXtkniz2N5nkQt8s0/iv3iCKXbON0/Gc4FSRKPnkMYU3BwhD55
         UiZiYMCDXE2QGumZ0pxLyAzZ6pLctrUBx6VzR035WU1z1JNXwTYB5gdgseZ9NyzjFd6n
         t04MWxNAqvLYaQDLur41A1+ZhTXOWngqQmXEdxYi4t4Dtm4WdF/BR+pW981vPw8KQYuh
         YooKXEtOKERNaQSiCaEKA5bSP2a4EKee74A0CmQrPSiPn2CTkqrvF1M2ZwE6rnB8hcIC
         5BOdA5t9D8AmrBe6QZUt+KCr1obNtlwUzMYku7NctYVsxhBSlr0qtu/5JKgmQOVHtlkV
         aLYQ==
X-Gm-Message-State: AOAM533X3+YeC9mNOIyTkRB/ZrkUdvQ6ByHGr1dA/V5IRFQSreRMnjUV
	S0mqvXG1VB+mpzf9BdHdy+4MvgKOLd5nxg==
X-Google-Smtp-Source: ABdhPJxnlPZkh6ZhNRm2JZ6wRAf4IsZDBejmAGrBCiExzr3g9lsjYxtEBt+EDZkEro/AZ4F5WakdGA==
X-Received: by 2002:a5d:480a:: with SMTP id l10mr7367647wrq.279.1604000996925;
        Thu, 29 Oct 2020 12:49:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id k18sm6907698wrx.96.2020.10.29.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:49:56 -0700 (PDT)
Message-ID: <8e8fbbc2ac3f99533650894893823928e8a33e1b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Paul Eggleton
	 <paul.eggleton@linux.microsoft.com>, "docs@lists.yoctoproject.org"
	 <docs@lists.yoctoproject.org>
Date: Thu, 29 Oct 2020 19:49:55 +0000
In-Reply-To: <ca8c02ed3f724e49bb6dfb5481f5ebb0@XBOX03.axis.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
	 <c9245b18556164df9e94c07084918116182cbfb3.1603839557.git.paul.eggleton@linux.microsoft.com>
	 <ca8c02ed3f724e49bb6dfb5481f5ebb0@XBOX03.axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-28 at 22:18 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> > Of Paul Eggleton
> > Sent: den 28 oktober 2020 02:19
> > To: docs@lists.yoctoproject.org
> > Subject: [docs] [PATCH 4/7] ref-manual: add PSEUDO_IGNORE_PATHS
> > 
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > 
> > Add a brief variable glossary entry for the new PSEUDO_IGNORE_PATHS
> > variable.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >  documentation/ref-manual/ref-variables.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/ref-variables.rst
> > b/documentation/ref-manual/ref-variables.rst
> > index a7315cf..176c94a 100644
> > --- a/documentation/ref-manual/ref-variables.rst
> > +++ b/documentation/ref-manual/ref-variables.rst
> > @@ -5932,6 +5932,14 @@ system and gives an overview of their function and contents.
> >        service <dev-manual/dev-manual-common-tasks:working with a pr service>`. You can
> >        set ``PRSERV_HOST`` to other values to use a remote PR service.
> > 
> > +
> > +   :term:`PSEUDO_IGNORE_PATHS`
> > +      A comma-separated (without spaces) list of files that should be ignored
> 
> Based on the default definition of PSEUDO_IGNORE_PATHS in bitbake.conf, saying 
> "files" here seems misleading. It seems to support files, directories and even 
> prefixes, e.g., "${WORKDIR}/deploy-".

That is correct, I've tweaked the patch queued in -next to reflect
that, thanks.

Cheers,

Richard

