Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7914.1610452606834079817
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Seo4ylmZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g25so1611651wmh.1
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=alVZsfk4QHeNxGG3AWQbxOwR0WxQK4y0zKIcn/jJ3To=;
        b=Seo4ylmZ6ja6JbGBW1iyTJB9tSK8/RtCE3xuc30JCCgN1w14vcWVdLs0Vmkj/88tYE
         kNxqGIVRTFDAHhe/xXM4wKg9X9kQFRbCnmK4TnId0hwZCc6iY04vfOqUtMv2X4mpZDs6
         ggGWPBLz3QGIPiBX9KhL95z/MI5tmQPYQh0nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=alVZsfk4QHeNxGG3AWQbxOwR0WxQK4y0zKIcn/jJ3To=;
        b=YLDeHocdR8LnwUG9pT3YO9csYVJkFCOgF3oj9eBm5oSjqDONRHC75iJjCiVVHMWYvW
         uLhZObfu88a9qn5qFeHc4ZU7D43D3nlkCSCkof0INZzabCrpDP1anjdpeg6ew0z/uOZR
         dvQPAsYhNfn0Mk8IBCIwWJVoth2kJD+o0NM3xwmq5zFsY4k+9z9ttzrKtC6Gb63YrcO8
         gwHd8JVobvdZEJJUMvL7hsTO6nl8yulfyJPyljXlm2qlKkXdGfPJIrmSJqUf87QPdFrP
         rTHrfwzNykSUfRbgyi74HL3KnEU4w5NAnXrIxwtdu2OIIgxQlfwPyBe3/JlYFm3JLCY5
         sTOw==
X-Gm-Message-State: AOAM532chtgUfWZEnI4xJlbiB74vc+aKUqY0n77kEeGDIZY/sWA+rBv2
	/NI5lpdTQGney58QNPL85qr0lw==
X-Google-Smtp-Source: ABdhPJzS1ZO2lGUXNyK+h8hClmIiaUNhgU1glHDuiQy5JcdbW9PJzzaFwJCVOwJSd6SqQwSPHQZooQ==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr3207462wmc.40.1610452605187;
        Tue, 12 Jan 2021 03:56:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id g184sm3900952wma.16.2021.01.12.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 03:56:44 -0800 (PST)
Message-ID: <3eb6f61ff31061ffd357a8d592710144b29ecbc7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Leon Anavi <leon.anavi@konsulko.com>, Quentin Schulz
	 <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 12 Jan 2021 11:56:42 +0000
In-Reply-To: <a1d67e85-fa8b-dfd9-2bf0-b5efe9eca5de@konsulko.com>
References: <20210111191655.23792-1-leon.anavi@konsulko.com>
	 <20210112091623.4puwnclbtw4nixno@qschulz>
	 <a1d67e85-fa8b-dfd9-2bf0-b5efe9eca5de@konsulko.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 13:50 +0200, Leon Anavi wrote:
> Hi Quentin,
> 
> On 12.01.21 г. 11:16 ч., Quentin Schulz wrote:
> > instead?
> > 
> > Might even want to pass CFLAGS to the line too.
> I've just followed the exact recommendation for resolving this 
> particular issue in Yocto Project Manual as it is described in "24.10.8. 
> Default Linker Hash Style Changed".
> 
> At the end of the day it is just a simple hello world example and there 
> are different ways to fix it. According to me it will be a nice bonus to 
> apply in it the knowledge from chapter 24.10.8.

Adding LDFLAGS is definltey the better way to fix this, we should be
encouraging people to use LDFLAGS in makefiles and scripts.

I suspect 24.10.8 might be better saying that LDFLAGS is the preferred
fix, failing that the CC tweak is a second option.

Cheers,

Richard

