Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.1739.1599781148774751671
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2020 16:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bu9QCelQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id u13so5243947pgh.1
        for <docs@lists.yoctoproject.org>; Thu, 10 Sep 2020 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=latKn1NJHZWu4KLF7gqtaWmWOXklyD8lm7H4eGyUgzI=;
        b=Bu9QCelQyfT2bbVj3VHpDuUhNCJxza6r/s8GSK0Rgjh9dgwOtNQRyaJVGBr+VHsQ+T
         vSaXvxZdzknA6nycTbdCPQX9qgVS7aiR4I5xUZxbPexmiVFvgIjPjKEWzg38Zhkd1zFA
         vcErjVkSkaYFxXTcsCefKpcZbvh9yGkldeucq3rRlmd5PGiO237TRPyc82IHtLUJlsg4
         HjcOCHiTvTagwzwqIkan40cbgmZK4Hm6cpJKg6MH4+3kjT8NJ4N4hJOxlVTZJ96CqGf5
         F0cC+HcZA064EaZU7BQY/feUGZpuuBJbrEvUgRgtuSp3cxQCGo3c/9AdMZFM6/cRTZmm
         qlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=latKn1NJHZWu4KLF7gqtaWmWOXklyD8lm7H4eGyUgzI=;
        b=JNoy5xEGYCAaQXkBp6q0HijGaG+ecGwMHBNYxrbljZEFFXVz/3H4RaZu0eQZFFWzVS
         kT5nhjRTguIXk6Mctwf7CtFDYB7eUiy66AB8o25CxvwnXhuFgUI3+ij+PWVzmMjlE9AY
         QWwE9JRUSxlOkDzi9Q+5/kv14no2dRPvXEnTPxobhL2APehhO/C8Fg0ZSK4DVs+pTm7T
         Fi0u9kmSpFhzSGaVeC0zojC6CNVcsmuKvQy05NTHkgtyTGo3JV7J249ho3Wb7IZkVTMO
         L47ndAbkECwd4DaCrXzwI+tXqaRdRJku0ZtRd+X4fH/2ZJAcSVwlX6H9PNqX7TiedE1M
         Iu3A==
X-Gm-Message-State: AOAM531LoW7g+Wix6k9w4PQ9xsQZfvvQ2nHCVStsx1ZC+XkAp27AJP5N
	PEsJj+T+s5ztMo1GvyeLZgl/9SCQfU8=
X-Google-Smtp-Source: ABdhPJxW5XwkfQS+Dn7sl1c3bDnzWhPLXyLjLsNK6pQ7F37MwCtz2TQk7+83n/ZKDI/wDApaH0G08A==
X-Received: by 2002:a17:902:ba8f:: with SMTP id k15mr8078694pls.79.1599781147795;
        Thu, 10 Sep 2020 16:39:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9d9a:aa32:31fc:b6f0? ([2601:202:4180:a5c0:9d9a:aa32:31fc:b6f0])
        by smtp.gmail.com with ESMTPSA id u20sm91263pgl.68.2020.09.10.16.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 16:39:07 -0700 (PDT)
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <574a4968-f543-ed18-954a-842acf50851d@gmail.com>
Date: Thu, 10 Sep 2020 16:39:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 9/10/20 3:03 PM, Nicolas Dechesne wrote:
> hi there,
>
> some more updates on our Sphinx migration task. It turned out to be a
> rather huge task.. "Never ask engineers to make estimates" applies
> quite well here ;)
>
> I think we are getting close to where we wanted to be. As you should
> know by now, we are planning to switch for 3.2, and the sphinx
> migration is kind of blocking M3 right now. Richard and I have spent
> quite a bit of time on the docs lately to make the final push.
>
> Any help in this last mile would be much appreciated.. The 'last mile'
> is to review each doc and finalize what's left which was not converted
> properly by pandoc, nor by any of the=C2=A0regexp find/replace we've don=
e..
> Unfortunately this last step is manual and time consuming.
>
> We are planning to merge the sphinx branch in yocto-docs and bitbake
> repo any time now. We haven't removed the docbook files yet, we will
> do the removal once we claim to be done.
>
> In terms of publishing the docs, our plan is to have a brand new YP
> docs 'website'. On that website, we will publish docs for each
> release/branch, and it will be easy to navigate between versions.=C2=A0
>
> We have also created 'transition' pages in Sphinx for docs from all YP
> releases from 0.9 to 3.1.x. For each release, we have a 'static' page
> with links to the DocBook HTML manuals. So that the YP docs website
> will be the *only* place to look for our docs moving forward.
>
> In each of the 2 sphinx branches, we've done the following:
> 1. add makefile / sphinx boilerplate
> 2. used pandoc to convert all .xml into .rst. it's a gross
> conversion.. far from perfect...
> 3. added a bunch of commits to fix up what's left from the conversion
> (images, links, ..)
> 4. Finally we are doing a manual review of each file and fixing the
> last things. At this point, what's the most painful is that the
> 'code-block' sections are not converted automatically.
>
> If anybody has any cycle now, we need to finish #4. The current status
> is that:
> *=C2=A0brief-yoctoprojectqs/* is done.
> * bitbake user manual is half done, and I am doing it
> * bsp-guide/*: i started it, and will finish
> * ref-manual/*: RP is on it.
> * there are=C2=A0plenty of warnings when we build, i would like to get r=
id
> of them all!


>
> Anything else is work that remains to be done. Before starting
> anything, please send a quick email here to let everyone know, to
> avoid duplication. If you have any improvement, please share your
> patches, I will take them into the sphinx/master branch. And I will
> continue to work on the remaining files that no one=C2=A0would pick.
>
> And since a picture is worth a thousand words...
>
> The new doc website is here:
> https://docs.yoctoproject.org/
>
> If you want to help, please review the "WIP" patches on=C2=A0
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=3Dsphinx
> And pick one of the manuals which are left! It is not straightforward
> to get started, I have to warn you.. don't hesitate to ask me
> questions by email or on irc (ndec) if you need any help.
Are we leaving the Mega manual for last or are we dropping it?

I will take the "overview-manual" if its not taken.

- armin

>
> And as a reminder, instructions to build can be found here:
> https://wiki.yoctoproject.org/wiki/Documentation_Sphinx
>
> cheers
> nico
>
> =C2=A0
>
>=20


