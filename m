Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.226.1604329114796344170
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 06:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oR0tYCm6;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id t14so10998468pgg.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2020 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=q0fdIk5EkKFjUOr4Axv9k8k+kgFcTcVMjhwfjwFy6FU=;
        b=oR0tYCm686FMKm96gwr3MdtMZsAutwA+IfGNytOkxyAhD1foK51xGsbVs50aSrYNgw
         VdNwl8fNDDr4quXKE7Y7WfVtc5fLJK0mjzoheg5Y6XJ6iHtL7tQVXA6j4vw4wW7jNFAM
         3xnVtz0PmZo6cQDvObSl0xWf+dwALiBXejA75oOdrP9hzUpEr4JaGburTmlOxxTvJdiA
         1Wf2f9F23PRzASc9WyoSqaAnTEFpF1MAX52qqnWyvgyVKKc+eWovj+SwHtoEfDnsq0xi
         lLpfAjjlC0cKItRfKthnUvufYUgYDXterWO9kUPP+GIFC45wWs08Z96/qwYypqEcZYHX
         labg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=q0fdIk5EkKFjUOr4Axv9k8k+kgFcTcVMjhwfjwFy6FU=;
        b=VqYlS0A3+IdxjCJ+nUEJX2q4L7SWtQfyZqsGCpN/I4R6/bPseHkQBcIsThYXYKq8H2
         +UJDKcwUl//BNfOIZZMwe01Jr2PPZn6ycGCO4l1NPdt++1RT3sk2UX/WV6PS+PHyJxwP
         7jHrdhHPJZ7lSbQE/u9MNH31I0rWtqZRS2y2O2LXRhYYwIhKDvBAsTUxzhsw6TKlGC0t
         wIxmJ2+RzOj31kgVY7xnG+ADkukBweznK1QCJBdPtLPafP+75ht3C5Dei1iSpFlKs7Ie
         2f9oT1+JNA4h66r7oje1Ojg6oWOy5q0NefK2JrWz9t2ojRQJt4R7eyfQRLoK2aNcfvD3
         bgPg==
X-Gm-Message-State: AOAM531QzOTmyv4s8+ti696TH/HB+f91xRy0OMbq96RdLsCkORRTbGkg
	PDCKXz9T80teiYCdHVuVNeex5cr/wFI=
X-Google-Smtp-Source: ABdhPJyPGcdMUreCbJ/+j7e7CShRS1QExJJtCrLaQx5C53eA/062vofLP1h40G5X603WgWGvVoQiCw==
X-Received: by 2002:a62:16ce:0:b029:160:5faa:23d5 with SMTP id 197-20020a6216ce0000b02901605faa23d5mr22076525pfw.26.1604329114149;
        Mon, 02 Nov 2020 06:58:34 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c84:880c:a42b:4489? ([2601:202:4180:a5c0:2c84:880c:a42b:4489])
        by smtp.gmail.com with ESMTPSA id 26sm3123183pgm.92.2020.11.02.06.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 06:58:33 -0800 (PST)
Subject: Re: [docs] [RFC] Add recipe-yocto-docs
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <d6cadebf-150f-079a-8a47-bf18220a5bfa@gmail.com>
 <CAP71WjzHN3Vxpp+NJ_YWdoRmmdvTTAsYxUyToHkLUkqUN1SrPA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a2e56d3f-c5e6-fd89-7b38-389440c4cfb0@gmail.com>
Date: Mon, 2 Nov 2020 06:58:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzHN3Vxpp+NJ_YWdoRmmdvTTAsYxUyToHkLUkqUN1SrPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/2/20 12:40 AM, Nicolas Dechesne wrote:
> hey Armin,
>
> On Sun, Nov 1, 2020 at 7:40 PM akuster <akuster808@gmail.com> wrote:
>> Hello,
>>
>> I just finished creating the ability to build the yocto-doc via a recip=
e
>> ( Thanks to everyone who helped with the sphinx migration)
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakuster=
/yocto_docs_recipe
> This is cool ;)
>
>> There are several structural decision to me made.
>>
>> Several of the dependency packages that currently reside in  other
>> layers so those might need to moved in core.
>>
>> The easy decision is where the yocto-doc recipe should live. I suspect
>> in meta-yocto.
>>
>> The ones I am not sure are the ones needed to support sphinx. Do we wan=
t
>> these only as Native? Do we want this sphinx in core?
> If we go this route, I think we need all dependencies in Core.
>
>> This may be a gateway to allow including the docs in an SDK image. Add
>> layer based docs. Create an Docs installer, bitbake-docs, etc.
> I was wondering about bitbake-docs.. and where we should have such a rec=
ipe..

if sphinx and it's dependencies are in core, then bitbake manual could
be there too
>
>> The recipes most likely need a bit of cleaning up. I did test a native
>> version of the index.html and that worked fine.
> We could use this recipe to test docs as part of AB testing. Though I
> am not sure if yocto-docs master-next is included in poky master-next.

it does open up the possibility to have a mock doc in meta-skeleton and
have it part of oe-selftest. Or have as a template if someone want to
create sphinx doc for the layer or product.
>
> That said for building the docs website (docs.yp.org), we would
> probably not use this bitbake recipe, since we have several branches
> to build to create the whole website.
at some point, the recipes can be changed and use branching and be
updated at a dot release time.

>>
>> - armin
>>
>>
>>
>>
>>=20
>>


