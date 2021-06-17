Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.64.1623962837399875118
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 13:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SBGkfHZ6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id j18so4093022wms.3
        for <docs@lists.yoctoproject.org>; Thu, 17 Jun 2021 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GgllWh5Ow9UQ4zmgyms24O7XYLaFlAZa9DXoQySJb8k=;
        b=SBGkfHZ6J+bY7rnICMmiatwdJQlp7tkXGPaE3Lnbq/7K7YIX9MZnjaNL+tRWaW+cLA
         KBZC5NWwvEcbUNRZMArdnkFzM9FwdkzzXRteG14JHqrI8EMtAqi0IbYZsX07HjPReqZY
         syM86izmxxS8w72H9E1LVZhU6CmVU0GZMwYC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GgllWh5Ow9UQ4zmgyms24O7XYLaFlAZa9DXoQySJb8k=;
        b=ZqPaEto9kr3dAh0nLw9jDvdl5HJj0DNhf76I1caLKWvuMiMcyf0ERpS3Yj2xezI61y
         JrNPet7Wk6izJ2ducB4nK3KnYB84UD94iledDNe2ewzmgE1jpwdBKRaShQwCl9map3u9
         Q/zmOQHvHS+fGn+Mardgkmp194nhJf93ObC9mNEKYSzh4eOj2tRHHk1gJg91mPHsFlIJ
         m5JCeYcK6K0vH0QVl7Gsk4PUZftYAZb09eN8PVYSrxuJPqFJET88XFXEYDO7J49F/O18
         JRMsjawNjwPfDYoqDtByzpylf6X6eMSBq12tD5dflXLqreM+7e9GLUri21wT6q70anKQ
         mC2Q==
X-Gm-Message-State: AOAM533Sj56YzOVqW9JtGRChuXib65cOojG1/kxQaJkybJF7WsL+dglr
	xeArLipUl8a+eqN4EsF4Kl9ijw==
X-Google-Smtp-Source: ABdhPJwwfWMglnUXny4UJ9L7ykfbd9ul/R0rkSXJwIarJMAXkNKvshDQzRJuU4cU5/DaCKnI5042gA==
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr7522409wmq.9.1623962835697;
        Thu, 17 Jun 2021 13:47:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d370:edcc:4e2d:7f3c? ([2001:8b0:aba:5f3c:d370:edcc:4e2d:7f3c])
        by smtp.gmail.com with ESMTPSA id 6sm5732120wmg.17.2021.06.17.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 13:47:14 -0700 (PDT)
Message-ID: <e0fbf82a03bef065ed381299a7c38d5f9a47932e.camel@linuxfoundation.org>
Subject: Re: [docs] [RFC 0/1] initial documentation for hash equivalence
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 JPEWhacker@gmail.com,  docs@lists.yoctoproject.org
Date: Thu, 17 Jun 2021 21:47:14 +0100
In-Reply-To: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
References: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-17 at 21:55 +0200, Michael Opdenacker wrote:
> Greetings
> 
> This is a first documentation attempt for hash equivalence.
> I need to know if I'm headed in the right direction before expanding
> the text if needed.
> 
> So, I would be interested in your opinion about:
> 
> - Is this the right level of detail?
>   Don't forget that this is turned on by default in Poky
>   and therefore easy to use.

We definitely need a high level overview so people can understand what it 
is doing. I suspect we'll need this and some more in depth docs too.

>   Would I need to add more details about the implementation,
>   such as using explaining unihashes and adding diagrams such
>   as the ones in Joshua Watt's presentation on the topic?

People will need to know more about it so I do think further manual 
sections on topics like that will be needed, yes.

> - It this the right place to add such documentation?

I think this piece is fine at the level and place it is at.

> - Doesn't this need a more thorough update of the whole
>   documentation about share state cache to give the new
>   full picture right away, rather than adding this new
>   feature later in the manual ?

We do need to update other sections and tie this in, yes.

> - Anything else that I should mention?

There is a read only mode and pass through for the server which will be 
needed. We need to document how to launch a standalone server instance?


> - Anything wrong or that I misunderstood?

Nothing wrong as such but it wasn't as clear as I think it needs to be.
I replied to the email directly about that.

Cheers,

Richard



