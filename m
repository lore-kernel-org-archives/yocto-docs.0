Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web08.2491.1603231487143094880
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 15:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=reAQTXKJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id m11so24454otk.13
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 15:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2s8K1cvr46PsJsOSOgEUoIzJcP+zoAgq0GJOKtbypos=;
        b=reAQTXKJ9mBjgErDV9ZqptxXqY8tDPxG/P2q5cZBCa4+UxopUz8tVV0R59PgPy6FzS
         neyouzD4IxP6SZRfdA7aL1K0luHmuITfaRWzYrxeJj0cCWp/PPjqkE1HpW9URXj5ATOb
         /d3ea/uygkXOUU5/3wylvy2D96NXkwrx2M2Auz5Z9GQSVDa31UfexQcMCs1BMww+EqGD
         yOd8i9uatA83Jqh4YDFCax3qc25/IjEOJBoAjOXG1idJUTqkCqI6k4hlLjmeGduQlUeU
         ++7ioOzMFH3VpGENefCJQ2oAuBiVwXQhZuIgYNUK5LFUsjf1s0IyAf0s2LEtx8KiD4qY
         9umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=2s8K1cvr46PsJsOSOgEUoIzJcP+zoAgq0GJOKtbypos=;
        b=q6pPBHia60FtdU7uY+8VIalqBOa5gs8WHOM0mSaU6HT0j0Yd4h8WKsALR9q5+IavSw
         xQ25bLghClm5WxXO0rmqFTZb5cnvy2nfWYYfndsfwPuM8sHgd843KqUA36FyWawl/n/x
         Z2xPTMi6KAW3YROlOdg22AUJU4pSFOAnQFk5lgacNhnpIlj/40lGSM1DXXgnd5D8Onix
         G3H+e18hYfJASuQE3lIx0xi3DKxvuKbioF3TYAny+47jt5DMsoUJieV+w3qULinlKyr4
         2PFQLhpxnrqHi3axXimvMndrHrmNEnLUHBv3r7AlGgpNDUjYWyD1WreU/P2rWdG6dxvF
         G0YA==
X-Gm-Message-State: AOAM532Uc/eSNnEy4Z7g1ACBCKrJIl1JBsIdAJeWFSsdhaGWaKmIhf24
	mK+Yg5+GGAa1Ip0H3TOS428=
X-Google-Smtp-Source: ABdhPJyVwOV1Emm4tB1eIF+FhU62MHwHsKJNfFOm7MyQtf0763K6RCwZETGlYFCGnWYndtH4W01N9w==
X-Received: by 2002:a9d:22e4:: with SMTP id y91mr366981ota.72.1603231486462;
        Tue, 20 Oct 2020 15:04:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cd0c:110:b7a5:2c69? ([2601:202:4180:a5c0:cd0c:110:b7a5:2c69])
        by smtp.gmail.com with ESMTPSA id 4sm93317oij.40.2020.10.20.15.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 15:04:46 -0700 (PDT)
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: Joshua Watt <JPEWhacker@gmail.com>, docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Paul Barker <pbarker@konsulko.com>
References: <20201020170326.14313-1-JPEWhacker@gmail.com>
 <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <ad70d8cd-2b64-05f4-f78a-17a559011c87@gmail.com>
Date: Tue, 20 Oct 2020 15:04:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/20/20 11:14 AM, Joshua Watt wrote:
> On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>> Adds a FAQ with explicit directions about how to build a vanilla kernel
>> for a machine.
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>  documentation/kernel-dev/kernel-dev-faq.rst | 49 +++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
>> index 70bf4a2d4..929cc4aad 100644
>> --- a/documentation/kernel-dev/kernel-dev-faq.rst
>> +++ b/documentation/kernel-dev/kernel-dev-faq.rst
>> @@ -79,3 +79,52 @@ following:
>>
>>     APPEND += "printk.time=y initcall_debug debug"
>>
>> +How do I use a vanilla Linux kernel with my machine?
>> +----------------------------------------------------
>> +
>> +The simplest way to use a vanilla kernel is with the ``linux-yocto`` kernel
>> +maintained by openembedded-core. Using this kernel is as simple as adding the
>> +following to your machine.conf file:
>> +::
>> +
>> +   # Use a defconfig provided by the kernel. If you are going to provide your
>> +   # own defconfig in SRC_URI as show below, you'll need to omit this line
>> +   KBUILD_DEFCONFIG = "multi_v7_defconfig"
>> +
>> +   # Use default value for all symbols. This is usually what you want when
>> +   # providing a defconfig
>> +   KCONFIG_MODE = "alldefconfig"
>> +
>> +   # Make linux-yocto provide the kernel
>> +   PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
>> +
>> +   # If you want to use a specific version of the upstream kernel, uncomment
>> +   # and set this line, otherwise omit it to use the latest stable kernel
>> +   #PREFERRED_VERSION_linux-yocto = "5.8.%"
>> +
>> +You will also need to add a .bbappend in your BSP layer to amend the
>> +linux-yocto recipe (e.g. recipes-kernel/linux/linux-yocto_%.bbappend):
>> +::
>> +
>> +    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> +
>> +    # Uncomment this line to provide your own defconfig file in your BSP layer:
>> +    # SRC_URI_append_my-machine = " file://defconfig"
>> +
>> +    # Marks the recipe as compatible with your machine. Be sure to replace
>> +    # my-machine with the name of your machine
>> +    COMPATIBLE_MACHINE .= "|my-machine"
>> +
>> +You can also apply patches and config fragements in the bbappend if desired,
>> +see :ref:`kernel-dev/kernel-dev-common:applying patches` and
>> +:ref:`kernel-dev/kernel-dev-common:changing the configuration` in the Kernel
>> +dev manual. It is recommended that you use ``_append_my-machine`` to prevent
>> +these changes from inadverently leaking into other machine configurations
>> +
>> +.. note::
>> +    You will notice that this is will still pull the kernel source from `the
>> +    Yocto Kernel git repo
>> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
>> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
>> +    which is an exact mirror of the upstream kernel.
> This is a lie.
No. You listen to this old man ; )

was I close?

-Armin
>  I thought it was the upstream mirror, but it's not.
> v5.8/base is the mirror and this one has a few extra patches.
>
>> +
>> --
>> 2.28.0
>>
>>
>> 
>>

