Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B00FCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:27:56 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14888.1781076474875326103
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 00:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IfhnLDGX;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5176bbb9384so64277351cf.1
        for <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 00:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781076474; cv=none;
        d=google.com; s=arc-20240605;
        b=iKKNWhaushbWSK2Q91VAIzbzLkbFllephhUV0NYQiOPEYFXpsc4eZ7Xr2rgAJ/TNgX
         j1qzaMRh0E+hiG7E+lQ5pqYzH20QiHnPPiytowtLYpBjW6z8h7BzhBDavQl+NnS+bzGQ
         /oANNkRcSRAPotltfH+2wvo380t48WpBtYakNf5HjtfWZdPcpF/MK7QfBEnlZNJ6fDvV
         w0/aS6prZF0TCcWP9Tgp1F1b5Jg3+C8jvi7aOspW09La7MQ3K8+z7Ry7CFBhprFCnhs0
         PYWj+hBKifDuD6WYKCt1QPaLW7CdXauSz5BmOFMjlDf0L3R385vHbcE3KYhVJKZcoF+8
         3KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uoWh2dJLFkOf4H1tYVHP34hUSQt6tK5DZgbcxxUoQjs=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=TsaWHicWjvXRlnlpt685Rw/kj+TsDgi35I4aQPStjjRe4JWNIvDWhyq/ixAC/becM9
         fs3U1k8IPtZwaZtoFmIqvRTC0YNcu/PLBfaTpBlxTLL4SlIXfo9Kn8aqBWKQRkpYWbAo
         fIcDS8Qahq07zfID+dYqzYnFwCOvVZC+NfmiGUnwLMPFN20U7/LPDSCv9oB+hAM9/hYd
         LNkDYoyf+bRffswH/NAECMLiz3vbI5ur6ehxQ0QMggKU3Jtol7QGEldFPzhmuuqFCwyL
         oR4fDzXgydLUC5OkSQTg7TwDl1vckeX9kV9E/vOrQ/1/xhMExZKzRGbOxyh7HECAerM0
         3ghQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781076474; x=1781681274; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uoWh2dJLFkOf4H1tYVHP34hUSQt6tK5DZgbcxxUoQjs=;
        b=IfhnLDGX6f16o+yeONwvkpUGMjC7IM/kppnyM79xhK/9nXAD/71DOYRa/5m1I138yZ
         Im4w4lixuCE8eIvhzCXDReg+jsBqLq2ya9BblZYHIdZldPdsqrLdGdfh8rzn6+n+FpZZ
         MAIQTjh+/paFgqbGzkJOtW8+zYPmrheLLQfOdvhwvm5D5zJBSGaAp0u38qCiDrnVg+0Z
         1ganEFJRUYhcimvPW5sn47x55WQ/HrhgorHlk8NE1NXl0wYNw32XdLTCltxDEXvA1C7V
         fo1W9cbJQoZKfpTKjf7veDMWOcY8VablB2xMGxLLRtHDrA3XqDgGFrQ5Odj0F79+rTA4
         MtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076474; x=1781681274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoWh2dJLFkOf4H1tYVHP34hUSQt6tK5DZgbcxxUoQjs=;
        b=KGa+ywVlb3Tgei8/5Jozbaxegh7X8Bbb/+Zm2eD84kUz/ZYKXojvDmE6waCBmNJw0Y
         ncGPcHyo6VdA/w+R/CnKly2T59QDdPj3RoBUX5lMFv+KiyGSzjNUyxHynK/Ojj3Yixp0
         +ODX3VvibjbpWZcgRZwPsZ/huf4i2GeMSDS/+GbU/1z1da0NFJLmDr171KM+IC5/d51f
         mEnFpwkPI/JIQLT9rZW8N7YL5fA7D7U4kK2B6jDkWNzd3XyJJ6lJ3InUN57PDtFhlH2x
         EwV1wals8sZIPBdJnzyZNLKm+10B8P/p1kOckejlEg+AuaK+0YQ6mGEBfZvHpGZiH19Q
         vScQ==
X-Gm-Message-State: AOJu0YwOvshO+x5zdHkOqjCfpgMQw3op5ftnRJFwMccvOdhTTIJJeAUk
	PWgrEg62ajsFQ59FNztnjDFTkhjCBQj9Uks+v313F3Rry8sTjDveOAgwxRmhQ2U9QW9AyXiDoMt
	pXxJjMYNSMr+UOyvuwMCApG3XD5Lc558=
X-Gm-Gg: Acq92OHCnqJJHHoSKZvhDe8z4GnoKH/+k1/RLQT9Brbf4CXv5NxcT6dAaJNK8GvePIX
	qv+fg7Y6OXd6zU79vMPhfaTEmhbWrWuT3IJsRG2GZnxADy8Rif0DxMyZ9hcaEiTWbBaoGY2sKsx
	XzAg9bC10rLi2Z3K1ckSLnhi3awTIQOixKO8ZERZeQI1t3pYv53NNwQp3jV8Z94qj/eGO+7Hgtq
	D8OG8yBRL/FA4+A0fqq58WIMtarP20suys0YAX7UfMsVTm2UGaJnnNmua0o6aaScAzXfZPkg6VB
	ycfWk4kVa5nS7MEdrFM=
X-Received: by 2002:a05:622a:30d:b0:516:de71:e21b with SMTP id
 d75a77b69052e-51795b0a1a7mr335847281cf.9.1781076473806; Wed, 10 Jun 2026
 00:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
In-Reply-To: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jun 2026 09:27:44 +0200
X-Gm-Features: AVVi8Cd-b0rnGvl2DRgv_pX1kDtVchDWve0WAs3Q8lketCQg6PYq_dpFUwtobBA
Message-ID: <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe re-compile
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 07:27:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9669

On Tue, 9 Jun 2026 at 21:20, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
> --- a/documentation/dev-manual/temporary-source-code.rst
> +++ b/documentation/dev-manual/temporary-source-code.rst
> @@ -65,3 +65,11 @@ build system uses to build the package would be as follows::
>
>     project/build/tmp/work/qemux86-poky-linux/foo/1.3.0
>
> +Finally, if you make some changes to a recipe's unpacked source code,
> +you can force a re-compile of that recipe with the command::
> +
> +   $ bitbake -c compile -f recipe-name
> +
> +The ``-f`` option in the above forces that task to be re-run
> +(invalidating any existing stamp file).
> +

While explaining where to find the unpacked source is okay, taking it
further and providing a way to force-build it is not a good advice. If
someone needs to modify and build source like this, they should be
using 'devtool modify'.

Alex

