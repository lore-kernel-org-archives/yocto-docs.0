Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2EFC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:03:30 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.3656.1668002602343952530
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 06:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H3h99MKQ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id k2so46948696ejr.2
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 06:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3pBVphmjiAeQ9215Fw5ze4LiuGm4YXZVDDQauGsHYk=;
        b=H3h99MKQf/bmMC/b1cNdYa4ZsjB9FzU+JLguv/PMvFmjf4JLT7f3KwV9oSUGbnecqM
         cygJtsrcnjfVjsg0tocOgkk7mr5RxywD0GSFG7ziy3TOY4dadzdwhZMQw7BWFyDNr6dk
         lheMfB4JgGgeyiTcZGJ04v2OzLB4DItNB+FFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i3pBVphmjiAeQ9215Fw5ze4LiuGm4YXZVDDQauGsHYk=;
        b=xYq9DOXL3UV+VGthGYj5hXnVISasKk5HnSYWXUdNPFWf2wPqM83zYi/a6EbiqNUyfy
         ilVH5IGoa/zN6lCKGzqN+g+NoYEDCYEp5ogQdvdHHlNApSQlrg4+2L6aHvErIotsek7F
         ItjFTqQ0fjAVTxcHOOxEsD+de62ktuKKrkVOh47vO661+NF2HQCnTKn+1PVNJv0FNW0D
         FCI+vFM4YMdLIOxe9Tqu0v8RGqa/I+UXCKD7vtg16vfB3Nbr+21JIojkmZREA2fAQS3Q
         sLwiyXrPhfMfwZrJ6VwsuySYXsA0xTMRIT4yqq5fTgB06MEb6PqewqsAPuDB8X5gJ///
         Ygzg==
X-Gm-Message-State: ACrzQf2iRXcjAGpFnzv1KFztbMJgY2IXXhPXQollmIF4Mo6IF+k3XDy7
	gGnOe0IQknXa7pMjL0xYwquk5g==
X-Google-Smtp-Source: AMsMyM4C3xhD30LQuW7Qrphhv5A36kwfKnJVelnhOM/jebkd1MtnpyQ0WnWValEa7vI3SwnGr85a6A==
X-Received: by 2002:a17:907:86a8:b0:7ad:988e:a93 with SMTP id qa40-20020a17090786a800b007ad988e0a93mr60268776ejc.704.1668002600195;
        Wed, 09 Nov 2022 06:03:20 -0800 (PST)
Received: from [192.168.10.72] ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id hp20-20020a1709073e1400b0078d3f96d293sm5984580ejc.30.2022.11.09.06.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 06:03:19 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------sPghFjQkSuQ0nDr4PRHKkKuG"
Message-ID: <2d279cb7-6a93-4b42-8ca5-64a4e14d5155@konsulko.com>
Date: Wed, 9 Nov 2022 16:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH] qemu.rst: audio: reference to Command-Line options
Content-Language: en-US, bg-BG
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20221109115018.16086-1-atanas.bunchev@konsulko.com>
 <65858fd2-0b98-a736-42b0-be168e99c842@theobroma-systems.com>
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
In-Reply-To: <65858fd2-0b98-a736-42b0-be168e99c842@theobroma-systems.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 14:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3482

This is a multi-part message in MIME format.
--------------sPghFjQkSuQ0nDr4PRHKkKuG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Quentin,

I tried to use reference initially, but I couldn't get it to render 
properly in my github clone.

If it renders as expected in the documentation, i do approve the 
suggested change. Thanks!

Cheers,
Atanas

