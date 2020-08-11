Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.18454.1597162024526420353
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 09:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cSTQnerR;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id c15so11979519wrs.11
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2020 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=OIHHItW8Xxo08PPeuShj6pLVrJUXE45h7mj/64tibJU=;
        b=cSTQnerR11t6yn/nxhTHXLyk82FMJCmPVzyE5k//SrdiEmnZHyFjqHZZe9pVo3IaBq
         af7IHNnY3qbdbPt7v57+b4ZaTr4Pk8RiH4rrAIiZXLqUdXqcZErXmmduf9DzO9lwOmtp
         2F6WWbbXqoP5tdtDV/taXtxcIgCxnA+zcQ8oGL2GmJfC8VQSG0+Ha7Lipkg5uhXKXPBm
         iNk0fwyUB9p3Nuohlrca7yrPYygE0U+jjWvjRtYbKH82NyBLZ2sos4o+w8M5JiPoSuEa
         M+mefgnUDD5tTthcB3dighVKldSPrwAm/9eyFNqbnP+PUIrPZ9wmuUCK6KA1A4axCNTq
         czvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIHHItW8Xxo08PPeuShj6pLVrJUXE45h7mj/64tibJU=;
        b=IETZTgDnbbbbKMUOCHlHoitymsSah58arOXPa+jouRPa7v99nS9yUZVhP6t+EbFRP3
         fJkPHuDm0Db56e5/QACLi6S/e8M1zS9p3JBQRP/G/LStaDsCBQkhVH8kOV9ZzNtcLPy4
         V4RsN3B5lyJkTdZV0NSzReoBKDe6zsKD2AvK/dghrsLIvLnsbQdGMX2pQvLaYZdfav7c
         XGoR1+xh3FXh2l6Wjq2twFe3jMAs92IBGcpBXxb9rrbCf1o1RYfr0lj/Zm9mc5SBpLNk
         RQMJ4/YaNLnzUWbI+sUqPHzYtZeH9IUpZpuY/IOX/ziiTEZBlVGxWKle8R3ZEz7w6I0A
         SUoQ==
X-Gm-Message-State: AOAM533ULp6L0z2C5m87HlX9Szquy5iykNlEJy3+wbtmLCe514Xh/CQ2
	knpEOBEgDf/NdpeiskYYXbRVGpOj
X-Google-Smtp-Source: ABdhPJwLw+clijUb6M2me/vP45ld5UdOy+MSmSfjf+gjD75+O9hypw+KxBJMIUKt7iijR0AtWjRoKg==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr32599331wrw.105.1597162022503;
        Tue, 11 Aug 2020 09:07:02 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-237-227.home.otenet.gr. [2.86.237.227])
        by smtp.gmail.com with ESMTPSA id b123sm5920212wme.20.2020.08.11.09.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 09:07:01 -0700 (PDT)
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <6cb6f3a9-e4c0-960d-0069-09eecc344625@gmail.com>
Date: Tue, 11 Aug 2020 19:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

My comments are in-line

On 06/08/2020 00:54, Nicolas Dechesne wrote:
> hi there,
> 
> I will be away from the Interweb the next two weeks. So I wanted to
> share some updates about how the YP docs migration to Sphinx is doing.
> [it is a fairly long email].
> 
> To be honest, I wouldn't mind a little bit of help, and I will give
> some hints about how you can help!
> 
> We are still working on publishing the current Sphinx docs on
> yoctoproject.org, in the meantime, it's here for YP and Bitbake
> documentation.
> 
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.html
> https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/
> 
> All changes are pushed to the 'sphinx' branch in yocto-docs and in
> bitbake trees.

As long as chapters/sub chapters and variables are have some kind of 
stable links this should work for me.

To give you some context:

I my training I have many links from my slides to the good old doc.
e.g.

in my latex magic I have something like:
{\tt \href{\MegaManualVarSearch LAYERSERIES\_COMPAT}{LAYERSERIES\_COMPAT 
(MM)}}

which ends up into a link pointing to a downloaded version of the good 
old Mega manual:

file:///xxx/mega-manual/mega-manual.html#var-LAYERSERIES_COMPAT

It looks like I could do the same with your stuff:

https://people.linaro.org/~nicolas.dechesne/yp-docs/html/ref-manual/ref-variables.html#term-LAYERSERIES_COMPAT

and I hope there will be a Mega Manual which contains them all ;)

Regards,

Robert

> 
> 
> 

