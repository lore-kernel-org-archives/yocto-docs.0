Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE7CC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:50:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.479.1635882644066929817
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 12:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iuviwB1x;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id t38so299pfg.12
        for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ui7ktmhLASy5VeN9pRdexG2ZlaQm060Stm7T4f+eSqw=;
        b=iuviwB1xmdeemCc1kTLTN4pX6MMogaOjXN5/3Vj8FEiy0TW6it7Aha01Y17sA/Gzun
         6vdDQhixrvbnCygccxelj50LYEL8k6dgUV7nY9lRirGdrBQ4cmkSJKxm4tSuTT5ExqsP
         ZY0rhGfArMOdvnRV8nUVSu/QXNYTFW9n1pJT0cYMm1PnpQSsGsk9maumSDNcuRF8DQjQ
         HA5NJFcADMoFnLMDWpnR+7amkeWpkDR/GoKrwnSVKt4fY3tBzPlAixHX9pLZGR37B4VK
         8R1YumAVLjvjqlJx9oGjojafnwX+2MPsSdN+g3iXyATh/Uo0vgkFFHQQR1lnsHxxVtyH
         /GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ui7ktmhLASy5VeN9pRdexG2ZlaQm060Stm7T4f+eSqw=;
        b=48X5N3tuMdRsSGQb67A71AWdM3qnk6Oy7nIZPxG7B63QGq3fw0+sD0R58xDBhQcPHC
         20cMInZcppRsJYXM7oajxhZxXE7Aaab3OIiv5Mpp2sBAkIKNhWggypIr8UshXC/vKGvW
         JndCwODxjydkAQlclyJYJqqku3J+4yzB5S76nS+gFuhI1/iDlEg1kQSOB5J5x2bNui6H
         LnQw+5j9tPZqvZkjsUpFIFmWlblnD2BWthqRX0w+2laT/pD+tA5Hd3ypQe/YEnjkV5sT
         b+8KhYS/tLIZHiX/KiyB3dgg6GMWi3X4LSfIg6s5wYe71n1xMnO5BU0Y9fOz+B7WHcPB
         xs1g==
X-Gm-Message-State: AOAM5330Oq/J0onoOeeTcRpcsvz+sl2iuPhGO8f4XYMmLwML+NfmgsmX
	nmbKsorbe7t5yz9GHXTYFbUE7HbsDY4=
X-Google-Smtp-Source: 
 ABdhPJyMu3Oy9dRjWNmLTBBa4xwZYrA0d/6Z3tN/aDoMp0ZLFWrqBNdPfvNigg3X822P6M85nBIJ4A==
X-Received: by 2002:aa7:83c9:0:b0:481:1d47:3362 with SMTP id
 j9-20020aa783c9000000b004811d473362mr10750763pfn.5.1635882643192;
        Tue, 02 Nov 2021 12:50:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:e13:25b1:763b:6129?
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 r25sm16169847pge.61.2021.11.02.12.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 12:50:42 -0700 (PDT)
Subject: Re: [docs] [hardknott][PATCH] poky.yaml: fedora33: add missing pkgs
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20210909150842.3299672-1-akuster808@gmail.com>
 <6ad9f754-bfe3-68f8-4498-4147af8c6b02@gmail.com>
 <ac89abdf-379e-58dd-b76c-f4db5ab9bdbc@bootlin.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ec65541a-7fac-19ea-39b8-06b78a99adc7@gmail.com>
Date: Tue, 2 Nov 2021 12:50:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ac89abdf-379e-58dd-b76c-f4db5ab9bdbc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 19:50:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2070



On 11/2/21 11:22 AM, Michael Opdenacker wrote:
> Hi Armin
>
> On 10/28/21 7:10 PM, Armin Kuster wrote:
>> ping
>>
>> On 9/9/21 8:08 AM, Armin Kuster wrote:
>>> [ Yocto #14188]
>>>
>>> The following packages where needed to a fresh FC33 install
>>> perl-FindBin
>>> perl-File-Compare
>>> perl-File-Copy
>>> perl-locale
>>>
>>> Error seen:
>>>
>>> openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
>>> Can't locate FindBin.pm in @INC (you may need to install the FindBin module)
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> (cherry picked from commit 5b4127dd72a465ff8c962c425e78140ca8e536db)
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  documentation/poky.yaml | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>>> index 02c9bf3dc..7207df142 100644
>>> --- a/documentation/poky.yaml
>>> +++ b/documentation/poky.yaml
>>> @@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>>>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>>>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>>>       python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
>>> -     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
>>> +     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
>>> +     perl-File-Copy perl-locale"
>>>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>>>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>>>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
> Richard took care of these ones, but now I have the rights to merge
Yep, saw the merges.
> these by myself.

that is good.

thanks,

-armin
> Cheers
> Michael.
>