On 11/9/22 14:12, Quentin Schulz wrote:
> Hi Atanas,
>
> On 11/9/22 12:50, Atanas Bunchev wrote:
>> The previous statement can cause confusion, because this is the
>> first time when the `audio` argument is mentioned.
>>
>> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
>> ---
>>   documentation/dev-manual/qemu.rst | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/dev-manual/qemu.rst 
>> b/documentation/dev-manual/qemu.rst
>> index 5a4a82ce6..4fcfd0686 100644
>> --- a/documentation/dev-manual/qemu.rst
>> +++ b/documentation/dev-manual/qemu.rst
>> @@ -125,8 +125,9 @@ available. Follow these general steps to run QEMU:
>>      -  This example specifies to boot an :term:`Initramfs` image and to
>>         enable audio in QEMU. For this case, ``runqemu`` sets the 
>> internal
>>         variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be 
>> enabled,
>> -      an appropriate driver must be installed (see the previous
>> -      description for the ``audio`` option for more information).
>> +      an appropriate driver must be installed (see the description for
>> +      the ``audio`` option in the Command-Line Options section below
>> +      for more information).
>
> We can use a reference here so this always is up-to-date.
>
> I can suggest the following diff:
>
> diff --git a/documentation/dev-manual/qemu.rst 
> b/documentation/dev-manual/qemu.rst
> index 5a4a82ce6..8f70eec10 100644
> --- a/documentation/dev-manual/qemu.rst
> +++ b/documentation/dev-manual/qemu.rst
> @@ -125,8 +125,8 @@ available. Follow these general steps to run QEMU:
>     -  This example specifies to boot an :term:`Initramfs` image and to
>        enable audio in QEMU. For this case, ``runqemu`` sets the internal
>        variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
> -      an appropriate driver must be installed (see the previous
> -      description for the ``audio`` option for more information).
> +      an appropriate driver must be installed (see the ``audio`` option
> +      in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options` 
> for more information).
>        ::
>
>           $ runqemu qemux86-64 ramfs audio
>
> What do you think?
>
> Cheers,
> Quentin
--------------sPghFjQkSuQ0nDr4PRHKkKuG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#ffffff" bgcolor="#222222">
    <p>Hi Quentin,</p>
    <p>I tried to use reference initially, but I couldn't get it to
      render properly in my github clone.</p>
    <p>If it renders as expected in the documentation, i do approve the
      suggested change. Thanks!<br>
    </p>
    <p>Cheers,<br>
      Atanas<br>
    </p>
    <div class="moz-cite-prefix">On 11/9/22 14:12, Quentin Schulz wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:65858fd2-0b98-a736-42b0-be168e99c842@theobroma-systems.com">Hi
      Atanas,
      <br>
      <br>
      On 11/9/22 12:50, Atanas Bunchev wrote:
      <br>
      <blockquote type="cite">The previous statement can cause
        confusion, because this is the
        <br>
        first time when the `audio` argument is mentioned.
        <br>
        <br>
        Signed-off-by: Atanas Bunchev
        <a class="moz-txt-link-rfc2396E" href="mailto:atanas.bunchev@konsulko.com">&lt;atanas.bunchev@konsulko.com&gt;</a>
        <br>
        ---
        <br>
          documentation/dev-manual/qemu.rst | 5 +++--
        <br>
          1 file changed, 3 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/documentation/dev-manual/qemu.rst
        b/documentation/dev-manual/qemu.rst
        <br>
        index 5a4a82ce6..4fcfd0686 100644
        <br>
        --- a/documentation/dev-manual/qemu.rst
        <br>
        +++ b/documentation/dev-manual/qemu.rst
        <br>
        @@ -125,8 +125,9 @@ available. Follow these general steps to run
        QEMU:
        <br>
             -  This example specifies to boot an :term:`Initramfs`
        image and to
        <br>
                enable audio in QEMU. For this case, ``runqemu`` sets
        the internal
        <br>
                variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to
        be enabled,
        <br>
        -      an appropriate driver must be installed (see the previous
        <br>
        -      description for the ``audio`` option for more
        information).
        <br>
        +      an appropriate driver must be installed (see the
        description for
        <br>
        +      the ``audio`` option in the Command-Line Options section
        below
        <br>
        +      for more information).
        <br>
      </blockquote>
      <br>
      We can use a reference here so this always is up-to-date.
      <br>
      <br>
      I can suggest the following diff:
      <br>
      <br>
      diff --git a/documentation/dev-manual/qemu.rst
      b/documentation/dev-manual/qemu.rst
      <br>
      index 5a4a82ce6..8f70eec10 100644
      <br>
      --- a/documentation/dev-manual/qemu.rst
      <br>
      +++ b/documentation/dev-manual/qemu.rst
      <br>
      @@ -125,8 +125,8 @@ available. Follow these general steps to run
      QEMU:
      <br>
          -  This example specifies to boot an :term:`Initramfs` image
      and to
      <br>
             enable audio in QEMU. For this case, ``runqemu`` sets the
      internal
      <br>
             variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be
      enabled,
      <br>
      -      an appropriate driver must be installed (see the previous
      <br>
      -      description for the ``audio`` option for more information).
      <br>
      +      an appropriate driver must be installed (see the ``audio``
      option
      <br>
      +      in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line
      options` for more information).
      <br>
             ::
      <br>
      <br>
                $ runqemu qemux86-64 ramfs audio
      <br>
      <br>
      What do you think?
      <br>
      <br>
      Cheers,
      <br>
      Quentin
      <br>
    </blockquote>
  </body>
</html>

--------------sPghFjQkSuQ0nDr4PRHKkKuG--

