Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.9337.1603893986000558191
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 07:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H+JK75px;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 13so4685199wmf.0
        for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2020 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=i2ZfA+2jWmrpGP9LK6I5jVl9R+tlGBFx9BWY5tmuhJM=;
        b=H+JK75pxYvWmXwbbFF+iFN7BaY4gQmAme1nk8uGV3nE8X7pgfE2NcN2iEqbwOM3Voh
         O/ZuV/NeYVd3EcH/CDIczWdmzFIF2d98a4piTeh8fY+rgPlSClkt4mfmyN2/F8IhJGuJ
         qcs8Fb8iMG1JRtou/NcCtSc8ESmk22kRipYC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i2ZfA+2jWmrpGP9LK6I5jVl9R+tlGBFx9BWY5tmuhJM=;
        b=iPO1V4c67Dxd6Nrsm0vVKtEwLdcMuTjM6vFopXfiPQaoNMRpffrnlk2YLVANWwwvlt
         JJkDvXpLZGMJtjBZQp7YxdfELrz7TeEarl2iOuKAsxagiwuRVr2s69ckxoDwYewcWSfv
         ykJuXZ3WjfSuPwKVnXSqnQS3/seeDUtbdDkiYZPYdfABxR8FZFsaVwXYksPnXUDnRwuF
         1E8iE+etNH4D1q9h8Mbh0n6lkY+W2f+Dd8Ga3ybsF/XwnzY98Nu5p7XnE2sI6Hf3MdXr
         MhWwdTCA49MNf9ugHD7fUj5uv0/Pa9CVY6tWAW3AVzM2eXvkooV9XIZ/fNyOdxG9EsHf
         5ipg==
X-Gm-Message-State: AOAM531+NaEcN94998p7OZBFiwcV7qqtoW7IEltbXn0FkGaC+bc47RWT
	JiGjvMFtGkL5AlXcvBfEtZ+wfw==
X-Google-Smtp-Source: ABdhPJwYYpn9ERTeYIMzIDWnFza9YrjkEP1M+2nWhoSfq2GI1ucCBlZY0XvCfms8xLYCsY9SVH2KVg==
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr8857050wmb.55.1603893984376;
        Wed, 28 Oct 2020 07:06:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id 30sm7353565wrr.35.2020.10.28.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 07:06:23 -0700 (PDT)
Message-ID: <d10da2f6470fdd3bd37a9fa0203fafbfc4c7340c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 7/7] ref-manual: add migration section for 3.2
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org, Paul
 Eggleton <paul.eggleton@linux.microsoft.com>
Date: Wed, 28 Oct 2020 14:06:23 +0000
In-Reply-To: <7E52934A-D7A4-42D7-8AE8-ED1E6EB60DA6@0leil.net>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
	 <18956e99fafa0d898c37a785e44015af2eb532d8.1603839557.git.paul.eggleton@linux.microsoft.com>
	 <7E52934A-D7A4-42D7-8AE8-ED1E6EB60DA6@0leil.net>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi All,

On Wed, 2020-10-28 at 14:12 +0100, Quentin Schulz wrote:
> Hi Paul,
> 
> On October 28, 2020 2:18:35 AM GMT+01:00, Paul Eggleton <
> paul.eggleton@linux.microsoft.com> wrote:
> > +In addition, pseudo's behaviour on mismatches has now been changed
> > -
> > rather
> > +than doing what turns out to be a rather dangerous "fixup" if it
> > sees
> > a file
> > +with a different path but the same inode as another file it has
> > previously seen,
> > +pseudo will throw an ``abort()`` and direct you to a `wiki page
> > <https://wiki.yoctoproject.org/wiki/Pseudo_Abort>`
> 
> :yocto_wiki:`wiki page </wiki/Pseudo_Abort>`

Thanks for the review! Since time is short and I suspect Paul will be
fine with the tweaks, I've squashed the tweaks into the patches in
master-next. I've not make the qa-check changes, those may be easiest
in a follow up patch if someone wants to send one?

Cheers,

Richard

