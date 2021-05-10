Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.29034.1620637045951046379
 for <docs@lists.yoctoproject.org>;
 Mon, 10 May 2021 01:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPQBynUT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d11so15725799wrw.8
        for <docs@lists.yoctoproject.org>; Mon, 10 May 2021 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j7hFcGbUO+4j4eA9YTEWfXFc5I9CmQQd//dtpONOEHE=;
        b=SPQBynUTptsj0IzP4FTm5RcxCuhnUalH9Qdb0mmgBsyIce4vt6CFsI+iX4WxK1Lsny
         UZClPTooCvJK27GLoR+H03KT3uKkAKG8fO4OYIDsedmol5EjF7msmMGLNkGB77KLhswe
         2KOQQDarzqLCvE230AE3XGAKIhCSqVC5Ae/T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j7hFcGbUO+4j4eA9YTEWfXFc5I9CmQQd//dtpONOEHE=;
        b=APeVqfpdWN7pXNu+ILvSZxpQvTW2mhCQApwRCeXyTo/vT8PB9PRjjLO9BKFHwg6bTY
         mLk7FyKkHjz/BeJRjfUyGOOEcWdtpIkrViYh4GStf62ec6PQGq9UdNbN6pvJaaHlMe5s
         aZPPWVils4XtYpc26M3PG4Hcth6/qeWTMejCUb/mcCQO7fMNP17RdCNaSh7K215EKWVa
         DjVwmMJYuF+bp5wR6fqoi6OMoge0b/4jpVrdI9BY8BXFpEJPEpCcfeQk2rzDGrfAgv7k
         n+lyXiGXPhdXs2IZiY1KZVQZNBFAzPcdy/5SRKhBO4M3BQPrWYWc4YL9HDsPuC3Ij9RJ
         U76w==
X-Gm-Message-State: AOAM530TZRSGSP5ZQQRjuf4HuFWkCZ3uaw6+iCCQkQGy4ULgB8uBJNh3
	d6/x03ciNCmRYCM8g+QrTsl5xQ==
X-Google-Smtp-Source: ABdhPJwBrAmGf4myIfRJxmXzkb9W/KViTsUs49NeFKL0nASfECSi7SowNAvb89TvHWVlf79EEhwEmQ==
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr29625979wrz.118.1620637044377;
        Mon, 10 May 2021 01:57:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id i13sm21319672wrs.12.2021.05.10.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:57:24 -0700 (PDT)
Message-ID: <85d045f13f7da6828ff86dc163a47ab36c0afaf0.camel@linuxfoundation.org>
Subject: Re: [docs] Questions about runqemu --help, misleading usage string?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Cc: alistair.francis@wdc.com, liezhi.yang@windriver.com
Date: Mon, 10 May 2021 09:57:22 +0100
In-Reply-To: <1ec33849-e45e-4202-7a1d-97968d2a0532@bootlin.com>
References: <1ec33849-e45e-4202-7a1d-97968d2a0532@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-06 at 17:10 +0200, Michael Opdenacker wrote:
> Following some experiments with the runqemu command, I'm trying to
> update its documentation in the development manual, which looks
> significantly out of date. However, reading the code, I think that the
> usage string is misleading...
> 
> Here's the current usage:
> 
>    Usage: you can run this script with any valid combination
>    of the following environment variables (in any order):
>      KERNEL - the kernel image file to use
>      BIOS - the bios image file to use
>      ROOTFS - the rootfs image file or nfsroot directory to use
>      DEVICE_TREE - the device tree blob to use
>      MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
>      Simplified QEMU command-line options can be passed with:
>        nographic - disable video console
>        ....
> 
> I understand that MACHINE can be recognized because of unique valid
> strings corresponding to it (such as "qemuarm64"), KERNEL because its
> filename and extension can be recognized, ROOTFS because it is a file
> with a known extension or is a directory. I also checked that MACHINE,
> KERNEL and ROOTFS can be set as environment variables.
> 
> But what about BIOS and DEVICE_TREE? It only seems to be possible to
> pass them as environment variables.
> 
> If so, then the usage string is very confusing, because it gives the
> impression that BIOS and DEVICE_TREE are at the same level as KERNEL,
> ROOTFS and MACHINE, but unlike the latter, they cannot be passed as
> command line arguments.
> 
> Shouldn't we modify "runqemu --help" so that it lists supported
> environment variables and details that only KERNEL, ROOTFS and MACHINE
> can be set by parsing the command line?

I suspect you're right and we should fix the help output...

Cheers,

Richard

