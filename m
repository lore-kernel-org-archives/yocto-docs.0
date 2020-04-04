Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.8349.1586040869102411773
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2020 15:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NSJB/wtd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id c195so4941178wme.1
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2020 15:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=K8g2sEAwx6lPlew8H7tHRgVwFly9ctXCi4RSvRfw8xw=;
        b=NSJB/wtdPGqdo7rCCm+pHrv/UdsPyGgkb+U/jk1SD/g1IWGC3TrhhEcqM6K5hnibZi
         YkMPiwzg1BgjTgSNsi6BYUfWUIH4nENFVHsYVJZHwdbDfQ2v+0mfpt9FFELInEspv+ZX
         D3jht09bSqq2mP050jxHe1KvpFUXe9D1vD0bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=K8g2sEAwx6lPlew8H7tHRgVwFly9ctXCi4RSvRfw8xw=;
        b=hqlSm9gp8GPsH8DPo3Nw0TfeqZSsHQ1GxYcWpe+gphaRyC8WFB1ydyll7QUZ/vjqkS
         ciSagvo2zqiy8d3FcMdGVx2Qi2t828n2EEplFeqYu1NnZCvLdwT9c+JsqBa2nWa8vTz9
         UW4GKLVvLMiQvL+YjoYPaCWJ4ySr3jvve3l43A+OmCChg0a4tpa2srqQfZIjJFp/NV/Q
         IMPPwwfoiD3Yqn43K+0iEPcPEAFrarB/Fh/zpK3buymFuJZXGsAY/OCzBrsdOdgwWaYW
         e8/7EYznOPqowmVOaaDOtXJpBpVm13btsKRAo5S5YhXPfDZPe4KyV9c/q78KwuJFM2Iy
         czmg==
X-Gm-Message-State: AGi0PuboTitZCXGohf0e4ffcCc2zW9B6CBcS4FlVLvugNlS6cFNlyBya
	AjcDbwIOwC+oUFHcUu16t6RmF4/+UWc=
X-Google-Smtp-Source: APiQypLlGDioFtRhxalOKQLvG76L0fKNrpfNItHhR4sbIun7l9zqK76myu5+tG80hGKAYwGGI5j1qg==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr6426586wmc.103.1586040867276;
        Sat, 04 Apr 2020 15:54:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t11sm18298176wru.69.2020.04.04.15.54.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:54:26 -0700 (PDT)
Message-ID: <2d64ea650e5737a1e7703e553c66b1b6aa4c1f22.camel@linuxfoundation.org>
Subject: Re: [docs] worth moving ref manual migration stuff to its own manual?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Sat, 04 Apr 2020 23:54:25 +0100
In-Reply-To: <alpine.LFD.2.21.2004040748030.11170@localhost.localdomain>
References: <alpine.LFD.2.21.2004040748030.11170@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-04 at 07:49 -0400, rpjday@crashcourse.ca wrote:
>   a good chunk of the YP ref manual is just the migration content --
> would it be cleaner to just give all that migration stuff its own
> manual and make the ref manual noticeably shorter?

Yes, but post release?

Cheers,

Richard

