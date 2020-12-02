Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.1605.1606895273127662422
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 23:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JM+FOdJ/;
 spf=pass (domain: linaro.org, ip: 209.85.128.67, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f67.google.com with SMTP id e25so4751866wme.0
        for <docs@lists.yoctoproject.org>; Tue, 01 Dec 2020 23:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GgysNiQtOKBx1cxg9g4IC3zY8l7O3KXuznVJIFrfM7E=;
        b=JM+FOdJ/1hLZ7WDgFyu9/0V7J0n6pODH0wbj9/+dfJaGOfYEz1K7O73QsRwW+ge+q0
         4au870epxn0wdzL0KGJWM1yKWyThhhS9qQaG+DmzjW9UK22O9qKyESeX2wcmDBE7C517
         0qkFL2TFMWk/H0yBpSFEM0kuxd+cz04I6gnlQYL9gnMc20tbCZyGIN3wKldyQUw4kTje
         q3NqeRgdo2OoixuEzQ+9pgG02qWCaCyoHxbrz4or0LqDQjJKQyGBdvRNBwqpme1tPVM0
         bif3PVcMHd2RIP1F4/Sw9bV3/fuQ4y8WJkcXa1/wSHHsJR7OGaiLjBDJFO4qQglvgNer
         mvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GgysNiQtOKBx1cxg9g4IC3zY8l7O3KXuznVJIFrfM7E=;
        b=nqlEfmBUNlm3r0EKYzf1XIg6AZeDn4Xn5wS8WLEfNGuL7luxbiV36FtR+Rdl61uN+f
         DbblwrtwXJAUlOQt07VoYMNjkH/q8wluwKH9bbAhOF0tB0BqyPm0MEBTe9iMnQaTJL5B
         4gm+qqgabOBZc2Q+DbHusEP7olIGtvQTy1YHJ9AaisIUO2V7Mil+q+DvyaPo+Ny3q+w4
         6vUl/KB2XKL4U+rDIINOzzmA3qnygfZL0+o3LVdt9PsLqh+YVYee5TBZlT3XFB3OLS0P
         QLiMZoKfbQECc5AdxzCRuKwu5tC2oxeHjwgWmSWfmGcPfukwB0MTUSr+jlLXFhXp3uKp
         r9aA==
X-Gm-Message-State: AOAM532zUn1ZGuIDf/gL6jM3E8gYCiYt1Dvp/LZ5uproKTf+b+s5SLaO
	Huw6qqMTLkrmdtFdPR+aUt+ZMRBanB1vXbAa
X-Google-Smtp-Source: ABdhPJz1Me0+GK+59svpc2qiEdo+QXrXthVWwOoJJ32xQUGxN7xL1KqsxKoh+CX2ZNxwoOgA2vyKRQ==
X-Received: by 2002:a1c:2d84:: with SMTP id t126mr1640626wmt.132.1606895271358;
        Tue, 01 Dec 2020 23:47:51 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3? ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y18sm1027646wrr.67.2020.12.01.23.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 23:47:50 -0800 (PST)
Subject: Re: [docs] [PATCH] releases.rst: add gatesgarth to current releases
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20201202012158.19944-1-anuj.mittal@intel.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <8ec7e08d-e8cc-845b-772c-679e8d4c2e00@linaro.org>
Date: Wed, 2 Dec 2020 08:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201202012158.19944-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/2/20 2:21 AM, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>   documentation/releases.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 9992f97d5..dbdc173a0 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -4,6 +4,12 @@
>    Current Release Manuals
>   =========================
>   
> +*******************************
> +3.2 'gatesgarth' Release Series
> +*******************************
> +
> +- :yocto_docs:`3.2 Documentation </3.2>`
> +
>   ****************************
>   3.1 'dunfell' Release Series
>   ****************************
> 
> 
> 
> 
> 

