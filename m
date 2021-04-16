Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.10317.1618585660322354644
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 08:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VF8tHNli;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so7356247wma.1
        for <docs@lists.yoctoproject.org>; Fri, 16 Apr 2021 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bgIlbM3STLBx0Vk33xo0auG/3oF345a3M7HEH6ZFh7w=;
        b=VF8tHNliqOM6eWFhrI9NJNtOA4Z5dRUvxgWHy+JttNt+2pQlkodOKWlwL920nuBB1P
         HXrg9cV9oVXCS+rdntnlMdIz8TXp+De7HGIXXeMOxqwAjjfHI3FDq+bbDHomsWC6v5qt
         5hXBIU3JzaNBeg/hUwwY2oGLBrfp97RdnXXSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bgIlbM3STLBx0Vk33xo0auG/3oF345a3M7HEH6ZFh7w=;
        b=rLRbM9RTU0Ov+PjeCwJS5o/AkZtkZXDPZxMhEtWqrKf+m4uZ6NJky3Gv0hq4Ps8gl6
         k10KTkqvPfg6MKtuzNQ5aCT8sZ+xywGshuoSGNPzbFhWv9PPWaKjQwX2csDIG1Ly1s/I
         LSmgRg2h4SI2uuwunFRw7BjTnCUF0zMYLnQVpOExvDwC3FJsbCo+dD4+H1nWKOvbVvMC
         K5HVz8AJIbnjnLpH6txqFMA5facLAMHgyaLx+RlVT5D77ZM7OssrNVVK/L3yxcVnYHQd
         RHwOuof+mPTzJj9s8nonv4If/nBhqQS/xLCi6LJ0jg7pCAutZqBLsR+Y3GtfsJgIiKhy
         lBXA==
X-Gm-Message-State: AOAM532hKx1vh4ibMdShSuliGuZiYUkRHaCcyhvJN4UEmJDKS5eAo2c4
	+t5lN3RlzkdmjeuhlG60N7eFBQ==
X-Google-Smtp-Source: ABdhPJy7sVHUM1ReXU8gTrrxsJrEmOcVGe4Ik/MX06+syr+FamXYN9ioVLw4BFw2xJRimJTE/LDQEQ==
X-Received: by 2002:a1c:a7c8:: with SMTP id q191mr8828447wme.6.1618585658716;
        Fri, 16 Apr 2021 08:07:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6910:66c9:6ed2:e889? ([2001:8b0:aba:5f3c:6910:66c9:6ed2:e889])
        by smtp.gmail.com with ESMTPSA id u3sm9905275wmg.48.2021.04.16.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 08:07:38 -0700 (PDT)
Message-ID: <3970459b469af69e0c0bc509db60bf2d0890e7c4.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Janne Kiiskila <Janne.Kiiskila@pelion.com>, Michael Opdenacker
 <michael.opdenacker@bootlin.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Date: Fri, 16 Apr 2021 16:07:35 +0100
In-Reply-To: <DBAPR08MB55582E0BF19959FA9724ED35F34E9@DBAPR08MB5558.eurprd08.prod.outlook.com>
References: 
	<DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
	 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
	 <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
	 <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
	 <874e8b4d36e7febe5198c7ce04d692633c699aea.camel@linuxfoundation.org>
	 <DBAPR08MB55582E0BF19959FA9724ED35F34E9@DBAPR08MB5558.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-04-14 at 08:24 +0000, Janne Kiiskila wrote:
> Hei,
> 
> From my point of view - I spent several weeks last week debugging this issue 
> and tried to look it up from this spot in the docs. I think you all have good 
> intentions here and that's all fine and admirable.
> 
> However, if you do not have a clear intent to quickly do any of the below 
> mentioned documents (and it seems we are missing a tool as well) - then you're 
> just stalling.
> 
> We can put this in and help a few miserable persons in their painful road with 
> Yocto NOW, rather than ... sometime in the uncertain future.
> 
> If we find the persons to do the wonderful desired state, then it's easy enough 
> to remove this commit later on and add that "General debugging tips" section 
> that uses that new tool later.
> 
> But, that's just my 25 cents.

Adding that information to a single variable would mean that anyone else with a 
similar problem but with a different variable wouldn't be helped. I therefore 
think weeither document this somewhere generically or we don't do it. Taken
to an extreme, we wouldn't add that command to every variable in the glossary
as that wouldn't make sense.

With regard to the tool, I found the open bug for it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10748

and since I was messing with tinfoil anyway on something unrelated, I've just 
added a bit of tinfoil script that shows how we'd implement it to the bug.

It needs a fix to the tinfoil data API:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=42c6c93f934b37345411a579592d2c305f9f4e3b

which is pretty horrific as a patch. Hopefully this is at least progress...

Cheers,

Richard

