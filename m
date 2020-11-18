Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web08.22812.1605699752428264524
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 03:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gc2FX/9G;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id l14so1397769ybq.3
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FgM8En/5CdzZOkf8JaqqsFMDztmCSlf8wq9Bpcs/7gg=;
        b=gc2FX/9GQiZQtkZ3PKUSfvFXfmSdKkjrXsZSV2krUdJTAhPvm4GbUvX69vh8myWVTz
         B6TVOLjGHOQGzoJTI0i3uGAojcfsZ8SvrURzcBjDGxoHiS9916myHOS4hS7NT1VV3z5c
         3YE/miNbgzFGd+AFjR1SinEMuU43hWzD+na4rKZVuh1RIhQp7AKVuYFRQdCgfKVxlSjT
         HQ2+Ko1BPZsKDtEidNWCyFgQLxIPY8YNXkjcrDDB8VHGvd4dDcQvt/IJE6gAfQWDZoYZ
         efrqUCmMxKAz/s2IeqnCQV6iHfFm9vKYU7C7xDW8KKxc1zTqi+LeWAkPtIf0MgIScE59
         aA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FgM8En/5CdzZOkf8JaqqsFMDztmCSlf8wq9Bpcs/7gg=;
        b=p5N5rF8qM9EE/s1mIDBJ5cyn39EpxsLCK/gnjmXseYOOiJC9wBRX4i1WmYSsErx/gZ
         PL9zWerM+jwXxn/+LisO0cdxd1rMXLZxl++0X58lAfA9bwgF9mwoIQwqXPm7Lj74W6Xz
         RxA10QmaUy4mCfQfu2O3oIUq5fdj4x1ZsdX2jEa+jEzOvdgeFgdJMlXMBVTjCNlx5us4
         e2kvMuRIBQFZ+6jOQzkpx9aSEDQSziijQHvGx2zvGosE2jUwzjOqNofRnfQX0x/edpfH
         BiFyBI+YqWxPAvGgFJMpfO+bWzq22Io70CyYyicCx/UF4Da9fUb+as+39XelydSAVPZR
         rXzw==
X-Gm-Message-State: AOAM5300ek3OICyH2zssaKRy+Y1tXoPgfK2Q+hzhbbbp0FQYuqUiGpKE
	XdZB0Dp2Gbd1+KHJqNuc9kfvafGgBcpGIr2gful21GdKPLZHPg==
X-Google-Smtp-Source: ABdhPJwi8o7v5tg1nGQv5xwgtQZeF8xNHrhPPBpvPTYcskVibfzq3U/LuknIKiTMzf13d3SVgs20DEoj7jTBJuQs/fw=
X-Received: by 2002:a25:318b:: with SMTP id x133mr7314449ybx.201.1605699751587;
 Wed, 18 Nov 2020 03:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com>
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 18 Nov 2020 12:42:21 +0100
Message-ID: <CAP71Wjy0zX_vExgmWcV_6fA3RcOghRfBr1zvxt9dyphyrdFBOA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 1/9] conf.py: Add oe_git directive
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> This simplifies linking to git repositories on openembedded.org.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Thanks Paul!. I reviewed the whole series. made a suggestion about a
new variable for the LTS name. It can be done in a v3, or a later
series as well, i don't mind much.
For the whole series:
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  documentation/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index a8df6e8f8..96118abec 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -78,6 +78,7 @@ extlinks = {
>      'yocto_git': ('https://git.yoctoproject.org%s', None),
>      'oe_home': ('https://www.openembedded.org%s', None),
>      'oe_lists': ('https://lists.openembedded.org%s', None),
> +    'oe_git': ('https://git.openembedded.org%s', None),
>  }
>
>  # Intersphinx config to use cross reference with Bitbake user manual
> --
> 2.20.1
>
>
> 
>
