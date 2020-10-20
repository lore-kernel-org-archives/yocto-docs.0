Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web09.2639.1603231764351685507
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 15:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=inszvNWR;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id l4so61310ota.7
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 15:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7hlbotC7ZvSWeX42QDdsEZhTB6qdc08Ycgd5c0q2Yj4=;
        b=inszvNWR3cobjD/JZ/l4+Ou1TUiDvncjqQ18nBNhKHpbEsKRlnTfw90jWOQzsqVHF4
         N9VRYsmLb6KLoIufKGHG5KqZK7aROT5vqV53MRY1IgEp+4V/uU515hz28IHMt1v29/pz
         19MYgNzrSm6dO/5U34BHQv/yM4FtpB8A57HPLB3oj9Vy9Kf9KiLoJfrN9lHSXe6D6WOY
         eV7/AkJ/0Y20/krVd9RrWntgkPiHayxN/eKphBoxuT77k1U3LvLiEs6+AFC27Tw/rW1k
         VPLZ0f417yv3GO5Brlm29niVOhvhOqsSVm0g73Moq0zVsxERM1lHKgIdRCkjCP39nHsa
         XyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=7hlbotC7ZvSWeX42QDdsEZhTB6qdc08Ycgd5c0q2Yj4=;
        b=Hd4nmYsouRTyuHXuQF6+Nm95tdW0sOs2WuF/RIhJFWIFruVoZzhH1lLv3g+b0rJs6B
         1rB5PevEtbAZdQZcwO1uSZ9Wen/wtgSTjk3a9sExYUxwvqXYHGen1iejblWZTzSh7yy/
         dyyvgdnk61Vs2V9KIQU1rRsmzws9RBrrtzPs3U3NkxphEMYuQvq9POKZ1Jr+Wlt10KJY
         kGVXNjzE0458ewtQHZPRc5ZkCPFnBKn0JK0qmnn770389mQh8umJNHsI4I7hH8W0tHXI
         CNveglaEZfqN1JrpGAGq8oqCxIi/9IFwkyaWNbXPBIDWAtzZA/3ufQ5EXL8OHmPMRQvp
         JSPA==
X-Gm-Message-State: AOAM531s2GpkyGS2rP3YHrRaBuilRopaZLUFHns+S3WZPy/0v4OOi1dB
	DJC/3Ww3rfTMLx8zZB/EP7o=
X-Google-Smtp-Source: ABdhPJwUFdElbM70P7HXKt9d4bUxAYbOatrb17hx+V8oeqMMswgfWcX0E8tmL5G3QaXUdextHmwzIA==
X-Received: by 2002:a05:6830:1694:: with SMTP id k20mr406997otr.100.1603231763643;
        Tue, 20 Oct 2020 15:09:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cd0c:110:b7a5:2c69? ([2601:202:4180:a5c0:cd0c:110:b7a5:2c69])
        by smtp.gmail.com with ESMTPSA id j7sm95203oie.44.2020.10.20.15.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 15:09:23 -0700 (PDT)
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 "Robert Berger@yocto.user" <robert.berger.yocto.user@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, docs@lists.yoctoproject.org,
 Paul Barker <pbarker@konsulko.com>
References: <20201020170326.14313-1-JPEWhacker@gmail.com>
 <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
 <9c52a04c-7184-8dfc-44e6-83a4cb7db2d0@gmail.com>
 <CADkTA4N+dJv_QqtEiJBxdcZXE5SxkDjDJF-+4Sz6n4+wVDYRKw@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a860f167-4f08-a48c-45b2-2de4c617ea00@gmail.com>
Date: Tue, 20 Oct 2020 15:09:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N+dJv_QqtEiJBxdcZXE5SxkDjDJF-+4Sz6n4+wVDYRKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/20/20 2:14 PM, Bruce Ashfield wrote:
> On Tue, Oct 20, 2020 at 5:05 PM Robert Berger@yocto.user
> <robert.berger.yocto.user@gmail.com> wrote:
>> Hi,
>>
>> On 20/10/2020 21:14, Joshua Watt wrote:
>>> On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>>>> +.. note::
>>>> +    You will notice that this is will still pull the kernel source from `the
>>>> +    Yocto Kernel git repo
>>>> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
>>>> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
>>>> +    which is an exact mirror of the upstream kernel.
>>> This is a lie. I thought it was the upstream mirror, but it's not.
>>> v5.8/base is the mirror and this one has a few extra patches.
>>>
>> And exactly because only Bruce knows (most of the time) what is in all
>> those funny branches why not use upstream (kernel.org) for a vanilla kernel?
>>
> We are documented how the single linux-yocto repository can be used to
> track tip (master), or any of the -stable upstream kernels
> (<version>/base), or the yocto specifics (<version>/standard/base),
> without needing to create 'x' recipes to do it. It is just a branch
> switch away.
>
> Someone can always use upstream in their own kernel recipe, we are
> just using this doc to describe what's in oe-core itself.

this is what I just did for the meta-odroid.

https://gitlab.com/akuster/meta-odroid/-/blob/master/recipes-kernel/linux/linux-yocto_5.8.bbappend

It  you don't have your own kernel fragments, it could be simpler.

-armin

>
> Bruce
>
>> Robert
>
>
>
> 
>

