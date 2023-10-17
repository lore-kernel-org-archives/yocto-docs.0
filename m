Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C8CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:26:58 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.214673.1697549217202784259
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OUmcKR/q;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-419628fb297so36544811cf.1
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697549216; x=1698154016; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbGj3/W090tL1okYi+AHV2Z9+GXAH9fEFO1cuRfTmh4=;
        b=OUmcKR/qtuSLzNng7oej/uSgmXId0rlszyki3Q7v4POOOJXp2iOANuvEyRFgAlyG5Z
         1Vw2FkKKFIDdpg/GSILM4JerihY3AOFcpb4NVDMa4sQjtEJv531s74vAR/esFKYoddQw
         0+mqKhOWSMB4ArbGCwrPSyHH3Cw3pwALxb12/ImuCvx8/4YLKMubAbCnsJFRGdm2lQTE
         e8+XE9Z54lPDr4J+a3ArEFxELXBLSxV0vRiBc0RyEIHcami20sNVNw1OtNxZK41olrgP
         8eIY57q0wUEyw9oSQKo/OMrPWzp18HiD9Ud7cNQP6jqPw5NPpCQrsLoZ2xgOqC7pTq+u
         Nu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549216; x=1698154016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbGj3/W090tL1okYi+AHV2Z9+GXAH9fEFO1cuRfTmh4=;
        b=ND5AK3et03EWIvvdK8YyQ4wTVWASjEH8lOd35kYym0HATwRgkvzTV9ILNpyYqVvVjB
         wrk0KPzPOX+Z2j36TIhXMJrPU57UzL6vMlFtpyrgXz5F6kg6RSKZT8PLBZgXUYeaPI3i
         FE2Zu+n894lTuGnCiFINKMJkVaT8Hb96QanSrouJLhi4bU8nFjEtG+gtv6sAJTw9rO/a
         SkfDVQtk1AZvk4ar9t8nfkVPWGFFxd8FdJeLIQdYUHnGHr2xgcCZ3iYKnozduNhLRog1
         ajiYud2HHU/dnszB7mtvIGPODwmRziG33k5BUJN2q6DOQYZi8hntJGQcxJ3FF72WlV58
         10qA==
X-Gm-Message-State: AOJu0Yw1jYflEvmIhvvre3jE7Kl3LWfL92Tnbplojx5RGJxSrGpggK7S
	98Ki5XM290Eg/tfidNnCZo/wxICHFXz/KmfF3qnfyQ==
X-Google-Smtp-Source: AGHT+IGpOHvIfe4QB55uO4TcMrJnB1a7WShOJwcL6EDM2HyzVuEQocrjgGn5Sx203v+y9zMyOemrtw==
X-Received: by 2002:ac8:5901:0:b0:417:8eb5:2780 with SMTP id 1-20020ac85901000000b004178eb52780mr2490423qty.18.1697549216222;
        Tue, 17 Oct 2023 06:26:56 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8100f000000b0041b0b869511sm599869qti.65.2023.10.17.06.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:26:55 -0700 (PDT)
Message-ID: <41eccab0-0bfc-fb57-08ef-a895676ff9c4@baylibre.com>
Date: Tue, 17 Oct 2023 09:26:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [docs][PATCH] contributor-guide: add patchtest section
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20231016195549.2243243-1-tgamblin@baylibre.com>
 <390ad2ed-6989-4dfb-b497-d635d82c4734@bootlin.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <390ad2ed-6989-4dfb-b497-d635d82c4734@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:26:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4401


On 2023-10-17 05:25, Michael Opdenacker wrote:
> Hi Trevor,
>
> Many thanks for the patch!
>
> I have a few quick tweaks to suggest, see below...

Hi Michael,

I'll send some revisions shortly.

- Trevor

>
> On 16.10.23 at 21:55, Trevor Gamblin wrote:
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../contributor-guide/submit-changes.rst      | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/documentation/contributor-guide/submit-changes.rst 
>> b/documentation/contributor-guide/submit-changes.rst
>> index cda2d12d2..6dfb0ffec 100644
>> --- a/documentation/contributor-guide/submit-changes.rst
>> +++ b/documentation/contributor-guide/submit-changes.rst
>> @@ -401,6 +401,43 @@ Anyway, you'll also be able to access the new 
>> messages on mailing list archives,
>>   either through a web browser, or for the lists archived on 
>> https://lore.kernelorg,
>>   through an individual newsgroup feed or a git repository.
>>   +Validating Patches with Patchtest
>> +=================================
>
>
> Hey, what about having this section right after the "Creating Patches" 
> and before "Sending the Patches via Email"? This would make more sense 
> IMHO.
>
>> +
>> +Patchtest is available in ``openembedded-core`` as a tool for making 
>> sure
>> +that your patches are well-formatted and contain important info for
>> +maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
>> +tags. Once you have generated the patch files and run ``source
>> +oe-init-build-env`` to initialize your workspace, you can run patchtest
>> +like so::
>
>
> Here and in the rest of the patch, could you use "``patchtest``" 
> instead of "Patchtest" or "patchtest"? This would be aligned with the 
> way we refer to other tools such as devtool (see 
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n74)
>
>> +
>> +    patchtest --patch <patch_name>
>> +
>> +Where ``/path/to/target/repo`` may (for example) be openembedded-core,
>> +with the actual patchtest tests being kept in
>> +``openembedded-core/meta/lib/patchtest/tests``.
>
> Is this sentence relevant here, as "/path/to/target/repo" is not part 
> of the above command line?
>
>> Alternatively, if you
>> +want patchtest to iterate over and test multiple patches stored in a
>> +directory, you can use::
>> +
>> +    patchtest --directory <directory_name>
>> +
>> +By default, patchtest uses its own modules' file paths to determine 
>> what
>> +repository and test suite to check patches against. If you wish to test
>> +patches against a repository other than ``openembedded-core`` and/or 
>> use
>> +a different set of tests, you can use the --repodir and --testdir
>
>
> Use ``--repodir`` and ``--testdir``.
>
>> +flags::
>> +
>> +    patchtest --patch <patch_name> --repodir <path/to/repo> 
>> --testdir <path/to/testdir>
>> +
>> +Finally, note that patchtest is designed to test patches in a 
>> standalone
>> +way, so if your patches are meant to apply on top of changes made by
>> +previous patches in a series, it is possible that patchtest will report
>> +false failures regarding the "merge on head" test.
>> +
>> +Using patchtest in this manner provides a final check for the overall
>> +quality of your changes before they are submitted for review by the
>> +maintainers.
>
>
> Very cool, I'm excited to use this tool, including for documentation 
> patches ;-)
>
> Of course, I'll apply your patch when patchtest makes it to oe-core.
>
> Cheers
> Michael.
>

