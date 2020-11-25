Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.5586.1606304530244220993
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 03:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VDgrjqkY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id h21so1859773wmb.2
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 03:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rdmT7caG9aqB90hcZ86ttTWYASuCuphn3d0OpKcF45w=;
        b=VDgrjqkYtuzQOnXoGHoDdtZSnAY+PNC5RipOTNV9UtTc33DyNh7o6B2jFhhBn/Dlav
         bpB36s6ZFieplBTGIfZqBfOQRc+W1dup/KMBMz1DXhbVR4TGUEgdiKK4kq0eC4VFpjaF
         +PshlBZ5BAZPgpAUTdk1XZ3uZqciOsKcpEXJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rdmT7caG9aqB90hcZ86ttTWYASuCuphn3d0OpKcF45w=;
        b=rIbM8EcgqfZ5G3TZ0Na0gzCNBEesvbfMwuXfsdnSiwL6P8BrHs5tAFYTHjGza+LecY
         Z4IvEh0TU7fjkCADfiHZ5YHJQi/n/yJPtm3NUdkvtLTi9k41m+0v4zAjLLKdjE+BtPaG
         58jkjktNJZdREMzsQz+d8HbDg8suTa8k7pG/Wkyfui/9ZkW4BQkxwBzL1njbcsA24ULZ
         IqAP3UHFeJEcUguxM+2l+KsWj/wSzoRsecanPsurGuN/UceUix0dx6gaq/IvVidG7H7q
         EiyOZmWVxeCZD7J3gcSMsamGUvAjzunTqyg7FV980fjmizGEcp0pIY4o23L9QonwUF2y
         HAfA==
X-Gm-Message-State: AOAM533AwQLdWHZrR6lfVS96mUNJTQJ+yCr2XjpkE71N5u7NdyG1qI7c
	mzaPFECmMHscQhIU7AXCQ3vtfQ==
X-Google-Smtp-Source: ABdhPJwmCR3XzM+6MCFG28KaJhdLQNpvrhoHjan2hNHPTDr0YXmv/VQbmC9r3UHeqejVqfjqfyw99A==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr3440043wma.105.1606304528774;
        Wed, 25 Nov 2020 03:42:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id h2sm4381709wme.45.2020.11.25.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 03:42:06 -0800 (PST)
Message-ID: <45c7be8601c53b826dcd2eff4188e95f86e5f996.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] {dev,kernel,sdk}-manual: replace hardcoded release version with &DISTRO;
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Date: Wed, 25 Nov 2020 11:42:00 +0000
In-Reply-To: <20201125110522.4dhp3xddwrbrckn3@qschulz>
References: <20201125091526.46021-1-nicolas.dechesne@linaro.org>
	 <20201125101647.jzde6uprwod3cvpd@qschulz>
	 <CAP71WjzvhNnYo5EP+QoN-NprZwyLOqA-cLQ1skkES2hsG53MhA@mail.gmail.com>
	 <20201125110522.4dhp3xddwrbrckn3@qschulz>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-25 at 12:05 +0100, Quentin Schulz wrote:
> It was more about the output of a yocto build, e.g. the SDK, does it
> have 3.2 in its name or 3.2.0?
> 
> I know we tag them with 3.2 only, just wondering if it's 3.2
> everywhere
> in code or if we can have a 3.2.0 somewhere for some reason.
> 
> Anyway, no biggie, if it's not exact (filename is different), it'll
> be
> so close to the actual thing you're doing (filename or whatever) that
> one can manage to fix it on their own. Links are important though and
> they use 3.2, so let's stick with 3.2.
> 
> Hope it's not too much non-sense :p
> 
> All good for me.

Its always 3.2, then 3.2.1 and the only other context for "3.2" is to
refer to the series.

I once tried X.Y.0 and I broke lots of things :) I was asked not to do
that again.

Cheers,

Richard

