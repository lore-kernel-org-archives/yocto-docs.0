Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.304.1617118970527405716
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IP9vH7qk;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id x16so16675263wrn.4
        for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VILz3wS2Bc4MzcTPR7TJndoYWtt86QWJH0D/fPJV3VI=;
        b=IP9vH7qkWEn6DL8kGqUkXrjWLWRTWTemodiUx6QQykI8ReQwRqcjDBHq4XRb6VvSQw
         jUCHmJcrJNn6qzxiXLbUeJ1IV/76kXlgBFkFYK0OywkFCQknQlOH3w2vUKM3TCLssNTl
         1JDCXl2mv66euyfGfNIP6sHJ5iXvhb7zk+6U6oyf4lJBqHBryjJA8GLwQquPs/1o+65T
         HDedr+/3lSMUkJ5XqW3yJOETNyjwNnX4JdchAVMZiB2ghm/GNnQ7eXBnRQDYv5RsNKJ4
         6sjY1SmDiGHA7hMPkqHAOSrl5XSdyVx1arZ5/qAZ0YA+D2b9Bs4coX1suY4OVmNM3cAp
         VhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VILz3wS2Bc4MzcTPR7TJndoYWtt86QWJH0D/fPJV3VI=;
        b=ISHSwwv7fjEt72hL30e4EinTAblYhcJx0Xovwt/9lKmlfKeBlZlB8c58sYb71x1Hfq
         Bv3mrniOteu7depqI8gIxXNmMmsrHVSrpj5VzpoHmRTMfrbSh7iiDtPliJW4o0GsSgAP
         3w3NcbvvDLtEq34KWogbtIVEmJGE/ra6tfWUKw97zBYxVGmQW9Dfg35mk5dj/erxisyC
         eCG6/0kknOh6NiQjJbWr9QcoWOy77nwXyvrmCGnQ48+Mlu7sH7UKf7dLvkuveSye0bf9
         STq63dq7A98MTnqt266KJXgnYiXGxptfIkh7zwVCrAh5rrBf2zo9FnKjG6UPcuHbOfoK
         aUbQ==
X-Gm-Message-State: AOAM533LhiCWZMLgI1CXio8DRVub5yfuvVydosfWgoNNq73B/m6X2Xun
	vkONALYXJbx7VOahQgOxOFDX6BRyDo4A9u9D
X-Google-Smtp-Source: ABdhPJz3i8nXIjpl3+L05lqyLGJvii8GXHNvTFVNeOb+wYL0sUOHzs8NRfd/cgYZ7pqyC3yhcFoEHA==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr34816220wrm.221.1617118968878;
        Tue, 30 Mar 2021 08:42:48 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:bf7c:ed85:7b13:75ef? ([2a01:e0a:1b9:3e10:bf7c:ed85:7b13:75ef])
        by smtp.gmail.com with ESMTPSA id l6sm32495695wrt.56.2021.03.30.08.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:42:48 -0700 (PDT)
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
 <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
 <167128A8C71457FE.21770@lists.yoctoproject.org>
 <20210330153638.xgbtnl7zenp36wb5@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <6c5e096e-d376-c053-f097-f5fd7ee56ade@linaro.org>
Date: Tue, 30 Mar 2021 17:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330153638.xgbtnl7zenp36wb5@qschulz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/30/21 5:36 PM, Quentin Schulz wrote:
> On Tue, Mar 30, 2021 at 05:34:00PM +0200, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On Tue, Mar 30, 2021 at 05:27:41PM +0200, Michael Opdenacker wrote:
>>> Hello,
>>>
>>> On 3/30/21 5:19 PM, Michael Opdenacker wrote:
>>>> Thanks in advance for your reviews!
>>>
>>>
>>> Sorry, I missed again! When I sent the e-mail to myself, both the cover
>>> letter and patch were on the same thread.
>>>
> 
> They seem to be on the same mail thread in my mail client, not sure if
> anyone else than you has the issue?

Looks fine for me too.
However please avoid cover letter when you have just one patch. You can 
add additional information when you send one email, if you add it after 
the commit message (after the ---), this will not be used when applying 
the patch.
	
> 
> It is possible your mail client is confused because git send-email will
> add yourself to the recipients (since you're the author and added your
> SoB), so you might receive the mail twice, once from the mailing list,
> once "from" git send-email (your own mail server reading the recipients
> basically).
> 
> Quentin
> 
> 
> 
> 
> 

