Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.49098.1624290534234044453
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gu1wbnTN;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id g192so6289491pfb.6
        for <docs@lists.yoctoproject.org>; Mon, 21 Jun 2021 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DGdnfUXHGyDWn/RF1th0VLemloaWcfGqCjzItKCgEaI=;
        b=Gu1wbnTNvwq9Plp5kYiuzvGqIUeAV6rZdktDkqvwu1q7cUdZ0krexkkt3p/WKbZhS8
         pzmDyMAxAOYlCSmXf5tNLCIoEeylWePyB+dTXJrJYwJIHMqgXNnHGWhaq/R+7JIfGKmD
         /ae2jA6N+QM/H7HI2HVWN4tdxYbk3Slpz19r8UQpSKElA5BegKyqcQjvgEAbcOziuCd4
         JgO4V2hPn4yNhkLVj6lBex60Nnk1ePpYaBOFMJi2Q3Zr8U3MPKlg93QnZRg/Zi+lzyFM
         0GaglpkvAw/AzisqBfL3oz7tgspMMq5V6lRnPKh/uGe473UnhtmslPnta7aJsqo6pjc4
         O/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DGdnfUXHGyDWn/RF1th0VLemloaWcfGqCjzItKCgEaI=;
        b=o8Ptj4qBC/EGfkjByhTFSHxuXGvLJv2RsZWdwmUo/j3+tcuF7Ftx6oXAvHmMh7DOd3
         qesUGd1f9n8TkOXSRxMN8NuXLtiNcesgLVQqHY87/n33OIMzxNRyf0tLbrZhTfwkYfj7
         sZ3MOqtjEOIZYJOATSwPTT7PCshORpRDovC5B3WRbGjir+6DZqw5TD2UmD2C3MQVST+2
         Qf16Y9HUwcBhkvkb1qHjqqOQTaRMJ2tCR6nOOqglcCAZvEdHB4rXJdGydodmKSuFjxH6
         DPtDl9HmCh8ZfTEvNLo8NkurEXyIONAYEkJetF2+K08k27gj58/OsGo8pUWBcfAFi177
         SfZA==
X-Gm-Message-State: AOAM533lunAro0uVZOLOtVSUGHb/xI1PrUA3MtkXri4/+19ZJ+RI3BN1
	PTWWS1fQZ4RStmObi2q+yuWB4Xk50FM+8Q==
X-Google-Smtp-Source: ABdhPJxoszSGn5lysgY2ETLxqN2oo+0gFuTKMO+/jjEgTJNHsuOZ5gtCP4FQPZE2YykspJCVXCy7pg==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id y139-20020a6264910000b029028e8c906b16mr19825687pfb.24.1624290533353;
        Mon, 21 Jun 2021 08:48:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::a108? ([2601:646:9200:a0f0::a108])
        by smtp.gmail.com with ESMTPSA id 10sm7328605pgl.42.2021.06.21.08.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 08:48:52 -0700 (PDT)
Subject: Re: [docs] should "ASNEEDED" be in the variables glossary?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <7b2fdc5-b939-eb82-ea82-c8d4f6e8e26@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b2b03925-9942-ba7e-d2a1-1ad1ae8b95ca@gmail.com>
Date: Mon, 21 Jun 2021 08:48:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7b2fdc5-b939-eb82-ea82-c8d4f6e8e26@crashcourse.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

yes it would be good to have it in glossary, it goes beyond core layer 
when you think of general use

On 6/21/21 5:59 AM, Robert P. J. Day wrote:
> 
>    it's not like there's a lot of it in OE-Core:
> 
> meta/recipes-support/icu/icu_69.1.bb:ASNEEDED = ""
> meta/conf/bitbake.conf:ASNEEDED ?= "-Wl,--as-needed"
> meta/conf/bitbake.conf:TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
> meta/recipes-kernel/lttng/babeltrace_1.5.8.bb:ASNEEDED = ""
> meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb:ASNEEDED = ""
> meta/recipes-devtools/distcc/distcc_3.4.bb:ASNEEDED = ""
> meta/recipes-devtools/unfs3/unfs3_git.bb:ASNEEDED = ""
> meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:ASNEEDED = ""
> meta/recipes-extended/quota/quota_4.06.bb:ASNEEDED = ""
> meta/recipes-bsp/pciutils/pciutils_3.7.0.bb:ASNEEDED = ""
> 
> rday
> 
> 
> 
> 
> 
