Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.9296.1600208263081190772
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 15:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MXPXrCSG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id s13so912772wmh.4
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 15:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oylrg3PmTIk1Kq/HtjDsyRrAfEW+x08LIeYpAzYEFXA=;
        b=MXPXrCSGDLpXc7iXaCK8qatPeHXg2PEEo1UG6qtscav1iEJITAIULJ1uAfOVB7ObQc
         A3BbbOUV/r3s37QfYKfgNVDtKgunI/cyy3/MXIAigqmCXxAvHk359gvSrPZ9eVqmfuHv
         aASLq5Kmiz5Za6Uf5D4lFKT3oxBQr6/Vi6UA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oylrg3PmTIk1Kq/HtjDsyRrAfEW+x08LIeYpAzYEFXA=;
        b=mkSjC33Toqc9r1o3gs0rGMLWAc8zZafFkOhPZrsBZu9YMDKKB1XCarhVNZFguBTRWR
         NUI52nkKqv48iR3n3lbbsw1Txx6nA0EEA6/KOQ3vWZyCNGoE/B/rccrba7XGxrX9UusT
         02/w1lJxAyUYd5YX15o4bN96QcWW/EYDKrJDMW7XkG6eKJc14k+gFss6rGJnQLm7K+Rt
         vFxF39b3Q3150Mpgz9MoFpQeh7g5RVipLHUMZ2H1B/INWP3vmgCAa+GrvVbBactb53i9
         xXFhn6jQvIqqwTqjklT4YBubTB7hvPoYA2N5pMPBCCdB0FbL1ZKei/v2z7ACUmBzhCpU
         sGGw==
X-Gm-Message-State: AOAM532en9yr/ivm8xYtklp2i7GHx7H4HnKJgKCUxqEQlxnuYJ0sTWdd
	GzJf54lYR88AAhCEPNF7mHGPtg==
X-Google-Smtp-Source: ABdhPJz7f3bWR9nJGt2rfOD2El5XmykZAvfVjZy0uDU+Sv92tDDf0v8Yy3CJdGYCod2XGQ9Gch1lJg==
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr1385479wmj.64.1600208261460;
        Tue, 15 Sep 2020 15:17:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:532:7978:4951:c36c])
        by smtp.gmail.com with ESMTPSA id d83sm682133wmf.23.2020.09.15.15.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 15:17:40 -0700 (PDT)
Message-ID: <58afa847b98484557df7bbddb47e9bcde1d9264e.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Tim Orling
	 <ticotimo@gmail.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 15 Sep 2020 23:17:37 +0100
In-Reply-To: <CAP71WjxQNormFOzCsd5h3MopO4hTdn5ENgU_Wmt+UdwPJ0jQog@mail.gmail.com>
References: 
	<CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
	 <16346239585A567B.3515@lists.yoctoproject.org>
	 <16349A56620CF0CB.7642@lists.yoctoproject.org>
	 <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
	 <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com>
	 <CANx9H-D1W=S8Jz=b6_d+D3frcqpZQkhmSHW=ZCjZ4tUMGWWpyQ@mail.gmail.com>
	 <CAP71WjxQNormFOzCsd5h3MopO4hTdn5ENgU_Wmt+UdwPJ0jQog@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-15 at 18:48 +0200, Nicolas Dechesne wrote:
> I've finished profile-manual today. And excluded adt-manual from
> Sphinx (deprecated doc). At this point, we have:
> Richard on kernel-dev

This is now done.

I've also gone back over the reference manual and fixed a ton of issues
I missed the first time as I had a better process for it.

> Mark on test-manual
> Armin on overview-manual
> Tim on toaster-manual
> 
> Which means everything is now covered! Please send patches on the
> list for review, and if you have any trouble with Sphinx , let me
> know!

I've split the migration guide into separate files which should avoid
warnings. I've also tweaked the css handling of "em" handling thanks to
tips from Nico, to better match the existing style.

One problem I've noticed is that example blocks don't need "\" escaping
and so we have a ton of "\\" loose in them we now need to fix.

Its looking ever better though, quite excited to see it coming
together.

Cheers,

Richard

