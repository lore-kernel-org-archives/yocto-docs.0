Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.8689.1600419607152568718
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HS5UF5Op;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id h206so3769868ybc.11
        for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2020 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PmpJLP317j/KokP69R8c1aBKvr9Oh6CBBnf8xx7uRpU=;
        b=HS5UF5OpXVvjlPvoSzXllTRJAu+ubGNMsT3vsMC0UowHfgxUtaUaR/XgsuqHlAx1N6
         18j+DSJENm5ito6f08dPampdMyRKBk3WHGLZ42usZpjTG1P0X7a0s3jXIcT8MpIGixyK
         D9Z9xjtN5dP8gMB+F8ru6HgtSoc1y1s1UQy30K5bxk3RkDwoxmff38HLc39wZP+7DGpw
         8jHlNaXgO+pjE3Bh6a3XKvGt3JN7bxTJKkKh0UIcrGsxzNaKzfKZtvgxJp/txha2OBBU
         w0xzqv/xwfOkk+4zOoTWO+b2UnLecmYqo3D5bu1lwks3ouSGBzQI3z/btuCZzFYUf10/
         Qc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmpJLP317j/KokP69R8c1aBKvr9Oh6CBBnf8xx7uRpU=;
        b=aAqy6mjuKmq7kfXOOKSmAerzaJZ7rQraNUybHjB7vCGVw8fjMnbESuPsMMgP/X/a6G
         nbzOIfQqeIIbiaR8w9L6mm5CHErIs4znc4/mDtapLfGuuLQfpcx8BqMuraLJJJZGWDYc
         sIc/aFq8rEFrqehpXDGvdG5uldmQkb+T3PN4sUsFotiZ9Hge6U+WGVjIXH3A+SSuUUL3
         0dwvcdeWmW4dOmv8uPU3VZl75rsakIwdjUEloi0DRxYX7GguJojFWwK3F2HvCXefhPuo
         Xpe+rfDpq7vg5S3oOtnSvGmyL7OIGnGX8LeOa08jvDNgYn1RoBB55zTy1Al9r5cZkN91
         YEJw==
X-Gm-Message-State: AOAM532oImGAP6lyIkM864/kXb3aFhBN4tMxhZI9jNINp4gutj3ATRWD
	MHQP8gLdtLr3oJ6S4Yp9NXPqSaeXfIpdYH6GIarZKcBBPD83cl8U
X-Google-Smtp-Source: ABdhPJyyTeIXi2Cs+swtnQ8QMgHjjUmk4ECUOrH/ORZDZPOUws//vx1sTYIoNlC8vXoG4u+sJy+yZLSpvgmyxW498C8=
X-Received: by 2002:a25:e009:: with SMTP id x9mr2592137ybg.373.1600419606195;
 Fri, 18 Sep 2020 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200917210947.51974-1-foss@0leil.net> <20200917210947.51974-2-foss@0leil.net>
 <20200918082227.4tmksf2ot5omitg2@qschulz>
In-Reply-To: <20200918082227.4tmksf2ot5omitg2@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 18 Sep 2020 10:59:55 +0200
Message-ID: <CAP71Wjy9xJCsc-WWxCONLFUyZZ7kD9Hr3oRoLJWB8iC_arU2sw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] docs: fix broken links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 18, 2020 at 10:22 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Thu, Sep 17, 2020 at 11:09:47PM +0200, Quentin Schulz wrote:
> [...]
> >  1. *Access the Index of Releases:* Open a browser and go to
> > -   :yocto_dl:`Index of Releases <releases>`. The
> > +   :yocto_dl:`Index of Releases </releases>`. The
>
> All those broken links could be mitigated by having:
>
> extlinks = {
> -    'yocto_home': ('https://yoctoproject.org%s', None),
> +    'yocto_home': ('https://yoctoproject.org/%s', None),
> }
>
> in documentation/conf.py.
>
> But then you need to change all links using this "macro") so that they
> don't have a double slash after the domain name :/
>
> At least with this patch it's consistent (and working :) ) but still
> error-prone.

Yes, you're right. That's one of the things I didn't like too much. I
think I mentioned I had 'abused' extlinks a little bit. The main
reason I didn't put the trailing '/' is because sometimes I needed to
have the URL in the output, not a 'text' with a link. for example:

kernel-dev/kernel-dev-maint-appx.rst:      Project kernel repositories
at :yocto_git:`/` is the

but i don't like that much.. that said, I did that, before I added
support for variables subst.. so perhaps we should use extlinks for
what it's supposed to be, and use variables otherwise, e.g.
&YOCTO_GIT_URL; when I just need the link..

if we do that, then we could have this instead:

'yocto_home': ('https://yoctoproject.org/%s', None),
'yocto_git': ('https://git.yoctoproject.org/cgit.cgi/%s', None),
'yocto_lists': ('https://lists.yoctoproject.org/g/%s', None),

and then we would have:

:yocto_dl:`Index of Releases <releases>`

but also:
:yocto_git:`meta-yocto-bsp <poky>` instead of
:yocto_git:`meta-yocto-bsp <cgit.cgi/poky>`
:yocto_lists:`Yocto list <yocto>`


>
> Quentin
>
> 
>
