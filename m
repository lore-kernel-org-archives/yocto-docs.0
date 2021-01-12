Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.7930.1610452221827366283
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Nsf2ah1V;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id v26so1934438eds.13
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ylPZufyTKXXrvC+pMp1ytN9Yw0w1tUBoyO68cgSmaik=;
        b=Nsf2ah1V/CqFTDbFhqmDNAHOB6+owhhePdbLRmvGziHMQNxlkfI/GKRhpzZr+3ETv1
         CSmsMx/ibTJ4vwqSYaJn8AvsP9Q3qjagvBxeIbYn9ciCU793WMY8d3GZli7VzT8oLuby
         Y1wsbk6wXRxFwaVhaZdOk8AcfYMbXT//UDr/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ylPZufyTKXXrvC+pMp1ytN9Yw0w1tUBoyO68cgSmaik=;
        b=pFQ5pZ1+EgHoCsMro7HRjWTNSrwizMQceCEMuVUodpdM51xBTvgv4+LYBOu/kGLoCJ
         EKx7YHZtsCrw9d26gmG67CbUgVf4QVKodUh4nKvZzCzm+hazkEgJsQ04Dp7n2LXMLYds
         dtWZ8/StGnPFqMcjOL2TqGcIXFNIp+lPz90V6lG919p6gjoqMjSPSW0y0U1WU1H7zIj2
         maTSQ0As3W5oX7218ftyB97QQxOI1YYijBpQAuLjO5W0fde95ABD/mWX4WJ9vuKkwyu2
         hTgqXW5EFag3SHuXeT2L5qfAL9k+cGLjwYfQLcm33H67Ns1xfPTvbenGGfldY8ixe1oP
         xUYQ==
X-Gm-Message-State: AOAM533wOqaC3pqWOH5I9y6lDXjjdNS6GU6VYIT/7eCv5xKotOzJY/Ap
	dQKRCChTNCRyO9NQmliOPmDp0I4klA5IIA==
X-Google-Smtp-Source: ABdhPJyEERF/GlOW0dHyRtPS2O8G4tJngZrxDXUM3i0TFuadU08NHR8bUbMdrnzWZii8qIu+0B7Itg==
X-Received: by 2002:a05:6402:100c:: with SMTP id c12mr3231245edu.356.1610452220054;
        Tue, 12 Jan 2021 03:50:20 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id m24sm1093665ejo.52.2021.01.12.03.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 03:50:19 -0800 (PST)
Subject: Re: [docs] [PATCH] common-tasks.rst: Fix GNU_HASH in hello.bb
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org
References: <20210111191655.23792-1-leon.anavi@konsulko.com>
 <20210112091623.4puwnclbtw4nixno@qschulz>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <a1d67e85-fa8b-dfd9-2bf0-b5efe9eca5de@konsulko.com>
Date: Tue, 12 Jan 2021 13:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112091623.4puwnclbtw4nixno@qschulz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Quentin,

On 12.01.21 г. 11:16 ч., Quentin Schulz wrote:
> instead?
>
> Might even want to pass CFLAGS to the line too.
I've just followed the exact recommendation for resolving this 
particular issue in Yocto Project Manual as it is described in "24.10.8. 
Default Linker Hash Style Changed".

At the end of the day it is just a simple hello world example and there 
are different ways to fix it. According to me it will be a nice bonus to 
apply in it the knowledge from chapter 24.10.8.

Best regards,
Leon

-- 
Leon Anavi
Software Engineer
konsulko.com

