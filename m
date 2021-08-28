Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.513.1630176349328530654
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Aug 2021 11:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qOKMxtrU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n18so9131051pgm.12
        for <docs@lists.yoctoproject.org>; Sat, 28 Aug 2021 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=rMaxuTLGgTxUF7fc3BplVNijtzc6lZFRfgHGHe4sMi0=;
        b=qOKMxtrUNRAFKmYK9XmgsNCeC70CId1DZzPGmusWig7z+2L7whgT8MPbMaGS/oMxLZ
         Sy3X7J4tE0L/paQk/m8OZdi+/RZ9SGj/GWxMYvOdGIa2Tia63KGcmOboPM3sgePzTE9p
         InEOWVG/enqvtVW47pg7qzelsTE6pfxFUpeC4TYSePIygb6pdS8mxmCpA5tpHIxSa9aW
         aTZ+cGmfbha9/G6oL2qlpS/m7DrHyubTtbb10B79VXyV/q995DC6z+fs8rL1ic0nxdJw
         Mp9E3u5df0SQtubbrYXWoMAY8AEpTbDzyz1WvNOiK22m9AKydsilXOH025QWRjJkUPie
         felw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=rMaxuTLGgTxUF7fc3BplVNijtzc6lZFRfgHGHe4sMi0=;
        b=QeC0ycItQBDyox7pDtlmOMLh6veTv7KM4TnKESggeiSIh/G1NegjhQHtc36gM1u+jv
         FjGAfOXIzA1Er1eQA05AwPJGowVRN8Dwndzd+0da6Ku3z3rlmgL0fo1DTBIRzo3IZCk5
         FpZ5pz7ZaNNNSILweCQTmvVRxfEZH3oVgCIsl7qPI+L+eEQQB19gNf7Xit4GHU+PatVG
         dvWrBgP/Nr6JRQf8dXJc/mnUNr5o6GDoMwvCfi5O2IaO5reTH8i7BzQRQvo0iV/AqS5q
         Mb3CU9ayoRoBLMFvI0E3aiN9vOg5U3iaYCVI8Wk0Cmwv3v4Eskx7hHSPQX7Xqx4ifJkN
         CfKg==
X-Gm-Message-State: AOAM5319a/MTDCkO2hrQ1SNckVmFz+nppguR5OXgUHRKkr7Z2WoiDsdY
	kCHAS1xPNFGkrz3WFDNQxpg=
X-Google-Smtp-Source: ABdhPJy6+8VKgG5RGWnJcfsXxdptq9kcisuPf9lssd/b0Rqp16InCmJCUsxNCxp5P1kewnzis2T5Aw==
X-Received: by 2002:a65:63d6:: with SMTP id n22mr13627835pgv.74.1630176348688;
        Sat, 28 Aug 2021 11:45:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id br3sm14229182pjb.52.2021.08.28.11.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 11:45:48 -0700 (PDT)
Message-ID: <99485a3c-0d5c-3a76-95cb-57765c797bd8@gmail.com>
Date: Sat, 28 Aug 2021 11:45:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [docs] docs "README" file seems a bit out of date
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <1a55fe74-5128-7a1f-5a3d-dd137ecf7bde@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1a55fe74-5128-7a1f-5a3d-dd137ecf7bde@crashcourse.ca>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/21 9:59 AM, Robert P. J. Day wrote:
> 
>    README file at top of "documentation" directory:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/README?h=master-next
> 
> at lines 49-53:
> 
> "If you want to find HTML versions of the Yocto Project manuals on the
> web, go to https://www.yoctoproject.org and click on the "Docs" tab.
>  From there you have access to archived documentation from previous
> releases, current documentation for the latest release, and "Docs in
> Progress" for the release currently being developed."
> 
>    that's not quite what you find under the "Docs" tab and, anyway, one
> should direct readers to docs.yoctoproject.org, yes?

I think so.

> 
> rday
> 
> 
> 
> 
> 
