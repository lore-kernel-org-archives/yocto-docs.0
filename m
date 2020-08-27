Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.26463.1598555142661143458
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 12:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uDXaZQtW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id r15so6347878wrp.13
        for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2020 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I7tyRMJcX7Jx9/Q/ze2NKLZDvA9fxzRo/AXrhRteYyk=;
        b=uDXaZQtWKO44eEfB38xGwlvBm4GU7LGWfJn5XPRe2n+swxyOfbXtlJVvpi/o4CSID7
         eVDNDrbeXDR3l6MsxsuL+A+8v4R/qnEg5D87RbxfOWIt9hV171p78KtnHS5OVbty1kMm
         OrR8UNYYUyb5SiMxjeGEj8BKOL0KHRgQZp2zv2OlEmlq3iCfyz24Z/f6fBIuWU323zeb
         vgGfbVnazBNRTpWkG4Lst0XP636CsSGhaJudOwTvj4NUlL6fkNiWMbesLhD2rHx+gQhL
         55pNF9kq6XPCZUUZJ+VLA9xV41ymJtlzXUgW0ftSAKfouv56MOjF24OVnskUViCjRtPy
         rpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I7tyRMJcX7Jx9/Q/ze2NKLZDvA9fxzRo/AXrhRteYyk=;
        b=d4zX3kiQe2aBv4lN9vJpQhF8rNKzFrISh4JC/UoLUH4TMs06fAMAgN0RzQHSAOrslh
         xsuEsXHOSj6iW/JMQzEJjW66onzvftjptExkkPC4RxT3xgrP1RB/VX46YK8DujetMgMY
         rWeNTDlS7qfZ6npQHlEVSsXMgPbUkUcUOdq0AbsrnuzmmJT/ObKlruWNt3Te2uAkmwqX
         JEAIQ3hSNL73kDefBM3uletHCFkIPKeZ15KyDukyfBb6M5FpFoR0bd0Mfi7xlPADenfE
         9Kea+RyiYrJ3LiNXv1Huba0sXSFBM98jvytkLyhCVEFxHAeVR4L6nL2v6aNxocZzLHW0
         GKHA==
X-Gm-Message-State: AOAM531CYU2gDJUWWeQb0B4aHMVbnjlgJzWsxMRE0BJJQPNxTY5YimyG
	xXloOJL92/RRDsEYGD5C/kkMTlsI8RI=
X-Google-Smtp-Source: ABdhPJwMMuDhrt4UJfd3Kv4I9Lh0OqyTq9zcRgZrl5K2jH0eGpK65kwamX83bEVgQI6FWpztaY/kRg==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr19387570wrm.285.1598555140712;
        Thu, 27 Aug 2020 12:05:40 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-237-227.home.otenet.gr. [2.86.237.227])
        by smtp.gmail.com with ESMTPSA id f10sm6115278wmj.37.2020.08.27.12.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 12:05:40 -0700 (PDT)
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
References: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
 <6cb6f3a9-e4c0-960d-0069-09eecc344625@gmail.com>
 <CAP71WjxnVfjaoKRx4-tfko5gcZFG4ACSdW2znjZwHii9rxZT4w@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <3cdc3f06-6413-55ee-fd2b-2abf1349abc0@gmail.com>
Date: Thu, 27 Aug 2020 22:05:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjxnVfjaoKRx4-tfko5gcZFG4ACSdW2znjZwHii9rxZT4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Nic,

As far as I can see this looks good.
As soon as the official mega manual and bitbake manual are replaced by 
Sphinx I'll give it a spin.

Regards,

Robert

On 24/08/2020 18:36, Nicolas Dechesne wrote:
> hi Robert,
> 
> thanks for your time!
> 
> On Tue, Aug 11, 2020 at 6:07 PM Robert Berger@yocto.user
> <robert.berger.yocto.user@gmail.com> wrote:
>>
>> Hi,
>>
>> My comments are in-line
>>
>> On 06/08/2020 00:54, Nicolas Dechesne wrote:
>>> hi there,
>>>
>>> I will be away from the Interweb the next two weeks. So I wanted to
>>> share some updates about how the YP docs migration to Sphinx is doing.
>>> [it is a fairly long email].
>>>
>>> To be honest, I wouldn't mind a little bit of help, and I will give
>>> some hints about how you can help!
>>>
>>> We are still working on publishing the current Sphinx docs on
>>> yoctoproject.org, in the meantime, it's here for YP and Bitbake
>>> documentation.
>>>
>>> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.html
>>> https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/
>>>
>>> All changes are pushed to the 'sphinx' branch in yocto-docs and in
>>> bitbake trees.
>>
>> As long as chapters/sub chapters and variables are have some kind of
>> stable links this should work for me.
> 
> Chapters/sections links will be stable. There is one difference
> between how it's done with docbook files since the links were "hand
> crafted", with Sphinx, they are generated from the 'section' name, but
> they won't change unless we change the section name. e.g.:
> 
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/overview-manual/overview-manual-concepts.html#shared-state
> 
> I am planning to rename the individual files to avoid the duplication
> in the url (e.g. overview-manual/overview-manual-concepts.rst should
> be overview-manual/concepts.rst).
> 
>>
>> To give you some context:
>>
>> I my training I have many links from my slides to the good old doc.
>> e.g.
>>
>> in my latex magic I have something like:
>> {\tt \href{\MegaManualVarSearch LAYERSERIES\_COMPAT}{LAYERSERIES\_COMPAT
>> (MM)}}
>>
>> which ends up into a link pointing to a downloaded version of the good
>> old Mega manual:
>>
>> file:///xxx/mega-manual/mega-manual.html#var-LAYERSERIES_COMPAT
>>
>> It looks like I could do the same with your stuff:
>>
>> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/ref-manual/ref-variables.html#term-LAYERSERIES_COMPAT
> 
> yes, that's correct.
> 
>>
>> and I hope there will be a Mega Manual which contains them all ;)
> 
> Here again there is a nice feature with Sphinx. We can generate a
> global 'index' table that is automatically generated with all 'terms'
> from all the glossaries, see:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/genindex.html
> 
> e.g. there can be more than 1 glossary. Currently we have 2:
> * the variable glossary from the reference manual:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/_sources/ref-manual/ref-variables.rst.txt
> * the terms glossary:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/_sources/ref-manual/ref-terms.rst.txt
> 
> We can also add any term from any place within the whole documentation
> set.  I like that a lot.
> 
>>
>> Regards,
>>
>> Robert
>>
>>>
>>> 
>>>
>>

