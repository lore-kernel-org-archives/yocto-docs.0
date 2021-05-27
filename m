Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1548.1622158445451514071
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 16:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JiMoUNT1;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id k5so1485419pjj.1
        for <docs@lists.yoctoproject.org>; Thu, 27 May 2021 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MFKcJ7InLMP5f1VQeIahok/aNnKlRodjbx1pYOM1gGk=;
        b=JiMoUNT1eoOJLQF+wX66R2vqOfUamCHaEcjtn+f4RMfrVuZua6DKfej8CnnQiG7ddx
         +lU7k/4KDZ6Al+NUveC/JkH78wHSko2jr3VM7rmuInG1DYFqv1y+zyssOzA7E/DmuUJ+
         iZj5uysrRRqw9t3j3fmoG9vzDsMM5+r+AAYL8ICbOFp0L6HJrMMaQHqaRDo4XioiLUOx
         xtwKrrbx5MHi6/ckpxqbu0/hZ4JnEVEZsapiA919dLrhYwRv4w7xpGrfigtIU30aSzo9
         H3T8lSccmK8jLwbM+wU6sXoVCw3BIzbUgyk/j6cY/lXmbc3cflZ0r3lY7IgRPpf1oXRH
         sI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MFKcJ7InLMP5f1VQeIahok/aNnKlRodjbx1pYOM1gGk=;
        b=SbNub+Q8cxhUQ7FX/WGDC3oqi9kR9vjW59bT4UWZMDQP29SAno4NqgcDuj1y1T2tFQ
         ygzlFP7LmdF3yLXUcKNAizLUONI3Iuumk6Sc5DlA/Gxi4AEipudhxnVb+SkMjPBY7zsQ
         ZXy8xhlXcpy4nSk/FtE/M2qWr8jSlNqI3kEfBZ5jW1cQUTGneg9ZzJzDN8DaFeXZIVzP
         RzNcRQZTJ4n9Fi6oKg35UXrP63V1O14thquBe56RRprYBaskVnhkaeLydeNlew+vkdSs
         ltdhQ1GgnUILMa3sDzGQ8MlQB4DTSiAgBzZlxtOmimnhB+d3rZ6eYYPuaEE464S30qhu
         uzsw==
X-Gm-Message-State: AOAM5308VY+Pf5QtssXIXszy3h+JsDl1NbCidsabKkJRGFsj1sJTHflx
	v9KqfOwzrKscnBxQ9hVicg6n5wH0VY9V5w==
X-Google-Smtp-Source: ABdhPJxPYCxpazFDdlmLHQxx+EmzHQyGo26VTFU0OzgT9mw1l3aXScaYVqIqbMCM294gPdH1DcMB9g==
X-Received: by 2002:a17:90a:5507:: with SMTP id b7mr1086809pji.27.1622158444488;
        Thu, 27 May 2021 16:34:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:f430:e8cc:9cc6:6c68? ([2601:646:9200:a0f0:f430:e8cc:9cc6:6c68])
        by smtp.gmail.com with ESMTPSA id r15sm2763508pfl.44.2021.05.27.16.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 16:34:04 -0700 (PDT)
Subject: Re: [docs] [PATCH] ref-manual: add DEBUGFS-related variables to glossary
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca>
 <20210527103344.pqxrbddld5rtpbge@qschulz>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b261368c-3e1b-b229-e081-ab157e0fdbd0@gmail.com>
Date: Thu, 27 May 2021 16:34:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210527103344.pqxrbddld5rtpbge@qschulz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/27/21 3:33 AM, Quentin Schulz wrote:
> Hi Richard,
> 
> On Fri, May 21, 2021 at 05:35:21AM -0400, Robert P. J. Day wrote:
>>
>> Add variable glossary entries for all of:
>>
>>    * IMAGE_GEN_DEBUGFS
>>    * IMAGE_FSTYPES_DEBUGFS
>>    * IMAGE_INSTALL_DEBUGFS
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 0b61f77cb..1ce43a954 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -3006,6 +3006,24 @@ system and gives an overview of their function and contents.
>>               or ``_prepend``. You must use the ``+=`` operator to add one or
>>               more options to the ``IMAGE_FSTYPES`` variable.
>>
>> +   :term:`IMAGE_FSTYPES_DEBUGFS`
>> +      Similar to :term:`IMAGE_FSTYPES`, specifies the formats the
>> +      OpenEmbedded build system uses during the build when creating the
>> +      debug filesystem, as long as :term:`IMAGE_GEN_DEBUGFS` has been
>> +      set to '1'.
>> +
>> +      The default value from ``bitbake.conf``::
>> +
>> +         IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
>> +
>> +   :term:`IMAGE_GEN_DEBUGFS`
>> +      Set to '1' in order to generate a separate debug fileystem::
>> +
>> +         IMAGE_GEN_DEBUGFS = '1'
>> +
>> +      If set, the debugfs will be generated with all of the filesystem
> 
> Having worked with the kernel before Yocto, for me debugfs is a pseudo
> filesystem created and mounted by the kernel. I guess this has nothing
> to do with it. Could we elaborate a bit more on what this debug
> filesystem is and what's its use? And also put a word that this
> shouldn't be confused with debugfs filesystem from the kernel, c.f.
> https://www.kernel.org/doc/html/latest/filesystems/debugfs.html.
> 
> Eager to learn what this is for :)

yeah its a name collision, perhaps we could have called it DBGFS or 
somesuch name

> 
> Thanks for the patch!
> Cheers,
> Quentin
> 
> 
> 
> 
> 
