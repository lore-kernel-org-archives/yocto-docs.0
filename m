Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.10590.1604046944260082918
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 01:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GRkCEOYs;
 spf=pass (domain: linaro.org, ip: 209.85.219.182, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id m188so4477793ybf.2
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zb707H/jXciICdG2ojjuB6lfJvoJ/llmliieyVdHuwg=;
        b=GRkCEOYsu7KMDNxIksLbqhsiO2QA+6LrqBbalPPKCnXvTT07AAwyDcQmz5q0KCWA4f
         T5m8LQOJYAId6cJ0Kawk5bB7WLpMYBSwPgWa3RcjATZ4hpZ45NWe2W7kDthy2e6zlz8A
         GG3BiDqmJ5TMnWy4atxaYK0D5vApy0L/p7mTevhJMxDf6ePio89ig81ygwhoJrdn6f43
         d27nP+XwR29KmJJtCJbG+22YeYvl0Hz3g8FVjjGZ49eYnMJQ4JhFbbPi1jZU1RD3pg1v
         LdzR0CvTuJuZhK5HRc5ymgcsfpikPnFqz91KZZ/iADDtAFkeXCwFt9Jop8czKz481cqa
         PYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zb707H/jXciICdG2ojjuB6lfJvoJ/llmliieyVdHuwg=;
        b=T7tbX3Hg1mriDOKBBfe4MH+DXaFHaaxtSJkvKYH1MKLEGjBkxTHkTUz7EM5wRu9HVo
         G5p8V6J7USyaZ9Z8Ji4ZtfCwM/0yxE7bezQO2o9DgIsAfh3Px+FPtnfPXMokvaN1jf0S
         /b9MMllXJsFEoFSVzXwWxiZvCo9oMUAYrvRAH6b7OLHuTUmg7KHl4BMYlep1fVmxm1WT
         uh8m8maDsl+28fTejPeeTZ2k/NsjCcCrAG2pPt3/zadvucJCsbRF5KQ9Nsck4bDc0E+I
         xjltMC//5dv/iQ0nivHXsS6NaOlIMUgg0p8ocekvLWCwwy2NsD1GD6KBX/19uKWvD2Uf
         co6A==
X-Gm-Message-State: AOAM531iBtCjNpoHDkoGFFXvITsTerfgbxsYLPKQItO6npjnLq3o4Xu9
	DSvWZh3astVH+cj+LlPM/e6qNe2R1xlT3lVyeTuRWQ==
X-Google-Smtp-Source: ABdhPJycascr58lJjHEX5zKL4PPBaJCANIqvz6gHke67/u9wtRoM2igXi2xJp/YEOxJpQA/bY07GoS2gpe4HkByNIHc=
X-Received: by 2002:a25:4654:: with SMTP id t81mr2151416yba.475.1604046943352;
 Fri, 30 Oct 2020 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <625da363-37ee-2325-ee68-a860a8f8a857@crashcourse.ca>
In-Reply-To: <625da363-37ee-2325-ee68-a860a8f8a857@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 09:35:32 +0100
Message-ID: <CAP71WjxZL+4U=RGT-32t08vY5_X6CDE=awCgBxsyhjLMJpxsEg@mail.gmail.com>
Subject: Re: [docs] pedantic observations about README file
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 10:01 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
> 1) refers to folder "yocto-project-qs" when it is, in fact,
> "brief-yoctoprojectqs"; has that update been queued?

no, you can send it!

>
> 2) no mention of folder "adt-manual" which, of course, has long been
> superseded by SDK docs ... is the adt-manual directory being kept
> around for some reason? (references to that manual also in conf.py and
> poky.yaml.)

i think we would merge a patch that removes all of it. we added the
mention in conf.py so that sphinx ignores the files, so that can go
away too, once you remove the files.

>
> rday
>
> 
>
