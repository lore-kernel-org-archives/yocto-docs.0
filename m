Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.703.1630177260806529148
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Aug 2021 12:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TBCRtECf;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id t42so8717043pfg.12
        for <docs@lists.yoctoproject.org>; Sat, 28 Aug 2021 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=GhBd/lXVm5jdQQrIfAEA7jAII42AH0VNiCOAk4smPMM=;
        b=TBCRtECf7XyohccbEdqZvUXXEUP3fWYBcc83ruCDbTX2pM341IWMjXPb6VNWHzD+10
         LcapszARQhypPzEV0ZupWqAy3qZIbYoonlNq3PiQkvDAMltUA6OQJ3wHzmB29NLJg3U6
         fBcDOqeloau7Of+xn4nfy3+c64RjnZp/bPphpt3FzpAwrO5pUlTRLMKMA+u4akZR9pwP
         ml39LT96xZHePNjUwGph36uJa9EEzJmDhi7gZedE0bWQdqVWvjjGFRDtMyFwTzHsPJjy
         j0ln+Nfk6df19Gf+rRQJxkX8iQ7X4/j0jjgbjYg/dW8GHLh6xI6Vi96u5RDZpXBQJVkO
         gcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=GhBd/lXVm5jdQQrIfAEA7jAII42AH0VNiCOAk4smPMM=;
        b=nFEY+esagfb7V6zZLat5likXPJQ71M8MzYS66wrSz7InNSMwA7CBmNapDq9GrC9/kk
         tZGA6Z5h86eiNx8X02nLLr0rKIgVF483Iv10QhWaufPE9YdJzxasZdpatgCyCxXii63J
         cvpRV7bDiJFtXbalMSmWHtQLKCcqUPJ75K7novoZTZtJ8ResZr/t4X5zV5uFs9R5EuxR
         rkeMq54AI1d2ANqZcjfgNY7Xfl3Sd9VzC7hZ4Pq72/Pn6UWdqdOFXsFi+fw7dgXH5hQQ
         WnXAV+wyOrVeuTuTyqICzGfHgAN9ERXsMo81Bqgmy17V4S5oJPu+pWCPpw/2x0hK7SYy
         AXfQ==
X-Gm-Message-State: AOAM532BGgErqqK+ffWok2qaqhIyCZf7RfJai0mUCjAR21QGS9FKY3My
	y3QFxVMUdwGiq66bERwzw0I=
X-Google-Smtp-Source: ABdhPJwoL6UJhfxgxFJ0Lkn9TvnS4k+eWKbi7jKqQLf9fb1Qh1FxDoORu9rYLpMdJOBDRJqx/Ozq7A==
X-Received: by 2002:a63:a55a:: with SMTP id r26mr4402993pgu.13.1630177260151;
        Sat, 28 Aug 2021 12:01:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id b13sm10626915pfr.72.2021.08.28.12.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 12:00:59 -0700 (PDT)
Message-ID: <82b20807-d987-e29e-4a9d-c8c5cf1ff524@gmail.com>
Date: Sat, 28 Aug 2021 12:00:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [docs] are autobuilder links in dev manual correct?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <169F8C1A79CD3C8C.14757@lists.yoctoproject.org>
 <2fd1d1b-e04c-cfc7-53cd-63352de2c21e@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <2fd1d1b-e04c-cfc7-53cd-63352de2c21e@crashcourse.ca>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/21 11:36 AM, Robert P. J. Day wrote:
> On Sat, 28 Aug 2021, Robert P. J. Day wrote:
> 
>>    here:
>>
>> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/dev-manual/start.html#accessing-nightly-builds
>>
>> the autobuilder links in that section don't work for me, what should
>> they be?
> 
>    sorry, erroneously added link for local build, here it is again:
> 
> http://docs.yoctoproject.org/dev-manual/start.html#accessing-nightly-builds
> 

I am not sure if there is any nightly links like they are documented see 
https://autobuilder.yocto.io/pub/

perhaps it should talk about 
https://autobuilder.yoctoproject.org/typhoon/#/builders perhaps.

> rday
> 
> 
> 
> 
> 
