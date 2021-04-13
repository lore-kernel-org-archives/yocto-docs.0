Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.2472.1618342818820970000
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 12:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cTTAoRb6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id s7so17455387wru.6
        for <docs@lists.yoctoproject.org>; Tue, 13 Apr 2021 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KV7fhQFizHbKsSqF10KnBpeMDZQZ42fNGRT3UlI/R2k=;
        b=cTTAoRb6fOSfO9kU00ViSMFAuzufR4ytJOu8yzbWrwUaW+sAT8O58S3y/GxQZNMtez
         SDiS4ifcl388gnQGn3ZJKlZQ0LNzE4yoCjMZ9YJ12FnSnWvd55JHQUYWCloaOIci/q4d
         96iqggCh5IobOyBrJuR5ymPWq6gjgNgnh+snA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KV7fhQFizHbKsSqF10KnBpeMDZQZ42fNGRT3UlI/R2k=;
        b=FnSx6ZFIDImuGqDtwhjbRWM+cw7lPgP4pJidWItD4mzwQCg0v8nbI6cevb3wlSmpB6
         O4Tpo76uB1iz+7IqYgxLFEwwgD7iqe/WsLscYio26SYURU1Q6hC+qB0v99aCmKTLX3yt
         UjYD7Xa18KzHOfEMtERpEbTaEpyej5hOIihN7/0ZsYESW5PtsdmT9LBqU2YTlOARU+5I
         GDz8acnvYSNFGz/3BhRa2h4br+TXgxKcTmGMgA94oHIgieG+njCAz2Nz6+hmAaQOfNaT
         cgU08P9oPGDqP0sh+eXji52kwftuFDn2Pvz5nrP4faMHcGi2ua+S7iNVIlUz0p6EaOps
         6IoA==
X-Gm-Message-State: AOAM532DRoqrOIFozcBI1uAaOoE2dcydM19Nd4ykrWbu1XKmV6LodJKw
	i9TTxsFMcpYFYGD9tXj6C/2OxA==
X-Google-Smtp-Source: ABdhPJxDiiOIOCVWLrcrM1zJaEi1rZ6YgW4yJO9qR1VSczHt6OJyqBX8X20Oh7uD4TS70C43cZIjfQ==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr2481780wrn.128.1618342817372;
        Tue, 13 Apr 2021 12:40:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:92c8:89c8:3615:b078? ([2001:8b0:aba:5f3c:92c8:89c8:3615:b078])
        by smtp.gmail.com with ESMTPSA id b12sm9536398wrn.18.2021.04.13.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:40:17 -0700 (PDT)
Message-ID: <086834e9b9a79fb30a11d160bb7a02037cd05c29.camel@linuxfoundation.org>
Subject: Re: [docs] ref-manual: reverse the order of migration guides?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Tue, 13 Apr 2021 20:40:16 +0100
In-Reply-To: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
References: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-04-13 at 20:03 +0200, Michael Opdenacker wrote:
> Greetings,
> 
> Wouldn't it make sense to reverse the order of migration guides in the
> reference manual
> (https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#migration)?
> 
> I guess it would be easier to start mentioning the migration path from
> the most recent release, as version 1.3 looks ancient.
> 
> Would it make sense? If so, it's easy to propose a patch...

Yes, I think it would. When we made the migration to sphinx, I took the decision
to split these into their own files. This is a next logical step from that.

Cheers,

Richard

