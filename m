Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.18705.1584828241614236692
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 15:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c4hUoROL;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t24so5020819pgj.7
        for <docs@lists.yoctoproject.org>; Sat, 21 Mar 2020 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+76wJ1eEC318YGt0qih0jIIu/jaQ/PbuU+KzdctJGsQ=;
        b=c4hUoROLHeIgqk+8SP695yFg1HKsz/6jcKVVQ0dHaQyykiVVKug8oH2lgnT9ZiDyGm
         Zw6Za5i99HZAWC2w3/U6948CINXkpsokKOLD/UKQBbvZ+bV02X4y7FzjF9HevB2OihVt
         j3y1Du2cAqTckPhFgrRpXxB8y9tFn7nWfe2/RpwYbO+HyUIWxcvJFuAVJHnwo7OA1Gki
         TYqYJd6/QoHaVOsqgFkKpvd9ecFZQ/U+sN0hKSDBSiqzymMa53B8k/M2a95ReCbm74ru
         g8UQuBPO9VqBofmNH+cA8228hH4O7X5CfNUMPdEIqKrH8wz/jHoDDiN90FcVZNfOBmma
         CC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+76wJ1eEC318YGt0qih0jIIu/jaQ/PbuU+KzdctJGsQ=;
        b=J6X5oQ07lwTVaekqUJw7F6olj22OhE2QO9Dqohd7yxPEnQliaTUyyLyxv5M6V3PWbJ
         D5dvtYIYw6qcBhXlMI+njaDtpuWrdR0LJGcFZXXuQl0CkqK9pG+8DtMNcU96nbvWMGbW
         mksZqtDRUehvR5o5+zAgQ8Tiaj8YqZ0gM4xMAxLksdzlMuCsr9jcwA/gkbr5jty5+OGQ
         OYDF+b1m2GdYF1j0nxI/ProFBBz+0OryVzs7lzzdzDBm4CsTQ54t0wFxCjGAp9OWeOGi
         ePCxLsoiA2dZTZ52WGdIyQNOpArlqF0S9txSIGe/7etafkY/V2+JereoPzCB8HY7CsIk
         2AGA==
X-Gm-Message-State: ANhLgQ2+MZ7bZqhoYDLWn985uUqIOTGgOGiy20Rg1x//UBtOqynuMGma
	TM7xc0DrftsVvJHxoy6NTcZ5qeHgzjA=
X-Google-Smtp-Source: ADFU+vsa/cX38o2eWXmrNVp98MP93zApYf+egAh13R9bmy+FfZmGiNb5fmqQA9PbVp2Xwc+FLpOotw==
X-Received: by 2002:a62:2a8d:: with SMTP id q135mr17844396pfq.220.1584828240535;
        Sat, 21 Mar 2020 15:04:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:8981:1b0d:92f0:88? ([2601:646:9200:4e0:8981:1b0d:92f0:88])
        by smtp.gmail.com with ESMTPSA id v185sm9168213pfv.32.2020.03.21.15.03.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 15:04:00 -0700 (PDT)
Subject: Re: [docs] [PATCH] documentation: add rpcgen to FEDORA_HOST_PACKAGES_ESSENTIAL
To: docs@lists.yoctoproject.org
References: <20200319232314.2038-1-cengic@gmail.com>
 <ac1eb590-1a23-ddbc-346e-568149ffc490@gmail.com>
 <Groupsio.1.CACT7hbmyCshZ1veuV-X-C7kfjh-wB2KYEykqk7OzmkUiH+q9xg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <7f7d70d9-750c-e49e-ed6c-5589f1d91c95@gmail.com>
Date: Sat, 21 Mar 2020 15:03:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <Groupsio.1.CACT7hbmyCshZ1veuV-X-C7kfjh-wB2KYEykqk7OzmkUiH+q9xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/21/20 5:03 AM, Goran Cengic wrote:
> [Edited Message Follows]
> 
> 
> On Fri, Mar 20, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 3/19/20 4:23 PM, Goran Cengic wrote:
>      > On Fedora 30 and 31 the following error appears without rpcgen
>     package:
>      > ERROR: The following required tools (as specified by HOSTTOOLS)
>     appear to be unavailable in PATH, please install them in order to
>     proceed:
>      >    rpcgen
>      >
>      > Signed-off-by: Goran Cengic <cengic@gmail.com
>     <mailto:cengic@gmail.com>>
>      > ---
>      >   documentation/poky.ent | 2 +-
>      >   1 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/documentation/poky.ent b/documentation/poky.ent
>      > index 581c87679..fba2a9123 100755
>      > --- a/documentation/poky.ent
>      > +++ b/documentation/poky.ent
>      > @@ -65,7 +65,7 @@
>      >        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo
>     chrpath \
>      >        ccache perl-Data-Dumper perl-Text-ParseWords
>     perl-Thread-Queue perl-bignum socat \
>      >        python3-pexpect findutils which file cpio python
>     python3-pip xz python3-GitPython \
>      > -     python3-jinja2 SDL-devel xterm">
>      > +     python3-jinja2 SDL-devel xterm rpcgen">
> 
>     Thats good. We also want to add rpcsvc-proto for suse based distros for
>     same.
> 
> I found that rpcsvc-proto does not require rpcgen so I added the rpcgen 
> package for the suse based distros as well (see patch v3). I'm not sure 
> that the rpcsvc-proto headers are required on the host since there is a 
> recipe providing them in case they are needed for a build.
> If the headers are also required we can add rpcsvc-proto-devel for 
> fedora based distros and rpcsvc-proto for suse based distros as well.
> On Fedora the lib package, libtirpc, is already installed by default.

My suggestion was to use a dependency thats common across many distro 
e.g. archlinux, gentoo put rpcgen in rpcsvc-proto itself, SuSE creates
independent RPM for rpcgen even though it comes from rpcsvc-proto, I 
guess as such this patch is fine.


> 
>      >   <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++
>     git chrpath make wget python-xml \
>      >        diffstat makeinfo python-curses patch socat python3
>     python3-curses tar python3-pip \
>      >        python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
>      >
>      >
>      >
>      > 
> 
> 
> 
> 
