Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.14341.1629052449017340020
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Aug 2021 11:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBQqLjjb;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id eh1so499967qvb.11
        for <docs@lists.yoctoproject.org>; Sun, 15 Aug 2021 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U8ZS6vKZ7re5NEkfwsA3QiGz6FTIrAKXQzjN8hGJPEQ=;
        b=OBQqLjjbH6VGF4HI299Gfktui1yERAc1NehIDfFJBY3yJHodhJXJusLbSSSTl07TWs
         dfCG+yYqV7ekzB65o//+98oG0UsfNr6qpYklRCpYN3yl+eu2Bstrk74hLzVnLftxKSl8
         9YpVRvFEfeExxbahJ4lsrU8FzNbrjN/VMKcXI7RYv51tJtb2anHEjsjD3uHNRxbXLEaS
         PIOyWYdXiKsS2Jk5H7jzFtCB87qvg9jcIy8V9swuz4xAUIP+MbJTFcCQ33YS2yg5uaoN
         NhEzvzx6twoooELM5ROfbKZ1wbZ+yWKi0NldYcE6M7X6We2Xep7+viF/OjY//lQMfOOT
         jX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U8ZS6vKZ7re5NEkfwsA3QiGz6FTIrAKXQzjN8hGJPEQ=;
        b=bvIqPCqMhRAZb6adJrN1qrlaFENn+n4lR/BocAHyByCfxTleCyp4fF7ShaNpATWVrz
         2SNGaeLqv2UL4v50kUF6rGOgOuSqXVs4jcXB+h6s/OipZPx4SBJq5DTaYsLHbIMITSKs
         W0uLSUy+mPWh6xcTXFH2tWF1OUSJFrW+/9szmuqXbQlkIVsRqFCHOS008q7FCWSfSwse
         nzS+t6YzSqE9sqi+RjnHD2m51UcfTivehW7P5NCJBJJ9xMQNF9HSYU61YXJV4P2qxfji
         WaehRACcmTzebgXgmx0gfF1JiLfss0G7148FBD14zQ6rOnHFzWHv0rRGvN8hcbeC7BJG
         Xw1Q==
X-Gm-Message-State: AOAM531JmA2Z89HDA1kJZMRJf2IswLcl0YWqjIuInHjw2UgbjyMbF1wR
	L7KwSDmw1yiAvqYZvemt9D0mH+VlGDsZ+00joFs=
X-Google-Smtp-Source: ABdhPJwH07OPypzy67dqS5u1x674qPnzpLbLaFeux+ST0Du7DbcPjylFxxFhAdiy37Vnm1zGF6qGUzqxHXAnI/8lExs=
X-Received: by 2002:a05:6214:291:: with SMTP id l17mr12843771qvv.50.1629052448058;
 Sun, 15 Aug 2021 11:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <b94dc1e7-9ba-58c6-9236-9c89cf23f83@crashcourse.ca>
In-Reply-To: <b94dc1e7-9ba-58c6-9236-9c89cf23f83@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 15 Aug 2021 11:33:42 -0700
Message-ID: <CAMKF1srSBN4kOK8=huWg4Vnxz3GG2PMnx6Afc34LEtbUw5g4Yw@mail.gmail.com>
Subject: Re: [docs] first of many questions on wic and associated documentation
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 15, 2021 at 11:16 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   as i am just beginning my adventure with the current wic
> documentation, i suspect i will have many questions, so let's start
> here:
>
> http://docs.yoctoproject.org/dev-manual/common-tasks.html#requirements
>
>   first, the docs imply that you have to manually build some packages:
>
>   "You must build several native tools, which are built to run on the
> build system:
>
>   $ bitbake parted-native dosfstools-native mtools-native"
>

I think this perhaps can be omitted.

> except that there is a "wic-tools.bb" recipe that appears to handle
> that, and i'm going to assume it's called as part of the wic
> processing, so that the doc seems a bit over-ambitious in what it
> needs the developer to do.
>
>   and right below that:
>
>   "Include the name of the wic kickstart file as part of the WKS_FILE
> variable"
>
>   except that makes no mention of the WKS_FILES variable.
>
>   thoughts?

maybe WKS_FILES should be better documented as well.

>
> rday
>
> 
>
