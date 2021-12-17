Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D90C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 06:05:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.3130.1639721109573100804
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 22:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=geIRtfLu;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r17so1641320wrc.3
        for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 22:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=u+ptm4mk2dm5WdoY8YKzJp4QubJJKGebBeGHzXZnaBE=;
        b=geIRtfLuOw3e2maR1mOem3QitFIIvPRRvd/wo+VA7sVBdzAWgc1CJR9AlZqIAz2rfv
         nteP7VxjZY9Prm6hwQ6QF0qMKRoHGyxK+VkB+IZNwA4yWF8KIWrA0qgKpzOuTHmBuF/l
         yaU+zW8wuRB93HlRxVM4v6IxTdRcCg8IlAb2SjJfh56CYF89XUmhd+EmaEVJAoUpDrzU
         PvmHNKQmCe934YGA90bhaEzxd+0vCU7v89wCcA7EddU8kDvreANpwipVqeRq91SuBC3O
         A4UhcQLgqzoJpGbKzKphN+3TMr2U70WmgcvVBIHl+g3BKC8PqAu5ZM5A0JgeIbkfdC3o
         ufqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=u+ptm4mk2dm5WdoY8YKzJp4QubJJKGebBeGHzXZnaBE=;
        b=ozu+dc9YF89GM3maLAYEdwIsZh0jthFDL0FNjvWppwcCE9VBrvptlGsa0EgPd7nAkR
         HBP76Rqe8F+RH0FQHt7v6OxzaJfb8nVrBmbEO88zDZ6XDkvzhoqxxoxXd0mRSADre/XY
         jYuWnrJVCheVm92r8tQYYbPgQZov1NK/1/In+FZfP+K3j3yjaE0wHmlBtOZ0RlYvHgt/
         GRHnKGEwgFxxnEZNixcDmnj3HYIw9a0DtoOlynnhkGa5qAkqA2iOvAmq2usY2T0jRSZa
         PQzPyT1mdsY2Co3QkdYmIe/QOvFTJZ09qUZOmhTCxX46sU3xNG47B/NblgRlLyrj0IGx
         mZqQ==
X-Gm-Message-State: AOAM533ncOi0jkJxAVHiPJS27a+rKCiKjuI0g/prqHXqn3goC9JNV4bc
	9nwAAfRoP/Abc58h3ZFYVis=
X-Google-Smtp-Source: 
 ABdhPJx7tiZHMs/RFxY8xmnxBDNSGQS8CAoR3XEDU/xgYQPTJxg/R7htimmUOzXJbXia5KEGZn5wug==
X-Received: by 2002:a5d:434f:: with SMTP id u15mr1139281wrr.492.1639721107805;
        Thu, 16 Dec 2021 22:05:07 -0800 (PST)
Received: from [10.133.223.13] ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id
 c8sm7468901wmq.34.2021.12.16.22.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 22:05:07 -0800 (PST)
Message-ID: <768e04dc-feb7-89f6-9465-b1ba61753e01@gmail.com>
Date: Fri, 17 Dec 2021 07:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH 1/2] ref-manual: add overlayfs-etc class
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211215171138.127272-1-uvv.mail@gmail.com>
 <C97BA46D-92DD-4A26-871C-D0991A67E1E8@0leil.net>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <C97BA46D-92DD-4A26-871C-D0991A67E1E8@0leil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 06:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2298

Hi Quentin,
Thanks for the review

On 16.12.2021 18:37, Quentin Schulz wrote:
>
>> +
>> +  OVERLAYFS_ETC_MOUNT_OPTIONS = "wsync"
>> +
>> +The class provides two options for ``/sbin/init`` generation:
>> +
>> +* Default option is to rename original ``/sbin/init`` to ``/sbin/init.orig`` and
>> +  place generated init under original name, i.e. ``/sbin/init``. It has an advantage
>> +  that you won't need to change any kernel parameters in order to make it work,
>> +  but it poses a restriction that package-management can't be used, becaause updating
>> +  init manager would remove generated script
> What is the default value? This needs to be explicit otherwise it cannot be "undone" in a bbappends for example.
>
> Thanks for the patch,
> Cheers,
> Quentin

Could you please elaborate on default value of what we are talking here? 
For mandatory variables there are no default values, for two optional 
variables the default values are set with ??=.

Cheers,
Slava

