Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.6252.1622196237665182120
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=cIafo2c9;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so4238536wmk.1
        for <docs@lists.yoctoproject.org>; Fri, 28 May 2021 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xU4q97hcI30jqni9Tj19AFBX7WTOLvAJveTfxOtRQQ0=;
        b=cIafo2c9WwMI1tRJnJ6Ve0ms75W32JdRY1UPRd0N2+pc6JnKOD4ld6JoBJO+/MizMB
         sZP8e/s735TRdk97NM9pB1UaNvUwmUrwkYtbaTtGUNolzSI5/tfGwdUJkEF9DmqW+JZ1
         CkpyLXDM0k/NnC9ijU9VJyMudxfOy9zX0lUk6tJV09asOTMlwRgwJ8a+VqCc1CSAiq/W
         0X+gfIN963ek8GUXACxvyG8wdQtpXbI/oWN8hFYMeoENCl0L3/cQqfiTi2B8iIw7UNF1
         oRyAmKOfF5zojIjEYAhGrsYCd89XW/i6pVUhE33QKYy+JYfVhXZOR+ulPsFpu39mqjse
         pl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xU4q97hcI30jqni9Tj19AFBX7WTOLvAJveTfxOtRQQ0=;
        b=mcQj9ON+/oL9X0kevo/EXLTaW8CXfbk8zyvB3/n1YSIbpVT78WAPw4HROmPBjqpf9e
         JYwoAkpduk6+jOuN4tSS2d7X51iPyjuwsmysPVdcDIOO3QDBuNj/ZUxgkpl4PZyHMq/r
         NLstCwccjT/2AV4Kq58AIFaJ+F/VEY+QA1ccH3/A9hipQLZZ6oOyySGO1RLbEQwYKRTq
         bRyuxigwsXE5Cb9VFNim4SxfTJxeWy0/i1OFl2aUVSe7EiEKaVpIE1ntE3ArwyeP/J6/
         XxhBnwqVDhl1rtcP2Ek5T8xpvXQXnIFU6ZadXNCHFZkkZJv76Ll5TrqphTm3YASDtMy3
         jo6g==
X-Gm-Message-State: AOAM5330JzssJeWZRPEmrs83ygtnsHYV1qyTr2rpsTkrt4P0SvzrLzEp
	chaAaEAmjo9dZbD7hhoQGqVHro6WldosTC6KepjWtg==
X-Google-Smtp-Source: ABdhPJx+UySLUDMc1YoyKpgDK0Kt2OzGa1ClkmJ4S+5i3X9wDSO+2h6bSKQ+rIfcKlqc55PCWb1FcyBCFNLn3/i4DsI=
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr7508404wma.171.1622196235925;
 Fri, 28 May 2021 03:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210526145910.3930141-1-ross.burton@arm.com> <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com>
 <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org> <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
In-Reply-To: <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 28 May 2021 11:03:45 +0100
Message-ID: <CAAnfSTtvb9B19W7GjJwpzjsCo01-fB++_AF8x3nPutOwjyUoZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 May 2021 at 10:40, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
> This makes me realize that the XZ_ variables defined in bitbake.conf
> don't appear anywhere in the documentation.
>
> Would it make sense to add them to the documentation too, or would it be
> overwhelming to document all possible variables, which default values
> should just work fine?

This should most likely be documented, albeit maybe only in the
reference as it's not really a common tweak.

Ross
