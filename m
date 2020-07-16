Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.353.1594940136063650326
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 15:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aNPKt66B;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id n22so5584510ejy.3
        for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2020 15:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IsigYr1vZlua+xK0MHlagjWqRFdlnrKok46oL/wJMVg=;
        b=aNPKt66BFVwYWmnEkaDi61XgQhDV3w3pR1tgXAIPmKLdjft9DBiJ7Al+0fYqE9k3JM
         4jXy65UvGCQCznOF1pd+u9WH7mNvK9irhRyiEsCCCcw4vq+wbFXCgJcu9tgkfgAaL6Hp
         zG8RhhN+rt9YCTFAxUDVC7k0raeZrBT3gjxp7X46eGdDyg5YSG+QZJcgZmsM/EhNUPjS
         OO9oX4Xmks8EYb06t+sXnPvC8+BKKqaimvJI/pRmXDqzgk58kK9CpCAehSfKLV3FJZFc
         cpSPAAoRUotUAabEgvW/T25jwHfw9lerx+hONyNtChqVES5GO5Ihp5zp6qqIqDi9DyIv
         dmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IsigYr1vZlua+xK0MHlagjWqRFdlnrKok46oL/wJMVg=;
        b=b9Qr12bEhXLuaCDm+hJpQjYp4QncyKpX52t3qYYQqx5RsqpDqB0jfHdN/fbHxqq/J6
         CY/VlDk1xiXSwf//1AIE+e4EyRDP/nz9hRUHeZ/MhNgbYY27qv3100FNHKq9zJwqYaAs
         isBaPnlixK+7NbLYgvqzsOGBMMs3KjFrpObCSFCPkZkRU6HWeR0W4Fw86E9cY+0vCwxM
         quDwMMQtjNAJJx3Ys0eSfxZBE/eXO5NWW4A/7yoh8PKqcvJeER/E+/xc6mn27Fmp7oNA
         SRrFgBXmceVlSnkuXdmsIYYSylUnF4coZE1SgH/44re/5iGQ8VOKVk4ROjV5PGbgf+ig
         kwbw==
X-Gm-Message-State: AOAM530JPOLSJrYy3X07avrXSAQNDft/BVNElYRL/bGYza9jNAeI+phM
	pap1hsjHABeCJRLbrp7GyWrfnB3g5w5FjjNPGGjYKw==
X-Google-Smtp-Source: ABdhPJyoEQFYDV5PRkxlzGyUWFnQPFEoLTtKcpdKWCwg52zEz+KhHv8ECrx0DVAUhsiS2Q02QnVXAiPmkuewlc6MY4g=
X-Received: by 2002:a17:906:488b:: with SMTP id v11mr6117529ejq.173.1594940134496;
 Thu, 16 Jul 2020 15:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <16225C0CF546C9E0.31624@lists.yoctoproject.org> <776527fe-3306-c772-103d-5632b4475809@gmail.com>
In-Reply-To: <776527fe-3306-c772-103d-5632b4475809@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 16 Jul 2020 12:55:23 -1000
Message-ID: <CAOSpxdbi1dZO3ZYBA_51mJrK=Pyw6PL588TSHwn9eVwhQs=gWw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-system-requirements: update supported hosts lists
To: akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 16, 2020 at 12:35 PM akuster808 <akuster808@gmail.com> wrote:
>
> Dunfell needs updating too but I am not sure if we can remove hosts that are no longer in the AB like Ubuntu 19.04 or the Fedora ones.

I was just about to send a similar patch for dunfell.

My assumption is that we don't remove previously supported distros
from LTS.  Someone correct me if I'm mistaken!

Steve
>
> - armin
>
> On 7/16/20 3:27 PM, akuster via lists.yoctoproject.org wrote:
>
> drop Ubuntu 19, Fedora 28 & 29
> Add: Fedora 31, 32 , Centos 8 and Ubuntu 20
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/ref-manual/ref-system-requirements.xml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
> index 43e217c6d..ac8b0032d 100644
> --- a/documentation/ref-manual/ref-system-requirements.xml
> +++ b/documentation/ref-manual/ref-system-requirements.xml
> @@ -94,11 +94,12 @@
>              <itemizedlist>
>                  <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
>                  <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
> -                <listitem><para>Ubuntu 19.04</para></listitem>
> -                <listitem><para>Fedora 28</para></listitem>
> -                <listitem><para>Fedora 29</para></listitem>
> +                <listitem><para>Ubuntu 20.04</para></listitem>
>                  <listitem><para>Fedora 30</para></listitem>
> +                <listitem><para>Fedora 31</para></listitem>
> +                <listitem><para>Fedora 32</para></listitem>
>                  <listitem><para>CentOS 7.x</para></listitem>
> +                <listitem><para>CentOS 8.x</para></listitem>
>                  <listitem><para>Debian GNU/Linux 8.x (Jessie)</para></listitem>
>                  <listitem><para>Debian GNU/Linux 9.x (Stretch)</para></listitem>
>                  <listitem><para>Debian GNU/Linux 10.x (Buster)</para></listitem>
>
>
> 
>
>
