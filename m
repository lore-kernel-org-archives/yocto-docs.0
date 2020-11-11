Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web08.9803.1605114438182261683
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 09:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hz5/yRCS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id w24so3027731wmi.0
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 09:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KlmojWyEZ+pWRhKE/Q2tFyyMm4aBZLldYxEohcO3fXs=;
        b=hz5/yRCSQnrmDxcx6b+pyGbz9Zs1QsqXUwH4NVt7DdwWGtaT7C7SfLi91O0UkuuAIx
         0atJ7Ctz/hJGLq1XtvMipd5iPEwGhFveYwpcqs/NOrJW4lLhF65H7Z/xFTxxybLDuNpz
         pQbt8xVILWOe6CK8sQAMhwTNdRjlPZDv5OmLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KlmojWyEZ+pWRhKE/Q2tFyyMm4aBZLldYxEohcO3fXs=;
        b=YaukvMdO6bEDCfu7QDnmW5pQgSWaiix49Ig9mm6Iqo0qoyaA6+Oct92dA0J+rsQT60
         4Vu2iTrP5PlsugTAohg7+Jfpkpnmg+eWwRZFkuG0sEJIQeq565A6ppaDutr+gm6GdeYk
         yDj4KT4xudrplHEVCneTEr+R2yJYlLoJIyyvEGGggANcwxCZ1ahqWvAqsmQ2b12kBEvb
         uqAGIIhHlmXasnHCpcnjAy7OgLNisX+7hLjM3KHXRgvIN/XWf7lchkGUa8tm7EVIzzA1
         EEGnT1n36f6BVemy5b060atXWORmVS/4GU6yUgoDC/A8VcYqmYLbU1gZkj+s68xYGdcG
         fNdw==
X-Gm-Message-State: AOAM530d8H0jLQeJiouVIfvebgq6NLP/CA+QpG+BEKuiLAkSZ8r8M9My
	HhAPN8p8dCjB9yy07EsNI3O3kA==
X-Google-Smtp-Source: ABdhPJy8jYewsEqB8uA06z/f4zXE77H0ge0usblMq28QdXCykV4WDMxPfcus1g3abN9UXfTutzJrUg==
X-Received: by 2002:a05:600c:2202:: with SMTP id z2mr5404324wml.95.1605114436773;
        Wed, 11 Nov 2020 09:07:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:a5ea:fdf9:a331:d3f2])
        by smtp.gmail.com with ESMTPSA id p10sm3285278wre.2.2020.11.11.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 09:07:16 -0800 (PST)
Message-ID: <a9acf18bc6c26746fc26b38995dc106755d06d8a.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, docs@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>
Date: Wed, 11 Nov 2020 17:07:13 +0000
In-Reply-To: <CAM9ZRVsCBZ2E_-uu7835avmnvHSDaTn3wgxNvSoLeP4NjgS-_A@mail.gmail.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
	 <CAM9ZRVsCBZ2E_-uu7835avmnvHSDaTn3wgxNvSoLeP4NjgS-_A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-11 at 16:27 +0000, Paul Barker wrote:
> On Wed, 11 Nov 2020 at 16:08, Paul Barker <pbarker@konsulko.com>
> wrote:
> > After discussions on IRC with Ross we concluded that the `ross/mut`
> > branch shouldn't really be listed in the docs as it's more of a
> > personal
> > test branch. Instead we should list the -next branches for
> > openembedded-core and poky.
> > 
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> 
> Cc: Ross.

Just for reference the testing manual was written around 12-18 months
ago and reflected the status quo at that time. The world has changed a
bit.

Cheers,

Richard

