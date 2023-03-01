Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D001C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 16:48:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.28033.1677689270818003837
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 08:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=ga6fN3Ix;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id j2so13903048wrh.9
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677689269;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLOLcI//24ZwOPbkODfMEOO6KIBhqC7/b0KOq/D1u/o=;
        b=ga6fN3IxVNtu3lULL0HC2OnDY30sVsLCPoQzDizH5PupCmODpLyZP+2kE8FCrsWm7G
         oqgiqe6erYz14PrnLSDXb6gk+8y0IOI8pgyRdaLqV5gfc4Ce0e+dzrui5RhWJbVw9/J/
         yRiCAII3ca9cqwdjTP8WG3NOLeBA+zTwS/kXsUgZdVUukhKhqWNkZ3VWz1Vj3zz2F/8R
         yGYB6ELzp3BJk8e1jKXvA8NMAl/W7Vxkw0opAFVqCR0LZnq5/55V5egANhvGaqRTdEeJ
         ovlb0lsG974Egnjp/ZmIVhMZzvtTAUBXeqDJm3EWFEuo0LOu1fwwetPD8G+ZI99jjBeg
         BZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677689269;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLOLcI//24ZwOPbkODfMEOO6KIBhqC7/b0KOq/D1u/o=;
        b=x/UppSVU4UrY6u85q+3IeKitTKGQXMnU+F7j9dlfP1VanOsD8eq5guccOh0SGGd1tX
         qjB8BWDu0pZsziSuOzTB228RWS3Ak8TSN1mshLYWC6grT3Pd9QJ0kGwUF/JyCmBrk8Ei
         HNRCRhS7/2fl9/WAZoZr6GJzjc1R5n8QHQH3ZRYZnglq9DQTARJBmjmGYMwmJtIgVIsr
         ae/XA2MmHH6hvX+QtayyMRVi011phuupesLJP7WPfoz5wjW6mqch+F51CukU/BbJClcl
         WqJG+yC+ZyHpyHBWuMA/Hg5LID9JEmcgYvPpVOYt2onVMiFRJpm1Ui6D6z89EDuPv3eW
         dAHQ==
X-Gm-Message-State: AO0yUKVu9vhcFhXQLI9QSH1dApZ6GmRiu3SbQIbgjewTH22oQy8uiZQh
	/sbbK4jGGTpYEqR+2EePoc70kA==
X-Google-Smtp-Source: AK7set/3r9o+CU/8CMrwzA02QuR0WZjn0JGar7WkO5QtkrzkWIDG9LIjUqCIHoyowHdJloHpm1JnKg==
X-Received: by 2002:a5d:6542:0:b0:2c7:434e:9a5a with SMTP id z2-20020a5d6542000000b002c7434e9a5amr5858273wrv.65.1677689268690;
        Wed, 01 Mar 2023 08:47:48 -0800 (PST)
Received: from [10.1.8.117] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id f3-20020a0560001b0300b002c70e60abd4sm13280694wrz.2.2023.03.01.08.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 08:47:48 -0800 (PST)
Message-ID: <23543f2d-9ae3-bc62-ca5f-8f86933f28e2@smile.fr>
Date: Wed, 1 Mar 2023 17:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [docs] [PATCH 1/1] ref-manual: Add info on "mixin" layers
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230228221309.82156-1-yoann.congal@smile.fr>
 <20230228221309.82156-2-yoann.congal@smile.fr>
 <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 16:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3769

Hi all,

Thanks for the reviews.

On 3/1/23 10:44, Michael Opdenacker wrote:
> Hi Yoann
> 
> Many thanks for the patch!
> 
> On 28.02.23 at 23:13, Yoann Congal wrote:
>> This is heavily inspired from:
>> https://wiki.yoctoproject.org/wiki/index.php?title=Stable_Release_and_LTS&oldid=84847#LTS_.E2.80.9CMixin.E2.80.9D_repositories
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>   documentation/ref-manual/release-process.rst | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
>> index 19e804063..cc464447f 100644
>> --- a/documentation/ref-manual/release-process.rst
>> +++ b/documentation/ref-manual/release-process.rst
>> @@ -97,6 +97,21 @@ through the same release process as do point releases. You can find more
>>   information about stable branch maintenance at
>>   :yocto_wiki:`/Stable_branch_maintenance`.
>>   +.. note::
>> +
>> +   In some circumstances, a layer can be created by the community in order to
>> +   add a specific feature or support a new version of some package for an LTS.
> 
> 
> s/LTS/LTS release/ ?

I will apply this for v2.

> 
>> +   This is called a "mixin" layer. These are thin and specific purpose layers
>> +   which can be stacked with an LTS release to "mix" a specific feature into
>> +   that build. These are created on an as needed basis and maintained by the
>> +   people who need them.
> 
>> The "mixin" layers are found here :
>> +   :yocto_git:`/meta-lts-mixins`.
> 
> 
> This makes me wonder about how official these are, though we said they are not officially supported by the project itself. Maybe we could just mention this repository in the next paragraph...
> 
>> +
>> +   Policies on testing these layers depends on how widespread their usage is
> 
> 
> s/depends/depend/

I will apply this for v2.

 
>> +   and determined on a case by case basis. Note that there may be other "mixin"
>> +   layers within the wider community too.
> 
> 
> What about replacing the last sentence by
> 
> "You can find "mixin" layers released in the :yocto_git:`meta-lts-mixins </meta-lts-mixins>` repository, but other such layers may be released elsewhere by the wider community.> ?

This is better, I will apply this for v2.


> 
> Thanks again for this patch.
> Once this one is merged, we need another pass on the page, as there are obsolete and missing details. LTS releases are not mentioned yet, and other releases are not supported for one year any more. I also saw some links that should be updated.

Agreed,


On 3/1/23 10:54, Richard Purdie wrote:
> On Wed, 2023-03-01 at 10:52 +0100, Michael Opdenacker via lists.yoctoproject.org wrote:
>> On 01.03.23 at 10:49, Alexander Kanavin wrote:
>>> On Wed, 1 Mar 2023 at 10:44, Michael Opdenacker via lists.yoctoproject.org <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>>>> This makes me wonder about how official these are, though we said they
>>>> are not officially supported by the project itself. Maybe we could just
>>>> mention this repository in the next paragraph...
>>> They are not official. Official things get tested on the AB and
>>> breakage blocks the changes; these layers are ad hoc, as is.
>>
>> Right, but it was the wording that was giving me this impression.
> I think we need to make it clear that we've gone as far as hosting
> things to give a common place for people to look/share but we don't
> currently offer any testing.

I'll make it clearer in v2.

Thanks!

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

