Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.8057.1615900270392754353
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 06:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XHt9SS3W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id 61so7404664wrm.12
        for <docs@lists.yoctoproject.org>; Tue, 16 Mar 2021 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fYMauLe/XRyD2ltjSXve3iCuMew3OsjzdKmNtWzJzFA=;
        b=XHt9SS3WsXz9VLmEOnGRK1GExKPgT+GebXRmtO3dLEKbjQqD7DA/IpE/ayegeZlLvv
         GFE8etiRJhRpdS6vHKt5Qa5ASLOnHr71/r2wth+Yxc59buZwvb1pP+Ehz9e7vJfCklBD
         pcDL1DGdOPSoan79M3NI3yJoD/xt4Hw0bVqUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fYMauLe/XRyD2ltjSXve3iCuMew3OsjzdKmNtWzJzFA=;
        b=Q/5QCDKwlJ8D3Ny9q74kVZQlcmV8BUj7H3jx0tH2reZqLdrUv8Ip3cdXoQkanx/d+Y
         h6Y+vGhW7LQBFxPSkmVvN/EmpyZ7xu0J0nyrshr6eAa4I5/p7cutMgSVnja2LcsTepUe
         KqBA+uJlLQoNgyjFKIemrdSC2AG6z2Kpn+uPQ3HKeXVdFrYmXuOAv9YKuQ/1A10hbFW0
         hrB7rFlC63+4H+6DpzfjrnRowH1a1HXUSeenOCD4CxekpnqJzJnJc0N0xbCErVc5e0Hb
         CfjDsRqprUfgOFaZT0iblLlOp4tFc37UpLyVXVMjpc57qqW+5WrYpA6HVFyMF56g/EIX
         Zgjw==
X-Gm-Message-State: AOAM533OEne/HYOz8RWGvhdwm8Eis3y4C9XvJsDjNGATTQdNWAIAXrxM
	/Jai4p+jakeS5UQ8qa+wei8WKp5NCKJ85w==
X-Google-Smtp-Source: ABdhPJxQ4nE98zkuku6bRwakHiUDkpQNwT2tyl5vufdvxzs1L9uklvkYSK7Mzdr4IX5+mB8a9TZA9w==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr4846561wrd.126.1615900268712;
        Tue, 16 Mar 2021 06:11:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6714:d6e6:f8b3:164b? ([2001:8b0:aba:5f3c:6714:d6e6:f8b3:164b])
        by smtp.gmail.com with ESMTPSA id a14sm23730978wrg.84.2021.03.16.06.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 06:11:08 -0700 (PDT)
Message-ID: <6b7688d68105073a9f1dc1718a2f5890d9e089f8.camel@linuxfoundation.org>
Subject: Re: [docs] wisdom of multiple BBFILE_PATTERN_* example in BB user manual
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Tue, 16 Mar 2021 13:11:07 +0000
In-Reply-To: <91803038-3794-aef9-af8e-4128f8a52af5@crashcourse.ca>
References: <91803038-3794-aef9-af8e-4128f8a52af5@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-16 at 08:59 -0400, Robert P. J. Day wrote:
>   not sure why i never noticed this before, but in BB user manual:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes
> 
> there's this weird example for layer.conf:
> 
>   BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
>   BBFILE_COLLECTIONS = "upstream local"
>   BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
>   BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
>   BBFILE_PRIORITY_upstream = "5" BBFILE_PRIORITY_local = "10"
> 
> rendering issue in the last line aside, is using multiple
> BBFILE_PATTERN settings in a single layer definition a good idea? i'm
> unaware of that being used in any layer i've ever seen, and it seems
> that, if one is writing for newbies, the last thing you want to do is
> present something truly obscure like that.
> 
>   thoughts?

The collections code predates layers and in many ways is separate from
the concept. In practise that is how most people use it today. The BitBake 
manual is intended to document the functionality so showing this 
is possible seems reasonable to me but maybe not as in that specific example. 
I'm not sure the manual is specifically targeted at newbies.

Cheers,

Richard

