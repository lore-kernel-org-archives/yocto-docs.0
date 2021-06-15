Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.1536.1623793683521094019
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 14:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V5Ra9sh7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id f2so187889wri.11
        for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hSZdX0AUCMmgwY9Gq4oOeC1LkY/RTWcMYSKcgaZSexM=;
        b=V5Ra9sh7SeCPRP9/P38wUNb+HsLHUsu1ETMNRPBcYCjQLfAR7/BRbXh2coO76Wv3uk
         GS1DninTJWK+qaR4Nz4K76Q95bGAloOd4LXzcX493xFI+ZG4rVi0EFZiinK8ufmojeIN
         opCFnVnLFehTC4SrEnvY/6LXCgm1EyjrEHNQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hSZdX0AUCMmgwY9Gq4oOeC1LkY/RTWcMYSKcgaZSexM=;
        b=io+SlDHk6ru8E5WsGUq3BqmppMQJUiK54vqPBogf1Nu3gq0M3GwD547kwSphKXrzDd
         OOAVQcF1zmNlFCF2OiAxNG4ZEXDyFBCYkZZ8DNkrD9y5I2mbmRnMBhzMLR8GFHKLTqD4
         2UW1XANADdUEl2id+cMqxwDf4xVvok2rdr7BYJSnQgOGEexgK2BLWRMs9ukFTAFJmMRL
         mSv9bOjVKKEWiBOybTXSpkvXuz5WcEBgaB+wUMCwX6K1AYA8yhpNfA9+nW0HL1K96aQa
         Q4k8uvkCiKBuuhw2u5HTNKpljAqNOGgaV5BHlkvOblPkHNdqBsYecCJyH8iHNz+IMfA/
         2KNg==
X-Gm-Message-State: AOAM533zwROFMOAWpu4UMXOtapNQZwCaRVynnPTNkGxING1QVI61KiGe
	68W/uK9UeZo/MuBvv4G+75U+rg==
X-Google-Smtp-Source: ABdhPJzqw+QxTNRdbaPPEGhQtiqiB7APqlSD+Zrc+zJSiKIEsekXuBLP/G6rIUk4ok5JaZf7GLJxTg==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr1383199wrp.58.1623793682023;
        Tue, 15 Jun 2021 14:48:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d6e:bde3:735d:6a7d? ([2001:8b0:aba:5f3c:1d6e:bde3:735d:6a7d])
        by smtp.gmail.com with ESMTPSA id k16sm119967wrn.96.2021.06.15.14.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:48:01 -0700 (PDT)
Message-ID: <cde2333ef0cb1467e01d3e24ee323420abc96853.camel@linuxfoundation.org>
Subject: Re: [docs] Documentation to install an ESDK out of date?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Tue, 15 Jun 2021 22:47:58 +0100
In-Reply-To: <84681300-15a8-d63e-786c-b0f7d3a8a476@bootlin.com>
References: <84681300-15a8-d63e-786c-b0f7d3a8a476@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-15 at 18:14 +0200, Michael Opdenacker wrote:
> Hi,
> 
> I'm following the documentation to install an ESDK:
> https://docs.yoctoproject.org/sdk-manual/extensible.html#installing-the-extensible-sdk
> 
> Several issues though:
> 
>   * The documentation doesn't say where to download ESDKs from, though I
>     guess it should be
>     https://www.yoctoproject.org/software-overview/downloads/

Yes.

>   * From this URL, I downloaded and ran
>     http://downloads.yoctoproject.org/releases/yocto/yocto-3.3.1/buildtools/x86_64-buildtools-nativesdk-standalone-3.3.1.sh.

That is a buildtools tarball, not an eSDK.

>     However, I didn't find the "devtool" or "run_qemu" scripts than the
>     documentation mentions.

An example would be:

http://downloads.yoctoproject.org/releases/yocto/yocto-3.3.1/toolchain/x86_64/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-ext-3.3.1.sh

Which is an core-image-sato eSDK that runs on x86_64. There are other images
and target MACHINEs.

>   * Why don't we release ESDKs for arm or arm64 and other architectures?

eSDK can only be built on the architecture it is intended to run on. We'd therefore
have to build an aarch64 eSDK on aarch64 hardware. We do now have that but I suspect
nobody has considered this before now.

> Am I right to suspect that this part of the documentation is out of date?

Sounds like it could at least do with some work!

Cheers,

Richard

