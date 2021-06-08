Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9978.1623143173222346593
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 02:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HCDFZ1Yy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id c5so20658144wrq.9
        for <docs@lists.yoctoproject.org>; Tue, 08 Jun 2021 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=30myQrc8KW6zG0ZJ047ontnYqtTydSB/3V8B02nTLlY=;
        b=HCDFZ1YyH1cgz3fZYhNYtB2bAc/94We6pwNoYHsT6MQfwKfFaoATrjQURCjIsl1C9M
         vEAhy1pxEre9AHd65YF6o43cFpxz2UeKLp4TH+gGr9Elf5nGA3T5Hv5eT7sFrl8Qj4Ec
         1VNq3ZymbDMNa4qXK8nyTfxq+PzdoVc8wbHZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=30myQrc8KW6zG0ZJ047ontnYqtTydSB/3V8B02nTLlY=;
        b=LGsB8ZgWdE8m0Z4M1CWGyTzCM9cyeMaQypbseenPOQgtjOu7iaE0aEg+EV33E5mCqd
         mqXSb9Qqa80X9bS6g8wsij2R59+wWk7HN+BdwGdONqddsE5PXRMowCZqH5IvJj/13FIj
         0uoWbXBKijg7hHRUZDFsNDvqRv6P4OV8g7LjFNCZm4Rkp7SbknmhrVohFSRe8UA/Gk+i
         FJHYZtohXIsK+mE4/MQjAl5uZm7RUXy5X1NsHn33dgnZ3LVGARdL+Xz2Z7sjot8rm6mb
         CI8huvkV3Rl03CEwIWga29E93bfUiSJ0N/9OlNo+1TP5nyfd3yP42YNL/BUTfiaIOdI5
         Z6VA==
X-Gm-Message-State: AOAM530WQBK8g62tHksSMG5ezSVmepf/13hh0gUdHQYc0dgQ14Vf809s
	tUZL8xTvM/ANCE4r0N0seIeUlgBag/2D+w==
X-Google-Smtp-Source: ABdhPJzLBiyvENE91jbEnM2+q8cMC2KxlIzM2AMgJ1QI0ZWm5BQBfqKWTSzpyWJQnw1VqNK2cQ3RXQ==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr21942073wrt.269.1623143171514;
        Tue, 08 Jun 2021 02:06:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:119e:2d1:fea4:6669? ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id d15sm8503635wri.58.2021.06.08.02.06.11
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 02:06:11 -0700 (PDT)
Message-ID: <94804013e19f7f1c7b09f71a63755f0c870a078c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] test-manual: Add initial YP Compatible documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Tue, 08 Jun 2021 10:06:10 +0100
In-Reply-To: <16868FF087903AB7.10003@lists.yoctoproject.org>
References: <16868FF087903AB7.10003@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-08 at 10:02 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> We need to document the Yocto Project Compatible badging programme. This
> adds an initial piece of documentation about it from which we can improve
> as needed.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/test-manual/index.rst           |  1 +
>  .../test-manual/yocto-project-compatible.rst  | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 documentation/test-manual/yocto-project-compatible.rst

Again, I've sent this out since I've had it languishing in a branch for too 
long. I appreciate the text needs wrapping properly and various other cleanups 
but hopefully it is at a point where Michael can take it as some base text 
and get it into the manual? 

I did try and at least get the content basically complete (there is much 
more we could add but it is a start).

Cheers,

Richard


