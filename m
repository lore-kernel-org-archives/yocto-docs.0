Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AC6CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:33:50 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.223476.1697560423277751974
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 09:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rY52esX4;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41820eecff2so40718271cf.1
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697560422; x=1698165222; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3KzOcVOfFFyzlLysX568CVrYM6olVcLoLQosTxw/XU=;
        b=rY52esX4HrHclkNR1hNAQFZglJCHhjTIBMCY0xpsh4va9qzJeOREGDDIwjhuLCyUpb
         Odpj8i1OMChT/Q+nuPbDW8x9ZQoQMtuK3AffkIski3SE7jLBMn5mQkWLeXabZw8pwZGm
         AyMtguuq/j6X3DZ5p2rEmKBj2Tl6s/9LFPAPM2V/6Aj8stdzHVF5BHmDjEBCyo5YDlP6
         QhnaWIYHcltniqST3xC4DqM7/gfCLGctXniSH8V2J82FuxMDb5FpwMGqgf49CABLXBna
         IvOtxRFdL5j6WoHNfRUTUJNEgW1Lf4CqLZPNeuEwB+6DNfiU0T4onPyfqJXPyRXrrcae
         xYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560422; x=1698165222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3KzOcVOfFFyzlLysX568CVrYM6olVcLoLQosTxw/XU=;
        b=LmY5GPURCoAqZYokXtVM0nqqxab+5im9TrD0mRYNic/gCx6+0br49g/B5KbDFL15xD
         L2Umsmu0BMw6GOl1FzCAB/rzJ3NBELLFXP3+Rc/q49s+8Ufuu98Rrm4/FTKijSu4razq
         HSlSfLe9Q1stUBOcp0xuzLgyeD9Sw2l9hIJYv5F/Q9RzBhclwl22xurJK6jjHJP9lUKd
         gfHCDOOAvHl6BiC3a1HLOgWinFUveK25uWHtHnxXSwjME78jEutGgwf5FUFOIeqNW5PC
         u03hp1udDRYryqyviT3dScWczlYK8dFU/BnMAYTVj0wzzJjiKtLJGlRK08PfLJWgBDCR
         3T7g==
X-Gm-Message-State: AOJu0YxBOX3+JrWE7WahERe1mAwI1vwLcyyfWwW3moN+sAbUxGjVmjov
	QHZFra+/d2CDKP8jqlX61bdQAw==
X-Google-Smtp-Source: AGHT+IGeYZXS7raxSnL9z6mHVKufqzDHg+uuyLzFfAS3IjZ4KqdJllJJA+8KcdcxAI9eygf76fypEw==
X-Received: by 2002:ac8:5887:0:b0:415:15bd:94d2 with SMTP id t7-20020ac85887000000b0041515bd94d2mr3333385qta.43.1697560422175;
        Tue, 17 Oct 2023 09:33:42 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id fu7-20020a05622a5d8700b0041a6fb444f6sm743772qtb.86.2023.10.17.09.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:33:41 -0700 (PDT)
Message-ID: <aea9f4b5-fc7e-ff5f-eb90-05d6b757b0f2@baylibre.com>
Date: Tue, 17 Oct 2023 12:33:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [docs][PATCH v2] contributor-guide: add patchtest section
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20231017133826.2248800-1-tgamblin@baylibre.com>
 <4a7c5f11-c883-4113-a472-baae4ba09872@bootlin.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <4a7c5f11-c883-4113-a472-baae4ba09872@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 16:33:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4406


On 2023-10-17 11:52, Michael Opdenacker wrote:
> Hi Trevor,
>
> Thanks for the update!
Second patch sent.
>
> On 17.10.23 at 15:38, Trevor Gamblin wrote:
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> v2 moves the patchtest section to before "Sending Patches via Email",
>> cleans up some confusing instructions, and improves highlighting to be
>> more consistent with the rest of the guide.
>>
>>   .../contributor-guide/submit-changes.rst      | 34 +++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/documentation/contributor-guide/submit-changes.rst 
>> b/documentation/contributor-guide/submit-changes.rst
>> index cda2d12d2..8a300c366 100644
>> --- a/documentation/contributor-guide/submit-changes.rst
>> +++ b/documentation/contributor-guide/submit-changes.rst
>> @@ -279,6 +279,40 @@ Here is the general procedure on how to create 
>> patches to be sent through email:
>>      If necessary, rework your commits as described in
>>      ":ref:`contributor-guide/submit-changes:taking patch review into 
>> account`".
>>   +Validating Patches with Patchtest
>> +=================================
>> +
>> +``patchtest`` is available in ``openembedded-core`` as a tool for 
>> making sure
>> +that your patches are well-formatted and contain important info for
>> +maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
>> +tags. Once you have generated the patch files and run ``source
>> +oe-init-build-env`` to initialize your workspace, you can run 
>> ``patchtest``
>> +like so::
>> +
>> +    patchtest --patch <patch_name>
>> +
>> +Alternatively, if you want ``patchtest`` to iterate over and test
>> +multiple patches stored in a directory, you can use::
>> +
>> +    patchtest --directory <directory_name>
>> +
>> +By default, ``patchtest`` uses its own modules' file paths to 
>> determine what
>> +repository and test suite to check patches against. If you wish to test
>> +patches against a repository other than ``openembedded-core`` and/or 
>> use
>> +a different set of tests, you can use the ``--repodir`` and 
>> ``--testdir``
>> +flags::
>> +
>> +    patchtest --patch <patch_name> --repodir <path/to/repo> 
>> --testdir <path/to/testdir>
>> +
>> +Finally, note that ``patchtest`` is designed to test patches in a 
>> standalone
>> +way, so if your patches are meant to apply on top of changes made by
>> +previous patches in a series, it is possible that ``patchtest`` will 
>> report
>> +false failures regarding the "merge on head" test.
>> +
>> +Using ``patchtest`` in this manner provides a final check for the 
>> overall
>> +quality of your changes before they are submitted for review by the
>> +maintainers.
>> +
>>   Sending the Patches via Email
>>   =============================
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Happy to merge it in "master-next", and to have it merged in "master" 
> soon :)
>
> Any plans to backport "patchtest" to Kirkstone at some point, so that 
> we can have it in the Kirkstone docs too? Otherwise, I can still 
> mention the tool in the latest release anyway ;-)
I think it will only apply to the latest and future releases, because it 
relies on some new recipes added in meta-python that would not be easily 
added to old releases (unfortunately).
>
> Cheers
> Michael.
>

