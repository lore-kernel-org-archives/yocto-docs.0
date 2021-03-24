Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.144.1616605275617984751
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 10:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkXLZ7Q8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j18so25182740wra.2
        for <docs@lists.yoctoproject.org>; Wed, 24 Mar 2021 10:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kjjKa99tY4r0niNAbOQAOSiG59o3gsxRa6piiP8dibM=;
        b=YkXLZ7Q8shL4AMiMZSXZVpuiOW8jRRaSlUSCL+g1FWWRHaGGF4/IJ2poEOP8F7dLQZ
         hF9qHF8l3+95TigmlXcwIB7kz9iEM4vy5gEmDIaheq3UdNs+woW1xUlh2fbdI++BmS4Z
         yrcGmeBXzkvcc9TYUucPUPeL0yNf4gcW362Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kjjKa99tY4r0niNAbOQAOSiG59o3gsxRa6piiP8dibM=;
        b=A204Yt9wyjnM0FbUWwiYdx1XUAIDVrz84Dye1MDrbTdquTEo5g9il/zgBFSxj3zVBm
         rEg8vM4VC/qVVfPuoLX7yn8YWnz1330VOUirbaujWFcTaQkdlZ6xM4OX8KBPTV2I9jrB
         udp99oFHL21dAR8xTEltzmYwyE6LbiWxf4F42X2XuEOSDZYJV943LjrO/T4e8tj4h1nm
         pra+6bTDTY+o4aYbFD8epdnUSgj3/BZeaOaQvPTlnNbiYYEJVQ90dhWGIWak+1WDe/N6
         /YTPqrS1cDaTRdn3FoQZsbaifFfo7byuAcnT7m5mB3T4XZS5brDmF/EWEv38zGFERHLV
         TvMw==
X-Gm-Message-State: AOAM532idyZA5kkzHkNDM5qBpBscsXVYi/QQCj24b8aofELfihdYciut
	GTPPznOlDNzFwOYvWaVzKCFxvw==
X-Google-Smtp-Source: ABdhPJxHgt/wfeMxgoSwntjnr/AS7DoSgm+sRudkqW6FNjhJRvTSnomNImAoqNafOyyvNjd4hCk85g==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4655201wrt.18.1616605273791;
        Wed, 24 Mar 2021 10:01:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id s9sm3606624wmh.31.2021.03.24.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:01:13 -0700 (PDT)
Message-ID: <abc98a06c805118148fb3dd5539b785d748aa24f.camel@linuxfoundation.org>
Subject: Re: [docs] HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 24 Mar 2021 17:01:12 +0000
In-Reply-To: <b0edd6d-7221-1f7d-cb6-6068c6963e23@crashcourse.ca>
References: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>
	 <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>
	 <b0edd6d-7221-1f7d-cb6-6068c6963e23@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 12:49 -0400, Robert P. J. Day wrote:
> On Wed, 24 Mar 2021, Richard Purdie wrote:
> > On Wed, 2021-03-24 at 12:06 -0400, Robert P. J. Day wrote:
> > >  yes, i realize the end of that entry gets around to that, but
> > > that should be emphasized from the beginning. i might even throw
> > > in a link for the reader to here:
> > > 
> > > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host
> > > 
> > >   also, the required presence of those tools on the host is
> > > totally independent of whatever ASSUME_PROVIDED is set to; the
> > > setup_hosttools_dir() routine in base.bbclass has no interest in
> > > the value of ASSUME_PROVIDED. so even if some of those tools had
> > > been built natively by the OE build, they would be ignored
> > > entirely.
> > 
> > No, they would not. If they are built natively, they would be injected
> > into PATH ahead of HOSTTOOLS and used.
> 
>   really? i was unaware of that, i should have checked more carefully.
> i find that confusing -- effectively, this is saying that certain
> tools *must* exist on the build host, but even if they do, they might
> not be the ones used? that seems counter-intuitive.

If you add something into DEPENDS, it is used instead of what is on the
host as long as it is not in ASSUME_PROVIDED.

Adding something to DEPENDS and it not being used instead replaced by
the host's tools would seem worse...

Cheers,

Richard



