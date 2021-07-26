Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.3183.1627335335661904476
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 14:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OeZgSLU+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g15so12738005wrd.3
        for <docs@lists.yoctoproject.org>; Mon, 26 Jul 2021 14:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=H56rpvEfMRsMLwI705/jfua6dmTlL1QoIVle+jvH6QY=;
        b=OeZgSLU+J8RNeq2zY6UoMDvgYzMK+yC8ERrxouIiRLwtd0vp6NdYvDUMRp1/4BAmm/
         A757lhIBTbobHCHfXLY9U2uHqrbrvHrDkx6mYN6o/wpv1QDoTRZQ3Mscm6nV58f7eXdq
         m6a3w0ck9W6Yj+NEwJnB7hlvuEKqXUehurNhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=H56rpvEfMRsMLwI705/jfua6dmTlL1QoIVle+jvH6QY=;
        b=FJNHQyUsjc0qSsT4Gr8EAa/93KvZ/zA8gZ/h8SjhNsES9SoZ7e6e6/ge5vY55ELmsl
         KdbV01cLJ8D6mNn/bECMQxIcp6YvwCkYyo2OkQFzBXQaOXi/441F4OcGUjv1cH3sRHNr
         skqPo1utAPbYzRf9S/ojJ7+g39Rmm2Wp7FFSzyraglt3Gl+tobf+xby9kol9iTIt3E8g
         wIB0FAn1tAZhHvr5QRucC1BeP3Stc2TZlrrmnyYeweAtfC+kLuKGCbkk1ZgVE+X4Y5ko
         CoEqiiVqJmjC46/UABfK5CYyjL0sV2yvzd14vhXG9oxhOpxK4MTdHPfPZXxFnTQDfaZJ
         QQFQ==
X-Gm-Message-State: AOAM532vrbyh/gMSDeDwLf10an4U54zNH3r6UsEMUUu1xIFL7J/lRLZA
	cmi/S/mG05loxKcfPaCI67IPkQ==
X-Google-Smtp-Source: ABdhPJxX9QFSfcam31dJcx0xYtXXIZaeJnUjz9t0080tt0SB2wCnfPnmUnXs63G3/KQDUUhXCEaRbQ==
X-Received: by 2002:a05:6000:1248:: with SMTP id j8mr21143524wrx.391.1627335334156;
        Mon, 26 Jul 2021 14:35:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4? ([2001:8b0:aba:5f3c:8722:e8c0:4ebc:1cd4])
        by smtp.gmail.com with ESMTPSA id y3sm948648wrh.16.2021.07.26.14.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 14:35:33 -0700 (PDT)
Message-ID: <25b786aeddbabd5bbe979d1559d30ba4ec8b5d05.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] doc: Makefile: turn warnings into errors by default
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>, BitBake
	developer list <bitbake-devel@lists.openembedded.org>
Date: Mon, 26 Jul 2021 22:35:32 +0100
In-Reply-To: <a0ddc662-dddc-dba4-d4e0-bbf94d8c9f9f@bootlin.com>
References: <20210726153446.2503018-1-quentin.schulz@theobroma-systems.com>
	 <a0ddc662-dddc-dba4-d4e0-bbf94d8c9f9f@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-07-26 at 18:55 +0200, Michael Opdenacker wrote:
> Hello Quentin,
> 
> Thank you for the new *BitBake* documentation patch. I CC the
> bitbake-devel mailing list.
> 
> On 7/26/21 5:34 PM, Quentin Schulz wrote:
> > -W is for turning warnings into errors, --keep-going to make sure the
> > whole documentation is built and all warnings will be printed before
> > failing.
> > 
> > Since there's currently no warning, it's time to introduce it!
> > 
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > 
> >  BUILDDIR      = _build
[...]

> 
> Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Richard, can you merge this patch as it was sent to the [docs] mailing list?
> Thanks in advance,

Merged, thanks.

Richard

