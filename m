Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.40462.1600011765562333976
 for <docs@lists.yoctoproject.org>;
 Sun, 13 Sep 2020 08:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZsnbNdmU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id w5so16029993wrp.8
        for <docs@lists.yoctoproject.org>; Sun, 13 Sep 2020 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MH2DiTt+zv3hypM2VYVd+OCxwRid5/AeGXpBVcPz6Vw=;
        b=ZsnbNdmUiTwiDjixa3OQh6YX0v9AKkoZDArck/YtgWb/iNMHu6WcCSYcgallMvwBOH
         AKyEqnEfZENrxiKfanOlwthhjhK9cIXHh0o8z2TaMXzkA4bMMH8+rgB8GSNSNOCpLyxb
         Ql30Zk2Ay958F0Zxa8iKHRL+YystrFhMmC4ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MH2DiTt+zv3hypM2VYVd+OCxwRid5/AeGXpBVcPz6Vw=;
        b=UqZ2ABM7YVyLxOi75NY0xyhSKpYnEfMgXSMgSXEIVqjs1KUnC6s4iGvH93T/qM5glO
         vtCWhYmv+MHBzFxnshZqvzvBNzu07rp8be+ZzZRe1eW+mUD0U26QbIzcJdIwE9Ww+qz7
         iDVXygOVS1F5aMXZUxmdVzMk8TPZbc8p2lhuhcAyJoRwQVG12oKGbEWTFunmufVYny6G
         BYgZZ8f62S5veM1gl+QyptXIdQlzyE9X3HNPqhZ1NwxV/ixnncCrtMuQVfIg+JMI0vu/
         h2aePFFBYhchsgvpVqEfeUAyzRjfLYc2ANHgz6FKrYSVzBIJwYFUvBnFiS17Vt/qf9FT
         ovnA==
X-Gm-Message-State: AOAM532VzwnGHDX6hGn7FvQ/rhb2t/W56v7Z28C5JxlWX535jpVWXwjp
	2QUJUhE8P1ID6gxuKTdR0tyuiw==
X-Google-Smtp-Source: ABdhPJwM6gRll1ZgJATyhpQEipRvXTrRT+YZC41Qg6ItcLtBaae1eS4JTEQbiFwWx8pHZxQlOKKbsw==
X-Received: by 2002:adf:9125:: with SMTP id j34mr12690287wrj.157.1600011763808;
        Sun, 13 Sep 2020 08:42:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.2.c.8.d.e.a.4.b.8.e.6.4.d.1.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.2.c.8.d.e.a.4.b.8.e.6.4.d.1.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:81d4:6e8b:4aed:8c2c])
        by smtp.gmail.com with ESMTPSA id b84sm16137779wmd.0.2020.09.13.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 08:42:43 -0700 (PDT)
Message-ID: <e903c0503d97918d38d90a86e1aff2bc47f46baf.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	docs@lists.yoctoproject.org
Date: Sun, 13 Sep 2020 16:42:41 +0100
In-Reply-To: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
References: 
	<CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
> If anybody has any cycle now, we need to finish #4. The current
> status is that:
> * brief-yoctoprojectqs/* is done.
> * bitbake user manual is half done, and I am doing it
> * bsp-guide/*: i started it, and will finish
> * ref-manual/*: RP is on it.

This is done, at least as a first pass with hopefully the bulk of
issues fixed.

> * there are plenty of warnings when we build, i would like to get rid
> of them all!
> 
> Anything else is work that remains to be done. Before starting
> anything, please send a quick email here to let everyone know, to
> avoid duplication. If you have any improvement, please share your
> patches, I will take them into the sphinx/master branch. And I will
> continue to work on the remaining files that no one would pick.

I'll take dev-manual/* next.

Cheers,

Richard

