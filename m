Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.7340.1602578300681616675
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 01:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SOhN3g8G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id x7so14339911wrl.3
        for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2020 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fOhm158z+EYzThcAMoBiuLX1tojASqXATJ6NPo2IUuo=;
        b=SOhN3g8GrmTgFodYBK9CYcAZdArHJuwlROgXAM/UQ1g9X/VGezfblWIiBZ972ctDwj
         doUD8/g6LV8+bZ+TdX73oExU9jG692Rw84Sdl5aluSYR8To21P12R0EuJcn0BDNSsE8q
         TlhJZUGj31LIAQJahAUR9qgTew2W6zo6rqFmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fOhm158z+EYzThcAMoBiuLX1tojASqXATJ6NPo2IUuo=;
        b=Byv4AzBHAMSvlNPBjb5/06Yuv6+UWDq+k43sO9yLAheAgzkOwoP04iylHrFFZk1XhA
         KW9G6/DEpcvN4UunrxP4J2bcFBW24b6H8Ie7UcgWyagkOzoWBh96xBq9g/HzxdvGVT8Y
         1vtIBxptnlrqADUsOpJBs3jIAlrGJtf3UXhnlPGL7+1Y6cBxIU318Zd+/059q0nCiMMo
         01Erj0ceEeyaUiFntu7UcwYB+y86m9UtFouh4m7bgNw30pCqL2B61EvAEUilvf7iohAA
         /PKmxiF3nouMATEtpps1v69Kh+5pCVYw3sjTDcxdWhiD7e/OFBt930WWaiUvkoMWUaUC
         DDdg==
X-Gm-Message-State: AOAM5322WQFRV3IsQL6TJPCjjAB22GdeN5pQGxoBdQF7tHqARAXLe6Jk
	CLUpog+4sKSwGaIKZxnTKePk9w==
X-Google-Smtp-Source: ABdhPJz8FLJ9hoQXzDoeF68UHfz8CjMMdfN7fWBVUYDAex8SrcnrYMXtTEwwbEm+Q0B+/p3NcbtHIQ==
X-Received: by 2002:adf:ce0b:: with SMTP id p11mr28103570wrn.318.1602578299035;
        Tue, 13 Oct 2020 01:38:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id q15sm692844wrx.55.2020.10.13.01.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:38:18 -0700 (PDT)
Message-ID: <b899138d3371db7b4e77ac7913bac169f661e3f0.camel@linuxfoundation.org>
Subject: Re: [docs] Sphinx for Dunfell
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	docs@lists.yoctoproject.org, Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Oct 2020 09:38:16 +0100
In-Reply-To: <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
References: 
	<CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
	 <CAP71WjzYV70G_aW9kqkhuqzzZBAMHt4um2ocNL=6hrHCZGBLOQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-13 at 09:41 +0200, Nicolas Dechesne wrote:
> which indicates the following commits exist in 3.2 and not in 3.1
> (again, I am filtering out sphinx changes):
> 
> 44b57216 bitbake-user-manual: update perforce fetcher docs
> 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> 7689fa78 bitbake-user-manual: Remove TERM from BB_HASHBASE_WHITELIST
> example
> 
> Out of these three changes, I think only:
> 9186ca47 bitbake-user-manual: Add BBFILES_DYNAMIC
> 
> Should be backported to 1.46 branch since it applies to 3.1, the
> other
> 2 changes are only for 3.2. To bring Sphinx docs into 1.46 branch, I
> could import the Sphinx files from master branch, and 'undo' these 2
> commits.

I had a quick look at things and that seems reasonable to me.

Cheers,

Richard

