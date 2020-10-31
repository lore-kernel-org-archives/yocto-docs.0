Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8462.1604139696385660539
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 03:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RviqSqss;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id c16so5009590wmd.2
        for <docs@lists.yoctoproject.org>; Sat, 31 Oct 2020 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+iu6MYTJRMVnOeGb8WZHz3olQ/CC+NEEw1CebUzjiEA=;
        b=RviqSqssDX/0udehXdAu+IcvQy49mMpYvMpAOHISiznNHRO//FaOIREYjik/P9iUjw
         IU8M/jAe/+6NuZGPzRR8b6h9HU5kqUC7A8JYlwjyR305YRqwNWUrl8zGKhWbuWJI6nlh
         89z0waf5P/4EwWzojeQSm+h9vthnszoA5Q6CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+iu6MYTJRMVnOeGb8WZHz3olQ/CC+NEEw1CebUzjiEA=;
        b=BR+CKEu66SD1nvrwpCtolRvRteozBUf+CUmssLZ+QMlYThiA+TSv0RswgrSThaf79W
         UDPKCi1UvOihQhYJ7tJyPXHbdrUFPE/lniXA4wwDRrAu56Jpm+N9VDEnlhAJH/3mwOdG
         wHGO5qZvwxZVpr4R6U4FJR26j7ke0RBkRjk0SJ1ViH5gCCU58r5OPsQHzCD/2tDuxf+w
         c7hxa+vThxaAaQU5f/peYRxDon6nEHdMLMJLKyzjFRofz5B5fU6QflCJHPdVMoQMtG+A
         oT1GuvJNe6Di4oenWzgFgDcIee6KiDakTrI3FhZ0OGgzpDaHYkNRYjWnBKJEiR+cET6O
         AMJw==
X-Gm-Message-State: AOAM530rW1B5AumA4npoHOvDEtoDsDvtJD+pZicza5gD9x5t6OCnVrkv
	pw8aw6vAyZ49I2z2DywlRYQUvQ==
X-Google-Smtp-Source: ABdhPJy+WLOHvhkuPPjWGSdwVmLgIG20bBsX+k+l0tfrZjv6MH7DOAhkVVP2zr7QYL0o3R3FRyBs5A==
X-Received: by 2002:a05:600c:d3:: with SMTP id u19mr7553256wmm.150.1604139694481;
        Sat, 31 Oct 2020 03:21:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id f2sm13218618wre.63.2020.10.31.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 03:21:33 -0700 (PDT)
Message-ID: <5fba914c8a943a4c361e71d6d23e2cd4085cbbfc.camel@linuxfoundation.org>
Subject: Re: [docs] general opinion on FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:" ??
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Sat, 31 Oct 2020 10:21:31 +0000
In-Reply-To: <edfa2c82-d684-446e-8428-af619e979eca@crashcourse.ca>
References: <edfa2c82-d684-446e-8428-af619e979eca@crashcourse.ca>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-10-31 at 05:57 -0400, Robert P. J. Day wrote:
>   as in, the use of "BPN" in the above, which is found in all of one
> place in the docs:
> 
>   dev-manual/dev-manual-common-tasks.rst
> 
> i vaguely recall seeing a warning that BPN should be avoided, but
> maybe i'm misremembering. some other layers use that form widely, but
> not so much in OE/YP layers.
> 
>   just change it to PN and move on? is there a standard for that?

Just leave it as BPN, its fine.

I'd have thought BPN makes much more sense in most contexts since the
same patches are likely to apply to native and nativesdk versions but
you won't want a separate patch directory. If you don't have native*
variants, PN would work fine too.

Cheers,

Richard

