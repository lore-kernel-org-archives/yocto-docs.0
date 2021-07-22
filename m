Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.5371.1626944347732985915
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 01:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gysmhLwT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 14-20020a05600c028eb0290228f19cb433so1120501wmk.0
        for <docs@lists.yoctoproject.org>; Thu, 22 Jul 2021 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KGtzgUdEliBIHT7OEmxfPCS1SXQ6oeXe8lV9yq1EmEo=;
        b=gysmhLwTs3QRNrqCwidAbRPlOQgLKsS/i5faO+miQjke2JthI6k3D9qQeg79O7wn54
         u5DiQs6RWXmZvTuHTl+yUflhZm85+Xz/1Dw7To18lzLQxGDNkVsQqhz1DtKkKskC0B/Y
         ajEv6G+DAlXf1hdARhYKZJTlD6IM//+VT3Yn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KGtzgUdEliBIHT7OEmxfPCS1SXQ6oeXe8lV9yq1EmEo=;
        b=eKMT/TDeYi/jBHioyFDXLMpEHk+MmiKgFrU6vJRHWnSZG68Wo5b3lrgx29c/7Kski6
         tF9zAf5qN043xRSEKYbSOvHriKisfpIJnkz51nbV0Oyb4nlNBVy8WYC0ow5Y7QLi7fYK
         pmyqZadmiyKqRCtAJQpe41oZTidp7RrlU9T1mSgFcuDbdhKxBRNTqmOJu2Sodq7DglcB
         YKCjhX/B9gD21wesLTxdHA9ihUmc0br7/KkYE8dXKgLNCT/LvBnaeO8MFmJCOitJDKHB
         WpoJrHnqfwCh/qXhErGSKnjB8kWQ8uqW4R0RCa6TPM7BHjCTBs/zTaN14zLuHMeeT8eV
         oWPg==
X-Gm-Message-State: AOAM532kW1T9FIuhdNzCFFuTubbjDGUJpvXPxtTIhdQVL6frAksp1cPO
	Aql5Ik2cuckQmOvqGMuB/X6XyA==
X-Google-Smtp-Source: ABdhPJxzQlcLqnnpX/zKWxU8NiHF7fRpItr6UH+11ofPjMuyeDCsOHlaTmJxZHdEUe0/QCV2yigTWQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr7926385wmf.176.1626944346160;
        Thu, 22 Jul 2021 01:59:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id c2sm29309233wrn.28.2021.07.22.01.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 01:59:05 -0700 (PDT)
Message-ID: <f6e86401ad6f2077133a7d989fc32c34547d24eb.camel@linuxfoundation.org>
Subject: Re: [docs] DEFAULT_PREFERENCE no longer used?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, BitBake developer
	list <bitbake-devel@lists.openembedded.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Thu, 22 Jul 2021 09:59:02 +0100
In-Reply-To: <53a7dab9-2c9c-ce0b-b363-543c33959e62@bootlin.com>
References: <53a7dab9-2c9c-ce0b-b363-543c33959e62@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-07-22 at 10:55 +0200, Michael Opdenacker wrote:
> Greetings,
> 
> Looking at the code, it seems that the DEFAULT_PREFERENCE variable is no
> longer in use. Unless I missed something, the variable is still read,
> but not taken into account any more, and there are just two recipes that
> set it.
> 
> The BitBake documentation still refers to it though.
> 
> May I propose documentation and code patches to remove it for good?

I think it is still used:

lib/bb/cache.py:        self.defaultpref = self.intvar('DEFAULT_PREFERENCE', metadata)
lib/bb/cache.py:        cachedata.pkg_dp[fn] = self.defaultpref
lib/bb/providers.py:        preference = dataCache.pkg_dp[f]
[in sortPriorities()]

Cheers,

Richard

