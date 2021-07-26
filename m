Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.3230.1627335569288701830
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 14:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WBjQoFu6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id l11-20020a7bcf0b0000b0290253545c2997so918015wmg.4
        for <docs@lists.yoctoproject.org>; Mon, 26 Jul 2021 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GCHaXKRV8lkqfajNxb6jJpGnLG8gfVYNlDvj1BuOF74=;
        b=WBjQoFu6G/iWeex3TGypvszbYxH3RDtUe3PYooWvu/nX2EDdBJBaXEPBY26lNersuy
         tM4Vj4Uk6QBRckK+INKCg3wqqIy0dDgOPUabngJDVOGWqrKPzv6S4hYe9aH+Jy4ihwdp
         p13cEth8u0RdMl4ttCZMj8Uyjw4zh2cinN/bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GCHaXKRV8lkqfajNxb6jJpGnLG8gfVYNlDvj1BuOF74=;
        b=hW9oXThlr0fZtatWc9rc86pfx9ZLEHN8DHtSZjFTP71oltM+Mgm1ULZdQ4Vaq4aiGQ
         ski5PAHGIxUtV5JFRVMfpUiEaAusF8oGC3am654l2vp56MnDZ4dXYqu5v/2mk9HeKch8
         hO7mM6a97k6EQGe4odTHy3bcnkrP7E3xNI00xo9tRQYyvBzE/04NzlJWzNbAVVJUuRDB
         PFkbEWRBOiNfEKt9r5e/oM0+WroZZe3yI9nwpTTbjubPbgw7bUSlNywtaCMSxS6557Fy
         ntnJJ8JRMgvCvQNN9OaWxnNLhPOCKbTXFwMLTesZsWhQcqNzP/rfObXsu/ITR6tjvZeR
         IBYw==
X-Gm-Message-State: AOAM530RTpZ9U6UDPvMqW3jt/IqGOLD2fppU8TiRRNqSDUZDto0nkOWy
	fiUwW+35x0MJIQtTBV3lXoE7dg==
X-Google-Smtp-Source: ABdhPJxPbv4T9QGcp0TzkZD9zeKjAAHNCXiGfXWLE5hJEXg5g2kfnWupv8u2PO3dcsIpKjIbXcdD3Q==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr900141wmj.88.1627335567880;
        Mon, 26 Jul 2021 14:39:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4? ([2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4])
        by smtp.gmail.com with ESMTPSA id w3sm949328wrt.55.2021.07.26.14.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 14:39:27 -0700 (PDT)
Message-ID: <abcf80a591582aac4438ce09ec1fa08a7b124117.camel@linuxfoundation.org>
Subject: Re: [docs] [bitbake-devel] [PATCH] doc: bitbake-user-manual: fix syntax in example and improve description
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org
Date: Mon, 26 Jul 2021 22:39:26 +0100
In-Reply-To: <80d7406b-0b12-feaf-7381-56c815062122@bootlin.com>
References: <20210722171021.69225-1-michael.opdenacker@bootlin.com>
	 <a7519c3f91a397c4e4259be88c0ccd76c3b2f037.camel@linuxfoundation.org>
	 <80d7406b-0b12-feaf-7381-56c815062122@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-23 at 10:35 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 7/23/21 12:14 AM, Richard Purdie wrote:
> > I should probably highlight there is a new command, "bitbake-getvar":
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=7bbeddeee1992d8c8fb71ba2dd49b03d0ae1ce86
> > 
> > We probably want to document that.
> 
> 
> Sure, this sounds like a very good idea indeed. I'll take care of that.

Thanks.

> > Whilst I'm thinking about it, the override discussions on the architecture list
> > are going to have implications for documentation too.
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=75fad23fc06c008a03414a1fc288a8614c6af9ca
> 
> 
> Of course! I was wondering when we are supposed to start updating the
> documentation. Probably right now, indeed, right?

I think we need to get final approval on what we're converting on the
openembedded-architecture list, then we can start.

> > An example of my scripted conversion run against the manuals is included
> > in this commit:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/diff/documentation/ref-manual/variables.rst?h=rpurdie/overrides-convert&id=9ac22a64a4c0ac4640552e90674e6459f0fece9a
> 
> Where can I find the script (or commands) that you used to modify the
> documentation?

It was done with a script in the same tree:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/overrides-convert&id=f7c5c3bbb9bc5d4c4c8f798d64a020a4504542df

Not pretty or efficient but does roughly what we need. I'm still working on it
with some build tests on master-next to see how close this is to working.

The main issue is the script doesn't spot some manual/docs specific example 
overrides.

Cheers,

Richard


