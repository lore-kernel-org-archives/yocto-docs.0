Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.455.1623085394337503387
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 10:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WZy6Sz1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id o3so54009wri.8
        for <docs@lists.yoctoproject.org>; Mon, 07 Jun 2021 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JTPk/e09pwmmrxIpk17ZaL8tLL9IADb99SyqjaEHbQY=;
        b=WZy6Sz1JzifS4WWry68DB+MukPMNC+o2Aem326DkeNguI7XJvYs0DdlRiruA3SnRPy
         PF3tE4Mt32vxVpMS/KkiznWGuRWpZCyTybUSirkSS4ro7C4ouD/smVjlg3O+5q8fdGns
         6DpCwc5SXfgX2WC2Rz+M/iUev7BAOM6NQYFy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JTPk/e09pwmmrxIpk17ZaL8tLL9IADb99SyqjaEHbQY=;
        b=S6oyB+a/5FgFZThsgZCcq19bhFWM5oEQtvAQ9Z5sy/qwS+dQnKL6FtRXinsdi8qAxL
         4jWarp0vx9fgmeZAjnD+UYq4OOIeLB5fWa/NVcfrs7z7/CN/U8kI+95SSkpo2NA6PCnt
         RaWWA1RNn3oQQaoZierMRBYgWxOO1lyRZC9kR14HWXSa0Vj343aWofESFlFnblLG7LdH
         dUClBjUEIZREZapkaPDH9JO1Cg8mNw8+rEkiWyk9fN6sKHGJ0tAt0jme9aGI1rzXW8mG
         OBAuD49SjuJlN1fWa+1RUjJaOp8YW9BQd5IWhDNht62oaE456awZ7YnIbKPfvDq7vJFq
         OdNA==
X-Gm-Message-State: AOAM531fuRb1CcWRUmZJDjIFpIsO7CSR8q6A61lQH10PQSVu7amVlBKV
	DI/5uZw9E8ZbHBEC8hmFdBwHEaqCatwbcQ==
X-Google-Smtp-Source: ABdhPJwbE8lFvPHTMhVvQGj07re+NTtaIbXGmOt6+JYiRnaynp9ISQXBFA0vANeyzSdePt9uQRk3XQ==
X-Received: by 2002:adf:ea49:: with SMTP id j9mr15457002wrn.366.1623085392562;
        Mon, 07 Jun 2021 10:03:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27? ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27])
        by smtp.gmail.com with ESMTPSA id f13sm16632897wrt.86.2021.06.07.10.03.12
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:03:12 -0700 (PDT)
Message-ID: <56b2b0aa26a20d6e06c1d594feb143b8cfe44c96.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] test-manual: Add initial reproducibile builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Mon, 07 Jun 2021 18:03:11 +0100
In-Reply-To: <16865B5B6683D232.21761@lists.yoctoproject.org>
References: <16865B5B6683D232.21761@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-07 at 17:59 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/test-manual/index.rst           |  1 +
>  .../test-manual/reproducible-builds.rst       | 60 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 documentation/test-manual/reproducible-builds.rst
> 
> diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
> index e2198c4c3..d122b5e27 100644
> --- a/documentation/test-manual/index.rst
> +++ b/documentation/test-manual/index.rst
> @@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
>     intro
>     test-process
>     understand-autobuilder
> +   reproducible-builds
>     history

As background, I've had this sitting around half finished for a while. I've
had a push to at least get the minimal content in and wanted to get something 
out which we can improve upon from here. I know some variables aren't quite 
right syntax wise and so on but I'm hoping Michael or someone else might be
able to help from here?

Cheers,

Richard

