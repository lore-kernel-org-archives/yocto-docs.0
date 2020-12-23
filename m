Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.8701.1608729753468669972
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 05:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eivOJMEU;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id u19so16191496edx.2
        for <docs@lists.yoctoproject.org>; Wed, 23 Dec 2020 05:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkvfsfFg2QmhhJAfQrolSSGaoaDYUU9aN3yTS1GF4/M=;
        b=eivOJMEUrIrTG3GUTfVf+HK6W/FxjndwIUheruhXtB6//H1jWDGWXdPciSBUJD/hwE
         8HcViUOYLnBTpnc266BDBAYV783b88nBenHQFpRNlIGnrP+PrkXtcjPcb2OU2CXXvRaH
         iix5iOSvoQgHVpQGVPU8ocAYf13E4kbRQe7GWRJx1YKAP2RMoRJxlyvCV5jZLV89WTha
         2X4z5+21ythih6/YAUXo4c0PcKFBY7PRaHlOUOxo2swzYzwjC2mNZgXdEz+jBOpvcoQy
         YM4abykg5gs31qxTifM21evRQWtSAAQq7hJKSsWJZK6pYTGHg0t0zjPiK2pRkyk3wJ8d
         5Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkvfsfFg2QmhhJAfQrolSSGaoaDYUU9aN3yTS1GF4/M=;
        b=bVpNF8IXo0+A51ga5dt36OY82SSk0/Iu5r3zzS8ZzgEZhZVqpabUHPvhI/lkSDnbdg
         E4sXSvBQ1KpKlBjACK0D6xA4Phi7TcVQcql5TfMWsUDLkqlQsXFmhgqrd6pgpwfN9pfb
         qdaN/qpNHPDzamwMxRXd3C1PEyfF0S1+LzzK2viQYKKwROYAvA5zl59Cci+KlJHsPfOy
         EdRIEJ2fXcsrvCBJnxpfnMyQe8Xu3tCGYWgIVgdlnck24KD/g90QhJvA/m2nZkKUI3rr
         cL11UxQwL7Ovxupj1+QxYYKj6qrUykbATlVl1twABB4/OcwJTjlRWM0N/2IIZeiv/7qu
         PnRA==
X-Gm-Message-State: AOAM5321aDZgYAgbhJ1VnB9u6/Qc5P4f0baMnjslJefZTypwlAgnxrlX
	5/jDxjzrV/75ScvOXfT2iodYltisO4N+h0a41G6wBA==
X-Google-Smtp-Source: ABdhPJzvPSsa/fb+mnLAgKP1dzhc2lG63UarfLggndPSvAYSsd0JefVayFQ/VPIVbodHafzr7tqUeFBSBtiHz8vt+eo=
X-Received: by 2002:a50:9991:: with SMTP id m17mr24481395edb.48.1608729751963;
 Wed, 23 Dec 2020 05:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20201223130938.20476-1-ovidiu.panait@windriver.com>
In-Reply-To: <20201223130938.20476-1-ovidiu.panait@windriver.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 23 Dec 2020 14:22:20 +0100
Message-ID: <CAP71WjwVDPojL6Qh7VWRBzVL3qZayLMMxkDcb9Rrq-MvRMyp2A@mail.gmail.com>
Subject: Re: [docs] [PATCH] variables: Document KERNEL_DTC_FLAGS variable
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 23, 2020 at 2:11 PM Ovidiu Panait
<ovidiu.panait@windriver.com> wrote:
>
> Add documentation for the newly introduced KERNEL_DTC_FLAGS variable.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 8c6cc46b6..a4938d9c5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3838,6 +3838,14 @@ system and gives an overview of their function and contents.
>        :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
>        be inherited.
>
> +   :term:`KERNEL_DTC_FLAGS`

we try to keep things in alphabetical order, so it should go a bit
later in the list.

> +      Specifies the dtc flags that are passed to the Linux kernel build system
> +      when generating the device trees (via DTC_FLAGS environment variable).
> +
> +      In order to use this variable, the
> +      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
> +      be inherited.
> +
>     :term:`KERNEL_DTB_LINK_NAME`
>        The link name of the kernel device tree binary (DTB). This variable
>        is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
> --
> 2.17.1
>
>
> 
>
