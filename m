Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web10.1205.1606948698981910531
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 14:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aphpbpA7;
 spf=pass (domain: linaro.org, ip: 209.85.219.193, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f193.google.com with SMTP id x2so164285ybt.11
        for <docs@lists.yoctoproject.org>; Wed, 02 Dec 2020 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vepnBe9QusRkh/0w3Dje8qEdzJbTp/9AFSphSYOUP50=;
        b=aphpbpA7HbTqDV0JA8+H2u+Uvyt3Hd8inpKZpUwW6yBKTwTM0x7CmNsWrbxsYE71kt
         eWkoMfQaXfOXT2hqsZxtoeSsdxe+BrIdXnnELZnc3X/GIUMn4SJ1ZDxKnaIlnl8xGRQj
         X+Dztk/GXxtSfQQTkY23+2Dwuv6Wkr1foCPjV7eaMe3rvFdvy/PyQ3hoGl4JlpXIT+oF
         NgDUb95C6Vl9wrSEnXiobeXsj9TUvfGrCpRVmJMGaOy6AM23L19e1qPQpMcNZtRNYaL1
         sPVReSjEqikY5MwfK5/vUwxfmHM4ajasyFYdBOL2Rox6WgOzvpPh7VUR8P6FD9gcTiuB
         NjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vepnBe9QusRkh/0w3Dje8qEdzJbTp/9AFSphSYOUP50=;
        b=Zb8bDVKap7QC2urqJyf+Ts2q4hTrqd5Raq3BDvEBlDKvu6v0s/m1YFSDmkZvLLMTnX
         cYpjFbkNts2n8SUekCZHPE0j72o5Mg/6TCmzi7lIHISPNOgugQmUoZjUIy+TklwrKxZH
         mYGjVprksStfqUdZ2ZKPeBia8wm1w5in+wDBSukVlusZ6+snvhCbv0kJ/SaFWq2B6rIB
         UOLF0RHIsgNvIqiv1Hg+GXhUZAqx8hyVNiyoFnz2UDdXbTYm4bxSzVvOknchwhhGzqRF
         vNsKty30F5a25lX9V+POna44nnsY6dBIMMuQcmC5Mj7kZc0QZObrEJy0lBDtuxhl4mRI
         9iUw==
X-Gm-Message-State: AOAM532Xa5TpByFYO4Pxf5cCEuA9RBP2Ny76PPkzcXENRVgEK9zMB9RP
	z8dHzuxHfo8wINcKgNlOrSccyhXDwW/ebmqmpqEymA==
X-Google-Smtp-Source: ABdhPJx5CxmKK273bo6No36RU+zzVWM6lhqR656p7yQ4YIXmcKFh5Fg02zfGZMDshOHgn9eQW0uNP735bgyUvDyfLrk=
X-Received: by 2002:a25:8686:: with SMTP id z6mr482482ybk.373.1606948698060;
 Wed, 02 Dec 2020 14:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20201202220453.33336-1-mhalstead@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 2 Dec 2020 23:38:07 +0100
Message-ID: <CAP71WjxVVNuAtBvYJLwgMSSkx6FYsq3+06txyGpa2h=jFPWjdw@mail.gmail.com>
Subject: Re: [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, rpurdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 11:07 PM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  documentation/poky.yaml                  | 2 +-
>  documentation/releases.rst               | 1 +
>  documentation/sphinx-static/switchers.js | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 57da0a7c2..c1340c25e 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>  YOCTO_DOC_VERSION : "3.2"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
>  DISTRO_REL_TAG : "yocto-3.2"
>  POKYVERSION : "24.0.0"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 9992f97d5..85b31b64d 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -12,6 +12,7 @@
>  - :yocto_docs:`3.1.1 Documentation </3.1.1>`
>  - :yocto_docs:`3.1.2 Documentation </3.1.2>`
>  - :yocto_docs:`3.1.3 Documentation </3.1.3>`
> +- :yocto_docs:`3.1.4 Documentation </3.1.4>`

The patch looks good, however, but http://docs.yoctoproject.org/3.1.4
currently does not exist. When are you planning to deploy the docs for
3.1.4?

>
>  ==========================
>   Previous Release Manuals
> diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> index fe9841b10..fc901d329 100644
> --- a/documentation/sphinx-static/switchers.js
> +++ b/documentation/sphinx-static/switchers.js
> @@ -4,7 +4,7 @@
>    var all_versions = {
>      'dev': 'dev (3.3)',
>      '3.2': '3.2',
> -    '3.1.3': '3.1.3',
> +    '3.1.4': '3.1.4',
>      '3.0.4': '3.0.4',
>      '2.7.4': '2.7.4',
>    };
> --
> 2.28.0
>
