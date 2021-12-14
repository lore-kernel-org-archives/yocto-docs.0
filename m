Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C71FC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:27:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.24424.1639481266735705445
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=E+OoXHHw;
 spf=pass (domain: burtonini.com, ip: 209.85.128.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f51.google.com with SMTP id 133so14028030wme.0
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j5LYBjI+eQ51/s0STdVgirfWw9QxSOyUHqLN5zbkjM8=;
        b=E+OoXHHw3Aawa+vXJVAQ+gECHBbpnOUZ1OdGTBZEiCLkOB74CEe1oA4ZbMYg8zf/8N
         xQcg3AgGQjpqPnxM4Sul9mAkUwgmMBtGwXnS0/AjnEvAc0TuoPhd9SUyjqvoeuIrrT9M
         wZYwnYVYZqgUuQNqNehfOZhsnDOhOzwBLBL9AN4sAC4eyKb7VFbki5E43q8ULoQ4RNqE
         csi1pyhhK+l5YF/bh1YHA4qCCRr7VbYkmjKoS1DK6DfAn1jlfrq5Zvd9x5pBUhhdDXML
         xF1ebgJZI3yZKhaw3F+k59lsh1+mfw/afDhaYGhvUPWcJTzd3fiJK04dI8Bx2n4E9WXA
         skVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5LYBjI+eQ51/s0STdVgirfWw9QxSOyUHqLN5zbkjM8=;
        b=DbHBlP5vFbXP3BBikg4LOwpjXFVfAF/Jin+5fK7I5ojYaX+/FyJUHrWICfEgI4IFkY
         6JjGiUQIcWbW5b7pOc1tj++/gvUHvAkoGhUPqXeM4n4nN5Q2nxyu0xizrVZ0XVdRE58H
         oIvSqH6LzdoQpZkHsovqnv7zxbkgRvuTBz/b7TIQrhRFYMKFfIorm+TYnWDOieKR7HS9
         itSzWwcDTC0gi3MtvIhQWS+u0LueCmA/rdXMS9JoxeRXZdudhn02hT9YmLCvHLxm+6ER
         6iXBILNzUCWvgK+yIflzQd3FpBVXIIWEebuGbod+CQSzEuqS576YpFhH7UhXsgozU2+E
         eRWQ==
X-Gm-Message-State: AOAM531bUjndo3h68REUgDhZSHt6l8mVLiQ3ZuyvgLbs6W7Vh858HRz1
	cJq9fCKKP7ETB2sAfLqt3Wkcd4D38ih+lWrKjNCLlg==
X-Google-Smtp-Source: 
 ABdhPJxh3wwtBIgWyWU+bNd3YiYdpjBrxxvZm5Fcx9eKYmscyTGA8FIz6mzmXyW2VfvkY9SA5D4nxSN4PWYapZ0mAvI=
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr44831458wmq.184.1639481264755;
 Tue, 14 Dec 2021 03:27:44 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-jYhoRu8S6C=CmhiP7L+zgdG97fj4MmRQ-wRco2xWxZQ@mail.gmail.com>
 <AM9PR09MB46424D01CC5A6F489074FA04A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <ce0b166097c52942fefb8b93849ebff88a1e1ca9.camel@linuxfoundation.org>
 <1822eb65-af18-f149-7a6f-6f985bc6e72c@bootlin.com>
 <CANNYZj-_Uke6GqZwqziTdA48tWGwHvw=Wm_BGjvJKaS+5oqjQA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-_Uke6GqZwqziTdA48tWGwHvw=Wm_BGjvJKaS+5oqjQA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 14 Dec 2021 11:27:34 +0000
Message-ID: 
 <CAAnfSTt4ryodSOjJvVb0vSKCiurPUCt3D92uCd9GjBB9Mx6+=w@mail.gmail.com>
Subject: Re: [docs] [Openembedded-architecture] proposal: allow
 Upstream-Status: Inactive-Upstream in patches
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:27:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2253

On Tue, 14 Dec 2021 at 10:38, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 14 Dec 2021 at 11:30, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:
>>
>> Are you suggesting to expand the official Yocto Project docs on this topic?
>> Actually, I only see
>> https://docs.yoctoproject.org/dev-manual/common-tasks.html#patching-code
>> which explains the use of patches. There is much more content indeed in
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
>
> I would suggest you link to the wiki, but please do not copy any content, as it will certainly become mismatched.

I'd actually suggest the proper documentation is improved, and the
wiki page retired.  Wikis are great for getting something written
down, but if the proper documentation can have a chapter, then that's
even better.

Ross

