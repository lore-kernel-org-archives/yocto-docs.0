Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.6055.1608708250605613240
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 23:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xEXxe74W;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id r3so17600802wrt.2
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 23:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=HJP8AFSlMvpjsbrjCnJNMUp48WV6CRgSxIPFp1Zy+lc=;
        b=xEXxe74WpAF3FJ7DyY8NOKFMR1AscIwuQwiUNxwhUwh+W8EMp6QyxcfWqPENA0UZiK
         oJlxmF6LQxYdLHODx8Ku+RpcX9An02BYP4zeEE+jiSnv9RWxdnu6LvLwxXz7Whv6MuFE
         +SFGpX3Gz1syX+nDRkgm1zyKdKa3D6fY4+TsapNfbfOwYARfitKhZxccIy3vZu1CWrFj
         mN1WVQ1CXHIzAEYHjNiIKKC77gM+oo6zHDalGDD1Z2ZMoyhxnrupE/dpbLjvdURn8eA1
         JfmHz/x8ZSajjCVfGakkWGDtWFbZysvO2nNpOKi6nK9dWkK+x6C/18nbG5g94Cqj19n5
         im2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HJP8AFSlMvpjsbrjCnJNMUp48WV6CRgSxIPFp1Zy+lc=;
        b=BGhoeGJACDXlC6gaM8KmLnDUC5+7uITRCCnm7vbXcQjesiY1AZNR48+sztC0znphyv
         CE95kW7FSjvJMW7t97x4TQJk8X/dJpTs5wrwKhKggN9HqZiKJOR9GovdozYmeIaZ9Zmi
         9eolHFTNY5G6gFXNcvt2A6Xnh8IUKzXAd7U7zAubaoKg2Qv/FwETW+mHcoMmWnRRdbwH
         iQO03IXRg8/eg/CiJ7MvBuFHJHf0XOkp0T7JHJmzEoQclexkG/Mymx+rK4cZnVs4q0I1
         BrRY4Tcv1JjkKosICVpCzxVhS3m5MUm0oywsgy/86SK4IxjJSPDGPD8DQJuxmZAuP+hf
         kdsg==
X-Gm-Message-State: AOAM5313n1wmgmjnXv4fHXcAz3GNJcg/EYNMrpI6DGdTEqvKDeZdsXxC
	deDuWZQoAi2EvETqLww98CK6Fil8rNfwYA==
X-Google-Smtp-Source: ABdhPJxq9oC3Gp+Gvg8EsMfU4dR2tWBHQnP0YRsk5qkaH40BlnxfK8Ne0/qlB76//5j8EWOxcb2G8g==
X-Received: by 2002:adf:8143:: with SMTP id 61mr27346627wrm.318.1608708248688;
        Tue, 22 Dec 2020 23:24:08 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3? ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id i11sm11100004wmq.10.2020.12.22.23.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 23:24:08 -0800 (PST)
Subject: Re: [docs] [PATCH v3 0/6] Tidy up links in documentation
To: Paul Barker <pbarker@konsulko.com>, docs@lists.yoctoproject.org
References: <20201222153032.6909-1-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <25c14688-56d9-1f3c-6469-5d6517827cec@linaro.org>
Date: Wed, 23 Dec 2020 08:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222153032.6909-1-pbarker@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/22/20 4:30 PM, Paul Barker wrote:
> Changes since v2:
>    * Fixed usage of :oe_layerindex: and :oe_layer:
> 
>    * Dropped trailing slash from :oe_layer: links now the web server redirects
>      as appropriate.
> 
> Changes since v1:
>    * Addess feedback from Quentin Schulz, many thanks for the review.
> 
> Paul Barker (6):
>    documentation: Simplify oe_wiki and oe_home links
>    documentation: Simplify layerindex and layer links
>    documentation: Simplify remaining yocto_home links
>    profile-manual: Simplify yocto_bugs link
>    ref-manual: Simplify oe_lists link
>    documentation: Use https links where possible

For the whole series:
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

I noticed they are all in master-next, so RP, as far as I am concerned, 
it's ready to merge.

thanks Paul B. ( and Paul E. for the other series, also in -next).

> 
>   documentation/README                          |  8 +--
>   documentation/boilerplate.rst                 |  2 +-
>   documentation/brief-yoctoprojectqs/index.rst  |  2 +-
>   documentation/bsp-guide/bsp.rst               |  4 +-
>   documentation/conf.py                         |  5 +-
>   documentation/dev-manual/common-tasks.rst     | 17 +++----
>   documentation/kernel-dev/intro.rst            |  3 +-
>   documentation/overview-manual/concepts.rst    | 28 +++++------
>   .../development-environment.rst               | 22 ++++-----
>   documentation/overview-manual/yp-intro.rst    | 13 ++---
>   documentation/profile-manual/usage.rst        | 49 +++++++++----------
>   documentation/ref-manual/classes.rst          |  4 +-
>   documentation/ref-manual/faq.rst              |  6 +--
>   documentation/ref-manual/images.rst           |  4 +-
>   documentation/ref-manual/kickstart.rst        |  4 +-
>   documentation/ref-manual/migration-2.1.rst    |  2 +-
>   documentation/ref-manual/migration-2.2.rst    |  4 +-
>   documentation/ref-manual/migration-2.3.rst    |  4 +-
>   documentation/ref-manual/migration-2.7.rst    |  2 +-
>   documentation/ref-manual/qa-checks.rst        |  2 +-
>   documentation/ref-manual/resources.rst        |  7 ++-
>   documentation/ref-manual/variables.rst        | 20 ++++----
>   documentation/sdk-manual/intro.rst            |  2 +-
>   documentation/toaster-manual/intro.rst        |  2 +-
>   documentation/toaster-manual/reference.rst    |  8 +--
>   .../toaster-manual/setup-and-use.rst          | 11 ++---
>   .../transitioning-to-a-custom-environment.rst |  4 +-
>   documentation/what-i-wish-id-known.rst        | 11 ++---
>   28 files changed, 119 insertions(+), 131 deletions(-)
> 
> 
> 
> 
> 

