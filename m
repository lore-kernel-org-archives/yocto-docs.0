Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.5089.1605355273963373668
 for <docs@lists.yoctoproject.org>;
 Sat, 14 Nov 2020 04:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XfcGP0rL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id w24so18270940wmi.0
        for <docs@lists.yoctoproject.org>; Sat, 14 Nov 2020 04:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=r7KXPWtlNVFML4+nMEBTKAmNVsCcAkPZwsvjL2O5esU=;
        b=XfcGP0rLPsCjuLu+sKgI4pLdSv8F6/xXwchnqg/ZaeIEOnB1D0JAwSs+N+9Tdbn4Qu
         +d90OCRluj/ighe8r//eaFMqvYCqqx5FztV2pVqWiRrsuFj0yVNA/Y47rLWZWTEwBWlj
         UDLkJGHm3Q5cxUubCfs2ZQO2+MUpWOq9/S1aDgDv5qLVX8SWpcfqMsGVLlJ/fxPcXoXb
         NcEzKj3UiLRzw/wuG3z8FG4UluJkgbjKUa3RFvP1p+tq8gG0iOzuljcbajA9KWyYS8Cs
         IcOusfBTi8hNf5QmZTdczgeTMrjY5vwkFAH8gKeeY+BRWlHc+w+GKa6IH++ApsVMHF04
         Ss2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r7KXPWtlNVFML4+nMEBTKAmNVsCcAkPZwsvjL2O5esU=;
        b=FzxJ7zVMtCNGLXNMC7gKZplzVC4PVJbYFPNCd/Syj4vvmatPhUHSYpBArvtVgxVEA2
         FhKLyog50McESOeia+olrQjTelycxxLou6/9VLGJvAI8WD9qnJVVZze4q7hNytz2vZzA
         C0+xhsKtyI+/2xW2MgPNT/4Qntekfo7mJXOKDYgDNrtveRgxbP/pEVryDd+mnzIthp7a
         vCBuuGJPSfwuATV+pZ6J5VgI6MGitwJgSlPvkA0nXIRtIFfLbpAb/lvjoedv4L3Q3wZa
         DKOy74VQouIn8YVNFB18Y3oon3QhA1rSsFSIii+1gRO8aQky0xRGe9fNNQU9PZ4iAR0u
         enRQ==
X-Gm-Message-State: AOAM533SItJYzUCmSLhI/UV9xCAG8I/Fx9AeHhnzK6WuxEhZqSIvIOxg
	OBlj598hwz9JwhfY2yS/oD+NgUTefpg=
X-Google-Smtp-Source: ABdhPJzG+qigIoJDbmPHPAMKHuYjRxqykIyhDC9ZwVbuXeVoGiSsFPpKUYXtICVxFNVE78dMxPfTLw==
X-Received: by 2002:a7b:c3c7:: with SMTP id t7mr7041069wmj.114.1605355272098;
        Sat, 14 Nov 2020 04:01:12 -0800 (PST)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-84-14-95.home.otenet.gr. [2.84.14.95])
        by smtp.gmail.com with ESMTPSA id 109sm15181387wra.29.2020.11.14.04.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2020 04:01:11 -0800 (PST)
Subject: Re: [docs] pdf output for Sphinx
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <478fb8f6-1c5b-c138-854a-3dc15f204abb@gmail.com>
Date: Sat, 14 Nov 2020 14:01:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

My comments are in-line

On 13/11/2020 10:31, Nicolas Dechesne wrote:
> 
> Feedback?

This looks pretty nice.

With the old style stuff I created pdf books with html -> latex -> pdf, 
which was quite some pain.

After a quick check the only thing I would maybe change is the size of 
some images, since they seem to be scaled by width. At least in latex 
they could be scaled to be a bit smaller, no idea how this is done with 
sphinx.

e.g. p.56 Package Splitting

> 
> nico

Regards,

Robert

> 
> 
> 
> 
> 
