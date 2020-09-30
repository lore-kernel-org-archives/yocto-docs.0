Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web12.2825.1601494115669796969
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 12:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Cg6tYge0;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id k18so2157460ybh.1
        for <docs@lists.yoctoproject.org>; Wed, 30 Sep 2020 12:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cc/HyC84IajJ0off8fkAifuBhvvO9anKPL+4G7akFC8=;
        b=Cg6tYge0rNBuH5REuegI4RJBZhNB4nKz+EYE1egUDUaxRTTLeTlRSsA/Zf7wxlq25F
         W5YPKlF7goK30UEqxe8uvmqcGBDdjwpFHt+2B+WvrNpr5vJASkEE1kAMBhy2NcT2Cn4c
         eU2o1LkVPf9j/pwoc7DEo9icEk/wPoe0vL+hGqWftvAx3GDS5FwpG0OXvx8rL5JmN9He
         519wNg/QhbiZg0QKyLMUoIjlq57EAunpmx2YRFhmKJRJ25BoWWdZjGzypPVcBfVaaeub
         8kxhUiEPFqEIs5kPr0fk3pxpwhYHYHK6wAL/jxJl4a5SvNPQZNcF9Rum2zbEBsPqJdO1
         ClGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cc/HyC84IajJ0off8fkAifuBhvvO9anKPL+4G7akFC8=;
        b=GiVuAA53BFgKBIDoMx0jAojtZ6Ge/67iTJPnkKhAhPyKWKkDPFfOXgizx5/7mhE1Af
         9myusvoTPH8L75Fe7Ix/WGHAB1wgzqgodzGFucX6+KRFPwEpnJe5ryMCMy173yTasUN7
         Psi+SM8AvfVBEDLTI+CQqSEG4bwygQ79jg7S8f0l++MtbPB2G8YP95OwKRypa+6uI2x3
         eA7LpdvOiVS/R+MZDlPXxzLuRczjN6Sud7Zdriec3Ek5yI1xf2oaxalYe/isQhSWViiM
         31c3JGXTiHr0cKROkhCaGqXv1ZEIBB5q2bTFakd6ZO6VGfcpb/dP6ObyTlUDwY/sxJbG
         ddPQ==
X-Gm-Message-State: AOAM532tZWiFeDKzIVnbgGyyKFZ6/3z9BbG10YDFZyJRKKhlD1vI34iX
	loJaaHUORYQG+rXw0tk+LqiCKv/BjKaYjpZ1zGiJNg==
X-Google-Smtp-Source: ABdhPJzbk4AujezXTTaKHQJRSNSi8jLKWEp99kQKFz/lFHwLjL3vrnp/Cu4N79xt8jq2X13JmEtObbaIrz1Eo70xw04=
X-Received: by 2002:a25:bd41:: with SMTP id p1mr5818396ybm.475.1601494114642;
 Wed, 30 Sep 2020 12:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200930150227.47145-1-usama.arif@arm.com>
In-Reply-To: <20200930150227.47145-1-usama.arif@arm.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 30 Sep 2020 21:28:22 +0200
Message-ID: <CAP71WjyoP3vLECfhG-fdfF_T0rX9FSufizM8BOXNRxuTRQc4Dg@mail.gmail.com>
Subject: Re: [docs] [PATCH v3] ref-manual: document authentication key variables
To: Usama Arif <usama.arif@arm.com>
Cc: docs@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 5:03 PM Usama Arif <usama.arif@arm.com> wrote:
>
> This documents the variables used to create keys for
> signing fitImage.
>
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>  documentation/ref-manual/ref-classes.rst   |  4 +++-
>  documentation/ref-manual/ref-variables.rst | 23 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
> index 60ce8efd21..b007e34826 100644
> --- a/documentation/ref-manual/ref-classes.rst
> +++ b/documentation/ref-manual/ref-classes.rst
> @@ -1413,7 +1413,9 @@ variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
>  :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
>  appropriately. The default values used for :term:`FIT_HASH_ALG` and
>  :term:`FIT_SIGN_ALG` in ``kernel-fitimage`` are "sha256" and
> -"rsa2048" respectively.
> +"rsa2048" respectively. The keys for signing fitImage can be generated using
> +the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
> +:term:`UBOOT_SIGN_ENABLE` are set to "1".
>
>
>  .. _ref-classes-kernel-grub:
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index cf37703814..e206871c94 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -2585,6 +2585,11 @@ system and gives an overview of their function and contents.
>        For guidance on how to create your own file permissions settings
>        table file, examine the existing ``fs-perms.txt``.
>
> +   FIT_GENERATE_KEYS
> +      Decides whether to generate the keys for signing fitImage if they
> +      don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
> +      The default value is 0.
> +
>     FIT_HASH_ALG
>        Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
>
> @@ -2592,6 +2597,24 @@ system and gives an overview of their function and contents.
>        Specifies the signature algorithm used in creating the FIT Image.
>        For e.g. rsa2048.
>
> +   FIT_SIGN_NUMBITS
> +      Size of private key in number of bits used in fitImage. The default
> +      value is "2048".
> +
> +   FIT_KEY_GENRSA_ARGS
> +      Arguments to openssl genrsa for generating RSA private key for signing
> +      fitImage. The default value is "-F4". i.e. the public exponent 65537 to
> +      use.
> +
> +   FIT_KEY_REQ_ARGS
> +      Arguments to openssl req for generating certificate for signing fitImage.
> +      The default value is "-batch -new". batch for non interactive mode
> +      and new for generating new keys.
> +
> +   FIT_KEY_SIGN_PKCS
> +      Format for public key ceritifcate used in signing fitImage.
> +      The default value is "x509".
> +

We probably should be sorted alphabetically.

>     FONT_EXTRA_RDEPENDS
>        When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
>        this variable specifies the runtime dependencies for font packages.
> --
> 2.17.1
>
>
> 
>
