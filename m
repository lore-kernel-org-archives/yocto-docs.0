Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.12817.1611071028895004817
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 07:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LhQpHtrw;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id e70so4744580ote.11
        for <docs@lists.yoctoproject.org>; Tue, 19 Jan 2021 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=r4pwSJP2BRC+Pp4rChtUZRYxB3MVHLvjfAW5dPlJxwU=;
        b=LhQpHtrwp/GE1WmIj7qSB3Sd8KbIYznJG5Me+WzCwxqGSdJMdTund7ZfEeiRyZDwLf
         sY+8ku++TF5qWmRVGb8QLxF7Ey6efThDTyFsmbVLcjkRwUJQFVhKlZrxBLSEUu8pjGq1
         MN7qxpX9q+8tfSMyN6NJ7xjq6iy1MNsezl/cw2l/+zWFeBIPdeFtN6TYUt+BTN7NZp3C
         IxBJRs0dViannHLTgCnffmVkEwdOG5hj69OSX4Qsj5lV6QhZKg8NleD5gmnYAA1Ykt+l
         6X4AGBG0QHl/qcHuhUuv6wi2P3YEpMAKGF1PKqY0kYCmkdoZPodwdGLprizNfcUkb15j
         Beaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=r4pwSJP2BRC+Pp4rChtUZRYxB3MVHLvjfAW5dPlJxwU=;
        b=BrLx1LlbXjl8ZnaOlaooSoC8tNiKsv8YHgmxPaJ3ra3gcZs9L6h0L5GGUn+8OPwVr3
         nGDp6zhbTZAmTJZpJWmP/qUmdz4prp5vOiLjnB9kgNG1V5QvJGjTtHpH/nuSMU4QE4l6
         q/wbj6JLHTEr9X+J7jbTfYJS/pgIc3zT64F/drdpU8XpgWLkS28FOyQdSerhLj/z+Ymz
         NnfMCGVGQxhUeihT5pF8jiX7HXKDMl2SCCTXy6mx6ZHgL8yHDTO25WIuaI+K3S7+F1Yr
         dioW9L08m7rPvgI0HaLlXRToeHaqm3hlIXdPfiJ+bIL1M/6eZ4fqLRx0jiL21SCmPeEs
         fesg==
X-Gm-Message-State: AOAM532xFua/Sx6HE4jnyiBqWCFDmqMO2Jx5w/tr9JHSvyE4TrmgpNSE
	DgEY0XPV4TkzK35BnDlma6BBmD0KQJY=
X-Google-Smtp-Source: ABdhPJwMQVMcmCGY5XvuhmLLci2cTnyKSnQhq9+2yjwxQi0Rt5vaMrUFqj9TSJtYLdpfxSzvvBPpLA==
X-Received: by 2002:a05:6830:143:: with SMTP id j3mr3894969otp.241.1611071028041;
        Tue, 19 Jan 2021 07:43:48 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t16sm444027otq.17.2021.01.19.07.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 07:43:47 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs] PROVIDES inconsistency
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs <docs@lists.yoctoproject.org>
References: <de6c282b93e701bbd5d8b8bd1da6125c1cb6d38c.camel@linuxfoundation.org>
 <20210119153124.vayhbc6om4dj6uj6@qschulz>
Message-ID: <a90736b0-b038-b36b-b78d-13d9a8b4889d@gmail.com>
Date: Tue, 19 Jan 2021 09:43:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119153124.vayhbc6om4dj6uj6@qschulz>
Content-Type: multipart/alternative;
 boundary="------------3F16CD0858997F62886EE047"
Content-Language: en-US

--------------3F16CD0858997F62886EE047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/21 9:31 AM, Quentin Schulz wrote:
> Hi Richard,
>
> On Tue, Jan 19, 2021 at 03:27:11PM +0000, Richard Purdie wrote:
>> Hi,
>>
>> On irc it was pointed out we have an inconsistency in the documentation of PROVIDES:
>>
>> https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES
>>
>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES
>>
>> One says don't use +=, the other uses it as an example.
>>
>> We should probably decide on which and clarify the manual.
>>
>> In many ways I prefer encouraging users to use "+=" rather than setting
>> plain "=".
>>
> += all the way.
>
> Even if your recipe sets PROVIDES = "test123test", bitbake (Yocto?) will
> add ${PN} to it (otherwise recipes without PROVIDES would just flat out
> fail to be found by the DEPENDS mechanism).
>
> It's less confusing if you have PROVIDES +=, showing that there's
> actually already a value set for it.

Agreed. Even though there are some implicit behaviors w.r.t. PROVIDES, 
it seems that the principal of least surprise would say we should 
recommend "+=". For example, if I were to use "=", I might be surprised 
that the recipe was still available under it's old name (due to the 
implicit behavior). The fact that using "=" being "recommended" requires 
an explanation seems sufficient evidence that += would better match 
expectations.



>
> Cheers,
> Quentin
>
> 
>

--------------3F16CD0858997F62886EE047
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/19/21 9:31 AM, Quentin Schulz
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210119153124.vayhbc6om4dj6uj6@qschulz">
      <pre class="moz-quote-pre" wrap="">Hi Richard,

On Tue, Jan 19, 2021 at 03:27:11PM +0000, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

On irc it was pointed out we have an inconsistency in the documentation of PROVIDES:

<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES">https://docs.yoctoproject.org/ref-manual/ref-variables.html#term-PROVIDES</a>

<a class="moz-txt-link-freetext" href="https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES">https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-PROVIDES</a>

One says don't use +=, the other uses it as an example.

We should probably decide on which and clarify the manual.

In many ways I prefer encouraging users to use "+=" rather than setting
plain "=".

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
+= all the way.

Even if your recipe sets PROVIDES = "test123test", bitbake (Yocto?) will
add ${PN} to it (otherwise recipes without PROVIDES would just flat out
fail to be found by the DEPENDS mechanism).

It's less confusing if you have PROVIDES +=, showing that there's
actually already a value set for it.</pre>
    </blockquote>
    <p>Agreed. Even though there are some implicit behaviors w.r.t.
      PROVIDES, it seems that the principal of least surprise would say
      we should recommend "+=". For example, if I were to use "=", I
      might be surprised that the recipe was still available under it's
      old name (due to the implicit behavior). The fact that using "="
      being "recommended" requires an explanation seems sufficient
      evidence that += would better match expectations. <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20210119153124.vayhbc6om4dj6uj6@qschulz">
      <pre class="moz-quote-pre" wrap="">

Cheers,
Quentin
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3F16CD0858997F62886EE047--
