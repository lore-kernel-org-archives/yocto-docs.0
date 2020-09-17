Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web11.11706.1600335148419777365
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 02:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FhCxPbYX;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id c17so1237011ybe.0
        for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2020 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3LzQKAKj/8e0Je5cWEQkKgVuUFPcu/0XdkUmW+zdlEE=;
        b=FhCxPbYXzkJA9geI5vXQ2LADXdaLEe0i+p44oGjx23nywV5GlBmf2JJgUS6dOFbVUX
         WzQzXQD6eHQE7QuCcyO2Rho8ORQ5+UWupxkLAeaXpBqniy/71Jv433I/pFnUO/ryiRhK
         o2R77TRpPvfUjRR3P6Tff38WJUnXZnrkPAjsXWJVlXaiChuTn3eWvfzAtqH8qH5lsuba
         2AEzhEownOGPox3BeekDVhUNh/euU98HURZkqqDJaJQJIaYbMLzsYSAJR01g+85sRP4i
         xB48tlbRTXXAxJ0o6JlYUJGSZdzkJmnpiDb9mQPIvaag3/oc9ntcao7t4l3xTGMCoCeX
         BW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LzQKAKj/8e0Je5cWEQkKgVuUFPcu/0XdkUmW+zdlEE=;
        b=I6hWqYL8znpHRM3v93qxyuviD25xhBXxea9sEBk3E+R/5bgP07bRsaPxjeyofsULeE
         upc9TFrEa/OJxjb2xRJxvTSiTdI6yJUkeAZAaFuuf+ygSiI7I/3nLt+PMlW0UXOZAdG7
         XXdXdsqoiu78oOejnlcMSlLLSXzuRKGb7gdt6N/TzMYFudkFlXUS+aahd8Ja/DvEJFbZ
         SCulAUlLC53FTahD2oV40cIbCF/8GjEb6B0lzAfb/ktNxQnpJCV397Y0cHBhJMivShPJ
         D7Z17p8DFgmGwBMdqhFFAsE5u7nlfYDGie5XBnb69GqnmYPeX6dIHvqni0vqkPNFUyd8
         oucg==
X-Gm-Message-State: AOAM53048qymFGUrjn7yfRgkWg6Wl0j+UgUZV57UJJpSjEGk81qyloaK
	deo/40D6BN8Jp8k1iOa+Ex0F8mzQ+Tc7l30DAlfoKw==
X-Google-Smtp-Source: ABdhPJz/E5QQgL9dBNGXmZsyfZVRAODjLajrqaZXTdukkzTifqHkrGKgTNfQAuPADIXd1AiYKwORR2acyKhu6BSg9+E=
X-Received: by 2002:a25:d40c:: with SMTP id m12mr24661836ybf.273.1600335147455;
 Thu, 17 Sep 2020 02:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200916235906.243174-1-foss@0leil.net> <20200916235906.243174-16-foss@0leil.net>
In-Reply-To: <20200916235906.243174-16-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 17 Sep 2020 11:32:16 +0200
Message-ID: <CAP71WjwBU8xYtdA9KCtZt70AuCFh2Lx7foRRVOA7tt4SJ=PeXQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 16/16] ref-manual: examples: libxpm: add relative path to .inc
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 1:59 AM Quentin Schulz <foss@0leil.net> wrote:
>
> In order to be able to build this example from anywhere, one needs
> to give the relative path from LAYERDIR to the .inc file.
>
> The path is the one for the inc file from openembedded-core.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

thanks for all these patches! It's all merged, even in master now!
I squashed a minor change in patch 7 (use :yocto_docs:) , and I had a
minor conflict in patch 9 since I applied Timo's patch first.. but
other than that, it was really nice set of patches!

> ---
>  documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> index b58d4d7bd..c0c898640 100644
> --- a/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> +++ b/documentation/ref-manual/examples/libxpm/libxpm_3.5.6.bb
> @@ -1,4 +1,4 @@
> -require xorg-lib-common.inc
> +require recipes-graphics/xorg-lib/xorg-lib-common.inc
>
>  DESCRIPTION = "X11 Pixmap library"
>  LICENSE = "X-BSD"
> --
> 2.26.2
>
>
> 
>
