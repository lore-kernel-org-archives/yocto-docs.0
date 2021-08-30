Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.16015.1630326024256797621
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 05:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O6pQDBBV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i6so22202588wrv.2
        for <docs@lists.yoctoproject.org>; Mon, 30 Aug 2021 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T2XYiw79qyhYPvKMjs6ZyI4cxscQUE1U58NCTB5qHZI=;
        b=O6pQDBBVBdFLZjJNrCueO9A8nUBa3SSh0FXDO1415rn+bgwwvbraLfnC2UDYKjPKc/
         +rEQtDqJAoit8kvypOrWliKz5Wv/8rK5iywkCodkpcOhgpqKS98MXhF680ETe2R3HJWZ
         mYWI41RrwqkD5xZhnM4lmjKf4eVVJ1PLNjP/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T2XYiw79qyhYPvKMjs6ZyI4cxscQUE1U58NCTB5qHZI=;
        b=Yol4AdB8egSfCxSwHs+rSJKlSjm/+WrYCd9P9hzb8riyVKylbvNQc4Smbh9W5aHClv
         0nQEkoZA27PQIhg51ZcTM2XLscv4ML1SRmn4koz25BsegG7k/z1BkbIkcuCPkrw5bFza
         5zT4eYvo0fNZ1daMZuW0TD5AqQ/zNk7QVLXoidJMVu+lf1aTzIRY6xf8Rj+5sMOczQnz
         PGVo2pRcnO26uPnMJZwcjQTSzMPEKC/yJBc01VW+IKxAa8Rfl6O7eLvmUMZu/Uc59c+a
         cbNVp8w4xuPG5pIUnJ2fSuDqpKp8wnduwa1c8sViYODQzHasACZTeC6SZieHzABuyjQt
         Ik5Q==
X-Gm-Message-State: AOAM532sxeXVZfzpWg8gqOgXEblOtWajXCsoXaOD7ZqH7Mrc+tcUr8Q3
	2xpgXdGsUBjzPVbUnFHJ/UMATw==
X-Google-Smtp-Source: ABdhPJyf73rnTmKBuNYVqnEcW3cF4Rpt3izLDvq3+E6W+YYcd3JVdepPEnhDbUFzrwNuFfKFQNA9YQ==
X-Received: by 2002:a5d:6cca:: with SMTP id c10mr6577301wrc.224.1630326022597;
        Mon, 30 Aug 2021 05:20:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e915:30dd:edf1:5013? ([2001:8b0:aba:5f3c:e915:30dd:edf1:5013])
        by smtp.gmail.com with ESMTPSA id k17sm21105146wmj.0.2021.08.30.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:20:22 -0700 (PDT)
Message-ID: <0af509d5adc926ade1439a011d03e26687773e74.camel@linuxfoundation.org>
Subject: Re: [docs] virtual providers don't apply to runtime dependencies?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 30 Aug 2021 13:20:20 +0100
In-Reply-To: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
References: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-30 at 04:44 -0400, Robert P. J. Day wrote:
>   in this section:
> 
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-virtual-providers
> 
> one reads the note:
> 
> "Virtual providers only apply to build time dependencies specified
> with PROVIDES and DEPENDS. They do not apply to runtime dependencies
> specified with RPROVIDES and RDEPENDS."
> 
>   except in current oe-core, there seem to be a couple examples of
> that:
> 
> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/systemd-bootconf"
> 
> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/grub-bootconf"
> 
>   am i misreadimg something?

No, the above lines are incorrect and should be fixed. A bug or something to
track that would be good.

Cheers,

Richard

