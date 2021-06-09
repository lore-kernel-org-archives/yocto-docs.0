Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.10556.1623256259261631302
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 09:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=At8NRO/V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so4601903wmq.5
        for <docs@lists.yoctoproject.org>; Wed, 09 Jun 2021 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kaf0r7wRdUzcDlOMv/G9U2T9Of3iFcCAHXss/57qcSw=;
        b=At8NRO/VdzWtmyx715SNgBuF37SGyOXiXe936TcPnY+uTmhl/jbKbByaFOvIIzFL0I
         uzVdXafiSrnWwDeYK0yjCc5azQgCRcciSoSaIf+UZgrBPRptaqkazNukwP45dV8rpER6
         rAzGdj9aUwr8xNY301lkiPgYd8Ev30JDtrD5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kaf0r7wRdUzcDlOMv/G9U2T9Of3iFcCAHXss/57qcSw=;
        b=b0NXZlQW96q+AJJONwyZzZmIqOoaFgNBkovmrX7+5sd1fwFo7Oas+ek2KGNjCL/FvF
         ELuqBAQJKHaesF+qohRmlovwgXVGnIODMAiSsE+VFgW8mMmI5hteEkl/8iDT2kJjPL4+
         zZNrvPv2pg3BpYESUPbrXHYfHMLmansdK2572hAvGbJm1jTUuAubjZZGfM25EO6jqdLy
         8X5dezKYOmKCZk4jMA/jigD+1qCphhXPorqjtzlZ+rwT2bkfSVcYPACLiyfT58Ti582J
         0AVgFIHQHCe1GiR7U6lwueBSqHT8gJ+I2UpgbLH4LJg3GxEhUkG/D3sCGX2zuoOtfpv0
         Pz/g==
X-Gm-Message-State: AOAM531Ajj7zI5we2+o+ESToFtlQDDvSs0PEKR7gqeu7BGTEMKIGcOqo
	9RKVqCZ1WFc/m9B0GN55CuEgOw==
X-Google-Smtp-Source: ABdhPJywLVdLItfGpiHxZbTL/zSNFuCY/HoRa0cYb1+uMrXv0GqWCIt1OgYU7OlGbDNuwV/ESfYUAg==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr652875wmk.89.1623256257614;
        Wed, 09 Jun 2021 09:30:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca2:6776:ae9b:a3b2? ([2001:8b0:aba:5f3c:5ca2:6776:ae9b:a3b2])
        by smtp.gmail.com with ESMTPSA id l20sm256243wmq.3.2021.06.09.09.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:30:57 -0700 (PDT)
Message-ID: <6400f2c43fd9d292616cbc5d2f6cd99f98ebc2a3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3] test-manual: add initial reproducible builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Date: Wed, 09 Jun 2021 17:30:56 +0100
In-Reply-To: <20210609155552.nwjdirom4lkqi4n7@qschulz>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
	 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
	 <20210609155552.nwjdirom4lkqi4n7@qschulz>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-09 at 17:55 +0200, Quentin Schulz wrote:
> On Wed, Jun 09, 2021 at 04:47:28PM +0200, Michael Opdenacker wrote:
> 
> > +
> > +You could subclass the test and change ``targets`` to a different target.
> > +
> > +You may also change ``sstate_targets`` which would allow you to "pre-cache" some
> > +set of recipes before the test, meaning they are excluded from reproducibility
> > +testing. As a practical example, you could set ``sstate_targets`` to
> > +``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
> > +run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> > -- 
> 
> I'm not sure this section has its place in our documentation since it
> seems bound to the current implementation and explains modifications of
> the code.
> 
> I'd vote it out.

Doesn't most of the manual document the current implementation?

When this wasn't here, you wanted an example! I do agree we should give people 
some kind of a hint about how to write their own tests. We're likely going to end 
up adding more example, not less?

Cheers,

Richard

