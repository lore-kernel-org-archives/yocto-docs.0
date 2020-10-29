Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.2772.1604000924160418986
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 12:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DUXwixoP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id n18so4073112wrs.5
        for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2020 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+Ya/KsFEzbdd17s6AR+VD4RMPJQiv7NlR5L+5vpNZOY=;
        b=DUXwixoP8kP5up9SCd4vKBAudftc+Cb0RPDXg6aQ2rfxkx7U9u2JQuzmxW6ndXj77w
         C+8LoByBObm4PFgCDbZ9jnA7opCcCYqxGgNbM3X/pB7IKnMWN+ZLYAfV23pJLXj/7+vC
         KHQn45fOcK1DUoYCig6iQnuRguRNzHK9GJGqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+Ya/KsFEzbdd17s6AR+VD4RMPJQiv7NlR5L+5vpNZOY=;
        b=AFcbJN7TGKfcbj0ynlPdXD/H9tYPtG2PYzzdAP1nBuedZpE62sFt311F3W6G9umBZI
         D3trvpD86WbJuC4fvmu5S3mCx8jhn+iE0C6o59REbr0xirzoz/Mcgq1ENaJb11On11uh
         dfYv+IC5chciBE/WtJuairp++VwBFFSKU7Hu4iZIubxHW2FMRkVvQEYnSlHQ4C9thlV0
         puUVMFf250BnC2ZxvLi27BA6vKLRpOI1lQxCA+F0g2IgiIFdKij0qnLDBXgTEY9PPi2D
         PVxJLana/MqI9R6bOLyB9y+2pm3WoVO/pvZepKu30R3bmFWM2PNqRnV2hLqDf3kehoJ8
         Sa8w==
X-Gm-Message-State: AOAM532/j7nYggN/c+XzNVE0jDD4nM8Z9ZD1/NPw7fPfkf7zERTyUlop
	DwEX+WLZn3CXF19vAMF/5p7orw==
X-Google-Smtp-Source: ABdhPJw1D4ORNQn+CKok9FBRon383Mm5qn7/9Nr8JEfHhsM4/c7EAt1ShwW90v9SHA3eODlhitOqCQ==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr5481178wrj.47.1604000922581;
        Thu, 29 Oct 2020 12:48:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id e25sm7767780wrc.76.2020.10.29.12.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:48:42 -0700 (PDT)
Message-ID: <a67d25bba25b927bc6c30b15a269d3120cee5972.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] "PACKAGE_FEEDS_ARCHS" -> "PACKAGE_FEED_ARCHS"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Thu, 29 Oct 2020 19:48:39 +0000
In-Reply-To: <b914f3c-e22c-b3c8-f3a9-ebf417f1f218@crashcourse.ca>
References: <b914f3c-e22c-b3c8-f3a9-ebf417f1f218@crashcourse.ca>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 15:30 -0400, Robert P. J. Day wrote:
> Fix single misspelling.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   let's see if i can even remember how to submit a patch.
> 
> diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
> index 0603ba93c..0a70363a6 100644
> --- a/documentation/ref-manual/ref-variables.rst
> +++ b/documentation/ref-manual/ref-variables.rst
> @@ -5104,7 +5104,7 @@ system and gives an overview of their function and contents.
> 
>        .. note::
> 
> -         You can use the ``PACKAGE_FEEDS_ARCHS``
> +         You can use the ``PACKAGE_FEED_ARCHS``
>           variable to whitelist specific package architectures. If you do
>           not need to whitelist specific architectures, which is a common
>           case, you can omit this variable. Omitting the variable results in
> 

I've queued this thanks. In future could you include a prefix to the
shortlog please? I added one to this patch when I queued it.

Cheers,

Richard

