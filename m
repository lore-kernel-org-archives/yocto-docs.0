Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.57067.1600073462928904816
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 01:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NmSJdmhb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id b79so10353559wmb.4
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oXGkKkmOtFyOdlH7KpaT8w+KH/aiCnAHKLS7SNBkh3w=;
        b=NmSJdmhbZGYEcCj19w3XPSk8z9q76l3hD42prG4w5gtC/iaJoxeMffGGdUwdGmiAKj
         IRGJuZjod8SDvzKBF3cc6yrlLfVqmSN0PAWupCUpt3VDbpbAfz37+LcWIEwBB72JrZRE
         YdoIfozgN43r54lF31XfdJzkqyJCFqH5nRsyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oXGkKkmOtFyOdlH7KpaT8w+KH/aiCnAHKLS7SNBkh3w=;
        b=edynszAjM4Q9aztsum5L59sylxGAnw05h3fJIqoZBxsSgriNBQZuvq2zBGuvZDfmre
         KHEhzOpz8ZXWwz+kK+9JS4ySrckyGYbSpM9MRPw9WS+QVcweFAUgtv5NdjGCKyoDAmkH
         Gl89KlD6O5VJxbi+RZYBpx46IkAkUzE/0YMj1Ul7hytmtA0dyLTsh97QdCyXAJTDyBoc
         vMBNI094anjUCyIYW+SJD/rxWTtX/rTyVXbSoUmGY+Fn64BZf190sre++8QhAKhCoOpx
         7GcW8buGIHpryCpakHeOMThXu/V0+1bz6a7JAqnTSwLrsWyn8PlHiPyVgf+1kyJaMBQa
         uwYw==
X-Gm-Message-State: AOAM5338kMAOUod7aZqudBqYYMN6gYfDc949yMxhXRp+X2LUFW9v3QPN
	V1/VVrgqKCXAd3AiKzB9JGStJQ==
X-Google-Smtp-Source: ABdhPJz6lqb1tu8OGxJP8P92wpEyXkptXkj5+YLpxZTDr+WplU1gQzt2iEHqaGMD0iViIqpv1jfdMQ==
X-Received: by 2002:a1c:7e15:: with SMTP id z21mr5556637wmc.21.1600073461276;
        Mon, 14 Sep 2020 01:51:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id r15sm18288954wmn.24.2020.09.14.01.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 01:51:00 -0700 (PDT)
Message-ID: <39294662020c6c552d91eaa6f1e9c22ce8b50ca9.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	docs@lists.yoctoproject.org
Date: Mon, 14 Sep 2020 09:50:57 +0100
In-Reply-To: <16346239585A567B.3515@lists.yoctoproject.org>
References: 
	<CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
	 <16346239585A567B.3515@lists.yoctoproject.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via
lists.yoctoproject.org wrote:
> On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
> > If anybody has any cycle now, we need to finish #4. The current
> > status is that:
> > * brief-yoctoprojectqs/* is done.
> > * bitbake user manual is half done, and I am doing it
> > * bsp-guide/*: i started it, and will finish
> > * ref-manual/*: RP is on it.
> 
> This is done, at least as a first pass with hopefully the bulk of
> issues fixed.
> 
> > * there are plenty of warnings when we build, i would like to get
> > rid
> > of them all!
> > 
> > Anything else is work that remains to be done. Before starting
> > anything, please send a quick email here to let everyone know, to
> > avoid duplication. If you have any improvement, please share your
> > patches, I will take them into the sphinx/master branch. And I will
> > continue to work on the remaining files that no one would pick.
> 
> I'll take dev-manual/* next.

dev-manual is on the branch, I'll look at sdk-manual next.

Cheers,

Richard

