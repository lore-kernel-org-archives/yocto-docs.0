Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.5453.1600379267301889050
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 14:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lcFDVBRc;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id v60so2743676ybi.10
        for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2020 14:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJnUdWowBmcAsRKcAiaUTEdHhbiBe63ntgP2Fvzb9as=;
        b=lcFDVBRcEdnmc8PCCECvEDzWyujR7dlBlmfNYlu75DPiu/+TARQDO6gNQAZZ/RjNCX
         M0zM15xqUnwWpR00LrnBLL/tuoeUnHJ3b1Md3tPZcUZXUU/7AJHpT+K+bkDrBvlXbsPK
         TTucfy2BlVtldFJ+OHQOveSFHRJAIjoPbxKhFmYbeHuAGuqHJ6YdzeXKM1g89bB0msHr
         /TSVuaiW0deQerv5O45JPC06uKx8bWh82rPv5BPByEZShFb97BEwRV56cOuDpLNvR4q0
         hrbQwtITVb3MpqCGILRJ27krwfsJNMRu1SSwdkylf7okUaASKw03vZ5Fnqi54yfkxXYU
         EGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJnUdWowBmcAsRKcAiaUTEdHhbiBe63ntgP2Fvzb9as=;
        b=gM3B1GLOkFHUzF/FiNVEpFX9t4x4fkXfjm4p8CUU3Wipzw8UWm3R6YwjPsaP6NZ179
         W31v1dcLygRk9Ts4Db38l2IzY6uyefbhwh/yp7b4piDlZfUMHxYS+Rw71HvxmDdy1BSu
         /pjW3hfHvnTtYUgbJlBlh9Yd94EY147BSWhTQF+uA3mLlV1m1cttAdMYa36N5l4D+eX6
         JQ7j6P8sfqo7vHxumBOpP8Jn+5DVq7lUXdZQQVbwOW9NbzOCAQpykJgk4F3fNWlVPNQN
         44lQTO7I4GuIn9eWHE9b0FD0C/eX3ssKpVkPvVQ/DngUIwQg7PWYtgvK16JgPJh+bsvg
         /vfQ==
X-Gm-Message-State: AOAM53009nOilo+Jf74LNAMtumTjuIYbj20bh8m+aJzAqTvf3bg49VYN
	LNY142KHSgU3sALhtoaP2n9Y3vAdtEYQCmhaU1u0eQ==
X-Google-Smtp-Source: ABdhPJw2NoPVGr+QtklbQU9zmLbNWJDCzx2yhSLQJ+lcFkRnSfZSzundajKbpXC7wJtt7h3qhNK7Kzo0k/V0C0D5+64=
X-Received: by 2002:a25:bd41:: with SMTP id p1mr13152010ybm.475.1600379266268;
 Thu, 17 Sep 2020 14:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200917210947.51974-1-foss@0leil.net>
In-Reply-To: <20200917210947.51974-1-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 17 Sep 2020 23:47:34 +0200
Message-ID: <CAP71Wjwm_LYCVGAhm8O+0tC1K=aCLhwjmF_j5mh_gJGi4nYmJw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] docs: static: theme_overrides.css: fix responsive design on <640px screens
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 11:10 PM Quentin Schulz <foss@0leil.net> wrote:
>
> From experience the body takes the whole space anyway and the text stays
> within the screen boundaries by default, no need to make the min-width
> 640px then.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/sphinx-static/theme_overrides.css | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
> index c18053398..55da38a2b 100644
> --- a/documentation/sphinx-static/theme_overrides.css
> +++ b/documentation/sphinx-static/theme_overrides.css
> @@ -4,8 +4,6 @@
>
>  body {
>    font-family: Verdana, Sans, sans-serif;
> -
> -  min-width: 640px;

hmm. interesting. I made this change very early when I was still using
the default theme, not the one we use currently. I just made a few
tests, and it looks it might not be useful at all with the rtd theme..
i will test it more. Is that fixing the rendering issues you noticed
on 'mobile'?

>    margin:  0em auto;
>    color: #333;
>  }
> --
> 2.26.2
>
>
> 
>
