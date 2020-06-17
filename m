Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.850.1592414735972949192
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 10:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tk5lJ6hL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id h5so3214750wrc.7
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GhfU+r70aGL3rQ+A2frSN/I385jNB/U+0/dE5hGFcDY=;
        b=Tk5lJ6hLdsj4ts397sNWNqc1HruHvygGU75TcXpzvRv0LqA5/qd87Fcud4+Cm1Cbd5
         4Y4Ga9faKgBcTxtvJSbGJiI0brtzKrc39CNBvblrVTY85UU+hxoIvocyUN8LmR4YpWua
         k4H8gvJFGfCinWxbr795zLDyKuhBsiPAl51Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GhfU+r70aGL3rQ+A2frSN/I385jNB/U+0/dE5hGFcDY=;
        b=DP92sz+pHzPmb+3tt8J3hllF0dmrhkJ1vnxFc7xrVqM2t+8cOken3kGfNnSAjONne6
         3rlrWJgjJyqJSyJ0txL1BrBZK8AWu2FoUSbDJTDinVv9gJ9iLQ9tmx0UQgGJbrHB/ifO
         zZnOnaVYGKoiI22uma4w4lmQgelwTM/6fMcAFi5ecrnxEeflOSTIwusCEvd9zPkFFuxW
         5XHpdnLol7UwCDQ+KT+2jWKFOibJ7unSuQ63Bs99WyrVAYJYhdJ+QPYoygi32baokSrZ
         SBLBBKL4V/6ab8Y7kZq6rcPtjuKPgMG7SBc23TuXY80C8f6Hn87W+1Bi9HzC/Icb+syo
         2iIw==
X-Gm-Message-State: AOAM5304fbpQtS+EZeMCkzKXxFazdItRmTazsBwqXwDw38G9Th4lBvWV
	cMJbU4I3ufN6vhQIYTrw5XwpUA==
X-Google-Smtp-Source: ABdhPJwHG5JStvIa2pCFsTVzcObgBrUASOujLoaXUGjSdot2vgpUxxqdD5YXwpmofUc5SUbUlqbuGQ==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr287490wrt.159.1592414734576;
        Wed, 17 Jun 2020 10:25:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 63sm310549wra.86.2020.06.17.10.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 10:25:34 -0700 (PDT)
Message-ID: <3539de6f2df545388af1e12d01d30a82d808cb62.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 4/4] Makefile: Drop obsolete edison/denzil branch conditionals
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, docs@lists.yoctoproject.org
Date: Wed, 17 Jun 2020 18:25:32 +0100
In-Reply-To: <02ae490f-923a-bc7d-b67b-07c570e0ff96@gmail.com>
References: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
	 <20200617154422.417466-4-richard.purdie@linuxfoundation.org>
	 <02ae490f-923a-bc7d-b67b-07c570e0ff96@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-17 at 10:09 -0700, akuster808 wrote:
> hmm, I am sure I sent a patch to do this a while back, was there a
> problem ?
> 
> https://lists.yoctoproject.org/g/docs/message/162

Sorry, I thought there was one but couldn't find it :/. I think it was
sent when we were coming to the end of the release and we agreed it was
not the right time.

Cheers,

Richard

