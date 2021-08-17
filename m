Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.39328.1629208075723408430
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sQyF4B6N;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id i9so20751340lfg.10
        for <docs@lists.yoctoproject.org>; Tue, 17 Aug 2021 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VZAoM3CL5kcW6mw9BEhu40783y6T7ElIByuuSTRMK/Q=;
        b=sQyF4B6Nb4iR3KJ7UujEpkJl6VF1g0hnPDmTPwsbYpjQLuIMVl/o+lrqaupZt3IlOY
         ddSbpAg+UKVXoFCHx6/0lKW9RsVueKLkE/xVMluSVnvWMj1EqZAKEnpen8qTXKiPI73q
         s7dUCjUPswvUVGdP0JY6LVZR0agrVN2DekCCXowz6oYblxr36ci2cW4kwrULTEUSZugN
         D475CRE1H4wujAsstuWt2+fJtXzWt/2sYIplr2UyLHNnHic1wfE9z9bP4TNYHrchwE8J
         8KLU6htbNfE/OUFtWxR1L3bOG0jg5CuoJZ2qpp8Npvz/bdCUjlbq8cxd236m8oHUbSvi
         /DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VZAoM3CL5kcW6mw9BEhu40783y6T7ElIByuuSTRMK/Q=;
        b=DQCasUACnNI3KlPshCVErnlqAyj8jOuWjfjEYZR9k5TJWI1SkZGUdKLxBTwR1m/6o6
         XUtbpllk/uNnbuQpp98TMnuLZ9CFQZLTop0fWWm26oEpY3sSj7VGAz7eNY5KoAqVxQAc
         Rfazg7bM8E8o4NJEGxD5Y+uNRI1poEfXdi8IPTGfPkZCpCex3byzw+isUkd1fC4L9T0U
         UKwP2QUvgnF+7WqqN2U6TqFf6rMUHislLlhRfAFkwCdTRV0gOJ/zJVyu1TRg9RbadPLv
         Ykyn6a6pQzBM+jmsneykPOl3rIa4g+DnWZ2bWzq1hMCv8I7wN4Mam+gdxBcUz783N98n
         JZfw==
X-Gm-Message-State: AOAM532MdsQbvQcFDsh2E3J0UBj9vb4IpCn0wG4Knx0vWuSnQTS2vTd5
	Kp1dn3syGAtPaxV3+m0DnpeHCZokbDCuNQI7
X-Google-Smtp-Source: ABdhPJxr0Amffw1cRpZq0QUChxbRl9sD8arrAQtQfizBbUgs4Jjvw4yNt8jFP5i2l+VX9T4qW8F95w==
X-Received: by 2002:a19:c7c4:: with SMTP id x187mr2477321lff.432.1629208073640;
        Tue, 17 Aug 2021 06:47:53 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([185.253.97.10])
        by smtp.gmail.com with ESMTPSA id u13sm214673lfm.20.2021.08.17.06.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 06:47:53 -0700 (PDT)
Subject: Re: [docs] [PATCH] ref-manual: add overlayfs class
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
References: <20210814042825.124630-1-uvv.mail@gmail.com>
 <20210816091427.25cqk6kx3mnoyua5@fedora>
 <CAKHfEaj4P2L7g993rqnQsuX5z42tKP6zZm7pznSESY9JtDbXMA@mail.gmail.com>
 <20210817083742.iddx2fmqmlwy7b2t@fedora>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <cf0115e9-53fd-14fa-8313-879cf655005a@gmail.com>
Date: Tue, 17 Aug 2021 15:47:50 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817083742.iddx2fmqmlwy7b2t@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin

>> That means I check only that file exists in QA check, I do not check
>> whether it's a valid systemd mount unit (to avoid additional dependency on
>> systemd-native recipe).
>>
> I think what I was missing is that the QA check is actually part of the
> ROOTFS_POSTPROCESS_COMMAND variable. Therefore,  only the image recipe
> will do the QA check.
>
> I think we should highlight that this variable should only be set in
> configuration files OR image recipes. (or basically, say that it
> shouldn't be set in package recipes).
>
> So I'd actually add two notes:
>
> 1) Variables to be defined in conf files or image recipes (or say the
> opposite: not in package recipes)

Not entirely correct, see my other answer below.

> 2) Only existence of the systemd mount unit file is checked, not its
> content.

Agreed.

> I feel like OVERLAYFS configuration makes sense only when defined
> globally (conf files) or in image recipes.
>
> Just thinking out loud right now but couldn't we add the following in
> overlayfs.bbclass anonymous python code?
>
> if not bb.data.inherits_class('image', d):
> 	bb.fatal('Only image recipes can inherit overlayfs.bbclass. %s
> 		 is a package recipe.' % d.getVar('${PN}'))
>
> or something like that?
>
> What are your thoughts on my remarks?

To sum it up:
- OVERLAYFS_MOUNT_POINT should be defined globally and _not_ redefined 
afterwards.
- OVERLAYFS_WRITABLE_PATHS can be used in any recipe (I guess not a 
package group though). It doesn't have to be image recipe, because a 
directory specified there can be application / recipe specific. For 
example, if we have a recipe my-app.bb and an application there wants to 
have a writable path in /usr/share/my-app, then it makes sense to set it 
in the my-app recipe, not in the image recipe, right?
- QA check is part of ROOTFS_POSTPROCESS_COMMAND as you noted before and 
is done as one of the last step during image creation.

> Lemme know!
>
> Regards,
> Quentin

Cheers,
Vyacheslav
