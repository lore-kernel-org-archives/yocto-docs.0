Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.13372.1611072734405602986
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 08:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qgh7aYIQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id h192so4016397oib.1
        for <docs@lists.yoctoproject.org>; Tue, 19 Jan 2021 08:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nK3sCBGcCCYPD6YO6AvpBwND3PcDQjr8CanpY9QmTFE=;
        b=qgh7aYIQStVM0ZgxSprh1fZ3IAZM3HGdylNf//GZE+gQVLu2SKsB47iAWRYJ6DtYCx
         a6QqiytHWjLjD4kQ8CR4B3neQYPoIPYNcZv/UYNSd4QDStGVLJfM3Ew3Yp1XxX1++YJ1
         hHnQHfKdSTXt/K80CSPFXgu+qKO8Cs5aCSTlxQeoRTFoPJGkqUwxQWo1iAu18f6dJ6lN
         4udqQ+wZISnQK4JDiunRx/9kULXhVz27+8raAFxFZyhJ+Yt0RLOck39vP3WG+a/+I14g
         /i9vULOf7OK55+rKtttZ5iLOH/gSFueUE09G9x/ph0bxxCocGjkjoIYqjlr4JyWkd844
         bEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nK3sCBGcCCYPD6YO6AvpBwND3PcDQjr8CanpY9QmTFE=;
        b=erDmdBzwdlnH5CC80foLhWWHPNAmh6gqH9l8cyTJg3AhbK2FG4QIBOZaevMFkzGra/
         GTzZzapzcAjsrErafl85LD+Z7Ergcio2nJ3eHYejbDDPilpWQZJyNSlAQJrRFF2C1zJr
         DecaNnyB2sXEEIha2SuAonO0Qhhg+9Gy3gRdhWJJbmixA5cV9YxZqM/fYyuwp9/yeHwL
         s2JUFHHHrT/crnuuexOHeYT0aRNs/yS/6wfZDYmaGIa2BWB8oi/TIIkL2f15H/sjbPz6
         TJE3C+V6RRtThsY6AxCumfHn14kPc/H6I/XBlAsovBcLvOeBH2SN4KMZ6TEStwbuo5MI
         te7Q==
X-Gm-Message-State: AOAM532vcZasQMwv/NS5ZLrKhtVze1FBxBLa/9rCor/ghiozT0zs8/6s
	LA7mPLxqLplf/wV0gGivWs4=
X-Google-Smtp-Source: ABdhPJxF5B4cSgbITDtk74Ecwv0dzAOzi2QCceszOuegqbxYR1Wuqka7EVuxrpjPuLTZSHP842qUAw==
X-Received: by 2002:a05:6808:8c7:: with SMTP id k7mr248197oij.31.1611072733825;
        Tue, 19 Jan 2021 08:12:13 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id q6sm1660598otm.68.2021.01.19.08.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 08:12:13 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs][PATCH] ref-manual: Clarify recommended operator for PROVIDES
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs@lists.yoctoproject.org, richard.purdie@linuxfoundation.org,
 rpjday@crashcourse.ca
References: <20210119155751.11243-1-JPEWhacker@gmail.com>
 <20210119160301.5ywnqttcdt73xyx3@qschulz>
Message-ID: <8f199df4-ac9e-df80-a02b-832e8038b6b1@gmail.com>
Date: Tue, 19 Jan 2021 10:12:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119160301.5ywnqttcdt73xyx3@qschulz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/19/21 10:03 AM, Quentin Schulz wrote:
> Hi Joshua,
>
> On Tue, Jan 19, 2021 at 09:57:51AM -0600, Joshua Watt wrote:
>> Updates the documentation for PROVIDES so that it recommends "+="
>> instead of "=".
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   documentation/ref-manual/variables.rst | 16 +++++-----------
>>   1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 4ce264813..2ea0cc36c 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -5915,23 +5915,17 @@ system and gives an overview of their function and contents.
>>         file ``eudev_3.2.9.bb``:
>>         ::
>>   
>> -         PROVIDES = "udev"
>> +         PROVIDES += "udev"
>>   
>>         The ``PROVIDES`` statement
>>         results in the "eudev" recipe also being available as simply "udev".
>>   
>>         .. note::
>>   
>> -         Given that a recipe's own recipe name is already implicitly in its
>> -         own PROVIDES list, it is unnecessary to add aliases with the "+=" operator;
>> -         using a simple assignment will be sufficient. In other words,
>> -         while you could write:
>> -         ::
>> -
>> -                 PROVIDES += "udev"
>> -
>> -
>> -         in the above, the "+=" is overkill and unnecessary.
>> +         A recipe's own recipe name (:term:`${PN}`) is always implicitly
>> +         included in the recipe aliases, so while using "+=" in the above
> s/included in the recipe aliases/included in its own PROVIDES list/ ?
>
> Just a suggestion.

Hmm, yes. I was trying to avoid saying ${PN} was in PROVIDES because I 
though it wasn't, but I see that it is (using _prepend).


>
>> +         example may not be strictly necessary it is recommend to avoid
> s/recommend/recommended/
>
> Thanks,
> Quentin
